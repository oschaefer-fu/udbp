-- Nachhilfe-Datenbank; Abfrage 29

--\o Nachhilfe-query29.ans
\qecho 29) "Alle Stunden von Meinike, die stattgefunden haben, sortiert nach Stundennummern."
SELECT stunde.stdNr, tutoren.name
FROM Tutoren NATURAL JOIN stunde
WHERE stunde.status = true AND tutoren.name = 'Meinike'
ORDER BY stunde.stdNr;
--\o
