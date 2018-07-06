-- Autoren: Iris Münzner, Frank Möbius
-- Datum: 	04.06.2018
-- Zweck:	Aufbau der Tabellen für die Datenbank zur Miniwelt 'Projekttag'



-- Aufbau der Tabellen für die Datenbank zur Miniwelt 'Projekttag' --
-- ############################################################### --
-- Die Reihenfolge, in der die Tabellen erstellt werden, muss an   --
-- Fremdschlüsselbeziehungen angepasst werden. Ein Fremdschlüssel  --
-- muss vor der Verwendung in einer Tabelle bereits erzeugt sein!  --
-- --------------------------------------------------------------- --

-- Definition der speziellen Datentypen --
CREATE TYPE Geschlecht AS ENUM ('m', 'w');
CREATE TYPE Anrede AS ENUM ('Herr', 'Frau');

-- Definition der Tabellen --
CREATE TABLE lehrkraft(
	lID			integer			NOT NULL,
	lName		varchar(50)		NOT NULL,
	lAnrede		Anrede			NOT NULL,
	CONSTRAINT pk_lID			PRIMARY KEY (lID)
);


CREATE TABLE klasse(
	kID			integer			NOT NULL,
	kStufe		integer			NOT NULL,
	kName		varchar(50)		NOT NULL,
	lID			integer			NOT NULL		REFERENCES 		lehrkraft (lID),
	CONSTRAINT  pk_kID			PRIMARY KEY (kID)
);


CREATE TABLE schueler (
	sID			integer			NOT NULL,
	sName		varchar(50)		NOT NULL,
	sVname		varchar(50)		NOT NULL,
	sGeschlecht Geschlecht	 	NOT NULL,
	sAlter		integer			NOT NULL,
	sNote		integer			CHECK (sNote BETWEEN 0 AND 6),
	pID			integer			NOT NULL,		
	kID			integer			NOT NULL		REFERENCES 		klasse (kID),
	CONSTRAINT pk_sID 			PRIMARY KEY (sID)
);


CREATE TABLE projekt(
	pID 		integer			NOT NULL,
	pName		varchar(50)		NOT NULL,
	pBeschr		varchar(500)	NOT NULL,
	pKosten		numeric(5,2)	NOT NULL,
	pMinTNZahl	integer			NOT NULL,
	pMaxTNZahl	integer			NOT NULL, 
	pMinAlter	integer			NOT NULL,
	s1ID		integer			NOT NULL 		REFERENCES 		schueler (sID),	
	s2ID		integer			NOT NULL 		REFERENCES 		schueler (sID),
	CONSTRAINT pk_pID			PRIMARY KEY (pID)
);

CREATE TABLE raum(
	rID			integer			NOT NULL,
	rPlaetze	integer			NOT NULL,
	rName		varchar(50)		NOT NULL,
	CONSTRAINT pk_rID 			PRIMARY KEY (rID)
);

CREATE TABLE ausstattung(
	aID 		integer			NOT NULL,
	aArt		varchar(50)		NOT NULL,
	CONSTRAINT pk_aID			PRIMARY KEY (aID)
);

CREATE TABLE aufsicht(
	lID			INTEGER			NOT NULL		REFERENCES		lehrkraft (lID),
	pID			INTEGER			NOT NULL		REFERENCES		projekt (pID),
	CONSTRAINT 	pk_aufsicht		PRIMARY KEY (lID, pID)
);

CREATE TABLE raumausstattung(
	rID			INTEGER			NOT NULL		REFERENCES		raum (rID),
	aID			INTEGER			NOT NULL		REFERENCES		ausstattung (aID),
	CONSTRAINT	pk_raumausst	PRIMARY KEY (rID, aID)
);

CREATE TABLE raumbelegung(
	vStunde		integer			NOT NULL		CHECK (vStunde BETWEEN 0 AND 23),		
	vMinute		integer			NOT NULL,		CHECK (vMinute BETWEEN 0 AND 59),
	bStunde		integer			NOT NULL		CHECK (bStunde BETWEEN 0 AND 23),		
	bMinute		integer			NOT NULL,		CHECK (bMinute BETWEEN 0 AND 59),
	rID			integer			NOT NULL		REFERENCES		raum (rID),
	pID			integer			NOT NULL		REFERENCES		projekt (pID),
	CONSTRAINT	pk_raumbeleg	PRIMARY KEY (vStunde, vMinute, rID, pID)	
);
