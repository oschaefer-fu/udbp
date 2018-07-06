-- 10. Alle Lehrer, die irgendwann in der Woche im Museumsdorf sind (Entweder als Kursleiter oder als Begleitung)
SELECT Kuerzel FROM Lehrer NATURAL JOIN AUFSICHT INNER JOIN ORT ON Aufsicht.Ortid = Ort.Ortid WHERE Ort.Name = 'Museumsdorf' 
UNION SELECT Kuerzel FROM Lehrer NATURAL JOIN Kurs INNER JOIN Termin ON Kurs.Kursid = Termin.Kursid INNER JOIN Ort ON Termin.Ortid = Ort.Ortid
WHERE Ort.Name = 'Museumsdorf';
