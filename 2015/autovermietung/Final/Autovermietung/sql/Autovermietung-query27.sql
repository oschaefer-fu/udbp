-- Aufgabe 27 - ab hier sind die Aufgaben eher auf Relationenalgebrazugeschnitten
-- Ort und PLZ aller Stationen und Mieter (UNION ALL in psql = doppelte werden nicht entfernt)
SELECT  SPLZ, SOrt
FROM    station
UNION
SELECT  MPLZ, MOrt
FROM    Mieter;
