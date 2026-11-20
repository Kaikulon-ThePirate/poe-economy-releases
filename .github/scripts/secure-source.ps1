param([ValidateSet('open','report')][string]$Mode)
$ErrorActionPreference='Stop'
$commit=$env:SOURCE_COMMIT;$tree=$env:SOURCE_TREE
if ($commit -notmatch '^[a-f0-9]{40}$' -or $tree -notmatch '^[a-f0-9]{40}$') { throw 'Invalid source coordinates' }
$key=[Convert]::FromBase64String($env:PRIVATE_SOURCE_BUNDLE_KEY)
if ($key.Length -ne 32) { throw 'Owner setup key missing or invalid' }
try {
  if ($Mode -eq 'open') {
    if ($env:BUNDLE_BLOB -notmatch '^[a-f0-9]{40}$') { throw 'Invalid encrypted blob id' }
    $encoded=& gh api "repos/$env:GITHUB_REPOSITORY/git/blobs/$env:BUNDLE_BLOB" --jq .content
    if ($LASTEXITCODE) { throw 'Encrypted input unavailable' }
    $bundle=[Convert]::FromBase64String(($encoded -join ''))
    if ($bundle.Length -lt 32 -or $bundle.Length -gt 64MB) { throw 'Invalid encrypted bundle size' }
    $nonce=$bundle[0..11];$tag=$bundle[12..27];$cipher=$bundle[28..($bundle.Length-1)]
    $plain=[byte[]]::new($cipher.Length)
    $aes=[Security.Cryptography.AesGcm]::new($key,16)
    try { $aes.Decrypt($nonce,$cipher,$tag,$plain,[Text.Encoding]::UTF8.GetBytes("PoEEconomy/private-source/v1|$commit|$tree")) }
    finally { $aes.Dispose() }
    $length=[BitConverter]::ToInt32($plain,0)
    if ($length -lt 10 -or $length -gt 1MB -or $length+4 -ge $plain.Length) { throw 'Invalid encrypted manifest' }
    $meta=[Text.Encoding]::UTF8.GetString($plain,4,$length) | ConvertFrom-Json
    if ($meta.source_commit -ne $commit -or $meta.source_tree -ne $tree) { throw 'Source identity mismatch' }
    $zip=$plain[(4+$length)..($plain.Length-1)]
    $digest=[Convert]::ToHexString([Security.Cryptography.SHA256]::HashData([byte[]]$zip)).ToLowerInvariant()
    if ($digest -ne $meta.archive_sha256) { throw 'Source archive hash mismatch' }
    $archive=Join-Path $env:RUNNER_TEMP 'private-source.zip';[IO.File]::WriteAllBytes($archive,$zip)
    $target=Join-Path $env:RUNNER_TEMP 'private-source'
    Expand-Archive $archive $target
    Remove-Item $archive -Force
    $folders=@(Get-ChildItem $target -Directory)
    if ($folders.Count -ne 1) { throw 'Unexpected source archive root' }
    $source=$folders[0].FullName
    Push-Location $source
    try {
      & git init --quiet *> $null;if ($LASTEXITCODE) { throw 'Source index setup failed' }
      & git config core.autocrlf false
      & git config core.filemode false
      & git add --force --all *> $null;if ($LASTEXITCODE) { throw 'Source staging failed' }
      foreach ($file in $meta.executable_paths) {
        if ($file -match '(^/|(^|/)\.\.(/|$)|\\)' -or -not (Test-Path -LiteralPath (Join-Path $source $file))) { throw 'Invalid source file mode entry' }
        & git update-index --chmod=+x -- $file
        if ($LASTEXITCODE) { throw 'Source mode restoration failed' }
      }
      $actual=(& git write-tree).Trim()
      if ($LASTEXITCODE -or $actual -ne $tree) { throw 'Decrypted source does not match the approved Git tree' }
    } finally { Pop-Location }
    "PRIVATE_SOURCE_DIR=$source" | Out-File $env:GITHUB_ENV -Append -Encoding utf8
    [IO.File]::WriteAllText((Join-Path $env:RUNNER_TEMP 'source-binding.json'),($meta | ConvertTo-Json -Depth 6))
    Write-Output "Authenticated private source tree verified: $tree"
  } else {
    $source=$env:PRIVATE_SOURCE_DIR
    if (-not $source) { $source=Join-Path $env:RUNNER_TEMP 'no-source' }
    $summary=@{source_commit=$commit;source_tree=$tree;controller_commit=$env:GITHUB_SHA;run_id=$env:GITHUB_RUN_ID;status=$env:BUILD_STATUS;version=$env:VERSION;private_source_encrypted=$true;private_logs_encrypted=$true}
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
    & gh release create "build-report-$env:GITHUB_RUN_ID" --repo $env:GITHUB_REPOSITORY --draft --title "Owner build report $env:GITHUB_RUN_ID" --notes-file $report $output
    if ($LASTEXITCODE) { throw 'Encrypted build report upload failed' }
    Write-Output ($summary | ConvertTo-Json -Depth 20)
  }
} finally { if ($key) { [Array]::Clear($key,0,$key.Length) };if ($plain) { [Array]::Clear($plain,0,$plain.Length) } }
