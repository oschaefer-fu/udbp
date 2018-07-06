-- Aufgabe 32
-- Vertragsnummern und Namen aller Mieter, die einen Vertrag abgeschlossen haben
SELECT VNr, MName, MName
FROM  Mieter NATURAL JOIN Vertrag;
