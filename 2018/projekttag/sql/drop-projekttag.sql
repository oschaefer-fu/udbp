-- Autoren: Iris Münzner, Frank Möbius
-- Datum: 	04.06.2018
-- Zweck:	Löschen der Tabellen und Datentypen zur Miniwelt 'Projekttag'



-- Löschen der Tabellen und Datentypen zur Miniwelt 'Projekttag' --
-- ############################################################# --

DROP TABLE schueler       	CASCADE;
DROP TABLE projekt   	  	CASCADE;
DROP TABLE raum		      	CASCADE;
DROP TABLE ausstattung    	CASCADE;
DROP TABLE lehrkraft       	CASCADE;
DROP TABLE klasse		  	CASCADE;
DROP TABLE aufsicht       	CASCADE;
DROP TABLE raumausstattung	CASCADE;
DROP TABLE raumbelegung		CASCADE;
DROP TYPE Anrede;
DROP TYPE Geschlecht;

