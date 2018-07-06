-- Aufgabe 13
-- Gib alle Auto mit Kennzeichen an, die in der Station Nr. 1 stehen 
-- aufsteigend sortiert nach Sitzplatznummer aus.	
SELECT ANr, AModell 
FROM Auto 
WHERE Snr = '1' 
ORDER BY ASitzplaetze ASC;
