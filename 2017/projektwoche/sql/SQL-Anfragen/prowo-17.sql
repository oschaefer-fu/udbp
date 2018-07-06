-- 17. Anzahl der Schüler im 'Mittelalterkurs'"
SELECT COUNT(SchuelerID) AS Schueler_im_Mittelalterkurs FROM Schueler NATURAL JOIN Kurs Where Kurs.Name = 'Mittelalterkurs'
