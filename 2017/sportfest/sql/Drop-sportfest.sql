--	LWB	Informatik
--	UDBP	Sportfest
--
--	Drop Tabelle
--
DROP TABLE Schueler CASCADE; 					-- Tabelle Schuler wird gelöscht trotz Schlüsseleinträgen in anderen Tabellen
DROP TABLE Wettkaempfe CASCADE; 				-- Tabelle Wettkämpfe wird gelöscht trotz Schlüsseleinträgen in anderen Tabellen
DROP TABLE Teilnahme CASCADE; 					-- Tabelle Teilnahme wird gelöscht trotz Schlüsseleinträgen in anderen Tabellen
DROP TABLE Wettkampfstaetten CASCADE; 				-- Tabelle Wettkampfstätten wird gelöscht trotz Schlüsseleinträgen in anderen Tabellen
DROP TABLE Aufsichtsunterstuetzung CASCADE; 			-- Tabelle Aufsichtsunterstützung wird gelöscht trotz Schlüsseleinträgen in anderen Tabellen
DROP TABLE Lehrer CASCADE; 					-- Tabelle Lehrer wird gelöscht trotz Schlüsseleinträgen in anderen Tabellen
DROP TABLE Stattfinden CASCADE; 				-- Tabelle Stattfinden gelöscht trotz Schlüsseleinträgen in anderen Tabellen
DROP TABLE Material CASCADE; 					-- Tabelle Material wird gelöscht trotz Schlüsseleinträgen in anderen Tabellen
DROP TABLE Bedarf CASCADE; 					-- Tabelle Bedarf wird gelöscht trotz Schlüsseleinträgen in anderen Tabellen
DROP TABLE Dienstleister CASCADE; 				-- Tabelle Dienstleister wird gelöscht trotz Schlüsseleinträgen in anderen Tabellen
DROP TABLE Betreuung CASCADE; 					-- Tabelle Betreuung wird gelöscht trotz Schlüsseleinträgen in anderen Tabellen
--
--
DROP DATABASE sportfest;					--Mit den entsprechenden Rechten wird die DB "unwiederbringlich" zerstört
								--es darf keine Verbindung zur Datenbank bestehen
