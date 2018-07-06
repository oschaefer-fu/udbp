-- Aufgabe 07a
-- Gib die Kategorie an bei der der Tagespreis zwischen 30,00€ und 100,00€ liegt.
SELECT KName, KTagespreis  
FROM Kategorie 
WHERE KTagespreis >= 30 AND KTagespreis <= 100;

