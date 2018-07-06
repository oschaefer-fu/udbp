-- Nachhilfe-Datenbank; Abfrage 04

--\o Nachhilfe-query04.ans
\qecho 04) "Die Namen der Schueler der 8. Klasse mit ihrem Ortsteil"
SELECT klasse, name, ortsteil 
FROM schueler
WHERE klasse = 8;
--\o
