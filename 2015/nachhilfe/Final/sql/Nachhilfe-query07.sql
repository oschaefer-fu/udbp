-- Nachhilfe-Datenbank; Abfrage 07

--\o Nachhilfe-query07.ans
\qecho 07) " Die Namen, Vornamen, Ortsteile aller Schüler, die keine Tutoren sind"
SELECT schueler.name, schueler.vorname, schueler.ortsteil FROM schueler
EXCEPT
SELECT schueler.name, schueler.vorname, schueler.ortsteil 
FROM schueler NATURAL JOIN istTutor;
--\o
