--  Einfügen von Daten in die Datenbank zur Miniwelt 'Projekttag'  --
-- --------------------------------------------------------------- --
-- Die Reihenfolge, in der die Daten eingefügt werden, muss an     --
-- Fremdschlüsselbeziehungen angepasst werden. Ein Datensatz muss  --
-- muss vor der Verwendung in einer Tabelle als Fremdschlüssen     --
-- bereits in der entsprechenden Tabelle als Wert vorhanden sein.  --
-- --------------------------------------------------------------- --


INSERT INTO Lehrkraft (lID, lName, lAnrede) 
	VALUES 
		(0,'Münchmeyer','Frau'),
		(1,'Rheinbote','Frau'),
		(2,'Stöckl','Herr'),
		(3,'Graf','Frau'),
		(4,'Grünwaldt','Herr'),
		(5,'Herbst','Frau'),
		(6,'Wünsch-Hecker','Herr'),
		(7,'Hornburg','Frau')
	;


INSERT INTO Klasse (kID, kStufe, kName, lID) 
	VALUES 
		(0,7,'7a',0),
		(1,8,'8b',6),
		(2,9,'9c',3),
		(3,10,'10d',4)
	;



INSERT INTO Schueler (sID, sName, sVname, sGeschlecht, sAlter, sNote, pID, kID) 
	VALUES 
		(0,'Schulz','Norina','w',14,2,4,2),
		(1,'Meyer','Hans','m',12,2,3,1),
		(2,'Kowatzki','Jennifer','w',15,1,3,3),
		(3,'Wegner','Richard','m',10,2,3,0),
		(4,'Puck','Felicitas','w',12,1,3,0),
		(5,'Ötztürk','Mohammed','m',13,4,1,1),
		(6,'Famulla','Kim','w',11,1,3,0),
		(7,'Schmidt','Torben-Leander','m',13,1,0,2),
		(8,'Levi','Magdalena','w',16,1,0,3),
		(9,'Schäfer','Linus','m',14,1,2,2),
		(10,'Schäfer','Lena','w',14,2,2,2),
		(11,'Horst','Johannes','m',15,2,1,3),
		(12,'Kluge','Isabella','w',13,4,4,1),
		(13,'Schmitt','Kevin','m',12,0,1,0),
		(14,'Özil','Ayshe','w',12,2,0,0),
		(15,'Herera','Ramón','m',16,3,2,3),
		(16,'Kellenbauer','Maike','w',14,6,4,2),
		(17,'Jonas','Justus','m',13,3,4,1),
		(18,'von Hoffmann','Louisa','w',14,1,3,3),
		(19,'Kim','Mundo','m',14,2,2,2)
	;

INSERT INTO Projekt (pID, pName, pBeschr, pKosten, pMinTNZahl, pMaxTNZahl, pMinAlter, s1ID, s2ID) 
	VALUES 
		(0,'Ernährungsatlas für unseren Kiez','Wir analysieren das Ernährungsangebot in Restaurants und Gaststätten in unserem Kiez.',0,2,10,8,7,8),
		(1,'Ernährungsvorschriften in den Weltreligionen','Wir lesen einschlägige Texte aus den heiligen Schriften verschiedener Weltreligionen und bereiten Speisen nach diesen Regeln zu.',5,3,5,12,5,11),
		(2,'Ernährungspolitik','Wir besuchen das Bundesministerium für Landwirtschaft und führen dann ein Planspiel durch.',1,4,10,14,9,10),
		(3,'Alltag auf dem Bauernhof','Wir fahren auf deinen Biobauernhof und helfen den Bauern.',0,2,6,8,3,4),
		(4,'Hunger in der Welt','Wir betrachten unterschiedliche Lösungsansetze vom Chemielabor bis zur Weltbank.',3,2,5,13,0,17)
	;


INSERT INTO Raum (rID, rPlaetze, rName) 
	VALUES 
		(0,20,'Biobauernhof'),
		(1,10,'Klassenraum 10d'),
		(2,10,'Klassenraum 9c'),
		(3,10,'Klassenraum 8b'),
		(4,10,'Klassenraum 7a'),
		(5,10,'Chemiefachraum'),
		(6,5,'Computerraum'),
		(7,20,'Kiez'),
		(8,20,'BuMi f. Landwirtsch.')
	;


INSERT INTO ausstattung (aID, aArt) 
	VALUES 
		(0,'Kreidetafel'),
		(1,'Smartboard'),
		(2,'Waschbecken'),
		(3,'Experimentierplätze'),
		(4,'Computerplätze')
	;



INSERT INTO Aufsicht (lID, pID) 
	VALUES 
		(0,0),
		(1,4),
		(4,3),
		(5,3),
		(6,1),
		(7,2)
	;
	
	
INSERT INTO Raumausstattung (rID, aID) 
	VALUES 
		(1,0),
		(1,2),
		(2,0),
		(3,1),
		(4,0),
		(4,2),
		(5,0),
		(5,2),
		(5,3),
		(6,1),
		(6,4)
	;
	

INSERT INTO Raumbelegung (vStunde, vMinute, bStunde, bMinute, rID, pID) 
	VALUES 
		(8,0,12,0,7,0),
		(12,0,16,0,6,0),
		(8,0,16,0,1,1),
		(8,0,16,0,0,3),
		(8,30,11,30,8,2),
		(12,0,16,0,3,2),
		(8,0,9,0,2,4),
		(9,0,15,0,5,4),
		(9,0,12,0,6,4),
		(12,0,15,0,2,4),
		(15,0,16,0,2,4)
	;

ALTER TABLE schueler ADD CONSTRAINT rPID FOREIGN KEY(pID) REFERENCES projekt (pID) ;
