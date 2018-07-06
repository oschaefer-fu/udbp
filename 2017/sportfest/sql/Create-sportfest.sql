--	LWB	Informatik
--	UDBP	Sportfest
--
--	Create Tabellen


CREATE TABLE Schueler (
	SNr 			INTEGER			PRIMARY KEY,
	SName			VARCHAR(32)		NOT NULL,
	Klasse			VARCHAR(32),
	Geburtsdatum		DATE,
	Geschlecht		CHAR(1),
	Schwimmnachweis 	BOOLEAN
	);
	
CREATE TABLE Wettkaempfe (
	WKNr 			INTEGER			PRIMARY KEY,
	WName			VARCHAR(32)		NOT NULL,
	Kategorie		VARCHAR(32)		NOT NULL
	);
			 
CREATE TABLE Teilnahme (
	SNr 			INTEGER			REFERENCES Schueler (SNr),		-- geändert, vorher PRIMERY KEY
	WKNr 			INTEGER			REFERENCES Wettkaempfe (WKNr),
	TnZeit			TIME,
	Ergebnis		INTEGER								-- geändert, vorher CHAR		
	);

CREATE TABLE Wettkampfstaetten (
	WKStNr 			INTEGER			PRIMARY KEY,
	WKStName 		VARCHAR(32)		NOT NULL,
	WKStAdresse		VARCHAR(32)		
	);


CREATE TABLE Aufsichtsunterstuetzung (
	SNr 			INTEGER 		REFERENCES Schueler (SNr) ,
	WKStNr 			INTEGER 		REFERENCES Wettkampfstaetten (WKStNr),
	UAZeit 			TIME
	);

CREATE TABLE Lehrer (
	PNr 			INTEGER 		PRIMARY KEY,
	LName			VARCHAR(32)		NOT NULL,
	WKStNr 			INTEGER			REFERENCES Wettkampfstaetten (WKStNr)
	);

CREATE TABLE Stattfinden (
	WKNr			INTEGER			REFERENCES Wettkaempfe,
	WKStNr 			INTEGER			REFERENCES Wettkampfstaetten,
	SFZeit			TIME
	);

CREATE TABLE Material (
	MNr			INTEGER	 		PRIMARY KEY,
	MName			VARCHAR(32)		NOT NULL,
	Vorratsanzahl		INTEGER
	);
	
CREATE TABLE Bedarf (
	MNr			INTEGER	 		REFERENCES Material (MNr),
	WKNr 			INTEGER			REFERENCES Wettkaempfe (WKNr),
	Anzahl 			INTEGER
	);

CREATE TABLE Dienstleister (
	DNr			INTEGER			PRIMARY KEY,
	DName			VARCHAR(32)		NOT NULL,
	DAdresse		VARCHAR(32),
	Branche			VARCHAR(32)
	);
	
CREATE TABLE Betreuung (
	DNr			INTEGER			REFERENCES Dienstleister (DNr),
	WKStNr			INTEGER			REFERENCES Wettkampfstaetten (WKStNr),
	Kosten			MONEY 									-- geändert,	vorher REAL 
	);

