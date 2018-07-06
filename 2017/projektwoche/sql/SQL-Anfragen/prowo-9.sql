-- 9. "Eine Liste aller Schueler der Klasse 7b mit ihrem Aufenthaltsort am Donnerstag" 
SELECT Vorname, Nachname, Ort.Name FROM Schueler NATURAL JOIN Kurs NATURAL JOIN Termin INNER JOIN Ort ON Termin.Ortid = Ort.Ortid WHERE Schueler.Klasse = '7b' AND Termin.Tag = 4; 
