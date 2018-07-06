-- Nachhilfe-Datenbank; Abfrage 09

--\o Nachhilfe-query09.ans
\qecho 09)  "Die Namen aller Tutoren mit der durchschnittlichen Bewertung ihrer Stunden"
SELECT schueler.name, AVG(bewertung)
FROM schueler, stunde
WHERE stunde.tNr = schueler.sNr AND stunde.status = true
GROUP BY schueler.name;
--\o
