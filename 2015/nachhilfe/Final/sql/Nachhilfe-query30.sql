\qecho 30) "Alle Stunden von Meinike "

SELECT stunde.stdNr, fach.fName, stunde.bewertung
FROM Tutoren NATURAL JOIN stunde NATURAL JOIN fach
WHERE stunde.status = true AND tutoren.name = 'Meinike' 
ORDER BY stunde.stdNr;
