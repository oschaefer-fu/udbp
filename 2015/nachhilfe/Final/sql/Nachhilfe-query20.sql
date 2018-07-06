-- Nachhilfe-Datenbank; Abfrage 20

--\o Nachhilfe-query20.ans
\qecho 20.) "Die Teilnehmer (Name) der Mathematikstunde (Fachname) bei Meinike am Donnerstag in der 6.KW (SlotNummer 7)"
SELECT schueler.name, stunde.slotNr, fach.fName 
FROM stunde, schueler, fach
WHERE stunde.tNr = 13 AND stunde.slotNr = 7 AND fach.fNr = 2 AND stunde.sNr = schueler.sNr
GROUP BY schueler.name, stunde.slotNr, fach.fName;
--\o
