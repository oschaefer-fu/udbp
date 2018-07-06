-- Nachhilfe-Datenbank; Abfrage 16

--\o Nachhilfe-query16.ans
\qecho 16)"Die Namen und E-Mailadressen aller Tutoren die Slots in 2015 anbieten mit den entsprechenden Slots und den angebotenen Fächern (Fachname und Stufe)"
SELECT schueler.name, schueler.mail, slot.tag, slot.stunde,slot.kW, slot.schuljahr, fach.fName, fach.stufe
FROM schueler NATURAL JOIN tutoren NATURAL JOIN verfuegbar NATURAL JOIN slot NATURAL JOIN fach
WHERE slot.schuljahr = 2015
ORDER BY kw ASC;
--\o
