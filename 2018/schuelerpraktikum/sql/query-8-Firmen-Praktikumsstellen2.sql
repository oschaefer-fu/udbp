SELECT 
	FName AS "Firma",PName AS "Praktikum"
FROM 
	Firma, Praktikum, Angebot
WHERE 
	Firma.FNr=Angebot.FNr AND
	Praktikum.PNr=Angebot.Pnr
ORDER BY
	FName ASC
