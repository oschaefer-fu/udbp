--5. "Alle Raeume (und Exkursions- und Aufsichtsorte), die am Montag nicht belegt sind"
SELECT Name FROM Ort EXCEPT SELECT Name FROM Ort NATURAL JOIN Termin WHERE Tag = 1;
