-- Aufgabe 24
-- Gib den Namen des Kunden der die meisten Verträge abgeschlossen hat?
SELECT count (*) AS Vertraege, Mieter.MVorname, Mieter.MName 
FROM Vertrag, Mieter 
WHERE Vertrag.MNr = Mieter.MNr 
GROUP BY Mieter.MVorname, Mieter.MName 
ORDER BY Vertraege DESC LIMIT 1;
