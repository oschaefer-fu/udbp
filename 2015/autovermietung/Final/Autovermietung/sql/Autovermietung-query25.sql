-- Aufgabe 25
-- Gesamtmietzeit der Kunden absteigend sortiert?
SELECT SUM (VDauer) AS Miettage, MNr 
FROM Vertrag 
GROUP BY MNr 
ORDER BY Miettage DESC;
