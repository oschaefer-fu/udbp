-- Aufgabe 17
-- Gib den Standort (Adresse) aller Mercedes C-KLasse an.	
SELECT DISTINCT AModell, SPLZ, SOrt, SStr 
FROM Auto NATURAL JOIN Station 
WHERE AModell='Mercedes C-Klasse';
