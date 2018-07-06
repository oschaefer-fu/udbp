-- Aufgabe 33
-- Alle Mieternamen die Kindersitze gebucht hatten. 
SELECT distinct MVorname, MName
FROM  Mieter NATURAL JOIN Vertrag NATURAL JOIN gebucht NATURAL JOIN Zubehoer
WHERE ZName = 'Kindersitz';
