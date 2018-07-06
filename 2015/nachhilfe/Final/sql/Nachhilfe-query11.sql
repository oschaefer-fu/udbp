-- Nachhilfe-Datenbank; Abfrage 11

--\o Nachhilfe-query11.ans
\qecho 11) "Eine Kostenauflistung (Summen) nach Schülernamen (Teilnehmer)"
SELECT SUM(preis), schueler.name
FROM stunde NATURAL JOIN schueler NATURAL JOIN typ
WHERE stunde.status = true
GROUP BY schueler.name;
--\o

