-- Nachhilfe-Datenbank; Abfrage 05

--\o Nachhilfe-query05.ans
\qecho 05) "Die Namen und E-Mailadressen aller Tutoren in der Altstadt"
SELECT name, mail 
FROM schueler NATURAL JOIN istTutor
WHERE schueler.ortsteil = 'Altstadt';
--\o
