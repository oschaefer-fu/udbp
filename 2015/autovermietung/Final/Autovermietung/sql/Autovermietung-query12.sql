-- Aufgabe 12
-- Gib alle Auto mit Kennzeichen an, sortiert nach den Stationen aus.	
SELECT ANr, Amodell, Snr 
FROM Auto 
GROUP BY SNr, ANr, Amodell 
ORDER BY SNr;
