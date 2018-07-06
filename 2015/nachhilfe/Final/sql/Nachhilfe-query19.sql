-- Nachhilfe-Datenbank; Abfrage 19

--\o Nachhilfe-query19.ans
\qecho 19) "Alle stattgefundenen Mathe-Stunden mit den Tutorennamen und der Stundenbewertung, sortiert nach Stundennummern"
SELECT stunde.stdNr, schueler.name, stunde.bewertung
FROM schueler, stunde
WHERE stunde.tNr = schueler.sNr AND (stunde.fNr = 1 OR stunde.fNr = 2) AND stunde.status = true
ORDER BY stunde.stdNr;
--\o
