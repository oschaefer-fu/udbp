-- Nachhilfe-Datenbank; Abfrage 01

--\o Nachhilfe-query01.ans
\qecho 01) "Die Daten aller Schueler aus Kladow"
SELECT * FROM schueler
WHERE ortsteil = 'Kladow';
--\o
