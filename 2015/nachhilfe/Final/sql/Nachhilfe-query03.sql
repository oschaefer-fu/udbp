-- Nachhilfe-Datenbank; Abfrage 03

--\o Nachhilfe-query03.ans
\qecho 03) "Die Namen aller Schueler der 9. Klasse"
SELECT name FROM schueler
WHERE klasse = 9;
--\o
