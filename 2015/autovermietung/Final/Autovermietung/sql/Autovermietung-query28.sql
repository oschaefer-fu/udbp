-- Aufgabe 28
-- Orte aller Mieter die nicht in einem Ort mit Station wohnen
SELECT  MOrt
FROM    Mieter
EXCEPT
SELECT  SOrt
FROM    Station;
