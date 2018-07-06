SELECT Ansprechpartner, FName, Kontakttel
FROM Taetigkeitsbereich NATURAL JOIN Einsatzbereich NATURAL JOIN Angebot NATURAL JOIN Firma NATURAL JOIN Bewerbung
WHERE Arbeitsumfeld = 'draußen' AND Arbeitsbeginn >= '09:00';
