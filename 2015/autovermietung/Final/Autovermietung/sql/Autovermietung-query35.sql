-- Aufgabe 35 - spezielle Datums SQL Anfrage
-- Welche Kategorien sind am 2015-05-10 an der Station Nr. 3 noch frei?
SELECT KName
FROM Auto
WHERE SNr = '3'
EXCEPT ALL
SELECT KName
FROM Vertrag
WHERE SNr = '3' AND VBeginn <= '2015-05-10' AND VBeginn + VDauer >= '2015-05-10';
