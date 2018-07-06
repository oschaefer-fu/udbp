-- 3. "Lehrerkuerzel + Fach aller Fachverantwortlichen mit Nawi-Fach"
SELECT Kuerzel, Name FROM Fach WHERE Name = 'Physik' or Name = 'Chemie' or Name = 'Biologie';
