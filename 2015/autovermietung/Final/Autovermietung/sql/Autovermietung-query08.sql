-- Aufgabe 08
-- Welche Automodelle werden zu einem Tagespreis zwischen 30,00€ und 100,00€ angeboten?
SELECT DISTINCT Auto.AModell, Kategorie.KTagespreis  
FROM Auto, Kategorie 
WHERE (Kategorie.KTagespreis between 30 and 100) AND (Auto.KName = Kategorie.KName);
