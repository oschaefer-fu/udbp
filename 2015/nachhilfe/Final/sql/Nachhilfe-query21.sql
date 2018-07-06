-- Nachhilfe-Datenbank; Abfrage 21

--\o Nachhilfe-query21.ans
\qecho 21)  "Die Einnahmen (Summe) der Tutorin Meinike von Schülern (Name) nach der 4. KW (Kalenderwoche des Slots)"
SELECT slot.kW, schueler.name, SUM(preis) 
FROM stunde NATURAL JOIN schueler NATURAL JOIN typ NATURAL JOIN slot
WHERE stunde.tNr = 13 AND stunde.sNr = schueler.sNr AND slot.kW <= 4 AND stunde.status = true
GROUP BY slot.kW, schueler.name;
--\o
