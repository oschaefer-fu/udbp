--	LWB	Informatik
--	UDBP	Sportfest
--
--	Delete Tabelle

DELETE FROM ONLY Schueler WHERE Schwimmnachweis = false; 	-- Löschen der Schüler der Tabelle Schueler mit Bedingung Schwimmnachweis nicht vorhanden
DELETE FROM ONLY Teilnahme WHERE Ergebnis < 3;			-- Löschen der teilnehmenden Schüler der Tabelle Teilnahme mit Bedingung Ergebnis Wettkampf <3 Punkte
DELETE FROM ONLY Dienstleister WHERE DName = 'GuteFahrt';	-- Löschen des Dienstleisters 'Gute Fahrt' aus der Tabelle Dienstleister
DELETE FROM ONLY Material WHERE MName = 'Ständer';		-- Löschen der Materialgruppe 'Ständer' aus der Tabelle Material
