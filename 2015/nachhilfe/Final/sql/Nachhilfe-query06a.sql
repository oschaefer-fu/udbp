-- Nachhilfe-Datenbank; Abfrage 06a

--\o Nachhilfe-query06a.ans
\qecho 06a) "Die Daten aller Tutoren für Mathematik Stufe 7; realisiert ohne NATURAL JOIN"
SELECT * FROM schueler, istTutor
WHERE schueler.sNr = istTutor.sNr AND istTutor.fNr = 2; 
--\o
