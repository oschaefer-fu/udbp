SELECT DISTINCT 
  FName AS "Firma"
FROM 
  firma, 
  bewerbung
WHERE 
  firma.FNr = bewerbung.FNr AND NOT
  bewerbung.BArt = 'schriftlich'
