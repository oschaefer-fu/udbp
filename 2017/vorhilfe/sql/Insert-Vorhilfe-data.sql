--CreateVorhilfe.sql
-- Tabellengenerierung für die Datenbank Vorhilfe
-- Die Schlüssel werden, wenn nicht extra angegeben (Bsp. LID in Lehrer),
-- intern von PostgreSQL verwaltet (siehe Create-Vorhilfe.sql)
------------------------------- Dateneingabe -----------------------------------------------

INSERT INTO konto (kontostand) VALUES 
(0),(10),(3),(1),(3),(4),(1),(0),(2),(3),(8),(0),(10),(2),(8),(4);

INSERT INTO lehrer (LID,kuerzel,nname,email) VALUES 
(1,	'sf',	'Schaefer',	'os@vim.org'),
(2,	'cz',	'Czetö',	'cz@aiko.net'),
(3,	'bd',	'Bond',		'james@mi5.org'),
(4,	'cp',	'Cooper',	'high@noon.us'),
(5,	'kl',	'Klemt',	'winnie2@ado.de'),
(6,	'sc',	'Schmitt',	'schmitt@gmx.de'),
(7,	'si',	'Schmidt',	'darthvader@todesstern.de'),
(8,	'boe',	'Boettcher',	'benniboe@zedat.de'),
(9,	'wf',	'Wolf',	'tflow@gmx.de'),
(10, 'chi',	'Chi',	'themroc@musichi.net'),
(11, 'ms',	'Schlüter',	'ms@ado.de');

INSERT INTO schueler (nname,vname,geb,klasse,lid,email,konr) VALUES 
('Bär',			'Frieder',	'11-11-2002',	'11',	'1',	'go@luise.net',		1000),
('Schmidt',		'Harald',	'10-10-2002',	'11',	'1',	'aha@luise.net',	1001),
('Wolf',		'Hermine',	'01-10-2002',	'11',	'1',	'wo@luise.net',		1002),
('Waal',		'Fritz',	'11-09-2002',	'11',	'1',	'wale@luise.net',	1003),
('Gammel',		'Gabi',		'01-08-2000',	'12',	'2',	'gaga@luise.net',	1004),
('Schlau',		'Gabi',		'01-07-2003',	'10',	'3',	'schlau@luise.net',	1005),
('Gans',		'Gunter',	'01-07-2003',	'10',	'3',	'gg@luise.net',		1006),
('Kannicht',	'Thomas',	'03-03-2004',	'09',	'4',	'konzert@luise.net',1007),
('Kurz',		'Susanne',	'28-03-2004',	'09',	'4',	'shorty@luise.net',	1008),
('Braumeister',	'Thomas',	'03-04-2004',	'09',	'4',	'lame@luise.net',	1009),
('Sabbel',		'Klara',	'04-12-2005',	'08',	'5',	'schlau@luise.net',	1010),
('Kunze',		'Max',		'05-12-2005',	'08',	'6',	'maumau@luise.net',	1011),
('Kolbe',		'Theresa',	'07-06-2005',	'08',	'6',	'prince@luise.net',	1012),
('Kunze',		'Constanze','05-12-2005',	'08',	'6',	'babo@luise.net',	1013),
('Witzel',		'Merve',	'09-04-2000',	'12',	'6',	'knaller@luise.net',1014),
('Sonnenschein','Clara',	'30-12-2000',	'12',	'7',	'mist@luise.net',	1015);

INSERT INTO kurs (SID,wtag,zeit) VALUES --maxP wird automatisch auf 4 gesetzt
(1,'mo','12:30:00'),
(1,'di','12:15:00'),
(2,'mo','12:30:00'),
(2,'mi','12:30:00'),
(3,'do','12:00:00'),
(3,'di','13:00:00'),
(4,'mi','12:15:00'),
(4,'fr','13:30:00'),
(4,'di','14:00:00'),
(7,'di','14:00:00'),
(8,'mi','14:30:00');

INSERT INTO fach (fname) VALUES 
('keine'),
('Informatik'),
('Mathematik'),
('Englisch'),
('Französisch'),
('Deutsch');


INSERT INTO methode (mname) VALUES 
('keine'),
('ABI'),
('MSA'),
('Präsentation');

INSERT INTO raum (RNR,stock,anzP) VALUES
(400, 4, 08),
(401, 4, 13),
(402, 4, 19),
(403, 4, 21),
(300, 3, 20),
(301, 3, 32),
(200, 2, 20),
(201, 2, 32),
(202, 2, 30),
(203, 2, 13),
(100, 1, 16),
(101, 1, 25),
(102, 1, 28),
(103, 1, 10),
(001, 0, 23),
(-101,-1, 25);

-- eingeschrieben getrennt (su), damit die zweite Serie einen anderen Timestamp hat. 
INSERT INTO eingeschrieben (KNR, SID,zeitS) VALUES
(1,4,CURRENT_TIMESTAMP),(1,5,LOCALTIMESTAMP),(1,6,LOCALTIMESTAMP),
(5,9,LOCALTIMESTAMP),(5,8,LOCALTIMESTAMP),
(6,5,LOCALTIMESTAMP),(6,6,LOCALTIMESTAMP);

INSERT INTO ausstattung (geraete) VALUES 
('Tafel'),
('Beamer'),
('Computer'),
('OH-Projektor'),
('Fernseher'),
('Whiteboard'),
('Smartboard'),
('Waschbecken'),
('Sitzecke');

INSERT INTO hat (RNR, ANR) VALUES
(400,1),(400,3),(400,4),
(401,1),(401,8),
(402,7),(402,3),(402,4),(402,6),
(403,1),
(300,1),(300,2),(300,3),
(301,1),(301,4),
(200,3),(200,9),(200,8),
(201,1),
(202,1),
(203,1),
(100,5),(100,4),(100,9),
(101,5),(101,4),(101,9),
(102,7),(102,3),
(103,7),(103,3),
(001,1),(001,9),
(-101,1),(-101,2),(-101,4),(-101,8),(-101,9);

INSERT INTO findet_statt (KNR,RNR) VALUES
(1,300),(2,300),(3,301),(4,301),(5,201),(6,301),(7,301),(8,200),(9,403),(10,001),(11,-101);
INSERT INTO beaufsichtigt (LID, KNR) VALUES
(1,1),(8,2),(3,3),(9,4),(10,5),(11,6),(5,7),(6,8),(6,9),(2,10),(7,11);
INSERT INTO beinhaltet (KNR, MNR) VALUES
(1,1),(2,2),(3,2),(4,2),(5,3),(6,3),(7,3),(8,3),(9,3),(9,4),(10,1),(11,1);
INSERT INTO vermittelt (KNR, FNR) VALUES
(1,2),(2,3),(3,4),(4,6),(5,5),(6,3),(7,6),(8,4),(9,1),(10,3),(11,5);
INSERT INTO eingeschrieben (KNR, SID,zeitS) VALUES
(2,5,LOCALTIMESTAMP),(2,7,LOCALTIMESTAMP),(2,8,LOCALTIMESTAMP),(2,9,LOCALTIMESTAMP),
(3,9,LOCALTIMESTAMP),(3,4,LOCALTIMESTAMP),
(4,5,LOCALTIMESTAMP),(4,4,LOCALTIMESTAMP),
(7,8,LOCALTIMESTAMP),(7,10,LOCALTIMESTAMP),(7,12,LOCALTIMESTAMP),
(8,8,LOCALTIMESTAMP),(8,11,LOCALTIMESTAMP),(8,13,LOCALTIMESTAMP),
(9,8,LOCALTIMESTAMP),(9,6,LOCALTIMESTAMP),(9,5,LOCALTIMESTAMP),
(10,8,LOCALTIMESTAMP),(10,5,LOCALTIMESTAMP),(10,15,LOCALTIMESTAMP),
(11,8,LOCALTIMESTAMP),(11,5,LOCALTIMESTAMP);
-- zeige alle Tabellen
\dt
-- zeige alle views
\dv
