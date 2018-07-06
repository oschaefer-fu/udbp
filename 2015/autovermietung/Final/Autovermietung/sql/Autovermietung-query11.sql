-- Aufgabe 11
-- Gib alle VW's  mit Kennzeichen aus.	
SELECT ANr, AModell 
FROM Auto 
WHERE AModell LIKE 'VW%';
