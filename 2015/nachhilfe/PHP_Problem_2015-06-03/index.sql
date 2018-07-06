SELECT    SUM (preis), schueler.name
FROM      stunde NATURAL JOIN schueler NATURAL JOIN typ
WHERE     schueler.name = 'Berend'
GROUP BY  schueler.name; 		


SELECT SUM(preis), schueler.name
FROM stunde NATURAL JOIN schueler NATURAL JOIN typ
WHERE schueler.name = 'Berend'
GROUP BY schueler.name;
