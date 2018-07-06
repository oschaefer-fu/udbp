-- Drop-Vorhilfe.sql
-- Löscht alle Tabellen und den Typ wotag, die zur Datei Vorhilfe gehören.
-- Mi den Tabellen werden auch die abhängigen Views gelöscht.
-- Entitäten
drop table  schueler cascade;
drop table  konto cascade;
drop table  lehrer cascade;
drop table  raum cascade;
drop table  ausstattung cascade;
drop table  kurs cascade;
drop table  fach cascade;
drop table  methode cascade;
-- Beziehungen
drop table  hat cascade;
drop table  findet_statt cascade;

drop table  eingeschrieben cascade;
drop table  vermittelt cascade;
drop table  beinhaltet cascade;
drop table  beaufsichtigt cascade;

drop type wotag
