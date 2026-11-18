# PoE Economy Dashboard - Windows-Testversion 0.4.0

## Bereits installiert: direkt in der Anwendung aktualisieren

1. Updatekanal **Test** auswaehlen und bestaetigen.
2. **Nach Updates suchen** anklicken. Version **0.4.0** wird angeboten.
3. **Update installieren** bestaetigen. Sicherung, Migration und Neustart erfolgen automatisch; keine Neuinstallation erforderlich.

Der reale oeffentliche Updateweg 0.3.1 -> 0.4.0 wurde unter einem Windows-Standardbenutzer mit dem unveraenderten veroeffentlichten 0.3.1-Installer geprueft: Browseruebergabe, Erhalt von Notizen/Updatekanal, Marktdaten und Preishistorie bestanden (DB4/Config2 unveraendert). Windows-Server-Nachweis; keine vollstaendige Windows-11-/Stable-Abnahme.

## Neuinstallation

[Windows-Installer 0.4.0 herunterladen](https://github.com/Kaikulon-ThePirate/poe-economy-releases/releases/download/v0.4.0/PoEEconomy-0.4.0-Setup.exe)

EXE ausfuehren und PoE Economy Dashboard ueber das Startmenue oeffnen. Python oder Node muessen nicht installiert werden. Installation pro Benutzer. Fuer weitere Testupdates in der Anwendung den Testkanal bestaetigen; der Standardkanal Stable ist noch nicht freigegeben.

SHA256 des Installers:

```text
15ffafdd5b549c94b64d2922da390ae2e09e09218a205107742e29bbd4692d34
```

[Signierte Pruefsummen, SBOMs und Releasehinweise](https://github.com/Kaikulon-ThePirate/poe-economy-releases/releases/tag/v0.4.0)

## Funktionen

Sechs Marktbereiche mit 14 Datenkategorien: Waehrungen, Uniques, Divination Cards, Gems, Rare-Basistypen und Crafting-Materialien. Exakte Preis- und Variantenfilter speichern, vollstaendige Trefferlisten durchsuchen und als CSV exportieren. Interaktiver lokaler Preisverlauf mit Zeitfenstern, Tastaturauswahl und sichtbaren Datenluecken. Gespeicherte historische Ligen bleiben erreichbar.

Bei Rares werden Basistyp-Referenzen gezeigt, keine individuellen Rollpreise. Crafting zeigt Materialpreise, noch keine Kalkulation. Offizielle Trade-Suchen oeffnen die Website; keine Echtzeitangebote innerhalb der App. Nach dem Update bei Bedarf **Ligen laden**, Liga/Kategorie waehlen und **Preise aktualisieren**. Historie waechst aus den lokal gespeicherten Preisstaenden.

Der Installer verwendet den freigegebenen Owner-Modus ohne Windows-Authenticode. Updates werden mit dem eingebauten Vertrauensanker ueber Ed25519, SHA256 und HTTPS geprueft. Dieses Repository enthaelt ausschliesslich Binaerdateien und oeffentliche Release-Metadaten.
