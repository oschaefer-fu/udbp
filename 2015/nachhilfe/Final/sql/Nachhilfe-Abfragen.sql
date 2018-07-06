/*
 Alle Abfragen für die Nachhilfe-Datenbank
 Stand: 4. Juli 2015
 Ausgabe in die neu angelegte Datei: Nachhilfe-Abfragen.sql
*/
\o Nachhilfe-Abfragen-LSG.sql

-- Anzeige aller Tabellen (auskommentiert)
/*
SELECT * FROM schueler;
SELECT * FROM fach;
SELECT * FROM ort;
SELECT * FROM slot;
SELECT * FROM stunde;
SELECT * FROM verfuegbar;
SELECT * FROM istTutor;
SELECT * FROM typ;
SELECT * FROM tutoren
ORDER BY tutoren.tnr;
*/

\qecho 01) "Alle Schueler aus Kladow"
SELECT * FROM schueler
WHERE ortsteil = 'Kladow';

\qecho 02) "Die Namen aller Schueler, die noch kein OK der Eltern haben"
SELECT vorname, name FROM schueler
WHERE eltOK = false;

\qecho 03) "Die Vornamen und Namen aller Schueler der 9. Klasse"
SELECT name FROM schueler
WHERE klasse = 9;

\qecho 04) "Die Namen der Schueler der 8. Klasse mit ihrem Ortsteil"
SELECT klasse, name, ortsteil 
FROM schueler
WHERE klasse = 8;

-- Bis hierher ohne Join

\qecho 05) "Die Namen und E-Mailadressen aller Tutoren in der Altstadt"
SELECT name, mail 
FROM schueler NATURAL JOIN istTutor
WHERE schueler.ortsteil = 'Altstadt'; 

\qecho 06) "Die Daten aller Tutoren für Mathematik Stufe 7"
SELECT * FROM schueler NATURAL JOIN istTutor
WHERE istTutor.fNr = 2;

\qecho 06a) "Die Daten aller Tutoren für Mathematik Stufe 7; realisiert ohne NATURAL JOIN"
SELECT * FROM schueler, istTutor
WHERE schueler.sNr = istTutor.sNr AND istTutor.fNr = 2; 

\qecho 06b) "Die Daten aller Tutoren für Mathematik Stufe 7; realisiert mit Unteranfrage"
SELECT * 
	FROM schueler 
	WHERE schueler.sNr IN(
		SELECT istTutor.sNr
		FROM istTutor
		WHERE istTutor.fNr = 2);

\qecho 07) " Die Namen, Vornamen, Ortsteile aller Schüler, die keine Tutoren sind"
SELECT schueler.name, schueler.vorname, schueler.ortsteil FROM schueler
EXCEPT
SELECT schueler.name, schueler.vorname, schueler.ortsteil 
FROM schueler NATURAL JOIN istTutor;

\qecho 08) "Die Nummern aller stattgefundenen Stunden mit dem Namen des unterrichteten Fachs"
SELECT stunde.stdNr, fach.fName
FROM stunde NATURAL JOIN fach
WHERE stunde.status = true;

\qecho 09)  "Die Namen aller Tutoren mit der durchschnittlichen Bewertung ihrer Stunden"
SELECT schueler.name, AVG(bewertung)
FROM schueler, stunde
WHERE stunde.tNr = schueler.sNr AND stunde.status = true
GROUP BY schueler.name;

\qecho 10) "Die Namen und E-Mailadressen aller Tutoren mit ihren Fächern"
SELECT schueler.name, schueler.mail, fach.fName, fach.fNr
FROM schueler NATURAL JOIN istTutor NATURAL JOIN fach; 

\qecho 11) "Eine Kostenauflistung (Summen) nach Schülernamen (Teilnehmer)"
SELECT SUM(preis), schueler.name
FROM stunde NATURAL JOIN schueler NATURAL JOIN typ
WHERE stunde.status = true
GROUP BY schueler.name;

\qecho 12) "Die Einnahmen (Summen) von Tutorin Meinike (sNr = 13) von ihren Schülern (Namen der Teilnehmer)"
SELECT schueler.name, SUM(preis) 
FROM stunde NATURAL JOIN schueler NATURAL JOIN typ
WHERE stunde.tNr = 13 AND stunde.sNr = schueler.sNr AND stunde.status = true
GROUP BY schueler.name;

\qecho 13) "Alle von Tutor Depp angebotenen Slots (Tag,Stunde,KW,Schuljahr)"
SELECT schueler.name, slot.tag, slot.stunde,slot.kW, slot.schuljahr 
FROM schueler NATURAL JOIN istTutor NATURAL JOIN verfuegbar NATURAL JOIN slot
WHERE schueler.name = 'Depp';

\qecho 14) "Die Namen und E-Mailadressen aller Tutoren die Slots in 2015 anbieten mit den entsprechenden Slots, aufsteigend nach Kalenderwochen"
SELECT schueler.name, schueler.mail, slot.tag, slot.stunde,slot.kW, slot.schuljahr 
FROM schueler NATURAL JOIN tutoren NATURAL JOIN verfuegbar NATURAL JOIN slot
WHERE slot.schuljahr = 2015
ORDER BY kw ASC;

\qecho 15) "Die Namen und E-Mailadressen aller Tutoren die Slots in KW 7, 2015 anbieten mit den entsprechenden Slots, sortiert nach Tagen"
SELECT schueler.name, schueler.mail, slot.tag, slot.stunde,slot.kW, slot.schuljahr 
FROM schueler NATURAL JOIN tutoren NATURAL JOIN verfuegbar NATURAL JOIN slot
WHERE slot.schuljahr = 2015 AND slot.kW = 7
ORDER BY tag ASC;

\qecho 16)"Die Namen und E-Mailadressen aller Tutoren die Slots in 2015 anbieten mit den entsprechenden Slots und den angebotenen Fächern (Fachname und Stufe)"
SELECT schueler.name, schueler.mail, slot.tag, slot.stunde,slot.kW, slot.schuljahr, fach.fName, fach.stufe
FROM schueler NATURAL JOIN istTutor NATURAL JOIN verfuegbar NATURAL JOIN slot NATURAL JOIN fach
WHERE slot.schuljahr = 2015
ORDER BY kw ASC;

\qecho 17)  "Die Namen aller Tutoren sortiert nach der durchschnittlichen Bewertung ihrer Stunden (absteigend)"
SELECT schueler.name, AVG(bewertung)
FROM schueler, stunde
WHERE stunde.tNr = schueler.sNr AND stunde.status = true
GROUP BY schueler.name
ORDER BY AVG(bewertung) DESC;

\qecho 18)  "Die durchschnittliche Bewertung der Stunden von Tutor Aust"
SELECT schueler.name, AVG(bewertung)
FROM schueler, stunde
WHERE stunde.tNr = schueler.sNr AND schueler.name = 'Aust' AND stunde.status = true
GROUP BY schueler.name;

\qecho 18a) "Die durchschnittlichen Bewertung der Stunden von Tutor Aust (mit View Tutoren)"
SELECT tutoren.name, AVG(bewertung)
FROM stunde NATURAL JOIN tutoren
WHERE tutoren.name = 'Aust' AND stunde.status = true
GROUP BY tutoren.name;

\qecho 19) "Alle stattgefundenen Mathe-Stunden mit den Tutorennamen und der Stundenbewertung, sortiert nach Stundennummern"
SELECT stunde.stdNr, schueler.name, stunde.bewertung
FROM schueler, stunde
WHERE stunde.tNr = schueler.sNr AND (stunde.fNr = 1 OR stunde.fNr = 2) AND stunde.status = true
ORDER BY stunde.stdNr;

\qecho 20.) "Die Teilnehmer (Name) der Mathematikstunde (Fachname) bei Meinike am Donnerstag in der 6.KW (SlotNummer 7)"
SELECT schueler.name, stunde.slotNr, fach.fName 
FROM stunde, schueler, fach
WHERE stunde.tNr = 13 AND stunde.slotNr = 7 AND fach.fNr = 2 AND stunde.sNr = schueler.sNr
GROUP BY schueler.name, stunde.slotNr, fach.fName;

\qecho 21)  "Die Einnahmen (Summe) der Tutorin Meinike von Schülern (Name) nach der 4. KW (Kalenderwoche des Slots)"
SELECT slot.kW, schueler.name, SUM(preis) 
FROM stunde NATURAL JOIN schueler NATURAL JOIN typ NATURAL JOIN slot
WHERE stunde.tNr = 13 AND stunde.sNr = schueler.sNr AND slot.kW <= 4 AND stunde.status = true
GROUP BY slot.kW, schueler.name;

\qecho 22) "Alle Nachhilfestunden für Mathematik in der 6.KW (Tutorname, Tag, Stunde, Jahr)"
SELECT schueler.name, slot.tag, slot.stunde, slot.schuljahr 
FROM schueler NATURAL JOIN istTutor NATURAL JOIN verfuegbar NATURAL JOIN slot
WHERE slot.kW = 6 AND istTutor.fNr = 2;

\qecho 23) "Alle Nachhilfestunden die von Schüler Arend im Jahr 2015 besucht wurden"
SELECT * 
	FROM stunde NATURAL JOIN slot NATURAL JOIN schueler
	WHERE stunde.sNr = schueler.sNr AND slot.schuljahr = 2015 AND schueler.name = 'Ahrend';

\qecho 23a) "Alle Nachhilfestunden die von Schüler Arend im Jahr 2015 besucht wurden - mit Unteranfrage"
SELECT * 
	FROM stunde NATURAL JOIN slot
	WHERE stunde.sNr IN (
		SELECT schueler.sNr   
		FROM schueler, slot
		WHERE schueler.name = 'Ahrend' AND slot.schuljahr = 2015);

\qecho 24)"Die Namen und E-Mailadressen aller Tutoren die am Donnerstag, 9. Stunde, 6.KW in 2015 verfügbar sind mit den von ihnen unterrichteten Fächern."
SELECT schueler.name, schueler.mail, fach.fName, fach.stufe
FROM schueler NATURAL JOIN istTutor NATURAL JOIN verfuegbar NATURAL JOIN slot NATURAL JOIN fach
WHERE slot.tag = 'Don' AND slot.stunde = 9 AND slot.kW = 6 AND slot.schuljahr = 2015
ORDER BY schueler.name ASC;

\qecho 24a)"Die Namen und E-Mailadressen aller Tutoren die am Donnerstag, 9. Stunde, 6.KW in 2015 verfügbar sind. - mit Unterabfrage a"
SELECT schueler.name, schueler.mail, fach.fName, fach.stufe
FROM schueler  NATURAL JOIN istTutor NATURAL JOIN verfuegbar NATURAL JOIN fach
WHERE verfuegbar.slotNr IN (
	SELECT slot.slotNr
	FROM slot
	WHERE slot.tag = 'Don' AND slot.stunde = 9 AND slot.kW = 6 AND slot.schuljahr = 2015
ORDER BY schueler.name ASC);

\qecho 24b) "Die Namen und E-Mailadressen aller Tutoren die am Donnerstag, 9. Stunde, 6.KW in 2015 verfügbar sind. - mit Unterabfrage b (Alternative)"
SELECT schueler.name, schueler.mail, fach.fName, fach.stufe
FROM schueler NATURAL JOIN istTutor NATURAL JOIN fach
WHERE istTutor.sNr IN (
	SELECT verfuegbar.sNr
	FROM slot NATURAL JOIN verfuegbar
	WHERE slot.tag = 'Don' AND slot.stunde = 9 AND slot.kW = 6 AND slot.schuljahr = 2015
ORDER BY schueler.name ASC);

\qecho 25) "Namen und E-Mailadressen aller Tutoren sortiert nach Ortsteil" - mit Unterabfrage
SELECT schueler.ortsteil, schueler.vorname, schueler.name, schueler.mail
FROM schueler NATURAL JOIN tutoren
WHERE Exists (
	SELECT *
	FROM schueler 
	WHERE schueler.name = tutoren.name
ORDER BY schueler.ortsteil);--, schueler.vorname, schueler.name, schueler.mail;

\qecho 26) "Anzahl aller stattgefundenen Stunden"
SELECT COUNT(*) AS Anzahl
FROM stunde 
WHERE stunde.status = true;

\qecho 27) "Alle Tutoren"
SELECT *
FROM Tutoren;

\qecho 28) "Alle Stunden (Stundennummer) mit den Namen der Tutoren, sortiert nach Stundennummern."
SELECT stunde.stdNr, tutoren.name
FROM Tutoren NATURAL JOIN stunde
WHERE stunde.status = true
ORDER BY stunde.stdNr;

\qecho 29) "Alle Stunden von Meinike, die stattgefunden haben, sortiert nach Stundennummern."
SELECT stunde.stdNr, tutoren.name
FROM Tutoren NATURAL JOIN stunde
WHERE stunde.status = true AND tutoren.name = 'Meinike'
ORDER BY stunde.stdNr;

\qecho 30) "Alle Stunden von Meinike "

SELECT stunde.stdNr, fach.fName, stunde.bewertung
FROM Tutoren NATURAL JOIN stunde NATURAL JOIN fach
WHERE stunde.status = true AND tutoren.name = 'Meinike' 
ORDER BY stunde.stdNr;
--\o
