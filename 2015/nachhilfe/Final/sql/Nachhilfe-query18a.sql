-- Nachhilfe-Datenbank; Abfrage 18a

--\o Nachhilfe-query18a.ans
\qecho 18a)  "Die durchschnittlichen Bewertung der Stunden von Tutor Aust (mit View Tutoren)"
SELECT tutoren.name, AVG(bewertung)
FROM stunde NATURAL JOIN tutoren
WHERE tutoren.name = 'Aust' AND stunde.status = true
GROUP BY tutoren.name;
--\o
