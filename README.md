# PoE Economy Dashboard – Windows-Testversion 0.8.0

## Bereits installiert: direkt aktualisieren

In der Anwendung **Test → Nach Updates suchen → 0.8.0 installieren**. Sicherung und Neustart erfolgen automatisch. Keine Neuinstallation nötig.

Neu: **Sicherung und Wiederherstellung** mit vollständiger Einzelprüfung, portablem Export/Import und bestätigtem Restore. Beschädigte Metadaten blockieren die Anwendung nicht mehr. **Diagnosebericht herunterladen** exportiert nur technische Zustandsdaten, keine Buchungen, Notizen, Pfade oder Sitzungskennungen. Erneut über das Startmenü öffnen verwendet das bereits laufende Backend.

Der echte öffentliche Updateweg **0.7.0 → 0.8.0** wurde mit dem unveränderten Originalinstaller und eingebautem Produktionsanker unter einem Windows-Standardbenutzer geprüft. Vorherige Journalbuchungen, Rezeptversionen, Marktdaten, Einstellungen, Watchlist und Hinweise bleiben erhalten. Zusätzlich: zweiter Shortcut ohne zweiten Backendprozess, Sicherungsprüfung/Export/Import und bestätigter Restore über die Oberfläche; Notizen, Journal und Rezepte anschließend verglichen. DB6/Config2 unverändert.

## Neuinstallation

[Windows-Installer 0.8.0 herunterladen](https://github.com/Kaikulon-ThePirate/poe-economy-releases/releases/download/v0.8.0/PoEEconomy-0.8.0-Setup.exe)

EXE ausführen und PoE Economy Dashboard über das Startmenü öffnen. Installation pro Benutzer; Python oder Node werden nicht benötigt. Für Updates den Testkanal in der Anwendung bestätigen.

Installer-SHA256:

```text
475ea095c4390af31ec2a0c94daa955f4502d7db8585561557daaeaea4ad93ed
```

[Signierte Prüfsummen, SBOMs und Hinweise](https://github.com/Kaikulon-ThePirate/poe-economy-releases/releases/tag/v0.8.0)

## Enthaltene Funktionen

Markt-Explorer mit poe.ninja-Referenzpreisen, exakten Variantenfiltern, Verlauf und erklärbaren Marktsignalen. Offizielle Trade-Suche öffnet die Website; keine In-App-Echtzeitangebote. Watchlists mit Regeln, lokaler Hinweiszentrale und optionalen Browsermeldungen bei laufender Anwendung.

Manuelles Handelsjournal mit Teilverkäufen, FIFO, Gebühren, historischen Umrechnungen, ROI und CSV. Crafting-Kostenplaner mit eigenen Wahrscheinlichkeiten und unveränderten Rezeptversionen. Marktwerte lassen sich als Entwürfe übernehmen; tatsächliche Ausführung und eigene Annahmen vor dem Speichern prüfen. Keine Handelsausführung oder aus Spieldaten abgeleiteten Erfolgsaussichten.

Grenzen: 5.000 Buchungen inklusive Stornos, 500 Rezeptversionen, bis 20 Material-/Ergebniszeilen. Sicherungen enthalten alle lokalen Daten. Wiederherstellen ersetzt aktive Daten und erstellt zuvor eine zusätzliche Sicherheitssicherung; ältere Schemata benötigen zurückbehaltene passende Programmpakete. Exportierte Sicherungen an einem getrennten Ort aufbewahren.

**M6-Gesamtabnahme bleibt offen:** Die automatisierten Nachweise stammen von Windows Server, nicht von einer frischen Windows-11-Umgebung. Vollständige native Fehler-/Neustartmatrix und Stable-Freigabe bleiben offen. Installer im freigegebenen Owner-Modus ohne Authenticode; Updates werden über Ed25519, SHA256, eingebauten Vertrauensanker und HTTPS geprüft.

[Öffentlicher Update-/Restore-Nachweis](https://github.com/Kaikulon-ThePirate/poe-economy-dashboard/actions/runs/44487810014) · [Vollständige CI](https://github.com/Kaikulon-ThePirate/poe-economy-dashboard/actions/runs/44484450205)
