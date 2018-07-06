-- Nachhilfe-Datenbank; Abfrage 13

--\o Nachhilfe-query13.ans
\qecho 13) "Alle von Tutor Depp angebotenen Slots (Tag,Stunde,KW,Schuljahr)"
SELECT schueler.name, slot.tag, slot.stunde,slot.kW, slot.schuljahr 
FROM schueler NATURAL JOIN istTutor NATURAL JOIN verfuegbar NATURAL JOIN slot
WHERE schueler.name = 'Depp';
--\o
