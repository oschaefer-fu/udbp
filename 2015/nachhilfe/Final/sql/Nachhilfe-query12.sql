-- Nachhilfe-Datenbank; Abfrage 12

--\o Nachhilfe-query12.ans
\qecho 12) "Die Einnahmen (Summen) von Tutorin Meinike (sNr = 13) von ihren Schülern (Namen der Teilnehmer)"
SELECT schueler.name, SUM(preis) 
FROM stunde NATURAL JOIN schueler NATURAL JOIN typ
WHERE stunde.tNr = 13 AND stunde.sNr = schueler.sNr AND stunde.status = true
GROUP BY schueler.name;
--\o
