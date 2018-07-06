-- Nachhilfe-Datenbank; Abfrage 19 - modifiziert

\qecho 19) "Alle stattgefundenen Mathe-Stunden mit den Tutorennamen und der Stundenbewertung, sortiert nach Stundennummern"
SELECT    stunde.stdNr, schueler.name, stunde.bewertung
FROM      schueler, stunde natural join fach
WHERE     schueler.sNr = stunde.tNr AND fach.fname = 'Mathematik' AND stunde.status = true
ORDER BY  stunde.stdNr;
