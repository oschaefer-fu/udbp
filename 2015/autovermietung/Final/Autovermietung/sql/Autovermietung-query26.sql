-- Aufgabe 26
-- Welcher Kunde mit Vor- und Nachname  hat die meisten Tage gebucht?
SELECT SUM (VDauer) AS Miettage, Mieter.MVorname, Mieter.MName 
FROM Vertrag, Mieter 
WHERE Vertrag.MNr = Mieter.MNr 
GROUP BY Mieter.MNr, Mieter.MVorname, Mieter.MName 
ORDER BY Miettage DESC LIMIT 1;
