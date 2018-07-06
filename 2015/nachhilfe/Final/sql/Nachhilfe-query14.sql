-- Nachhilfe-Datenbank; Abfrage 14

--\o Nachhilfe-query05.ans
\qecho 14) "Die Namen und E-Mailadressen aller Tutoren die Slots in 2015 anbieten mit den entsprechenden Slots, aufsteigend nach Kalenderwochen"
SELECT schueler.name, schueler.mail, slot.tag, slot.stunde,slot.kW, slot.schuljahr 
FROM schueler NATURAL JOIN tutoren NATURAL JOIN verfuegbar NATURAL JOIN slot
WHERE slot.schuljahr = 2015
ORDER BY kw ASC;
--\o


