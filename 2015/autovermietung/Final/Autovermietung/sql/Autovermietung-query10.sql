-- Aufgabe 10
-- Welche Autos haben eine Berliner Kennzeichen?	
SELECT ANr, AModell 
FROM Auto 
WHERE ANr LIKE 'B-%';
