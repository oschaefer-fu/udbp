--  Miniwelt Computerspieledatenbank
--  erstellt von M. Kark, J. Schult, S. Moke, K. Güttler
--  Erstellung der Ralationen in SQL

CREATE TABLE Publisher
(
  PID		INTEGER NOT NULL,
  PName		VARCHAR (50),
  GJahr		INTEGER CHECK (GJahr > 1955),
  CONSTRAINT publ_key PRIMARY KEY (PID)
);

CREATE TABLE Computerspiel 
(
  SID		INTEGER NOT NULL,
  SName		VARCHAR (50),
  FSK		INTEGER CHECK (FSK IN (0,6,12,16,18,21)), 
  EJahr		INTEGER NOT NULL,
  MP		INTEGER,
  PID		INTEGER REFERENCES Publisher (PID),
  CONSTRAINT games_key PRIMARY KEY (SID)
);

CREATE TABLE Schlagwort
(
  WID		INTEGER NOT NULL,
  WName		VARCHAR (50),
  CONSTRAINT sw_key PRIMARY KEY (WID)
);

CREATE TABLE Plattform
(
  PlaID     INTEGER NOT NULL,
  PlaName   VARCHAR (20),
  CONSTRAINT pla_key PRIMARY KEY (PlaID)
);

CREATE TABLE benutzer  -- Schwierigkeit
(
  bid		  INTEGER NOT NULL,
  bname		  VARCHAR (30),
  geschlecht  VARCHAR (10) CHECK (geschlecht in ('w','m')),
  email		  VARCHAR (50),
--  gebdatum    DATE,
  CONSTRAINT user_key PRIMARY KEY (bid)
);

CREATE TABLE Kommentar
(
  KID		INTEGER NOT NULL,
  KText		VARCHAR (200),
  KNote		INTEGER CHECK (KNote IN (1,2,3,4,5,6)),
  SID		INTEGER REFERENCES Computerspiel (SID),
  BID		INTEGER REFERENCES Benutzer (BID),
  CONSTRAINT komm_key PRIMARY KEY (KID)
);

CREATE TABLE Eigenschaften
(
  WID       INTEGER REFERENCES Schlagwort (WID),
  SID       INTEGER REFERENCES Computerspiel (SID),
  CONSTRAINT eigen_key PRIMARY KEY (WID, SID)
);

CREATE TABLE Kompatibilitaet -- Schwierigkeit
(
  PlaID 	INTEGER REFERENCES Plattform (PlaID),
  SID	 	INTEGER REFERENCES Computerspiel (SID),
  Preis		REAL, --NUMERIC (4,2),
  CONSTRAINT komp_key PRIMARY KEY (PlaID, SID) 
);

CREATE TABLE Befreundet
(
  BID1     INTEGER REFERENCES Benutzer (BID),
  BID2     INTEGER REFERENCES Benutzer (BID),
  CONSTRAINT friend_key PRIMARY KEY (BID1,BID2)
);

CREATE TABLE Besitz
(
  SID		INTEGER REFERENCES Computerspiel (SID),
  BID		INTEGER REFERENCES Benutzer (BID),
  CONSTRAINT bes_key PRIMARY KEY (SID,BID)
);
