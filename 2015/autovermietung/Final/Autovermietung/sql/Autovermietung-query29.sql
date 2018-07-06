
-- Aufgabe 29
-- Vertragsnummer, Kategoriename und Ort aller Mieter die nicht in einem Ort mit Station wohnen
SELECT VNr, KName, MOrt
FROM VERTRAG NATURAL JOIN Mieter
WHERE MOrt NOT IN (
		SELECT SOrt
		FROM Station);
