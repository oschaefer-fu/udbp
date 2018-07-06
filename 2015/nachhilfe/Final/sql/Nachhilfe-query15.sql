-- Nachhilfe-Datenbank; Abfrage 15

--\o Nachhilfe-query15.ans
\qecho 15) "Die Namen und E-Mailadressen aller Tutoren die Slots in KW 7, 2015 anbieten mit den entsprechenden Slots, sortiert nach Tagen"
SELECT schueler.name, schueler.mail, slot.tag, slot.stunde,slot.kW, slot.schuljahr 
FROM schueler NATURAL JOIN tutoren NATURAL JOIN verfuegbar NATURAL JOIN slot
WHERE slot.schuljahr = 2015 AND slot.kW = 7
ORDER BY tag ASC;
--\o
