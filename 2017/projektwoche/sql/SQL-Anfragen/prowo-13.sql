-- 3. Klasse mit mehr als 5 Schülern
SELECT  Klasse, COUNT(Klasse) AS Anzahl FROM Schueler GROUP BY Klasse HAVING COUNT(Klasse)>5
