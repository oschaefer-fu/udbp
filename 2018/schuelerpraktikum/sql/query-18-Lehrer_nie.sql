SELECT lname AS "Lehrer"
FROM schueler RIGHT OUTER JOIN lehrer ON schueler.lnr = lehrer.lnr 
WHERE schueler.lnr IS NULL ;

