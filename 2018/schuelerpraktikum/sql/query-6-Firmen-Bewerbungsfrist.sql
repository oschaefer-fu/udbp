SELECT DISTINCT FName  AS "Firma"
FROM Firma NATURAL JOIN Bewerbung
WHERE Frist = 'nein';