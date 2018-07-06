-- Nachhilfe-Datenbank; Abfrage 23a

--\o Nachhilfe-query23a.ans
\qecho 23a) "Alle Nachhilfestunden die von Schüler Arend im Jahr 2015 besucht wurden - mit Unteranfrage"
SELECT * 
	FROM stunde NATURAL JOIN slot
	WHERE stunde.sNr IN (
		SELECT schueler.sNr   
		FROM schueler, slot
		WHERE schueler.name = 'Ahrend' AND slot.schuljahr = 2015);
--\o
