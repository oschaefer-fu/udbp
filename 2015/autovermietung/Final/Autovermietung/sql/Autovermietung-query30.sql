-- Aufgabe 30
-- Alle Mieternamen mit den von ihnen gebuchten Zubehör.
SELECT DISTINCT MName, MVorname, ZName
FROM  Mieter NATURAL JOIN Vertrag NATURAL JOIN gebucht NATURAL JOIN Zubehoer;
