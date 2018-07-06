SELECT FName
FROM Taetigkeitsbereich NATURAL JOIN Einsatzbereich NATURAL JOIN Angebot NATURAL JOIN Firma
WHERE Anforderung = 'Kreativität'
GROUP BY FName, Entfernung
ORDER BY Entfernung ASC;
