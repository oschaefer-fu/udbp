-- Nachhilfe-Datenbank; Abfrage 20 - modifiziert

\qecho 20.) "Die Teilnehmer (Name) der Mathematikstunde (Fachname) bei Meinike am Donnerstag in der 6.KW (SlotNummer 7)"
SELECT    schueler.name, stunde.slotNr, fach.fName 
FROM      stunde natural join schueler natural join fach natural join slot natural join
          ( SELECT  schueler.snr as tnr, name as tname, vorname as tvorname
            FROM    schueler, isttutor
            WHERE   schueler.snr = isttutor.snr ) as tutoren
WHERE     tutoren.tname = 'Meinike' AND slot.kW = 6 AND slot.tag = 'Don' AND fach.fName = 'Mathematik' AND schueler.eltok;
