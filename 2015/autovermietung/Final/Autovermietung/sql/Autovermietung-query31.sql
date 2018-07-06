-- Aufgabe 31
-- Alle Mieternamen und ihre Stationsnummer der Mieter, die in einem Ort mit Station wohnen 
SELECT *
FROM  Mieter NATURAL JOIN Station
WHERE MOrt = SOrt;
