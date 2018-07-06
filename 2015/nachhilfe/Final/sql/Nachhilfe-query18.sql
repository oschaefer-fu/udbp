-- Nachhilfe-Datenbank; Abfrage 18

--\o Nachhilfe-query18.ans
\qecho 18.)  "Die durchschnittliche Bewertung der Stunden von Tutor Aust"
SELECT schueler.name, AVG(bewertung)
FROM schueler, stunde
WHERE stunde.tNr = schueler.sNr AND schueler.name = 'Aust' AND stunde.status = true
GROUP BY schueler.name;
--\o
