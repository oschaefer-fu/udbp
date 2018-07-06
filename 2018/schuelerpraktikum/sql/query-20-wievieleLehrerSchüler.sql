SELECT COUNT( LName ), LName 
FROM schueler NATURAL JOIN lehrer 
GROUP BY LName HAVING ( ( COUNT( LName ) > 1 ) ) ORDER BY COUNT( LName ) DESC;
