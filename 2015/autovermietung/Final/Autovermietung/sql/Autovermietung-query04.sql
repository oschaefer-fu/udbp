-- Aufgabe 04
-- Gib alle Auto mit Kennzeichen an, die zwischen 2 und 4 Sitzplätze 
-- haben.	
SELECT ANr,AModell 
FROM Auto 
WHERE ASitzplaetze >= 2 AND ASitzplaetze <= 4;
