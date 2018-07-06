--  Miniwelt Computerspieledatenbank
--  erstellt von K. Güttler, M. Kark, S. Moke, J. Schult 
--  Erstellung der Ralationen in SQL

														-- Überlegungen zu der Wahl des Typs der Variable

CREATE TABLE Publisher
(
  PID		INTEGER NOT NULL,							-- laufende Nummer
  PName		VARCHAR (50),								-- Namen haben unterschiedliche Länge, daher varchar
  GJahr		INTEGER CHECK (GJahr > 1955),				-- Vor dem Jahr 1955 gab es noch keine Computerspielefirmen, daher
														-- sollte die Jahreszahl nicht kleiner sein
  CONSTRAINT publ_key PRIMARY KEY (PID)
);

CREATE TABLE Computerspiel 
(
  SID		INTEGER NOT NULL,							-- laufende Nummer
  SName		VARCHAR (50),								-- der Name des Computerspiels, habe unterscheidliche Länge
  FSK		INTEGER CHECK (FSK IN (0,6,12,16,18,21)), 	-- FSK gibt es nur mit bestimmten Werten, daher die Kontrolle
  EJahr		INTEGER NOT NULL,							-- Nur die Jahreszahl ist interessant
  MP		BOOL,										-- hier gibt es nur zwei Optionen
  PID		INTEGER REFERENCES Publisher (PID),			-- jedes Spiel hat einen Publisher
  CONSTRAINT games_key PRIMARY KEY (SID)
);

CREATE TABLE Schlagwort
(
  WID		INTEGER NOT NULL,							-- laufende Nummer
  WName		VARCHAR (50),								-- hat einen Namen, variable Länge
  CONSTRAINT sw_key PRIMARY KEY (WID)
);

CREATE TABLE Plattform
(
  PlaID     INTEGER NOT NULL,							-- laufende Nummer
  PlaName   VARCHAR (20),								-- Name, unterscheidliche Länge
  CONSTRAINT pla_key PRIMARY KEY (PlaID)
);

CREATE TABLE Benutzer
(
  BID		  INTEGER NOT NULL,							-- laufende Nummer
  BName		  VARCHAR (30),								-- Name, unterschiedliche Länge
  Geschlecht  VARCHAR (1) CHECK (Geschlecht in ('m','w')),	-- Geschlecht kann durch einen Buchstaben geklärt werden
															-- bisher nur männlich oder weiblich
  EMail		  VARCHAR (50),								-- Email-Adresse, unterscheidliche Länge
  GebDatum    DATE,										-- Tagesgenaues Datum ist erforderlich
  CONSTRAINT user_key PRIMARY KEY (BID)
);

CREATE TABLE Kommentar
(
  KID		INTEGER NOT NULL,							-- laufende Nummer
  KText		VARCHAR (200),								-- Kommentartext, unterscheidliche Länge, 200 Zeichen müssen ausreichen
  KNote		INTEGER CHECK (KNote IN (1,2,3,4,5,6)),		-- Schultnote, daher die Einschränkung
  SID		INTEGER REFERENCES Computerspiel (SID), 	-- Verweis auf Computerspiel 
  BID		INTEGER REFERENCES Benutzer (BID),			-- Verweis auf Benutzer
  CONSTRAINT komm_key PRIMARY KEY (KID)
);

CREATE TABLE Eigenschaften
(
  WID       INTEGER REFERENCES Schlagwort (WID),		-- Verweis auf Schlagwort
  SID       INTEGER REFERENCES Computerspiel (SID),		-- Verweis auf Computerspiel
  CONSTRAINT eigen_key PRIMARY KEY (WID, SID)
);

CREATE TABLE Kompatibilitaet
(
  PlaID 	INTEGER REFERENCES Plattform (PlaID),		-- Verweis Plattform
  SID	 	INTEGER REFERENCES Computerspiel (SID),		-- Verweis Computerspiel
  Preis		NUMERIC (4,2),								-- Preis in Euro,Cent. Spiele über 99,99 € gibt es bei uns nicht
  CONSTRAINT komp_key PRIMARY KEY (PlaID, SID) 
);

CREATE TABLE Befreundet
(
  BID1     INTEGER REFERENCES Benutzer (BID),			-- erster Verweis auf Benutzer
  BID2     INTEGER REFERENCES Benutzer (BID),			-- zweiter Verweis auf Benutzer
  CONSTRAINT friend_key PRIMARY KEY (BID1,BID2)
);

CREATE TABLE Besitz
(
  SID		INTEGER REFERENCES Computerspiel (SID),		-- Verweis auf Computerspiel
  BID		INTEGER REFERENCES Benutzer (BID),			-- Verweis auf Benutzer
  CONSTRAINT bes_key PRIMARY KEY (SID,BID)
);
