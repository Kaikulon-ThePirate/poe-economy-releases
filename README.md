# PoE Economy Dashboard - Windows-Testversion 0.6.0

## Bereits installiert: direkt in der Anwendung aktualisieren

1. Updatekanal **Test** auswaehlen und bestaetigen.
2. **Nach Updates suchen** anklicken. Version **0.6.0** wird angeboten.
3. **Update installieren** bestaetigen. Sicherung, Migration und Neustart erfolgen automatisch; keine Neuinstallation erforderlich.

Der reale oeffentliche Updateweg 0.5.0 -> 0.6.0 wurde unter einem Windows-Standardbenutzer mit dem unveraenderten veroeffentlichten 0.5.0-Installer geprueft: Browseruebergabe, Erhalt von Notizen/Updatekanal, Marktdaten, Preishistorie, Marktfilter und Score-Gewichte bestanden (DB4 nach DB5 migriert / Config2 unveraendert). Windows-Server-Nachweis; keine vollstaendige Windows-11-/Stable-Abnahme.

## Neuinstallation

[Windows-Installer 0.6.0 herunterladen](https://github.com/Kaikulon-ThePirate/poe-economy-releases/releases/download/v0.6.0/PoEEconomy-0.6.0-Setup.exe)

EXE ausfuehren und PoE Economy Dashboard ueber das Startmenue oeffnen. Python oder Node muessen nicht installiert werden. Installation pro Benutzer. Fuer weitere Testupdates in der Anwendung den Testkanal bestaetigen; der Standardkanal Stable ist noch nicht freigegeben.

SHA256 des Installers:

```text
fb6f8c1a7f9d6ece9d50e2333c1ed38c46bae9d3a95f82ae55636a76dc90d774
```

[Signierte Pruefsummen, SBOMs und Releasehinweise](https://github.com/Kaikulon-ThePirate/poe-economy-releases/releases/tag/v0.6.0)

## Funktionen

Neu in M4: exakte Varianten beobachten, Notizen speichern und Preis-/Market-Score-Regeln mit Mindestkonfidenz und Abklingzeit anlegen, bearbeiten oder pausieren. Lokale Benachrichtigungszentrale mit ungelesenen/gelesenen Ereignissen. Watchlist, Regeln und Ereignisse bleiben bei Neustart erhalten; derselbe Stand wird nicht doppelt gemeldet. Beobachtete Marktbereiche werden bei laufender Anwendung unter den bestehenden Abrufgrenzen aktualisiert, ohne die sichtbare Auswahl umzuschalten.

Desktop-Hinweise sind optional, benoetigen Browserfreigabe und funktionieren nur bei geoeffnetem Browserfenster. Die Zentrale sammelt bei laufendem Backend auch ohne Browser weiter. Keine garantierte Windows-Toastanzeige. Vollstaendig beendete Anwendung prueft nicht weiter. Grenzen: 200 Varianten, 20 Marktbereiche, drei Regeln je Variante und letzte 5.000 Ereignisse. Veraltete/fehlerhafte Daten loesen keine neuen Alarme aus. Details im Hinweis zeigen den historischen Referenzstand, keine aktuellen Angebote.

Auch enthalten: erklaerbare M3-Marktsignale mit Market Score, separater Datenkonfidenz, Rangliste, Filtern und speicherbaren Gewichten. Einzelbeitraege und Sperrgruende sind sichtbar. Variante im lokalen Verlauf oder auf der offiziellen Trade-Seite pruefen.



Die Rangliste braucht mindestens vier unterschiedliche Stundenstaende ueber mindestens sechs Stunden. Bei veralteter/fehlerhafter Quelle, Datenluecken oder unpassenden Einheiten wird kein Score erfunden. Die Anwendung muss veraenderte Preisstaende zunaechst lokal sammeln. Datenkonfidenz ist eine Vollstaendigkeitsheuristik, keine Gewinnwahrscheinlichkeit; keine konkreten Deals oder garantierten Margen.

Sechs Marktbereiche mit 14 Datenkategorien: Waehrungen, Uniques, Divination Cards, Gems, Rare-Basistypen und Crafting-Materialien. Exakte Preis- und Variantenfilter speichern, vollstaendige Trefferlisten durchsuchen und als CSV exportieren. Interaktiver lokaler Preisverlauf mit Zeitfenstern, Tastaturauswahl und sichtbaren Datenluecken. Gespeicherte historische Ligen bleiben erreichbar.

Bei Rares werden Basistyp-Referenzen gezeigt, keine individuellen Rollpreise. Crafting zeigt Materialpreise, noch keine Kalkulation. Offizielle Trade-Suchen oeffnen die Website; keine Echtzeitangebote innerhalb der App. Nach dem Update bei Bedarf **Ligen laden**, Liga/Kategorie waehlen und **Preise aktualisieren**. Historie waechst aus den lokal gespeicherten Preisstaenden.

Der Installer verwendet den freigegebenen Owner-Modus ohne Windows-Authenticode. Updates werden mit dem eingebauten Vertrauensanker ueber Ed25519, SHA256 und HTTPS geprueft. Dieses Repository enthaelt ausschliesslich Binaerdateien und oeffentliche Release-Metadaten.
