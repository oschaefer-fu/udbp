SELECT 
	FName AS "Firma", Pname AS "Praktikum"
FROM 
	Firma NATURAL JOIN Praktikum NATURAL JOIN Angebot
ORDER BY 
	FName ASC;
