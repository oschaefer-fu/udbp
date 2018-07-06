-- Nachhilfe-Datenbank; Abfrage 26

--\o Nachhilfe-query26.ans
\qecho 26) "Anzahl aller stattgefundenen Stunden"
SELECT COUNT(*) AS Anzahl
FROM stunde 
WHERE stunde.status = true;
--\o
