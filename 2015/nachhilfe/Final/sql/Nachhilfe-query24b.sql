-- Nachhilfe-Datenbank; Abfrage 24b

--\o Nachhilfe-query24b.ans
\qecho 24b) "Die Namen und E-Mailadressen aller Tutoren die am Donnerstag, 9. Stunde, 6.KW in 2015 verfügbar sind. - mit Unterabfrage b (Alternative)"
SELECT schueler.name, schueler.mail, fach.fName, fach.stufe
FROM schueler NATURAL JOIN istTutor NATURAL JOIN fach
WHERE istTutor.sNr IN (
	SELECT verfuegbar.sNr
	FROM slot NATURAL JOIN verfuegbar
	WHERE slot.tag = 'Don' AND slot.stunde = 9 AND slot.kW = 6 AND slot.schuljahr = 2015
ORDER BY schueler.name ASC);
--\o
