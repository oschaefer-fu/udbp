-- Nachhilfe-Datenbank; Abfrage 06b

--\o Nachhilfe-query06b.ans
\qecho 06b) "Die Daten aller Tutoren für Mathematik Stufe 7; realisiert mit Unteranfrage"
SELECT * 
	FROM schueler 
	WHERE schueler.sNr IN(
		SELECT istTutor.sNr
		FROM istTutor
		WHERE istTutor.fNr = 2);
--\o
