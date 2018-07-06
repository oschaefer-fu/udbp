-- Versionsdatum:	9.6.2015
-- Autor: 			von D. Fröhlich, M. Möbius, R. Schönfeld
-- Thema: 			Miniwelt Autovermietung


--CREATE TABLE Station (
--	SNr				VARCHAR (15),
--	SPLZ			CHAR (5)
--	CONSTRAINT C_SPLZ CHECK (SPLZ ~* '[0-9]{5}'), -- jede PLZ muss 5 "Zahlen" haben
--	SOrt			VARCHAR (20),
--	SStr			VARCHAR (25),
--    CONSTRAINT station_key PRIMARY KEY (SNr)
--);
INSERT INTO Station VALUES ('1','10787','Berlin','Budapester Straße 45');
INSERT INTO Station VALUES ('2','81671','München','Friedensstraße 22a');
INSERT INTO Station VALUES ('3','50933','Köln','Widdersdorfer Straße 369');

--CREATE TABLE Kategorie (
--	KName			VARCHAR (15),
--	KTagespreis 	DECIMAL (5,2), -- Euro Preise bis 999,99 und 2 Nachkommastellen
--  CONSTRAINT kategorie_key PRIMARY KEY (KName)
--);	

-- Kategorie
INSERT INTO Kategorie VALUES ('Kleinwagen','19.99');
INSERT INTO Kategorie VALUES ('Kompaktklasse','29.99');
INSERT INTO Kategorie VALUES ('Mittelklasse','49.00');
INSERT INTO Kategorie VALUES ('obMittelklasse','89.00');
INSERT INTO Kategorie VALUES ('Oberklasse','149.00');
INSERT INTO Kategorie VALUES ('Kleinbus','109.00');
INSERT INTO Kategorie VALUES ('Cabrio','99.00');

--CREATE TABLE Auto (
--	ANr				VARCHAR (9), -- Ein Kennzeichen ist nicht laenger als 9 Stellen
--	AModell			VARCHAR (20),
--	ASitzplaetze 	INTEGER NOT NULL CHECK (ASitzplaetze < 10), --maximal VW-Bus mit 9 Sitzplaetzen
--	KName			VARCHAR REFERENCES Kategorie (KName),
--	SNr				VARCHAR REFERENCES Station (SNr),
--  CONSTRAINT auto_key PRIMARY KEY (ANr)
--);	
INSERT INTO Auto VALUES ('B-T411','Smart Fortwo',2,'Kleinwagen','1');
INSERT INTO Auto VALUES ('M-CC2856','Smart Fortwo',2,'Kleinwagen','2');
INSERT INTO Auto VALUES ('K-FU1733','VW Up!',4,'Kleinwagen','3');
INSERT INTO Auto VALUES ('M-RO9999','Opel Adam',4,'Kleinwagen','2');
INSERT INTO Auto VALUES ('B-VX5656','VW Polo',5,'Kleinwagen','1');
INSERT INTO Auto VALUES ('B-Z75483','VW Golf',5,'Kompaktklasse','1');
INSERT INTO Auto VALUES ('B-VW1234','VW Golf',5,'Kompaktklasse','1');
INSERT INTO Auto VALUES ('M-Y7625','VW Golf',5,'Kompaktklasse','2');
INSERT INTO Auto VALUES ('M-UT319','Opel Astra',5,'Kompaktklasse','2');
INSERT INTO Auto VALUES ('K-LS1487','Opel Astra',5,'Kompaktklasse','3');
INSERT INTO Auto VALUES ('K-H2457','Ford Focus',5,'Kompaktklasse','3');
INSERT INTO Auto VALUES ('B-PI314','VW Passat',5,'Mittelklasse','1');
INSERT INTO Auto VALUES ('B-MT3577','Audi A4',5,'Mittelklasse','1');
INSERT INTO Auto VALUES ('M-ED6587','BMW 3er',5,'Mittelklasse','2');
INSERT INTO Auto VALUES ('M-AF1234','Ford Mondeo',5,'Mittelklasse','2');
INSERT INTO Auto VALUES ('K-RE9805','Mercedes C-Klasse',5,'Mittelklasse','3');
INSERT INTO Auto VALUES ('K-LJ754','Mercedes C-Klasse',5,'Mittelklasse','3');
INSERT INTO Auto VALUES ('M-WQ8051','BMW 5er',5,'obMittelklasse','2');
INSERT INTO Auto VALUES ('K-GH134','Audi A6',5,'obMittelklasse','3');
INSERT INTO Auto VALUES ('B-EA9623','Mercedes E-Klasse',5,'obMittelklasse','1');
INSERT INTO Auto VALUES ('K-OP1769','Audi A8',5,'Oberklasse','3');
INSERT INTO Auto VALUES ('M-BV888','BMW 7er',5,'Oberklasse','2');
INSERT INTO Auto VALUES ('B-CR6501','Mercedes S-Klasse',5,'Oberklasse','1');
INSERT INTO Auto VALUES ('B-AR7654','VW Phaeton',5,'Oberklasse','1');
INSERT INTO Auto VALUES ('M-HG6398','VW Caravelle',8,'Kleinbus','2');
INSERT INTO Auto VALUES ('B-ZC3761','Mercedes V-Klasse',8,'Kleinbus','1');
INSERT INTO Auto VALUES ('K-LU2595','Opel Vivaro',9,'Kleinbus','3');
INSERT INTO Auto VALUES ('M-T7130','BMW Z4',2,'Cabrio','2');
INSERT INTO Auto VALUES ('B-G9806','VW Eos',4,'Cabrio','1');

--CREATE TABLE Mieter (
--	MNr				VARCHAR (7) 
--	CONSTRAINT C_MNr CHECK (MNr ~* '[0-9]+'), -- mindestens eine "Zahl"
--	MName			VARCHAR (15) 
--	CONSTRAINT C_MName CHECK (MName ~* '[a-z]+'), -- mindestens ein "Buchstaben"
--	MVorname		VARCHAR (10)
--	CONSTRAINT C_MVorname CHECK (MVorname ~* '[a-z]+'), -- mindestens ein "Buchstaben"
--	MPLZ			CHAR (5)
--	CONSTRAINT C_MPLZ CHECK (MPLZ ~* '[0-9]{5}'), -- jede PLZ muss 5 "Zahlen" haben
--	MOrt			VARCHAR (20),
--	MStr			VARCHAR (25),
--  CONSTRAINT mieter_key PRIMARY KEY (MNr)
--);
INSERT INTO Mieter VALUES ('1','Meier','Felix','50126','Bergheim','Hubertusstraße 2');
INSERT INTO Mieter VALUES ('2','Müller','Christoph','14641','Nauen','Am Kanal 5');
INSERT INTO Mieter VALUES ('3','Bäcker','Jakob','09122','Chemnitz','Müllerstraße 13');
INSERT INTO Mieter VALUES ('4','Maler','Nadine','04103','Leipzig','Johannisallee 12');
INSERT INTO Mieter VALUES ('5','Müller','Nadine','83661','Lengriess','Oberreiterweg 11');
INSERT INTO Mieter VALUES ('6','Müller','Torsten','83661','Lengriess','Karwendelstraße 34');
INSERT INTO Mieter VALUES ('7','Schreiner','Tony','09599','Freiberg','Oststraße 4');
INSERT INTO Mieter VALUES ('8','Sattler','Sarah','01139','Dresden','Sternstraße 56a');
INSERT INTO Mieter VALUES ('9','Gärtner','Nicole','10587','Berlin','Cauerstr. 23');
INSERT INTO Mieter VALUES ('10','Tischler','Torsten','04249','Leipzig','Rehbacher Straße 5');

--CREATE TABLE Vertrag (
--	VNr				VARCHAR (6)
--	CONSTRAINT C_VNr CHECK (VNr ~* '[0-9]+'), -- mindestens eine "Zahl"
--	VBeginn			DATE, --in der Form 2015-12-04 eingeben
--	VDauer			INTEGER NOT NULL ,
--	MNr				VARCHAR REFERENCES Mieter (MNr),
--	SNr				VARCHAR REFERENCES Station (SNr),
--	KName			VARCHAR REFERENCES Kategorie (KName),
--  CONSTRAINT vertrag_key PRIMARY KEY (VNr)
--);	
INSERT INTO Vertrag VALUES ('1','2015-05-10',7,'1','3','Kleinwagen');
INSERT INTO Vertrag VALUES ('2','2015-05-16',3,'2','3','Kompaktklasse');
INSERT INTO Vertrag VALUES ('3','2015-05-12',5,'3','3','Kompaktklasse');
INSERT INTO Vertrag VALUES ('4','2015-05-01',4,'1','1','Cabrio');
INSERT INTO Vertrag VALUES ('5','2015-05-01',31,'4','1','Mittelklasse');
INSERT INTO Vertrag VALUES ('6','2015-05-13',10,'5','3','Mittelklasse');
INSERT INTO Vertrag VALUES ('7','2015-05-16',1,'6','3','obMittelklasse');
INSERT INTO Vertrag VALUES ('8','2015-04-25',25,'7','3','Oberklasse');
INSERT INTO Vertrag VALUES ('9','2015-06-30',30,'4','1','Oberklasse');
INSERT INTO Vertrag VALUES ('10','2015-06-12',5,'1','2','Kleinwagen');
INSERT INTO Vertrag VALUES ('11','2015-05-15',2,'8','3','Kleinbus');
INSERT INTO Vertrag VALUES ('12','2015-06-03',2,'1','1','Oberklasse');
INSERT INTO Vertrag VALUES ('13','2015-05-01',1,'9','2','Cabrio');
INSERT INTO Vertrag VALUES ('14','2015-05-25',2,'10','1','Kleinbus');

--CREATE TABLE Zubehoer (
--	ZNr				VARCHAR (6)
--	CONSTRAINT C_ZNr CHECK (ZNr ~* '[0-9]+'), -- mindestens eine "Zahl"
--	ZName			VARCHAR (20) 
--	CONSTRAINT C_ZName CHECK (ZName ~* '[a-z]+'), -- mindestens eine "Buchstabe"
--	ZPauschale		DECIMAL (5,2), -- Euro Preise bis 999,99 und 2 Nachkommastellen
--  SNr				VARCHAR REFERENCES Station (SNr),
--  CONSTRAINT zubehoer_key PRIMARY KEY (ZNr)
--);
INSERT INTO Zubehoer VALUES ('101','Navigationssystem','35.00','1');
INSERT INTO Zubehoer VALUES ('102','Navigationssystem','35.00','1');
INSERT INTO Zubehoer VALUES ('103','Navigationssystem','35.00','2');
INSERT INTO Zubehoer VALUES ('104','Navigationssystem','35.00','3');
INSERT INTO Zubehoer VALUES ('201','Winterreifen','30.00','1');
INSERT INTO Zubehoer VALUES ('202','Winterreifen','30.00','2');
INSERT INTO Zubehoer VALUES ('203','Winterreifen','30.00','3');
INSERT INTO Zubehoer VALUES ('301','Kindersitz','20.00','1');
INSERT INTO Zubehoer VALUES ('302','Kindersitz','20.00','1');
INSERT INTO Zubehoer VALUES ('303','Kindersitz','20.00','1');
INSERT INTO Zubehoer VALUES ('304','Kindersitz','20.00','1');
INSERT INTO Zubehoer VALUES ('305','Kindersitz','20.00','1');
INSERT INTO Zubehoer VALUES ('306','Kindersitz','20.00','2');
INSERT INTO Zubehoer VALUES ('307','Kindersitz','20.00','2');
INSERT INTO Zubehoer VALUES ('309','Kindersitz','20.00','3');
INSERT INTO Zubehoer VALUES ('401','Schneeketten','25.00','2');

--CREATE TABLE gebucht (
--	VNr 			VARCHAR REFERENCES Vertrag (VNr),
--	ZNr 			VARCHAR REFERENCES Zubehoer (ZNr)
--);
INSERT INTO gebucht VALUES ('1','104');
INSERT INTO gebucht VALUES ('2','203');
INSERT INTO gebucht VALUES ('5','301');
INSERT INTO gebucht VALUES ('5','302');
INSERT INTO gebucht VALUES ('5','303');
INSERT INTO gebucht VALUES ('7','309');
INSERT INTO gebucht VALUES ('10','401');
INSERT INTO gebucht VALUES ('14','201');
INSERT INTO gebucht VALUES ('14','305');

