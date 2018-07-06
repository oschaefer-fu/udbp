-- 7. "Alle Lehrer, die nicht in der Projektwoche eingesetzt werden (nicht einmal eine Aufsicht)"
SELECT Kuerzel FROM Lehrer EXCEPT (SELECT Kuerzel FROM Lehrer NATURAL JOIN Kurs UNION SELECT Kuerzel FROM Lehrer NATURAL JOIN Aufsicht);
