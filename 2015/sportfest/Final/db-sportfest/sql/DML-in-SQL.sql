--  Miniwelt Sportfest
--  Autoren: H. Huth, P. Kreißig, K. Petri
INSERT INTO Lehrer VALUES (100, 'Bauer','Bernd',100, 'Helfer'); 
UPDATE Lehrer 
		SET Funktion='Kampfrichter'
		WHERE LName = 'Bauer';
DELETE FROM Lehrer 
		WHERE LName = 'Bauer';



--INSERT INTO Klasse VALUES (); 
INSERT INTO Klasse VALUES ('7-2'); 
UPDATE Klasse 
		SET KlName='8-2'
		WHERE KlName = '7-2';
DELETE FROM Klasse 
		WHERE KlName = '8-2';
 
--INSERT INTO Wettkampf VALUES (); 
INSERT INTO Wettkampf VALUES (200, 'Weitsprung','7/8','w', '12:15'); 
UPDATE Wettkampf 
		SET Termin='12:30'
		WHERE WettName = 'Weitsprung';
DELETE FROM Wettkampf 
		WHERE Wettname = 'Weitsprung';
 
--INSERT INTO Schueler VALUES ();
INSERT INTO Klasse VALUES ('7-2');
INSERT INTO Klasse VALUES ('8-2');
INSERT INTO Schueler VALUES (200, 'Bauer','Ulli','w','2002-12-3', '7-2'); 
UPDATE Schueler
		SET KlName='8-2'
		WHERE KLName = '7-2';
DELETE FROM Schueler 
		WHERE SchName = 'Bauer';
DELETE FROM Klasse 
		WHERE KlName = '8-2' OR KlName='7-2';

--INSERT INTO Sportanlage VALUES ();
INSERT INTO Sportanlage VALUES (200, 'Weitsprung1'); 
UPDATE Sportanlage
		SET AnlagenName='Weitsprung2'
		WHERE AnlagenName = 'Weitsprung1';
DELETE FROM Sportanlage
		WHERE AnlagenName='Weitsprung2';

--INSERT INTO Material VALUES ();
INSERT INTO Material VALUES (200, 'Kugel',5); 
UPDATE Material
		SET MatAnzahl=10
		WHERE MatName = 'Kugel';
DELETE FROM Material
		WHERE MatName='Kugel';
		
--INSERT INTO benoetigt VALUES ();
INSERT INTO Sportanlage VALUES (20, 'Weitsprung1'); 
INSERT INTO Material VALUES (300, 'Kugel',5);
INSERT INTO benoetigt VALUES (20, 300,30); 
UPDATE benoetigt
		SET Anzahl=10
		WHERE MatID = 300;
DELETE FROM benoetigt
		WHERE AnlagenID=20;
DELETE FROM Sportanlage
		WHERE AnlagenName='Weitsprung1';
DELETE FROM Material
		WHERE MatName='Kugel';

--INSERT INTO findetStatt VALUES ();
INSERT INTO Sportanlage VALUES (20, 'Weitsprung1'); 
INSERT INTO Wettkampf VALUES (300, 'Weitsprung','7/8','w', '12:15'); 
INSERT INTO findetStatt VALUES (20, 300,30); 
UPDATE findetStatt
		SET Dauer=40
		WHERE Dauer = 30;
DELETE FROM findetStatt
		WHERE AnlagenID=20;
DELETE FROM Sportanlage
		WHERE AnlagenName='Weitsprung1';
DELETE FROM Wettkampf
		WHERE WettName='Weitsprung';
		
--INSERT INTO nimmtTeil VALUES (); 
INSERT INTO Klasse VALUES ('8-2');
INSERT INTO Schueler VALUES (200, 'Bauer','Ulli','w','2002-12-3', '8-2'); 
INSERT INTO Wettkampf VALUES (300, 'Weitsprung','7/8','w', '12:15'); 
INSERT INTO nimmtTeil VALUES (200, 300,2,350,'Teilnehmer'); 
UPDATE nimmtTeil
		SET Ergebnis=360
		WHERE SchID = 200;
DELETE FROM nimmtTeil
		WHERE SchID=200;
DELETE FROM Schueler
		WHERE SchName='Bauer';
DELETE FROM Klasse 
		WHERE KlName = '8-2';
DELETE FROM Wettkampf
		WHERE WettName='Weitsprung';

 
