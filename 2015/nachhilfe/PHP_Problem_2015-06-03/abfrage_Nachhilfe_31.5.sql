/*
 Abfragen für die Nachhilfe-Datenbank
 Daten von Tobias: create_tables_Nachhilfe_18.5.sql und insert_Nachhilfe_18.5.sql
 
 Stand: 31.5.2015
 Bearbeitet von Alex
   
 Ausgabe in die neu angelegte Datei: abfragetest.sql
*/
\o abfrageTest.sql

-- Anzeige aller Tabellen (auskommentiert)
--SELECT * FROM schueler;
--SELECT * FROM fach;
--SELECT * FROM ort;
--SELECT * FROM slot;
--SELECT * FROM stunde;
--SELECT * FROM verfuegbar;
--SELECT * FROM istTutor;
--SELECT * FROM typ;

\qecho "Alle Schueler aus Kladow"
SELECT * FROM schueler
WHERE ortsteil = 'Kladow';

\qecho "Die Namen aller Schueler der 9. Klasse"
SELECT name FROM schueler
WHERE klasse = 9;

\qecho "Die Schueler der 8. Klasse mit Ortsteil"
SELECT klasse, name, ortsteil FROM schueler
WHERE klasse = 8;

\qecho "Namen und E-Mailadressen aller Tutoren in der Altstadt"
SELECT name, mail FROM schueler NATURAL JOIN istTutor
WHERE schueler.ortsteil = 'Altstadt'; 

\qecho "Namen und E-Mailadressen aller Tutoren mit ihren Fächern"
SELECT schueler.name, schueler.mail, fach.fName, fach.fNr
FROM schueler NATURAL JOIN istTutor NATURAL JOIN fach; 

\qecho "Tutoren für Mathematik Stufe 7"
SELECT * FROM schueler NATURAL JOIN istTutor
WHERE istTutor.fNr = 2;
-- oder:
-- SELECT * FROM schueler, istTutor
-- WHERE schueler.sNr = istTutor.sNr AND istTutor.fNr = 2; 

\qecho "Alle von Tutor Depp angebotenen Slots"
SELECT schueler.name, slot.tag, slot.stunde,slot.kW, slot.schuljahr 
FROM schueler NATURAL JOIN istTutor NATURAL JOIN verfuegbar NATURAL JOIN slot
WHERE schueler.name = 'Depp';

\qecho "Namen und E-Mailadressen aller Tutoren die Slots in 2015 anbieten mit den entsprechenden Slots"
SELECT schueler.name, schueler.mail, slot.tag, slot.stunde,slot.kW, slot.schuljahr 
FROM schueler NATURAL JOIN istTutor NATURAL JOIN verfuegbar NATURAL JOIN slot
WHERE slot.schuljahr = 2015
ORDER BY kw ASC;

\qecho "Namen und E-Mailadressen aller Tutoren die Slots in 2015 anbieten mit den entsprechenden Slots" 
-- PLUS FACH
SELECT schueler.name, schueler.mail, slot.tag, slot.stunde,slot.kW, slot.schuljahr, fach.fName, fach.stufe
FROM schueler NATURAL JOIN istTutor NATURAL JOIN verfuegbar NATURAL JOIN slot NATURAL JOIN fach
WHERE slot.schuljahr = 2015
ORDER BY kw ASC;

\qecho "Namen und E-Mailadressen aller Tutoren die Slots in 2015 anbieten mit den entsprechenden Slots"
-- sortiert nach Tagen
SELECT schueler.name, schueler.mail, slot.tag, slot.stunde,slot.kW, slot.schuljahr 
FROM schueler NATURAL JOIN istTutor NATURAL JOIN verfuegbar NATURAL JOIN slot
WHERE slot.schuljahr = 2015
ORDER BY tag ASC;

\qecho "Namen, Vornamen, Ortsteile aller Schüler, die keine Tutoren sind"
SELECT schueler.name, schueler.vorname, schueler.ortsteil FROM schueler
EXCEPT
SELECT schueler.name, schueler.vorname, schueler.ortsteil FROM schueler NATURAL JOIN istTutor;

\qecho "Alle stattgefundenen Stunden"
SELECT stunde.stdNr, fach.fName
FROM stunde NATURAL JOIN fach
WHERE stunde.status = true;

\qecho "Kostenauflistung nach Schülernamen"
SELECT SUM(preis), schueler.name
FROM stunde NATURAL JOIN schueler NATURAL JOIN typ
--WHERE schueler.name = 'Berend'
GROUP BY schueler.name;

\o
-- Ende der Ausgabe in Datei abfragetest.sql






