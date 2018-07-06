-- Aufgabe 15
-- Wie viele Sitzplätze gibt es in Station 3?	
SELECT sum (ASitzplaetze) 
FROM Auto 
WHERE Snr = '3';
