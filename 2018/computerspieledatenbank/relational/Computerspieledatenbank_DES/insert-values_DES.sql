--  Miniwelt Computerspieledatenbank
--  erstellt von M. Kark, J. Schult, S. Moke, K. Güttler
--  Erstellen einer Population in SQL

INSERT INTO Publisher VALUES (1, 'Sega', 1960);
INSERT INTO Publisher VALUES (2, 'Deep Silver', 2002);
INSERT INTO Publisher VALUES (3, 'Nintendo', 1989);
INSERT INTO Publisher VALUES (4, '505Games', 2006);

INSERT INTO Plattform VALUES (1, 'XBox');
INSERT INTO Plattform VALUES (2, 'PC');
INSERT INTO Plattform VALUES (3, 'PS');
INSERT INTO Plattform VALUES (4, 'Web');

INSERT INTO Computerspiel VALUES (1, 'Pony Bridge', 12, 2016, 1, 2);
INSERT INTO Computerspiel VALUES (2, 'Dad in Vinland', 18, 2017, 0, 4);
INSERT INTO Computerspiel VALUES (3, 'Fair Cry V', 18, 2018, 1, 4);
INSERT INTO Computerspiel VALUES (4, 'Call of Beauty', 16, 2017, 1, 3);
INSERT INTO Computerspiel VALUES (5, 'School Rocks', 0, 1990, 1, 3);
INSERT INTO Computerspiel VALUES (6, 'Final Year', 0, 1985, 0, 1);
INSERT INTO Computerspiel VALUES (7, 'Holiday Land', 0, 1999, 0, 3);
INSERT INTO Computerspiel VALUES (8, 'Purple Survival', 6, 1984, 0, 1);
INSERT INTO Computerspiel VALUES (9, 'Codename Curie', 21, 2034, 1, 3);
INSERT INTO Computerspiel VALUES (10, 'Scream Buble', 16, 2015, 1, 3);


INSERT INTO Benutzer VALUES (1, 'babychief', 'w', 'babychief@gmx.de');--, '23.04.2010' );
INSERT INTO Benutzer VALUES (2, 'under-aged-freek', 'm', 'underagedfreak@yahoo.de');--, '17.06.2012');
INSERT INTO Benutzer VALUES (3, 'GOD of Peace', 'm', 'god_of_peace@gmail.com');--, '20.01.1984');
INSERT INTO Benutzer VALUES (4, 'Thunder', 'm', 'thunder@googlemail.com');--, '16.05.1990');
INSERT INTO Benutzer VALUES (5, 'The Art of Crime', 'w', 'the_art_of_crime@gmx.ru');--, '21.11.1977');
INSERT INTO Benutzer VALUES (6, 'Spitney Brears', 'w', 'spitney_brears@web.de');--, '14.03.2005');
INSERT INTO Benutzer VALUES (7, 'Destroya', 'w', 'destroya@ralf-sieg.net');--, '27.10.1997');
INSERT INTO Benutzer VALUES (8, 'König von Berlin', 'm', 'koenig_von@berlin.de');--, '16.08.1997');
INSERT INTO Benutzer VALUES (9, 'Leg3ndAry', 'm', 'leg3ndary@gmx.de');--, '17.12.1975');
INSERT INTO Benutzer VALUES (10, 'Morpheus xXx', 'm', 'morpheus_xxx@yahoo.de');--, '20.08.1970');
INSERT INTO Benutzer VALUES (11, 'Spamlord', 'w', 'spamlord@gmail.co.uk');--, '28.02.1986');


INSERT INTO Kommentar VALUES (1, 'Geiler Scheiß', 2, 7, 8);
INSERT INTO Kommentar VALUES (2, 'Krasses Game', 1, 5, 8);
INSERT INTO Kommentar VALUES (3, 'For Checkers only', 3, 4, 10);
INSERT INTO Kommentar VALUES (4, 'Total bgefahren', 2, 2, 9);
INSERT INTO Kommentar VALUES (5, 'Hatefullll', 6, 10, 7);
INSERT INTO Kommentar VALUES (6, '12 points to ...', 1, 3, 3);
INSERT INTO Kommentar VALUES (7, 'ziemlich lame', 4, 7, 5);
INSERT INTO Kommentar VALUES (8, 'MEEEEEGGGGGAAAAAAAA', 1, 7, 9);
INSERT INTO Kommentar VALUES (9, 'so durchschnittlich', 3, 4, 11);
INSERT INTO Kommentar VALUES (10, 'so durchschnittlich', 3, 5, 11);
INSERT INTO Kommentar VALUES (11, 'so durchschnittlich', 3, 7, 11);
INSERT INTO Kommentar VALUES (12, 'so durchschnittlich', 3, 9, 11);
INSERT INTO Kommentar VALUES (13, 'so durchschnittlich', 3, 10, 11);


INSERT INTO Schlagwort VALUES (1,'Mittelalter'); 
INSERT INTO Schlagwort VALUES (2,'Science Fiction');
INSERT INTO Schlagwort VALUES (3,'Role Play');
INSERT INTO Schlagwort VALUES (4,'Survival - Horror');
INSERT INTO Schlagwort VALUES (5,'MMO');
INSERT INTO Schlagwort VALUES (6,'Taktik-Shooter');
INSERT INTO Schlagwort VALUES (7,'Shooter');
INSERT INTO Schlagwort VALUES (8,'Action Adventure');
INSERT INTO Schlagwort VALUES (9,'Beat them Ups');
INSERT INTO Schlagwort VALUES (10,'Jump ´n´ Run');
INSERT INTO Schlagwort VALUES (11,'Echtzeit');

INSERT INTO Befreundet VALUES (1,2);
INSERT INTO Befreundet VALUES (2,4);
INSERT INTO Befreundet VALUES (3,4);
INSERT INTO Befreundet VALUES (7,6);
INSERT INTO Befreundet VALUES (8,9);
INSERT INTO Befreundet VALUES (10,3);

INSERT INTO Besitz VALUES (10,1);
INSERT INTO Besitz VALUES (3,2);
INSERT INTO Besitz VALUES (5,2);
INSERT INTO Besitz VALUES (3,3);
INSERT INTO Besitz VALUES (5,3);
INSERT INTO Besitz VALUES (7,3);
INSERT INTO Besitz VALUES (10,4);
INSERT INTO Besitz VALUES (3,4);
INSERT INTO Besitz VALUES (5,4);
INSERT INTO Besitz VALUES (7,4);
INSERT INTO Besitz VALUES (5,6);
INSERT INTO Besitz VALUES (3,11);
INSERT INTO Besitz VALUES (2,3);


INSERT INTO Kompatibilitaet VALUES (1,1,33.99);
INSERT INTO Kompatibilitaet VALUES (2,1,29.99);
INSERT INTO Kompatibilitaet VALUES (2,3,39.99);
INSERT INTO Kompatibilitaet VALUES (3,1,32.99);
INSERT INTO Kompatibilitaet VALUES (3,3,39.99);
INSERT INTO Kompatibilitaet VALUES (3,7,44.99);
INSERT INTO Kompatibilitaet VALUES (4,3,39.99);
INSERT INTO Kompatibilitaet VALUES (4,7,44.99);
INSERT INTO Kompatibilitaet VALUES (4,10,14.99);

INSERT INTO Eigenschaften VALUES (1,7);
INSERT INTO Eigenschaften VALUES (2,6);
INSERT INTO Eigenschaften VALUES (5,5);
INSERT INTO Eigenschaften VALUES (7,10);
INSERT INTO Eigenschaften VALUES (9,4);
INSERT INTO Eigenschaften VALUES (11,4);
INSERT INTO Eigenschaften VALUES (9,9);
INSERT INTO Eigenschaften VALUES (11,7);










