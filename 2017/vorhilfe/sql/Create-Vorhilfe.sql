-- Create-Vorhilfe.sql
-- Tabellengenerierung für die Datenbank Vorhilfe
-- Typen
-- Wochentag
CREATE TYPE wotag AS ENUM ('mo','di','mi','do','fr','sa');

--------------------- Entitäten --------------------------
CREATE TABLE konto (
	KoNR SERIAL, 
	kontostand INTEGER,
	PRIMARY KEY (KoNR)
); 
-- setzt den Beginn der KoNR auf 1000
ALTER SEQUENCE  konto_konr_seq RESTART WITH 1000;

CREATE TABLE lehrer (
	LID	INTEGER,
	nname VARCHAR (100),
	email VARCHAR (100),
	kuerzel VARCHAR (5),
PRIMARY KEY (LID)
);
-- 
CREATE TABLE schueler (
	SID     SERIAL, -- automatischer Zähler
	nname   VARCHAR (100),
	vname   VARCHAR (100),
	geb   	DATE,
	klasse  VARCHAR (3),    	--Klassenstufe
	LID 	INTEGER REFERENCES lehrer (LID), -- Hier geht die Beziehung 'ist Klassenlehrer' auf
	email	VARCHAR (100),
	KoNR    INTEGER REFERENCES konto (KoNR), -- hier geht 'besitzt' auf
  PRIMARY KEY (SID)
);


CREATE TABLE raum (
	RNR INTEGER , 
	stock INTEGER,
	anzP	INTEGER,
PRIMARY KEY (RNR)
);

CREATE TABLE ausstattung (
	ANR	SERIAL, -- AusNr
	geraete VARCHAR(100),
PRIMARY KEY (ANR)
);

CREATE TABLE kurs (
	KNR SERIAL, --KursNr
	-- hier geht die Beziehung schueler -<bietet an>- kurs in kurs auf
	Sid INTEGER REFERENCES schueler(sid), 
	wtag wotag,
	zeit TIME,	 -- Kurszeit
	-- Maximale Teilnehmerzahl (Integritätsbedingung)
	maxP INTEGER  
CHECK (maxP BETWEEN 2 AND 5) DEFAULT 4,
PRIMARY KEY (KNR)
);

CREATE TABLE fach (
	FNR SERIAL,
	fname VARCHAR (50),
PRIMARY KEY (FNR)
);

CREATE TABLE methode (
	MNR SERIAL,
	mname VARCHAR (50),
PRIMARY KEY (MNR)
);

---------------------------- Beziehungen ------------------------------
-- raum hat ausstattung
CREATE TABLE hat (
	RNR INTEGER REFERENCES raum (RNR) ,
	ANR INTEGER REFERENCES ausstattung(ANR) 
);
-- jeder Schüler besitzt ein Konto
-- geht auf in Schüler

--der kurs findet statt in raum
CREATE TABLE findet_statt(
	KNR INTEGER REFERENCES kurs (KNR),
	RNR INTEGER REFERENCES raum (RNR) 
);
-- Schüler ist in Kurs eingeschrieben 
CREATE TABLE  eingeschrieben (
	SID INTEGER REFERENCES schueler (SID),
	KNR INTEGER REFERENCES kurs (KNR),
	zeitS TIME  						--Zeitstempel, wann Einschreiben erfolgt
--  gehen auf in Kurs!!
);
-- Kurs vermittelt Fach
CREATE TABLE  vermittelt(
	KNR INTEGER REFERENCES kurs (KNR),
	FNR INTEGER REFERENCES fach (FNR)
);
-- Kurs beinhaltet Methode
CREATE TABLE  beinhaltet(
	KNR INTEGER REFERENCES kurs (KNR),
	MNR INTEGER REFERENCES methode (MNR)
);
-- lehrer beaufsichtig kurs
CREATE TABLE  beaufsichtigt(
	KNR INTEGER REFERENCES kurs (KNR),
	LID INTEGER REFERENCES lehrer (LID)
);


-------------------------------- views der Tabellen ---------------------------------------

-- kurs ohne leitenden Schüler (einfache natural joins für anfragen nach belegungen möglich)
CREATE VIEW vkurs AS 
	SELECT knr,wtag,zeit,maxP 
FROM kurs;

-- schueler mit basisdaten
CREATE VIEW vschueler AS 
	SELECT sid,nname,vname,klasse,email 
FROM schueler;

-- kurse mit fächern
CREATE VIEW vfach AS 
	SELECT * 
FROM fach natural join vermittelt natural join kurs ;

-- kurse mit methoden
CREATE VIEW vmethode AS 
	SELECT * 
FROM methode natural join beinhaltet natural join kurs ;

-- zeige alle Tabellen
\dt
\dv
