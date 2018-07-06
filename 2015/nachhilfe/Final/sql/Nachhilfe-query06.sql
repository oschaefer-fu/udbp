-- Nachhilfe-Datenbank; Abfrage 06

--\o Nachhilfe-query06.ans
\qecho 06) "Die Daten aller Tutoren für Mathematik Stufe 7"
SELECT * FROM schueler NATURAL JOIN istTutor
WHERE istTutor.fNr = 2;
--\o
