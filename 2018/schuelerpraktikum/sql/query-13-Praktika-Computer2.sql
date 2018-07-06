SELECT fname, pname 
FROM einsatzbereich, praktikum, taetigkeitsbereich, angebot, firma 
WHERE einsatzbereich.pnr = praktikum.pnr AND einsatzbereich.tnr = taetigkeitsbereich.tnr AND angebot.fnr = firma.fnr AND angebot.pnr = praktikum.pnr AND taetigkeitsbereich.anforderung = 'Computerkenntnisse' 
ORDER BY firma.fname ASC ;