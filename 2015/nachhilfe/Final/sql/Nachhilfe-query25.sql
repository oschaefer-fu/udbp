-- Nachhilfe-Datenbank; Abfrage 25

--\o Nachhilfe-query245.ans
\qecho 25) "Namen und E-Mailadressen aller Tutoren sortiert nach Ortsteil" - mit Unterabfrage
SELECT schueler.ortsteil, schueler.vorname, schueler.name, schueler.mail
FROM schueler NATURAL JOIN tutoren
WHERE Exists (
	SELECT *
	FROM schueler 
	WHERE schueler.name = tutoren.name
ORDER BY schueler.ortsteil);
--\o
