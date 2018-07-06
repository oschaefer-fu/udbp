SELECT DISTINCT LName, SName, PName
FROM Lehrer NATURAL JOIN Praktikum NATURAL JOIN Taetigkeitsbereich NATURAL JOIN Einsatzbereich NATURAL JOIN Schueler
WHERE TArt = 'Pflege' AND Schuljahr = 2015;