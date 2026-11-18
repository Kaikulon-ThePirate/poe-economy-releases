# PoE Economy Dashboard - Windows-Testversion 0.3.1

## Bereits installiert: direkt in der Anwendung aktualisieren

1. Updatekanal **Test** auswaehlen und bestaetigen.
2. **Nach Updates suchen** anklicken. Version **0.3.1** wird angeboten.
3. **Update installieren** bestaetigen. Sicherung, Migration und Neustart erfolgen automatisch; keine Neuinstallation erforderlich.

Der reale oeffentliche Updateweg 0.2.2 -> 0.3.1 wurde unter einem Windows-Standardbenutzer mit dem unveraenderten veroeffentlichten 0.2.2-Installer geprueft: Datenbankmigration, Browseruebergabe, Erhalt von Notizen/Updatekanal und Marktoberflaeche bestanden. Windows-Server-Nachweis; keine vollstaendige Windows-11-/Stable-Abnahme.

## Neuinstallation

[Windows-Installer 0.3.1 herunterladen](https://github.com/Kaikulon-ThePirate/poe-economy-releases/releases/download/v0.3.1/PoEEconomy-0.3.1-Setup.exe)

EXE ausfuehren und PoE Economy Dashboard ueber das Startmenue oeffnen. Python oder Node muessen nicht installiert werden. Installation pro Benutzer. Fuer weitere Testupdates in der Anwendung den Testkanal bestaetigen; der Standardkanal Stable ist noch nicht freigegeben.

SHA256 des Installers:

```text
956aec9cb57acd65446f078d6695f5e2f8855330aebc38e7f21a00e960c60815
```

[Signierte Pruefsummen, SBOMs und Releasehinweise](https://github.com/Kaikulon-ThePirate/poe-economy-releases/releases/tag/v0.3.1)

## Funktionen

poe.ninja-Referenzpreise fuer acht Waehrungs-/Fragment-/Unique-/Gem-Kategorien, Ligaauswahl, Suche/Sortierung, lokale Variantenhistorie, Cache und periodische Aktualisierung. Offizielle Trade-Suchen werden auf der Website geoeffnet; keine Echtzeitangebote innerhalb der App. Nach dem Update zuerst **Ligen laden**, Liga/Kategorie waehlen und **Preise aktualisieren**.

0.3.1 korrigiert die Windows-Zeichensatzbehandlung im Updater. 0.3.0 ist ein zurueckgezogener, nicht akzeptierter Kandidat. Die erste Aktualisierung nutzt kompatible ASCII-Releasehinweise; danach werden Unicode-Metadaten korrekt als UTF-8 verarbeitet.

Der Installer verwendet den freigegebenen Owner-Modus ohne Windows-Authenticode. Updates werden mit dem eingebauten Vertrauensanker ueber Ed25519, SHA256 und HTTPS geprueft. Dieses Repository enthaelt ausschliesslich Binaerdateien und oeffentliche Release-Metadaten.
