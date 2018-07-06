-- 14. Übersicht Kürzel + Anzahl Aufsichten (ohne Exkursionsbegleitungen)
SELECT Kuerzel, COUNT(Start) AS Anzahl_Aufsichten FROM Aufsicht WHERE (Start=940 and Ende=1000) or (Start=1140 and Ende=1210) GROUP BY Kuerzel

