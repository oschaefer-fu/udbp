-- 6. Anzahl  der SuS in den jeweiligen Kursen, mit Angabe der Kursnamen
SELECT  Name, COUNT(KursID) FROM Schueler NATURAL JOIN Kurs GROUP BY Name
