-- Nachhilfe-Datenbank; Abfrage 23

--\o Nachhilfe-query23.ans
\qecho 23) "Alle Nachhilfestunden die von Schüler Arend im Jahr 2015 besucht wurden"
SELECT * 
	FROM stunde NATURAL JOIN slot NATURAL JOIN schueler
	WHERE stunde.sNr = schueler.sNr AND slot.schuljahr = 2015 AND schueler.name = 'Ahrend';
--\o
