-- Nachhilfe-Datenbank; Abfrage 10

--\o Nachhilfe-query10.ans
\qecho 10) "Die Namen und E-Mailadressen aller Tutoren mit ihren Fächern"
SELECT schueler.name, schueler.mail, fach.fName, fach.fNr
FROM schueler NATURAL JOIN istTutor NATURAL JOIN fach; 
--\o
