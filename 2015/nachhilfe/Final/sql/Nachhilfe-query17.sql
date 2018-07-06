-- Nachhilfe-Datenbank; Abfrage 17

--\o Nachhilfe-query17.ans
\qecho 17)  "Die Namen aller Tutoren sortiert nach der durchschnittlichen Bewertung ihrer Stunden (absteigend)"
SELECT schueler.name, AVG(bewertung)
FROM schueler, stunde
WHERE stunde.tNr = schueler.sNr AND stunde.status = true
GROUP BY schueler.name
ORDER BY AVG(bewertung) DESC;
--\o
