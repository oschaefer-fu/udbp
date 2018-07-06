% Miniwelt Sportfest

/output off
/compact_listings on
/multiline on

CREATE OR REPLACE TABLE Lehrer 
(
  LID	         INTEGER,
  LName          VARCHAR(32),
  LVorname		 VARCHAR(32),
  WettID       	 INTEGER,
  Funktion		 VARCHAR(32),
  KlName		 VARCHAR(4)
);

CREATE OR REPLACE TABLE Klasse
(
  KlName         VARCHAR(4)
);

CREATE OR REPLACE TABLE Wettkampf
(
  WettID         INTEGER,
  WettName       VARCHAR(32),
  WettKlasse     VARCHAR(32),
  Geschlecht     CHAR,
  Termin		 VARCHAR(5)
);

CREATE OR REPLACE TABLE Schueler
(
  SchID			INTEGER,
  SchName		VARCHAR(32),
  SchVorname	VARCHAR(32),
  SchGeschlecht	CHAR,
  SchGebDatum	VARCHAR(10),
  KlName		VARCHAR(4)
);

CREATE OR REPLACE TABLE Sportanlage
(
  AnlagenID		INTEGER,
  AnlagenName	VARCHAR(32)
);

CREATE OR REPLACE TABLE Material
(
  MatID			INTEGER,
  MatName		VARCHAR(32),
  MatAnzahl		INTEGER
);

CREATE OR REPLACE TABLE benoetigt
(
  AnlagenID		INTEGER,
  MatID			INTEGER,
  Anzahl		INTEGER
);

CREATE OR REPLACE TABLE findetStatt
(
  AnlagenID		INTEGER,
  WettID		INTEGER,
  Dauer			INTEGER
);

CREATE OR REPLACE TABLE nimmtTeil
(
  SchID			INTEGER,
  WettID		INTEGER,
  Platz			INTEGER,
  Ergebnis		INTEGER,
  Funktion		VARCHAR(32)
);

INSERT INTO Lehrer VALUES (100,'Bauer','Bernd',100,'Helfer','7A');
INSERT INTO Lehrer VALUES (101,'Becker','Petra',101,'Stationsleiter','');
INSERT INTO Lehrer VALUES (102,'Engel','Bernd',102,'Helfer','8A');
INSERT INTO Lehrer VALUES (103,'Fuchs','Sebastian',103,'Helfer','11');
INSERT INTO Lehrer VALUES (104,'Hofmann','Constanze',104,'Kampfrichter','9A');
INSERT INTO Lehrer VALUES (105,'Hofman','Conrad',105,'Helfer','10A');
INSERT INTO Lehrer VALUES (106,'Meier','Juergen',106,'Stationsleiter','12');
INSERT INTO Lehrer VALUES (107,'Meier','Anja',107,'Stationsleiter','');
INSERT INTO Lehrer VALUES (108,'Schmidt','Anke',100,'Schreiber','7A');
INSERT INTO Lehrer VALUES (109,'Schulz','Klaus',105,'Stationsleiter','13');

INSERT INTO Klasse VALUES ('7A');
INSERT INTO Klasse VALUES ('7B');
INSERT INTO Klasse VALUES ('8A');
INSERT INTO Klasse VALUES ('9A');
INSERT INTO Klasse VALUES ('9B');
INSERT INTO Klasse VALUES ('10A');
INSERT INTO Klasse VALUES ('10B');
INSERT INTO Klasse VALUES ('11');
INSERT INTO Klasse VALUES ('12');
INSERT INTO Klasse VALUES ('13');

INSERT INTO Wettkampf VALUES (100,'Weitsprung','7/8','m','08:00');
INSERT INTO Wettkampf VALUES (101,'Weitsprung','7/8','w','08:20');
INSERT INTO Wettkampf VALUES (102,'100m','9/10','m','09:00');
INSERT INTO Wettkampf VALUES (103,'100m','9/10','w','09:00');
INSERT INTO Wettkampf VALUES (104,'Kugel','11/12','m','11:00');
INSERT INTO Wettkampf VALUES (105,'Kugel','11/12','w','11:15');
INSERT INTO Wettkampf VALUES (106,'Fussball','7/8','m','10:30');
INSERT INTO Wettkampf VALUES (107,'Fussball','7/8','w','10:30');
INSERT INTO Wettkampf VALUES (108,'Basketball','9/10','m','10:00');
INSERT INTO Wettkampf VALUES (109,'Basketball','9/10','w','10:00');

INSERT INTO Schueler VALUES (1000,'Becker','Julian','m','2002-08-06','7A');
INSERT INTO Schueler VALUES (1001,'Braun','Monika','w','2002-12-05','7A');
INSERT INTO Schueler VALUES (1002,'Franke','Lina','w','2002-03-08','7A');
INSERT INTO Schueler VALUES (1003,'Kaiser','Lukas','m','2001-03-17','8A');
INSERT INTO Schueler VALUES (1004,'Merten','Paul','m','2001-06-22','8A');
INSERT INTO Schueler VALUES (1005,'Keller','Lukas','m','2001-03-18','8A');
INSERT INTO Schueler VALUES (1006,'Klein','Christian','m','2001-03-17','8A');
INSERT INTO Schueler VALUES (1007,'Koch','Kristin','w','2000-03-17','9A');
INSERT INTO Schueler VALUES (1008,'Lange','Manuel','m','2000-12-22','9A');
INSERT INTO Schueler VALUES (1009,'Lorenz','Anton','m','2000-11-21','9A');
INSERT INTO Schueler VALUES (1010,'Meier','Julian','m','1999-01-01','10A');
INSERT INTO Schueler VALUES (1011,'Meier','Julian','m','1999-08-15','10A');
INSERT INTO Schueler VALUES (1012,'Meyer','Tom','m','1999-08-24','10A');
INSERT INTO Schueler VALUES (1013,'Scholz','Werner','m','1998-05-06','11');
INSERT INTO Schueler VALUES (1014,'Weber','Chantal','w','1998-09-12','11');
INSERT INTO Schueler VALUES (1015,'Wolf','Simon','m','1998-07-15','11');
INSERT INTO Schueler VALUES (1016,'Zimmer','Erik','m','1997-06-23','12');
INSERT INTO Schueler VALUES (1017,'Fiebich','Simona','w','1997-05-25','12');
INSERT INTO Schueler VALUES (1018,'Mutz','Gregor','m','1996-02-13','13');
INSERT INTO Schueler VALUES (1019,'Radig','Luise','w','1996-05-10','13');
INSERT INTO Schueler VALUES (1020,'Mader','Leonie','w','1996-07-20','13');

INSERT INTO Sportanlage VALUES (10,'Weitsprung 1');
INSERT INTO Sportanlage VALUES (11,'Weitsprung 2');
INSERT INTO Sportanlage VALUES (12,'Kugelstoss 1');
INSERT INTO Sportanlage VALUES (13,'Rasenplatz 1');
INSERT INTO Sportanlage VALUES (14,'Laufbahn 1');
INSERT INTO Sportanlage VALUES (15,'Laufbahn2');
INSERT INTO Sportanlage VALUES (16,'Ballspielplatz 1');
INSERT INTO Sportanlage VALUES (17,'Ballspielplatz 2');
INSERT INTO Sportanlage VALUES (18,'Turnhalle Feld 1');

INSERT INTO Material VALUES (100,'Fussball',10);
INSERT INTO Material VALUES (101,'Basketball',10);
INSERT INTO Material VALUES (102,'Leibchen',30);
INSERT INTO Material VALUES (103,'5 kg Kugel',15);
INSERT INTO Material VALUES (104,'3 kg Kugel',15);
INSERT INTO Material VALUES (105,'Massband',20);
INSERT INTO Material VALUES (106,'Startklappe',10);
INSERT INTO Material VALUES (107,'Pfeife',15);
INSERT INTO Material VALUES (108,'Schreibertisch',20);
INSERT INTO Material VALUES (109,'Stuhl',50);
INSERT INTO Material VALUES (110,'Stoppuhr',30);

INSERT INTO benoetigt VALUES (10,105,2);
INSERT INTO benoetigt VALUES (11,105,2);
INSERT INTO benoetigt VALUES (12,103,5);
INSERT INTO benoetigt VALUES (13,107,2);
INSERT INTO benoetigt VALUES (13,100,2);
INSERT INTO benoetigt VALUES (14,106,1);
INSERT INTO benoetigt VALUES (15,106,1);
INSERT INTO benoetigt VALUES (14,110,3);
INSERT INTO benoetigt VALUES (15,110,3);
INSERT INTO benoetigt VALUES (16,101,2);
INSERT INTO benoetigt VALUES (16,107,2);
INSERT INTO benoetigt VALUES (17,107,2);

INSERT INTO findetStatt VALUES (10,100,20);
INSERT INTO findetStatt VALUES (11,100,20);
INSERT INTO findetStatt VALUES (10,101,20);
INSERT INTO findetStatt VALUES (14,102,20);
INSERT INTO findetStatt VALUES (15,103,20);
INSERT INTO findetStatt VALUES (12,104,15);
INSERT INTO findetStatt VALUES (12,105,15);
INSERT INTO findetStatt VALUES (13,106,30);
INSERT INTO findetStatt VALUES (16,107,20);
INSERT INTO findetStatt VALUES (17,108,30);
INSERT INTO findetStatt VALUES (16,109,20);

INSERT INTO nimmtTeil VALUES (1000,100,1,450,'Teilnehmer');
INSERT INTO nimmtTeil VALUES (1000,106,1,0,'Teilnehmer');
INSERT INTO nimmtTeil VALUES (1001,101,3,340,'Teilnehmer');
INSERT INTO nimmtTeil VALUES (1001,107,2,0,'Teilnehmer');
INSERT INTO nimmtTeil VALUES (1002,101,2,365,'Teilnehmer');
INSERT INTO nimmtTeil VALUES (1002,107,1,0,'Teilnehmer');
INSERT INTO nimmtTeil VALUES (1003,100,2,440,'Teilnehmer');
INSERT INTO nimmtTeil VALUES (1003,106,2,0,'Teilnehmer');
INSERT INTO nimmtTeil VALUES (1004,100,3,415,'Teilnehmer');
INSERT INTO nimmtTeil VALUES (1004,106,2,0,'Teilnehmer');
INSERT INTO nimmtTeil VALUES (1005,100,0,0,'krank');
INSERT INTO nimmtTeil VALUES (1006,100,4,390,'Teilnehmer');
INSERT INTO nimmtTeil VALUES (1007,103,2,130,'Teilnehmer');
INSERT INTO nimmtTeil VALUES (1007,109,1,0,'Teilnehmer');
INSERT INTO nimmtTeil VALUES (1008,102,0,0,'krank');
INSERT INTO nimmtTeil VALUES (1009,102,1,122,'Teilnehmer');
INSERT INTO nimmtTeil VALUES (1009,108,1,0,'Teilnehmer');
INSERT INTO nimmtTeil VALUES (1010,102,2,130,'Teilnehmer');
INSERT INTO nimmtTeil VALUES (1010,108,2,0,'Teilnehmer');
INSERT INTO nimmtTeil VALUES (1011,102,3,132,'Teilnehmer');
INSERT INTO nimmtTeil VALUES (1011,108,2,0,'Teilnehmer');
INSERT INTO nimmtTeil VALUES (1012,102,4,133,'Teilnehmer');
INSERT INTO nimmtTeil VALUES (1012,108,2,0,'Teilnehmer');
INSERT INTO nimmtTeil VALUES (1013,104,1,830,'Teilnehmer');
INSERT INTO nimmtTeil VALUES (1014,105,1,655,'Teilnehmer');
INSERT INTO nimmtTeil VALUES (1015,104,2,812,'Teilnehmer');
INSERT INTO nimmtTeil VALUES (1016,104,0,0,'krank');
INSERT INTO nimmtTeil VALUES (1017,105,1,655,'Teilnehmer');
INSERT INTO nimmtTeil VALUES (1018,100,0,0,'Helfer');
INSERT INTO nimmtTeil VALUES (1019,101,0,0,'Helfer');
INSERT INTO nimmtTeil VALUES (1020,107,0,0,'Helfer');

% Da der Einfügebefehl in postgreSQL genauso aussieht, kann man neue
% neue Daten hier einfach reinkopieren oder umgekehrt.

/ra
/output on
/dbschema
