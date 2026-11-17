# PoE Economy Dashboard — Windows releases

Öffentliches Binärrepository für die privat genutzte Windows-x64-Anwendung. Der private Quellcode wird hier nicht veröffentlicht.

## Installation

Noch kein dauerhaft nutzbarer Owner-Installer veröffentlicht. Kurzlebige CI-Testinstaller sind keine Betriebsfreigabe und werden hier nicht als solche bereitgestellt.

Ein freigegebener Release enthält die Setup.exe, release-notes.md und ein Ed25519-signiertes Prüfsummenverzeichnis. Vor der Erstinstallation ist der SHA-256 des Installers unabhängig zu prüfen. Python, Node.js oder Entwicklerwerkzeuge werden für den Betrieb nicht benötigt.

## Dauerhafter Updatekanal

Geplante Kanaldateien auf GitHub Releases:

- `channel-stable/signed-manifest.json`: ausdrücklich freigegebene Versionen; Standardkanal der Anwendung.
- `channel-test/signed-manifest.json`: ausdrücklich bestätigte Testversionen.
- `roots/<version>.json`: autorisierte, fortlaufend versionierte öffentliche Vertrauensmetadaten.
- `v<version>/payload.zip`: unveränderliche vollständige Updatepakete neben dem passenden Installer.

Die Kanaldateien sind erst nach Einrichtung des dauerhaften Produktionsvertrauens und Veröffentlichung gültiger signierter Metadaten nutzbar. Es werden keine Platzhaltermanifeste bereitgestellt.

Updates prüfen Ed25519-Autorisierung, SHA-256, Größen-/Versions-/Schemakompatibilität und HTTPS. Unsigned Windows-Programme im Owner-Modus bedeuten keine unsignierten Updates. Private Signierschlüssel oder persönliche Zugriffstokens gehören weder in dieses Repository noch in Installationspakete.
