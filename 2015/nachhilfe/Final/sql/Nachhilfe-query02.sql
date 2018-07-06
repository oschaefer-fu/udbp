-- Nachhilfe-Datenbank; Abfrage 02

--\o Nachhilfe-query02.ans
\qecho 2) "Die Vornamen und Namen aller Schueler, die noch kein OK der Eltern haben"
SELECT vorname, name FROM schueler
WHERE eltOK = false;
--\o
