CREATE TABLE schueler (
  sNr       INTEGER PRIMARY KEY,
  vorname   VARCHAR(32),
  name      VARCHAR(32),
  ortsteil  VARCHAR(32),
  mail      VARCHAR(64),
  klasse    INTEGER,
  eltOK     BOOLEAN 
);

CREATE TABLE fach (
  fNr       INTEGER PRIMARY KEY,
  fName     VARCHAR(16),
  stufe     INTEGER 
);

CREATE TABLE ort (
  rNr       INTEGER PRIMARY KEY,
  rName     VARCHAR(16)
);

CREATE TABLE slot (
  slotNr    INTEGER PRIMARY KEY,
  schuljahr INTEGER,
  kW        INTEGER,
  tag       CHAR(3),
  stunde    INTEGER
);  

CREATE TABLE verfuegbar (
  sNr       INTEGER,
  slotNr    INTEGER,
  UNIQUE    (sNr,slotNr)
);

CREATE TABLE istTutor (
  sNr       INTEGER REFERENCES schueler(sNr), 
  fNr       INTEGER REFERENCES fach (fNr),
  UNIQUE    (sNr,fNr)
);

CREATE TABLE typ (
  typName   VARCHAR(16) PRIMARY KEY,
  preis     NUMERIC
);
  
CREATE TABLE stunde (
  stdNr     INTEGER PRIMARY KEY,
  sNr       INTEGER        REFERENCES schueler (sNr),
  slotNr    INTEGER,
  tNr       INTEGER,
  fNr       INTEGER,
  rNr       INTEGER        REFERENCES ort (rNr),
  typName   VARCHAR(16)    REFERENCES typ (typName),
  bewertung INTEGER,
  status    BOOLEAN,
  FOREIGN KEY (tNr,slotNr) REFERENCES verfuegbar (sNr,slotNr),
  FOREIGN KEY (tNr,fNr)    REFERENCES istTutor (sNr,fNr)
);
