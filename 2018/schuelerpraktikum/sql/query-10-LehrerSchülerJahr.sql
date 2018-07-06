SELECT LName,  SName, SVorname, Schuljahr
FROM Lehrer NATURAL JOIN Schueler
ORDER BY LNAME ASC, Schuljahr DESC;
