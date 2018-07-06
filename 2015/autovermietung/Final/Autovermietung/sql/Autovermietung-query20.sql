-- Aufgabe 20
-- Welches Winterzubehör ist in Köln verfügbar?
SELECT Zname 
FROM Zubehoer 
WHERE ZName = 'Winterreifen' AND SNr = '3' OR ZName ='Schneeketten' AND SNr = '3';
