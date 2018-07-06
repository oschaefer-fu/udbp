
-- Aufgabe 34
-- Für welche Vertragsnummern sind mindestens zweimal Zubehör gebucht worden?
SELECT VNr, COUNT(VNr)
FROM gebucht
GROUP BY VNr
HAVING COUNT(VNr)>=2;
