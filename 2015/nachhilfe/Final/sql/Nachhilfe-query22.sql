-- Nachhilfe-Datenbank; Abfrage 22

--\o Nachhilfe-query22.ans
\qecho 22) "Alle Nachhilfestunden für Mathematik in der 6.KW (Tutorname, Tag, Stunde, Jahr)"
SELECT schueler.name, slot.tag, slot.stunde, slot.schuljahr 
FROM schueler NATURAL JOIN istTutor NATURAL JOIN verfuegbar NATURAL JOIN slot
WHERE slot.kW = 6 AND istTutor.fNr = 2;
--\o
