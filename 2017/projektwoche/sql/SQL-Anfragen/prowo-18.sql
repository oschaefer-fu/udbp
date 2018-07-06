-- 18. Übersicht der Kurse mit der Anzahl der verantwortlichen SuS
SELECT Kurs.Name, SUM(Schueler.istVerantwortlich) AS Anzahl_verantwortliche_SuS FROM Schueler NATURAL JOIN Kurs GROUP BY Kurs.KursID
