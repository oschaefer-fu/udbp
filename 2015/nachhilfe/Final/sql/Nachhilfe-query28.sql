-- Nachhilfe-Datenbank; Abfrage 28

--\o Nachhilfe-query28.ans
\qecho 28) "Alle Stunden (Stundennummer) mit den Namen der Tutoren, sortiert nach Stundennummern."
SELECT stunde.stdNr, tutoren.name
FROM Tutoren NATURAL JOIN stunde
WHERE stunde.status = true
ORDER BY stunde.stdNr;
--\o
