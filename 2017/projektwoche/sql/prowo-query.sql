-- 1. "Liste aller Kursnamen"  
SELECT Name FROM Kurs;

-- 2. "Schuelernamen der Klasse 8a"
SELECT Nachname, Vorname FROM Schueler WHERE Klasse = '8a';

-- 3. "Lehrerkuerzel + Fach aller Fachverantwortlichen mit Nawi-Fach"
SELECT Kuerzel, Name FROM Fach WHERE Name = 'Physik' or Name = 'Chemie' or Name = 'Biologie';

-- 4. "Alle Fachverantwortlichen mit jeweiligem zugehoerigen Fach"
SELECT * FROM Fach NATURAL JOIN Lehrer;

--5. "Alle Raeume (und Exkursions- und Aufsichtsorte), die am Montag nicht belegt sind"
SELECT Name FROM Ort EXCEPT SELECT Name FROM Ort NATURAL JOIN Termin WHERE Tag = 1;

-- 6. "Die Kuerzel der Lehrer, die wenigstens einmal in der Woche arbeiten (Kurs, Exkursion, Aufsicht)"
SELECT Kuerzel FROM Lehrer NATURAL JOIN Kurs UNION SELECT Kuerzel FROM Lehrer NATURAL JOIN Aufsicht;

-- 7. "Alle Lehrer, die nicht in der Projektwoche eingesetzt werden (nicht einmal eine Aufsicht)"
SELECT Kuerzel FROM Lehrer EXCEPT (SELECT Kuerzel FROM Lehrer NATURAL JOIN Kurs UNION SELECT Kuerzel FROM Lehrer NATURAL JOIN Aufsicht);

-- 8. "Alle Lehrer, die im Hof Aufsicht fuehren"
SELECT DISTINCT Kuerzel FROM Lehrer NATURAL JOIN Aufsicht NATURAL JOIN Ort WHERE Name = 'Hof';
----> Achtung! Damit bei RA und SQL das Gleiche Ergebnis herauskommt, muss bei SQL Distinct ausgeführt werden.

-- 9. "Eine Liste aller Schueler der Klasse 7b mit ihrem Aufenthaltsort am Donnerstag" 
SELECT Vorname, Nachname, Ort.Name FROM Schueler NATURAL JOIN Kurs NATURAL JOIN Termin INNER JOIN Ort ON Termin.Ortid = Ort.Ortid WHERE Schueler.Klasse = '7b' AND Termin.Tag = 4; 

-- 10. Alle Lehrer, die irgendwann in der Woche im Museumsdorf sind (Entweder als Kursleiter oder als Begleitung)
SELECT Kuerzel FROM Lehrer NATURAL JOIN AUFSICHT INNER JOIN ORT ON Aufsicht.Ortid = Ort.Ortid WHERE Ort.Name = 'Museumsdorf' 
UNION SELECT Kuerzel FROM Lehrer NATURAL JOIN Kurs INNER JOIN Termin ON Kurs.Kursid = Termin.Kursid INNER JOIN Ort ON Termin.Ortid = Ort.Ortid
WHERE Ort.Name = 'Museumsdorf';

-- 11. Anzahl aller Kurse
SELECT COUNT(KursID) FROM Kurs;

-- 2. Anzahl aller Kurse, Summe dabei in 'Anzahl aller Kurse' umbennennen
SELECT COUNT(KursID) AS Anzahl_aller_Kurse FROM Kurs;

-- 3. Klasse mit mehr als 5 Schülern
SELECT  Klasse, COUNT(Klasse) AS Anzahl FROM Schueler GROUP BY Klasse HAVING COUNT(Klasse)>5;

-- 14. Übersicht Kürzel + Anzahl Aufsichten (ohne Exkursionsbegleitungen)
SELECT Kuerzel, COUNT(Start) AS Anzahl_Aufsichten FROM Aufsicht WHERE (Start=940 and Ende=1000) or (Start=1140 and Ende=1210) GROUP BY Kuerzel;

-- 15. Anzahl der Exkursionsbegleitungen der Lehrer
SELECT Kuerzel, COUNT(Start) AS Dauer_in_min FROM Aufsicht WHERE NOT (Start=940 and Ende=1000 or Start=1140 and Ende=1210) Group By Kuerzel;

-- 6. Anzahl  der SuS in den jeweiligen Kursen, mit Angabe der Kursnamen
SELECT  Name, COUNT(KursID) FROM Schueler NATURAL JOIN Kurs GROUP BY Name;

-- 17. Anzahl der Schüler im 'Mittelalterkurs'"
SELECT COUNT(SchuelerID) AS Schueler_im_Mittelalterkurs FROM Schueler NATURAL JOIN Kurs Where Kurs.Name = 'Mittelalterkurs';

-- 18. Übersicht der Kurse mit der Anzahl der verantwortlichen SuS
SELECT Kurs.Name, SUM(Schueler.istVerantwortlich) AS Anzahl_verantwortliche_SuS FROM Schueler NATURAL JOIN Kurs GROUP BY Kurs.KursID;

-- 19. "Durchschnittlicher Kursstart pro Tag"
SELECT Name, AVG(Start) AS Durchnittliche_Kursstart_pro_Tag FROM Termin NATURAL JOIN Kurs GROUP BY KursID, Name ;

-- 20. "Anzahl der Sportlehrer"
SELECT COUNT(Fach.FachID) AS Anzahl_Sportlehrer FROM Lehrer NATURAL JOIN unterrichtet INNER JOIN FACH ON unterrichtet.FachID = Fach.FachID WHERE Fach.Name='Sport';


