-- Nachhilfe-Datenbank; Abfrage 08

--\o Nachhilfe-query08.ans
\qecho 08) "Die Nummern aller stattgefundenen Stunden mit dem Namen des unterrichteten Fachs"
SELECT stunde.stdNr, fach.fName
FROM stunde NATURAL JOIN fach
WHERE stunde.status = true;
--\o
