CREATE TABLE Lehrer (
  Kuerzel VARCHAR PRIMARY KEY,
  Vorname VARCHAR,
  Nachname VARCHAR
);

CREATE TABLE Kurs (
  KursID INTEGER PRIMARY KEY,
  Kuerzel VARCHAR references Lehrer(Kuerzel),
  Name VARCHAR
);

CREATE TABLE Fach (
  FachID INTEGER PRIMARY KEY,
  Kuerzel VARCHAR references Lehrer(Kuerzel),
  Name VARCHAR
);

CREATE TABLE unterrichtet (
  FachID INTEGER references Fach(FachID),
  Kuerzel VARCHAR references Lehrer(Kuerzel),
  PRIMARY KEY (FachID, Kuerzel)
);

CREATE TABLE Ort (
  OrtID INTEGER PRIMARY KEY,
  Name VARCHAR
);

CREATE TABLE Schueler (
  SchuelerID INTEGER PRIMARY KEY,
  KursID INTEGER references Kurs(KursID),
  Vorname VARCHAR,
  Nachname VARCHAR,
  Klasse VARCHAR,
  istVerantwortlich INTEGER
);

CREATE TABLE Termin (
  KursID INTEGER references Kurs(KursID),
  OrtID INTEGER references Ort(OrtID),
  Tag INTEGER,
  Start INTEGER,
  Ende INTEGER,
  PRIMARY KEY (KursID, OrtID, Tag, Start)
);

CREATE TABLE Aufsicht (
  Kuerzel VARCHAR references Lehrer(Kuerzel),
  OrtID INTEGER references Ort(OrtID),
  Tag INTEGER,
  Start INTEGER,
  Ende INTEGER,
  PRIMARY KEY (Kuerzel, OrtID, Tag, Start)
);

CREATE TABLE Zugehoerigkeit (
  FachID INTEGER references Fach(FachID),
  KursID INTEGER references Kurs(KursID),
  PRIMARY KEY (FachID, KursID)
);
