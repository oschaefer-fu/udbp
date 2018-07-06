-- 19. "Durchschnittlicher Kursstart pro Tag"
SELECT Name, AVG(Start) AS Durchnittliche_Kursstart_pro_Tag FROM Termin NATURAL JOIN Kurs GROUP BY KursID, Name 
