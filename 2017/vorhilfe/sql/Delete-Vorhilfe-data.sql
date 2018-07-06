--Delete-Vorhilfe-data.sql
-- Tabellenlöschung für die Datenbank Vorhilfe

------------------------------- Dateneingabe -----------------------------------------------
-- Inhalte von Entitäten löschen

DELETE FROM raum;
DELETE FROM methode;
DELETE FROM fach;
DELETE FROM kurs;
DELETE FROM schueler;
DELETE FROM lehrer;

DELETE FROM konto;


-- Inhalte von Relationen löschen
DELETE FROM ausstattung;
DELETE FROM hat;
DELETE FROM findet_statt;
DELETE FROM beaufsichtigt;
DELETE FROM beinhaltet ;
DELETE FROM vermittelt ;
DELETE FROM eingeschrieben ;
-- zeige alle Tabellen
\dt
-- zeige alle views
\dv
