-- Nachhilfe-Datenbank; Abfrage 24

--\o Nachhilfe-query24.ans
\qecho 24)"Die Namen und E-Mailadressen aller Tutoren die am Donnerstag, 9. Stunde, 6.KW in 2015 verfügbar sind mit den von ihnen unterrichteten Fächern."
SELECT schueler.name, schueler.mail, fach.fName, fach.stufe
FROM schueler NATURAL JOIN istTutor NATURAL JOIN verfuegbar NATURAL JOIN slot NATURAL JOIN fach
WHERE slot.tag = 'Don' AND slot.stunde = 9 AND slot.kW = 6 AND slot.schuljahr = 2015
ORDER BY schueler.name ASC;
--\o
