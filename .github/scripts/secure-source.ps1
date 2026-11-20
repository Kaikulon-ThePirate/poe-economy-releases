param()
$ErrorActionPreference='Stop'
$commit=$env:SOURCE_COMMIT;$tree=$env:SOURCE_TREE
if ($commit -notmatch '^[a-f0-9]{40}$' -or $tree -notmatch '^[a-f0-9]{40}$') { throw 'Invalid source coordinates' }
$key=[Convert]::FromBase64String($env:PRIVATE_BUILD_LOG_KEY)
if ($key.Length -ne 32) { throw 'Owner log key missing or invalid' }
try {
    $source=$env:PRIVATE_SOURCE_DIR
    if (-not $source) { $source=Join-Path $env:RUNNER_TEMP 'no-source' }
    $summary=@{source_commit=$commit;source_tree=$tree;controller_commit=$env:GITHUB_SHA;run_id=$env:GITHUB_RUN_ID;run_attempt=$env:GITHUB_RUN_ATTEMPT;status=$env:BUILD_STATUS;version=$env:VERSION;private_source_encrypted=$true;source_access='repository-scoped read-only SSH deploy key';private_logs_encrypted=$true}
    if ($source -and (Test-Path (Join-Path $source 'evidence/public-build-quality.json'))) {
      $q=Get-Content (Join-Path $source 'evidence/public-build-quality.json') -Raw | ConvertFrom-Json
      $summary.quality_passed=($q.quality_passed -and $q.source_commit -eq $commit)
    }
    $publicProof=Join-Path $source 'evidence/public-n-minus-one-update.json'
    if ($source -and (Test-Path $publicProof)) { $summary.native_public_update=Get-Content $publicProof -Raw | ConvertFrom-Json }
    $xml=Join-Path $source 'evidence/windows-unit.xml'
    if ($source -and (Test-Path $xml)) {
      [xml]$tests=Get-Content $xml -Raw
      $summary.python_tests=[int]$tests.testsuites.testsuite.tests
      $summary.python_failures=[int]$tests.testsuites.testsuite.failures
    }
    # Only deliberate non-source evidence is included in this public result.
    if ($source) {
      foreach ($file in @('windows-m02-chain.json','windows-https-update.json','windows-native-preflight-rejections.json','windows-native-recovery.json','flip-plans-browser.json','auto-refresh-background.json')) {
        $path=Join-Path $source "evidence/$file"
        if (Test-Path $path) { $summary[$file]=Get-Content $path -Raw | ConvertFrom-Json }
      }
    }
    $paths=@()
    foreach ($name in @('quality.log','publish.log')) { $p=Join-Path $env:RUNNER_TEMP $name;if (Test-Path $p) { $paths+=$p } }
    if ($source -and (Test-Path (Join-Path $source 'evidence'))) { $paths+=(Join-Path $source 'evidence') }
    if (-not $paths.Count) { $empty=Join-Path $env:RUNNER_TEMP 'no-private-stage-started.txt';Set-Content $empty 'No private build stage started.';$paths+=$empty }
    $archive=Join-Path $env:RUNNER_TEMP 'private-logs.zip';Compress-Archive -Path $paths -DestinationPath $archive
    $bytes=[IO.File]::ReadAllBytes($archive);$nonce=[Security.Cryptography.RandomNumberGenerator]::GetBytes(12);$tag=[byte[]]::new(16);$cipher=[byte[]]::new($bytes.Length)
    $aes=[Security.Cryptography.AesGcm]::new($key,16)
    try { $aes.Encrypt($nonce,$bytes,$cipher,$tag,[Text.Encoding]::UTF8.GetBytes("PoEEconomy/private-logs/v1|$env:GITHUB_RUN_ID|$commit")) }
    finally { $aes.Dispose() }
    $bundle=[byte[]]::new(28+$cipher.Length);$nonce.CopyTo($bundle,0);$tag.CopyTo($bundle,12);$cipher.CopyTo($bundle,28)
    $output=Join-Path $env:RUNNER_TEMP 'private-logs.aesgcm';[IO.File]::WriteAllBytes($output,$bundle);Remove-Item $archive -Force
    $summary.private_logs_sha256=(Get-FileHash $output -Algorithm SHA256).Hash.ToLower()
    $report=Join-Path $env:RUNNER_TEMP 'public-build-result.json';$summary | ConvertTo-Json -Depth 20 | Set-Content $report -Encoding utf8
    & gh release create "build-report-$env:GITHUB_RUN_ID-$env:GITHUB_RUN_ATTEMPT" --repo $env:GITHUB_REPOSITORY --draft --title "Owner build report $env:GITHUB_RUN_ID" --notes-file $report $output
    if ($LASTEXITCODE) { throw 'Encrypted build report upload failed' }
    Write-Output ($summary | ConvertTo-Json -Depth 20)
} finally { if ($key) { [Array]::Clear($key,0,$key.Length) } }
