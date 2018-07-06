-- 6. "Die Kuerzel der Lehrer, die wenigstens einmal in der Woche arbeiten (Kurs, Exkursion, Aufsicht)"
SELECT Kuerzel FROM Lehrer NATURAL JOIN Kurs UNION SELECT Kuerzel FROM Lehrer NATURAL JOIN Aufsicht;
