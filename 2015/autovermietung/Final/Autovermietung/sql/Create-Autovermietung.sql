-- Versionsdatum:	9.6.2015
-- Autor: 			von D. Fröhlich, M. Möbius, R. Schönfeld
-- Thema: 			Miniwelt Autovermietung

CREATE TABLE Station (
	SNr				VARCHAR (15),
	SPLZ			CHAR (5)
	CONSTRAINT C_SPLZ CHECK (SPLZ ~* '[0-9]{5}'), -- jede PLZ muss 5 "Zahlen" haben
	SOrt			VARCHAR (20),
	SStr			VARCHAR (25),
    CONSTRAINT station_key PRIMARY KEY (SNr)
);	

CREATE TABLE Kategorie (
	KName			VARCHAR (15),
	KTagespreis 	DECIMAL (5,2), -- Euro Preise bis 999,99 und 2 Nachkommastellen
	--KTagespreis	FLOAT (10), check (trunc(KTagespreis*100)=KTagespreis*100)
  CONSTRAINT kategorie_key PRIMARY KEY (KName)
);	

CREATE TABLE Auto (
	ANr				VARCHAR (9), -- Ein Kennzeichen ist nicht laenger als 9 Stellen
	AModell			VARCHAR (20),
	ASitzplaetze 	INTEGER NOT NULL CHECK (ASitzplaetze < 10), --maximal VW-Bus mit 9 Sitzplaetzen
	KName			VARCHAR REFERENCES Kategorie (KName),
	SNr				VARCHAR REFERENCES Station (SNr),
  CONSTRAINT auto_key PRIMARY KEY (ANr)
);	

CREATE TABLE Mieter (
	MNr				VARCHAR (7) 
	CONSTRAINT C_MNr CHECK (MNr ~* '[0-9]+'), -- mindestens eine "Zahl"
	MName			VARCHAR (15) 
	CONSTRAINT C_MName CHECK (MName ~* '[a-z]+'), -- mindestens ein "Buchstaben"
	MVorname		VARCHAR (10)
	CONSTRAINT C_MVorname CHECK (MVorname ~* '[a-z]+'), -- mindestens ein "Buchstaben"
	MPLZ			CHAR (5)
	CONSTRAINT C_MPLZ CHECK (MPLZ ~* '[0-9]{5}'), -- jede PLZ muss 5 "Zahlen" haben
	MOrt			VARCHAR (20),
	MStr			VARCHAR (25),
  CONSTRAINT mieter_key PRIMARY KEY (MNr)
);

CREATE TABLE Vertrag (
	VNr				VARCHAR (6)
	CONSTRAINT C_VNr CHECK (VNr ~* '[0-9]+'), -- mindestens eine "Zahl"
	VBeginn			DATE, --in der Form 11.4.2015 eingeben
	VDauer			INTEGER NOT NULL ,
	MNr				VARCHAR REFERENCES Mieter (MNr),
	SNr				VARCHAR REFERENCES Station (SNr),
	KName			VARCHAR REFERENCES Kategorie (KName),
  CONSTRAINT vertrag_key PRIMARY KEY (VNr)
);	
	
CREATE TABLE Zubehoer (
	ZNr				VARCHAR (6)
	CONSTRAINT C_ZNr CHECK (ZNr ~* '[0-9]+'), -- mindestens eine "Zahl"
	ZName			VARCHAR (20) 
	CONSTRAINT C_ZName CHECK (ZName ~* '[a-z]+'), -- mindestens eine "Buchstabe"
	ZPauschale		DECIMAL (5,2), -- Euro Preise bis 999,99 und 2 Nachkommastellen
	SNr				VARCHAR REFERENCES Station (SNr),
  CONSTRAINT zubehoer_key PRIMARY KEY (ZNr)
);

CREATE TABLE gebucht (
	VNr 			VARCHAR REFERENCES Vertrag (VNr),
	ZNr 			VARCHAR REFERENCES Zubehoer (ZNr)
);
