# Test 1.1.0 verfügbar — Stable bleibt 1.0.0

Bestehende Anwendung: **Test → Nach Updates suchen → 1.1.0 installieren**. Keine Neuinstallation erforderlich. [Test-Release und Installer](https://github.com/Kaikulon-ThePirate/poe-economy-releases/releases/tag/v1.1.0).

Englische PoE-Begriffe, sortierbare Tabellenspalten und gespeicherte Reference Currency (Chaos, Divine, Exalted, Annulment, Ancient, Mirror). Frische Kurse derselben League; fehlende Kurse bleiben nicht verfügbar. Originalpreise, historische Kurse und Buchungen bleiben erhalten. Kein automatischer Flip-Finder oder Live-Listing-Feed.

310 Python-Tests je Linux/Windows, zehn Frontend-Tests, Browser-/native Prüfungen und echter öffentlicher 1.0→1.1-Updateweg einschließlich Daten/Neustart/Currency-Auswahl/Backup-Restore bestanden. [Nachweise](https://github.com/Kaikulon-ThePirate/poe-economy-dashboard/tree/main/docs/evidence/gui11). Installer-SHA256: `afc9cf0a761d02b572555081265288ceafe8ddc183e750096a747a67dc61c1ce` (54351686 Bytes). Private Owner-Verteilung mit signierten Ed25519-Metadaten; Installer weiterhin ohne Authenticode.

Stable und sein Installer bleiben unverändert auf 1.0.0.

---

# PoE Economy Dashboard 1.0.0 — Stable

[Windows-x64-Installer herunterladen](https://github.com/Kaikulon-ThePirate/poe-economy-releases/releases/download/v1.0.0/PoEEconomy-1.0.0-Setup.exe) · [Releasehinweise](https://github.com/Kaikulon-ThePirate/poe-economy-releases/releases/tag/v1.0.0)

Bestehende Anwendung: **Stable → Nach Updates suchen → 1.0.0 installieren**. Auch im Testkanal verfügbar. Keine Neuinstallation und keine Python-/Node-Installation erforderlich. Erneutes Öffnen über die Startmenü-Verknüpfung „PoE Economy Dashboard“.

Enthält Marktansicht/Preisverlauf, offizielle Trade-Websuche, manuelle Angebote, Watchlists, Handelsjournal, Crafting-Kosten und Backup/Wiederherstellung. Keine automatische Echtzeit-Listingquelle. Schema 7/Konfiguration 2 bleiben unverändert.

Installer-SHA256: `4c30a62b79aaf52d08053bcc73d015df27ad0fefc400cc931063b4a2a6325bdb` (54335503 Bytes). Produktions-Ed25519-Metadaten und signierte Prüfsummen prüfen die Dateien. Der private Owner-Installer ist nicht Authenticode-signiert; Windows kann einen Hinweis zum unbekannten Herausgeber anzeigen.

CI und echte öffentliche 0.9.1→1.0-Updates in Test und Stable bestanden, einschließlich vorhandener Angebote/Journal/Rezepte, Neustart und Backup-Wiederherstellung. Die Stable-Promotion hat keine Binärdateien neu gebaut oder ersetzt. [Nachweise im Quellrepository](https://github.com/Kaikulon-ThePirate/poe-economy-dashboard/tree/main/docs/evidence/v1). Private Owner-Freigabe vom 19.11.2026; automatisierte native Nachweise auf Windows Server 2025, keine vollständige maschinelle Win11-Zertifizierung.

Frühere Hinweise unten sind historisch.

---

# PoE Economy Dashboard – Windows-Testversion 0.9.1

## Bereits installiert: direkt aktualisieren

In der Anwendung **Test → Nach Updates suchen → 0.9.1 installieren**. Sicherung, Migration und Neustart erfolgen automatisch. Keine Neuinstallation nötig.

Neu: **Manuelle Angebote**. Eigene Beobachtungen erfassen oder eigene JSON-Dateien importieren. Zuerst Vorschau prüfen, dann ausdrücklich speichern. Identische Beobachtungen und wiederholte Anfragen werden nicht doppelt importiert. Archiv und CSV-Export erhalten Originalpreise, Währung, Umrechnungskurs und Zeitpunkte.

Im Markt **Angebot erfassen** übernimmt die Variante als Entwurf; den tatsächlich beobachteten Preis selbst eintragen und die manuelle Zuordnung bestätigen. Referenzabstand nur zu passender frischer Chaosreferenz, bei frischer Beobachtung und gegebenenfalls frischem eigenen Umrechnungskurs. Ansonsten bleibt der Vergleich unbekannt. Kein Deal-Score, ausgeführter Verkauf, Verfügbarkeits- oder Gewinnbeleg; keine automatischen Trade-Abfragen und kein Scraping.

Der echte öffentliche **0.8.0 → 0.9.1**-Updateweg wurde mit dem unveränderten Originalinstaller und Produktionsvertrauensanker unter einem Windows-Standardbenutzer geprüft. Bestehende Journal-/Rezept-/Markt-/Watchlist-/Einstellungsdaten erhalten, neue Angebotsvorschau/Import/Wiederholung geprüft, anschließend portable Sicherung exportiert/importiert und über React bestätigt wiederhergestellt. Die Angebotsdaten blieben erhalten. Migration DB6→DB7, Config2 unverändert.

## Neuinstallation

[Windows-Installer 0.9.1 herunterladen](https://github.com/Kaikulon-ThePirate/poe-economy-releases/releases/download/v0.9.1/PoEEconomy-0.9.1-Setup.exe)

EXE ausführen und PoE Economy Dashboard über das Startmenü öffnen. Installation pro Benutzer; Python oder Node werden nicht benötigt. Für Updates den Testkanal in der Anwendung bestätigen. Erneuter Start öffnet die laufende Anwendung.

Installer-SHA256:

```text
a5a210ffe821107432db01b84f6854e21b9d857d5a82aca0354c20a8c6e02bf0
```

[Signierte Prüfsummen, SBOMs und Hinweise](https://github.com/Kaikulon-ThePirate/poe-economy-releases/releases/tag/v0.9.1)

## Daten und Grenzen

JSON-Import: Objekt mit `format: 1` und `records`,1–100 Datensätze, höchstens512KiB. Beispiel und Felder werden im Angebotsbereich angezeigt. Preise/Kurse als Dezimaltext, Zeitpunkte mit Zeitzone. Keine Verkäuferkonten oder Zugangsdaten. Maximal2.000 Beobachtungen inklusive Archiv und500 Importvorgänge, keine automatische Löschung. Die Quelle und Aktualität manueller Angaben kann die App nicht unabhängig bestätigen.

Weiter enthalten: poe.ninja-Markt-Explorer, Variantenfilter/Verlauf/Marktsignale, offizielle Trade-Suchlinks, Watchlists/Hinweiszentrale, FIFO-Journal und Crafting-Kostenplaner mit eigenen Annahmen. Keine In-App-Echtzeitangebote oder Handelsausführung. Sicherung/Wiederherstellung und technischer Diagnosebericht sind enthalten. Portable Sicherungen enthalten alle lokalen Daten und sollten getrennt aufbewahrt werden. Restore ersetzt aktive Daten nach zusätzlicher Sicherheitssicherung; andere Schemata benötigen ein zurückbehaltenes kompatibles Programmpaket.

**M6-/Windows-11-Gesamtabnahme und Stable bleiben offen.** Automatisierte native Nachweise stammen von Windows Server; die vollständige frische Windows-11- und Fehler-/Neustartmatrix ist nicht ersetzt. Installer im freigegebenen Owner-Modus ohne Authenticode; Updates werden über Ed25519, SHA256, eingebauten Vertrauensanker und HTTPS geprüft.

Die zurückgezogene0.9.0 scheiterte beim öffentlichen Neustarttest. 0.9.1 beseitigt die Konkurrenz zwischen Startüberwachung und neuem Backend; die alte Version wird unverändert als Nachweis aufbewahrt.

[Öffentlicher Update-/Neustart-/Restore-Nachweis](https://github.com/Kaikulon-ThePirate/poe-economy-dashboard/actions/runs/44532273251) · [Vollständige CI](https://github.com/Kaikulon-ThePirate/poe-economy-dashboard/actions/runs/44527217746)
