-- Nachhilfe-Datenbank; Abfrage 24a

\qecho 24a)"Die Namen und E-Mailadressen aller Tutoren die am Donnerstag, 9. Stunde, 6.KW in 2015 verfügbar sind. - mit Unterabfrage a"
SELECT schueler.name, schueler.mail, fach.fName, fach.stufe
FROM schueler  NATURAL JOIN istTutor NATURAL JOIN verfuegbar NATURAL JOIN fach
WHERE verfuegbar.slotNr IN (
	SELECT slot.slotNr
	FROM slot
	WHERE slot.tag = 'Don' AND slot.stunde = 9 AND slot.kW = 6 AND slot.schuljahr = 2015
ORDER BY schueler.name ASC);
