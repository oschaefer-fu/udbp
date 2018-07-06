-- Aufgabe 21
-- Wie viele Kleinwagen gibt es in Berlin?
-- Dieselbe Anfrage mit Köln läuft wegen des Umlautes übrigens ins Leere
SELECT COUNT (*) 
FROM Auto NATURAL JOIN Station
WHERE SOrt = 'Berlin' AND KName='Kleinwagen';
