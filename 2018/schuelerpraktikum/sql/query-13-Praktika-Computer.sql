SELECT FName, PName
FROM Firma NATURAL JOIN Taetigkeitsbereich NATURAL JOIN Praktikum NATURAL JOIN Einsatzbereich NATURAL JOIN angebot
WHERE Anforderung = 'Computerkenntnisse'
ORDER BY firma.fname ASC ;