--  Miniwelt Sportfest
--  Autoren: H. Huth, P. Kreißig, K. Petri

CREATE TABLE Klasse
(
  KLName     VARCHAR (4),
  CONSTRAINT klass_key PRIMARY KEY (KlName)
);

CREATE TABLE Lehrer (
  LID    		INTEGER NOT NULL,
  LName      	VARCHAR (32),
  LVorname	    VARCHAR (32),
  WettID 		INTEGER NOT NULL, 
  Funktion		VARCHAR (32), -- Stationsleiter, Kampfrichter, Schreiber, Helfer
  KlName		VARCHAR REFERENCES Klasse (KlName),
  CONSTRAINT leh_key PRIMARY KEY (LID)
);

CREATE TABLE Wettkampf
(
  WettID     	INTEGER NOT NULL,
  WettName      VARCHAR (32),
  WettKlasse    Varchar (32),
  Geschlecht    Char (1),
  Termin 		VARCHAR (10), 
  CONSTRAINT wett_key PRIMARY KEY (WettID)
);

CREATE TABLE Schueler
(
  SchID     	INTEGER NOT NULL,
  SchName       VARCHAR (32),
  SchVorname	VARCHAR (32),
  SchGeschlecht	Char (1),
  SchGebDatum   VARCHAR (10),
  KlName		VARCHAR REFERENCES Klasse (KlName),
  CONSTRAINT schue_key PRIMARY KEY (SchID)
);

CREATE TABLE Sportanlage
(
  AnlagenID	  	INTEGER NOT NULL,
  AnlagenName   VARCHAR (32),
  CONSTRAINT span_key PRIMARY KEY (AnlagenID)
);

CREATE TABLE Material
(
  MatID     	INTEGER NOT NULL,
  MatName     	VARCHAR (32),
  MatAnzahl 	SMALLINT ,
  CONSTRAINT mat_key PRIMARY KEY (MatID)
);

CREATE TABLE benoetigt
(
  AnlagenID 	INTEGER REFERENCES Sportanlage (AnlagenID),
  MatID 		INTEGER REFERENCES Material (MatID),
  Anzahl		INTEGER ,
  CONSTRAINT benoetigt_key PRIMARY KEY (AnlagenID, MatID)
);

CREATE TABLE findetStatt
(
  AnlagenID     INTEGER REFERENCES Sportanlage (AnlagenID),
  WettID     	INTEGER REFERENCES Wettkampf (WettID),
  Dauer     	INTEGER,
  CONSTRAINT findet_key PRIMARY KEY (AnlagenID, WettID)
);

CREATE TABLE nimmtTeil
(
  SchID 		INTEGER REFERENCES Schueler (SchID),
  WettID 		INTEGER REFERENCES Wettkampf (WettID),
  Platz			SMALLINT,
  Ergebnis		INTEGER,
  Funktion 		VARCHAR (32) ,
  CONSTRAINT nimmtteil_key PRIMARY KEY (SchID,WettID)
);


