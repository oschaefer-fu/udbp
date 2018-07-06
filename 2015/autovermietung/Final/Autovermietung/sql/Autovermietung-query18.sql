-- Aufgabe 18
-- Gib das Zubehör aufsteigend sortiert nach Pauschalpreis an. Jeder
-- Name soll nur einmal auftreten.	
SELECT DISTINCT ZName, ZPauschale 
FROM Zubehoer 
ORDER BY ZPauschale;
