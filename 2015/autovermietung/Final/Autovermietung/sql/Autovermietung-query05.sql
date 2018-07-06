-- Aufgabe 05
-- Gib alle Autos mit Kennzeichen an, die 2 Sitzplätze haben und in 
-- Station Nr. 1 stehen.	
SELECT ANr,AModell 
FROM Auto 
WHERE ASitzplaetze = 2 AND SNr = '1';
