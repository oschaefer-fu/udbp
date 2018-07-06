-- 8. "Alle Lehrer, die im Hof Aufsicht fuehren"
SELECT DISTINCT Kuerzel FROM Lehrer NATURAL JOIN Aufsicht NATURAL JOIN Ort WHERE Name = 'Hof';
----> Achtung! Damit bei RA und SQL das Gleiche Ergebnis herauskommt, muss bei SQL Distinct ausgeführt werden.


