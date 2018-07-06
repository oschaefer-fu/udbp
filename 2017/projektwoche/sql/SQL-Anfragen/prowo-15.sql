-- 15. Anzahl der Exkursionsbegleitungen der Lehrer
SELECT Kuerzel, COUNT(Start) AS Dauer_in_min FROM Aufsicht WHERE NOT (Start=940 and Ende=1000 or Start=1140 and Ende=1210) Group By Kuerzel
