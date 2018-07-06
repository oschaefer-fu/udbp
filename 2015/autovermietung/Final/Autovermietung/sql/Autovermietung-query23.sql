-- Aufgabe 23
-- Anzahl der Verträge pro Kunde, absteigend sortiert.
SELECT count (*) AS Vertraege, MNr 
FROM Vertrag
GROUP BY MNr 
ORDER BY Vertraege DESC;
