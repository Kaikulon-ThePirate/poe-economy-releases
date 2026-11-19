# PoE Economy Dashboard – Windows-Testversion 0.7.0

## Bereits installiert: in der Anwendung aktualisieren

1. Updatekanal **Test** auswählen und bestätigen.
2. **Nach Updates suchen** anklicken; Version **0.7.0** installieren.
3. Sicherung, Migration und Neustart erfolgen automatisch. Keine Neuinstallation nötig.

Der echte öffentliche Updateweg **0.6.0 → 0.7.0** wurde mit dem unveränderten veröffentlichten 0.6.0-Installer unter einem Windows-Standardbenutzer geprüft. Migration DB5→DB6, alte Marktdaten/Historie/Filter/Gewichte/Notizen und schon im alten Programm angelegte Watchlist/Regeln/Hinweise bleiben erhalten. Danach tatsächliche Journal- und Crafting-API benutzt, Anfragen wiederholt und Anwendung neu gestartet: keine Doppelbuchungen, FIFO-Bestand und Rezeptversion erhalten. Windows-Server-Nachweis, keine vollständige frische Windows-11-/Stable-Abnahme.

## Neuinstallation

[Windows-Installer 0.7.0 herunterladen](https://github.com/Kaikulon-ThePirate/poe-economy-releases/releases/download/v0.7.0/PoEEconomy-0.7.0-Setup.exe)

EXE ausführen und PoE Economy Dashboard über das Startmenü öffnen. Installation pro Benutzer; Python oder Node werden nicht benötigt. Für Testupdates den Testkanal in der Anwendung bestätigen. Stable ist noch nicht freigegeben.

SHA256 des Installers:

```text
e20772f9576c16f2cac77bb8592a42b9769c0af08273ca133fceec4d3dc237a1
```

[Signierte Prüfsummen, SBOMs und Releasehinweise](https://github.com/Kaikulon-ThePirate/poe-economy-releases/releases/tag/v0.7.0)

## Neu in M5

Manuelles Handelsjournal: Käufe, Verkäufe und Teilverkäufe, Gebühren, FIFO-Bestand/Kostenbasis, realisiertes Ergebnis/ROI, historische Währungsumrechnung mit Quelle und Zeitpunkt, sichere Stornos und CSV-Export. Im Markt **Journalentwurf** wählen oder Liga/Variante selbst eintragen. Vor dem Buchen tatsächliche Ausführung und Werte prüfen. Aktuelle unrealisierte Referenzwerte gibt es nur bei passender Marktverknüpfung und frischen Chaospreisen; sonst bleibt die Bewertung unbekannt.

Crafting-Kostenplaner: Materialkosten und mögliche Ergebniswerte mit eigenen, sich ausschließenden Wahrscheinlichkeiten eingeben. Die Summe muss exakt 1 sein. Kosten, erwartetes Ergebnis/ROI und mögliche Grenzen werden berechnet. Annahmen und Rezeptversionen werden unverändert gespeichert. **Crafting-Kosten übernehmen** kopiert nur eine Marktreferenz in den Entwurf. Keine aus Spieldaten abgeleiteten Erfolgsaussichten, Handelsausführung oder Gewinnzusage.

Grenzen: 5.000 Buchungen einschließlich Stornos, 500 Rezeptversionen, jeweils bis 20 Material-/Ergebniszeilen. Die portable Anwendungssicherung enthält alle Journal- und Rezeptdaten. Gebühren einer Buchung nutzen dieselbe Originalwährung; andere Umrechnungen müssen nachvollziehbar selbst angegeben werden.

Vorhandene Marktbereiche, exakte Variantenfilter, lokale Historie, Marktsignale und Watchlists bleiben enthalten. Die offizielle Trade-Suche öffnet die Website; keine In-App-Echtzeitangebote. Watchlist-Zentrale arbeitet bei laufendem Backend; optionale Browser-Desktop-Hinweise benötigen ein geöffnetes Fenster und Browserfreigabe.

Installer im freigegebenen Owner-Modus ohne Windows-Authenticode. Updates werden mit eingebautem Vertrauensanker über Ed25519, SHA256 und HTTPS geprüft. Dieses Repository enthält nur Binärdateien und öffentliche Release-Metadaten.

[Nachweis des öffentlichen Updates](https://github.com/Kaikulon-ThePirate/poe-economy-dashboard/actions/runs/44479133924) · [224 Tests je Plattform und vollständige CI](https://github.com/Kaikulon-ThePirate/poe-economy-dashboard/actions/runs/44474481019)
