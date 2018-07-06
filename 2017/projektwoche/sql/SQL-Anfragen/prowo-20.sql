-- 2. "Anzahl der Sportlehrer"
SELECT COUNT(Fach.FachID) AS Anzahl_Sportlehrer FROM Lehrer NATURAL JOIN unterrichtet INNER JOIN FACH ON unterrichtet.FachID = Fach.FachID WHERE Fach.Name='Sport'
