-- Aufgabe 22
-- Wie viele Mietverträge für Oberklasse gibt es in Berlin?
SELECT COUNT (*) 
FROM Station NATURAL JOIN Vertrag
WHERE SOrt = 'Berlin' AND KName='Oberklasse';
