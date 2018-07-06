-- Aufgabe 06
-- Gib alle Auto mit Kennzeichen an, die Mittelklasse oder 
-- obMittelklasse sind und in Station Nr. 1 stehen.	
SELECT ANr,AModell 
FROM Auto 
WHERE (KName = 'Mittelklasse'  OR KName = 'obMittelklasse') AND Snr = '1';
