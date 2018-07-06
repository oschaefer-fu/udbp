SELECT SName, SVorname, STel, FName, FStrasseHNr, FPLZ, Kontakttel, Kontaktmail
FROM Firma NATURAL JOIN Schueler NATURAL JOIN Lehrer
WHERE LName = 'Frau Meisenbuch' AND Schuljahr = 2018;
