--	LWB	Informatik
--	UDBP	Sportfest
--
--	Insert Tabellen

INSERT INTO Schueler VALUES (90001,'Meier','10','27.11.2000','m','1');					-- SNr von x auf 9xxxx
INSERT INTO Schueler VALUES (90002,'El Daher','9','02.05.2001','w','1');
INSERT INTO Schueler VALUES (90003,'Anger' ,'10','17.09.2001','m','1');
INSERT INTO Schueler VALUES (90004,'Tusk','8','10.04.2002','w','0');
INSERT INTO Schueler VALUES (90005,'Schreiber','9','29.05.2001','m','1');
INSERT INTO Schueler VALUES (90006,'Yükcel','7','25.06.2003','m','0');
INSERT INTO Schueler VALUES (90007,'Watt','10','07.09.2000','m','1');
INSERT INTO Schueler VALUES (90008,'Ampere','8','02.06.2002','w','1');
INSERT INTO Schueler VALUES (90009,'Eroglu','7','11.03.2004','m','1');
INSERT INTO Schueler VALUES (90010,'Sommer','9','04.01.2002','w','0');

INSERT INTO Wettkaempfe VALUES (2001,'800m Lauf','Ausdauer');						-- WKNr von x auf 2xxx
INSERT INTO Wettkaempfe VALUES (2002,'Radfahren','Ausdauer');
INSERT INTO Wettkaempfe VALUES (2003,'Kugelstoßen','Kraft');
INSERT INTO Wettkaempfe VALUES (2004,'Standweitsprung','Kraft');
INSERT INTO Wettkaempfe VALUES (2005,'Laufen','Schnelligkeit');
INSERT INTO Wettkaempfe VALUES (2006,'25m Schwimmen','Schnelligkeit');
INSERT INTO Wettkaempfe VALUES (2007,'Hochsprung','Koordination');
INSERT INTO Wettkaempfe VALUES (2008,'Seilspringen','Koordination');

INSERT INTO Teilnahme VALUES (90001,2006,'10:00',2);							
INSERT INTO Teilnahme VALUES (90002,2002,'08:00',3);
INSERT INTO Teilnahme VALUES (90003,2001,'09:00',1);
INSERT INTO Teilnahme VALUES (90004,2005,'13:00',3);
INSERT INTO Teilnahme VALUES (90005,2004,'10:00',3);
INSERT INTO Teilnahme VALUES (90006,2001,'08:00',3);
INSERT INTO Teilnahme VALUES (90007,2006,'10:00',2);
INSERT INTO Teilnahme VALUES (90008,2005,'13:00',3);
INSERT INTO Teilnahme VALUES (90009,2001,'08:00',3);
INSERT INTO Teilnahme VALUES (90010,2004,'10:00',3);
INSERT INTO Teilnahme VALUES (90001,2003,'08:00',2);
INSERT INTO Teilnahme VALUES (90002,2004,'10:00',2);
INSERT INTO Teilnahme VALUES (90003,2003,'08:00',2);
INSERT INTO Teilnahme VALUES (90004,2003,'10:00',2);
INSERT INTO Teilnahme VALUES (90005,2002,'08:00',3);
INSERT INTO Teilnahme VALUES (90006,2003,'12:00',3);
INSERT INTO Teilnahme VALUES (90007,2003,'08:00',2);
INSERT INTO Teilnahme VALUES (90008,2003,'10:00',2);
INSERT INTO Teilnahme VALUES (90009,2004,'09:00',1);
INSERT INTO Teilnahme VALUES (90010,2002,'08:00',3);
INSERT INTO Teilnahme VALUES (90001,2006,'09:00',2);
INSERT INTO Teilnahme VALUES (90002,2006,'11:00',2);
INSERT INTO Teilnahme VALUES (90003,2001,'09:00',1);
INSERT INTO Teilnahme VALUES (90004,2002,'09:00',3);
INSERT INTO Teilnahme VALUES (90005,2006,'11:00',2);
INSERT INTO Teilnahme VALUES (90006,2008,'11:00',2);
INSERT INTO Teilnahme VALUES (90007,2006,'10:00',3);
INSERT INTO Teilnahme VALUES (90008,2001,'11:00',2);
INSERT INTO Teilnahme VALUES (90009,2006,'12:00',3);
INSERT INTO Teilnahme VALUES (90010,2006,'11:00',2);

INSERT INTO Wettkampfstaetten VALUES (301,'Turnhalle','Schulstraße');						-- WKSNr von x auf 3xx
INSERT INTO Wettkampfstaetten VALUES (302,'Sportplatz','Vereinsstraße');
INSERT INTO Wettkampfstaetten VALUES (303,'Schwimmhalle','Badstraße');
INSERT INTO Wettkampfstaetten VALUES (304,'Landschaftspark','Parkstrasse');

INSERT INTO Aufsichtsunterstuetzung VALUES (90007,304,'11:00');
INSERT INTO Aufsichtsunterstuetzung VALUES (90001,303,'08:00');
INSERT INTO Aufsichtsunterstuetzung VALUES (90003,302,'09:00');

INSERT INTO Lehrer VALUES (10001,'Buchschmid',304);								-- PNr von x auf 1xxxx
INSERT INTO Lehrer VALUES (10002,'Zemke',303);
INSERT INTO Lehrer VALUES (10003,'El Moutahid',302);
INSERT INTO Lehrer VALUES (10004,'Hertel',301);

INSERT INTO Stattfinden VALUES (2006,303,'10:00');
INSERT INTO Stattfinden VALUES (2002,304,'08:00');
INSERT INTO Stattfinden VALUES (2001,302,'09:00');
INSERT INTO Stattfinden VALUES (2003,302,'11:00');
INSERT INTO Stattfinden VALUES (2008,301,'12:00');
INSERT INTO Stattfinden VALUES (2005,302,'13:00');

INSERT INTO Material VALUES (501,'Kugel',5);									-- MNr von x auf 5xx
INSERT INTO Material VALUES (502,'Springseil',10);
INSERT INTO Material VALUES (503,'Stoppuhr',10);
INSERT INTO Material VALUES (504,'Trillerpfeife',20);
INSERT INTO Material VALUES (505,'Maßband',5);
INSERT INTO Material VALUES (506,'Harken',2);
INSERT INTO Material VALUES (507,'Ständer',6);
INSERT INTO Material VALUES (508,'Stangen',3);

INSERT INTO Bedarf VALUES (503,305,3);
INSERT INTO Bedarf VALUES (501,303,2);
INSERT INTO Bedarf VALUES (502,308,6);

INSERT INTO Dienstleister VALUES (401,'SportundSpiel','Ballweg','Sportgeräte');					-- DNr von x auf 4xx
INSERT INTO Dienstleister VALUES (402,'EinfachLecker','Brötchengasse','Catering');
INSERT INTO Dienstleister VALUES (403,'GuteFahrt','An der Autobahn','Transport');

INSERT INTO Betreuung VALUES (401,302,'50,00 €');
INSERT INTO Betreuung VALUES (403,302,'150,00 €');
INSERT INTO Betreuung VALUES (402,301,'200,00 €');

