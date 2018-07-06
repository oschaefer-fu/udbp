-- INSERT INTO beet (bnr, lage, groesse, schneckenfaktor) VALUES ();

INSERT INTO beet VALUES (0, 1, 1.8, 1); 
INSERT INTO beet VALUES (1, 1, 1.5, 1);
INSERT INTO beet VALUES (2, 1, 2.2, 1);
INSERT INTO beet VALUES (3, 2, 2.2, 2);
INSERT INTO beet VALUES (4, 3, 2.3, 3);
INSERT INTO beet VALUES (5, 3, 2.3, 3);


-- INSERT INTO gemuese (gnr, gname, familie, lage, schneckenbeliebtheit) VALUES ();

INSERT INTO gemuese VALUES (0, 'Mangold', 'Blattgemuese', 2, 1);
INSERT INTO gemuese VALUES (1, 'Karotte', 'Wurzelgemuese', 2, 1);
INSERT INTO gemuese VALUES (2, 'Erbse', 'Huelsenfrucht', 1, 2);
INSERT INTO gemuese VALUES (3, 'Weisskohl', 'Kohlgemuese', 1, 3);
INSERT INTO gemuese VALUES (4, 'Kuerbis', 'Kuerbisgewaechse', 1, 3);
INSERT INTO gemuese VALUES (5, 'Tomaten', 'Nachtschattengewaechse', 1, 1);
INSERT INTO gemuese VALUES (6, 'Spinat', 'Blattgemuese', 3, 1);


	
-- INSERT INTO haendler (hnr, hname, anschrift, plz, ort) VALUES ();

INSERT INTO haendler VALUES (0, 'Miray Kaymaz', 'Flottwelstr. 12', '10785', 'Berlin');
INSERT INTO haendler VALUES (1, 'Sanja Hauser', 'Welsumer Pfad 14', '12355', 'Berlin');
INSERT INTO haendler VALUES (2, 'Quan Ouyang', 'Feldstr. 7', '14979', 'Grossbeeren');
INSERT INTO haendler VALUES (3, 'Sigfried Stehle', 'Hintere Gasse 3', '72351', 'Geislingen');


-- INSERT INTO sorten (snr, sname, eigenschaften, gnr, fruehesteranbau, spaetesteranbau, anbaudauer) VALUES ();

INSERT INTO sorten VALUES (0, 'Bright Yellow', 'Gelbe Stiele', 0, '2000-04-01', '2000-06-20', 210);
INSERT INTO sorten VALUES (1, 'Roter Riese', 'dunkelorange, mit viel Aroma und Suesse', 1, '2000-03-10', '2000-06-30', 75);
INSERT INTO sorten VALUES (2, 'Duwicker', 'kurze Fruehkarotte', 1, '2000-02-20', '2000-07-30', 70);
INSERT INTO sorten VALUES (3, 'Zuckererbse', 'suesser Geschmack', 2, '2000-03-10', '2000-06-30', 90);
INSERT INTO sorten VALUES (4, 'Kleine Rheinlaenderin', 'Hohe, alte Sorte', 2, '2000-06-20', '2000-07-15', 120);
INSERT INTO sorten VALUES (5, 'Butterkohl Goldberg', 'Feiner Geschmack, goldgelbe Blaetter', 3, '2000-03-20', '2000-04-30', 180);
INSERT INTO sorten VALUES (6, 'Hokaido', 'Ein bis zwei Kilo schwere orangefarbene Fruechte', 4, '2000-03-01', '2000-04-15', 195);
INSERT INTO sorten VALUES (7, 'Blue Banana', 'Zigarrenfoermige, 3 Kilo schwere Fruechte', 4, '2000-03-01' , '2000-04-15', 195);
INSERT INTO sorten VALUES (8, 'Bunter Turban', 'Gut lagerfaehig', 4, '2000-03-01', '2000-04-15', 195);
INSERT INTO sorten VALUES (9, 'Tigerella', 'Gestreifte, mittelgrosse Fruechte', 5, '2000-03-01', '2000-04-01', 180);
INSERT INTO sorten VALUES (10, 'Sibirisches Birnchen', 'Birnenfoermige Fruechte, resistente Pflanze', 5, '2000-03-01', '2000-04-01', 180);
INSERT INTO sorten VALUES (11, 'Matador', 'Schnellwuechsig', 6, '2000-02-15', '2000-10-01', 30);
INSERT INTO sorten VALUES (12, 'Latio F', 'Resistent gegen falschen Mehltau', 6, '2000-02-15', '2000-08-15', 45);


-- INSERT INTO arbeitsschritte (anr, taetigkeit) VALUES ();

INSERT INTO arbeitsschritte VALUES (1,'Aussaht');
INSERT INTO arbeitsschritte VALUES (2,'Pikieren');
INSERT INTO arbeitsschritte VALUES (3,'Pflanzen');
INSERT INTO arbeitsschritte VALUES (4,'Duengen');
INSERT INTO arbeitsschritte VALUES (5,'Ernten');


-- INSERT INTO nachbarschaft (bnr1, bnr2) VALUES ();

INSERT INTO nachbarschaft VALUES (0,1);
INSERT INTO nachbarschaft VALUES (1,0);
INSERT INTO nachbarschaft VALUES (2,3);
INSERT INTO nachbarschaft VALUES (2,4);
INSERT INTO nachbarschaft VALUES (3,2);
INSERT INTO nachbarschaft VALUES (3,5);
INSERT INTO nachbarschaft VALUES (4,2);
INSERT INTO nachbarschaft VALUES (4,5);
INSERT INTO nachbarschaft VALUES (5,3);
INSERT INTO nachbarschaft VALUES (5,4);

-- INSERT INTO angebautes (annr, snr, bnr, tatsaechlicheranbau) VALUES ();

INSERT INTO angebautes VALUES (0, 0, 0, '2000-04-15');
INSERT INTO angebautes VALUES (1, 1, 1, '2000-03-20');
INSERT INTO angebautes VALUES (2, 0, 2, '2000-06-15');
INSERT INTO angebautes VALUES (3, 3, 2, '2000-05-10');
INSERT INTO angebautes VALUES (4, 4, 2, '2000-07-01');
INSERT INTO angebautes VALUES (5, 2, 1, '2000-03-20');
INSERT INTO angebautes VALUES (6, 5, 4, '2000-04-20');
INSERT INTO angebautes VALUES (7, 6, 4, '2000-03-15');
INSERT INTO angebautes VALUES (8, 9, 5, '2000-05-01');
INSERT INTO angebautes VALUES (9, 10, 5, '2000-05-01');
INSERT INTO angebautes VALUES (10, 7, 3, '2000-03-20');
INSERT INTO angebautes VALUES (11, 8, 3, '2000-03-20');
INSERT INTO angebautes VALUES (12, 12, 5, '2000-03-01');


-- INSERT INTO vertraeglichkeit (gnr1, gnr2) VALUES ();

INSERT INTO vertraeglichkeit VALUES (0,1);
INSERT INTO vertraeglichkeit VALUES (1,0);
INSERT INTO vertraeglichkeit VALUES (0,3);
INSERT INTO vertraeglichkeit VALUES (3,0);
INSERT INTO vertraeglichkeit VALUES (0,4);
INSERT INTO vertraeglichkeit VALUES (4,0);
INSERT INTO vertraeglichkeit VALUES (0,6);
INSERT INTO vertraeglichkeit VALUES (6,0);

INSERT INTO vertraeglichkeit VALUES (1,2);
INSERT INTO vertraeglichkeit VALUES (2,1);
INSERT INTO vertraeglichkeit VALUES (1,5);
INSERT INTO vertraeglichkeit VALUES (5,1);
INSERT INTO vertraeglichkeit VALUES (1,6);
INSERT INTO vertraeglichkeit VALUES (6,1);

INSERT INTO vertraeglichkeit VALUES (2,3);
INSERT INTO vertraeglichkeit VALUES (3,2);

INSERT INTO vertraeglichkeit VALUES (3,5);
INSERT INTO vertraeglichkeit VALUES (5,3);
INSERT INTO vertraeglichkeit VALUES (3,6);
INSERT INTO vertraeglichkeit VALUES (6,3);

INSERT INTO vertraeglichkeit VALUES (4,6);
INSERT INTO vertraeglichkeit VALUES (6,4);

INSERT INTO vertraeglichkeit VALUES (5,6);
INSERT INTO vertraeglichkeit VALUES (6,5);


-- INSERT INTO vertrieb (hnr, snr, preis, packungseinheit, packungsmenge) VALUES ();

INSERT INTO vertrieb VALUES (0, 1, 2.80, 'm', 10);
INSERT INTO vertrieb VALUES (0, 3, 4.10, 'm', 10);
INSERT INTO vertrieb VALUES (0, 5, 2.20, 'Anzahl', 30);
INSERT INTO vertrieb VALUES (0, 6, 2.50, 'Anzahl', 50);

INSERT INTO vertrieb VALUES (1, 1, 3.09, 'm', 10);
INSERT INTO vertrieb VALUES (1, 4, 3.89, 'm', 10);
INSERT INTO vertrieb VALUES (1, 5, 3.19, 'm', 10);
INSERT INTO vertrieb VALUES (1, 10, 1.90, 'Anzahl', 40);
INSERT INTO vertrieb VALUES (1, 11, 2.00, 'Anzahl', 30);

INSERT INTO vertrieb VALUES (2, 1, 2.89, 'm', 10);
INSERT INTO vertrieb VALUES (2, 3, 4.29, 'm', 10);
INSERT INTO vertrieb VALUES (2, 4, 3.79, 'm', 10);
INSERT INTO vertrieb VALUES (2, 5, 2.49, 'm', 10);
INSERT INTO vertrieb VALUES (2, 7, 2.30, 'm2', 3);
INSERT INTO vertrieb VALUES (2, 8, 4.50, 'm2', 3);

INSERT INTO vertrieb VALUES (3, 2, 4.50, 'm', 8);
INSERT INTO vertrieb VALUES (3, 4, 2.20, 'm', 3);
INSERT INTO vertrieb VALUES (3, 5, 3.29, 'Anzahl', 50);
INSERT INTO vertrieb VALUES (3, 11, 1.90, 'Anzahl', 30);
INSERT INTO vertrieb VALUES (3, 10, 3.79, 'm2', 5);
INSERT INTO vertrieb VALUES (3, 9, 1.89, 'm2', 2);


-- INSERT INTO erfordern (snr, anr, zeitbis) VALUES ();

INSERT INTO erfordern VALUES (0,1,0);
INSERT INTO erfordern VALUES (0,5,90);

INSERT INTO erfordern VALUES (1,1,0);
INSERT INTO erfordern VALUES (1,5,75);

INSERT INTO erfordern VALUES (2,1,0);
INSERT INTO erfordern VALUES (2,5,70);

INSERT INTO erfordern VALUES (3,1,0);
INSERT INTO erfordern VALUES (3,5,55);
INSERT INTO erfordern VALUES (3,5,90);

INSERT INTO erfordern VALUES (4,1,0);
INSERT INTO erfordern VALUES (4,5,120);

INSERT INTO erfordern VALUES (5,1,0);
INSERT INTO erfordern VALUES (5,5,180);

INSERT INTO erfordern VALUES (6,1,0);
INSERT INTO erfordern VALUES (6,3,60);
INSERT INTO erfordern VALUES (6,4,30);
INSERT INTO erfordern VALUES (6,4,60);
INSERT INTO erfordern VALUES (6,4,90);
INSERT INTO erfordern VALUES (6,4,120);
INSERT INTO erfordern VALUES (6,4,150);
INSERT INTO erfordern VALUES (6,5,150);

INSERT INTO erfordern VALUES (7,1,0);
INSERT INTO erfordern VALUES (7,3,60);
INSERT INTO erfordern VALUES (7,4,30);
INSERT INTO erfordern VALUES (7,4,60);
INSERT INTO erfordern VALUES (7,4,90);
INSERT INTO erfordern VALUES (7,4,120);
INSERT INTO erfordern VALUES (7,4,150);
INSERT INTO erfordern VALUES (7,5,150);

INSERT INTO erfordern VALUES (8,1,0);
INSERT INTO erfordern VALUES (8,3,60);
INSERT INTO erfordern VALUES (8,4,30);
INSERT INTO erfordern VALUES (8,4,60);
INSERT INTO erfordern VALUES (8,4,90);
INSERT INTO erfordern VALUES (8,4,120);
INSERT INTO erfordern VALUES (8,4,150);
INSERT INTO erfordern VALUES (8,5,170);

INSERT INTO erfordern VALUES (9,1,0);
INSERT INTO erfordern VALUES (9,3,50);
INSERT INTO erfordern VALUES (9,4,50);
INSERT INTO erfordern VALUES (9,4,110);
INSERT INTO erfordern VALUES (9,5,100);

INSERT INTO erfordern VALUES (10,1,0);
INSERT INTO erfordern VALUES (10,3,50);
INSERT INTO erfordern VALUES (10,4,50);
INSERT INTO erfordern VALUES (10,4,110);
INSERT INTO erfordern VALUES (10,5,80);

INSERT INTO erfordern VALUES (11,1,0);
INSERT INTO erfordern VALUES (11,5,30);

INSERT INTO erfordern VALUES (12,1,0);
INSERT INTO erfordern VALUES (12,5,45);
