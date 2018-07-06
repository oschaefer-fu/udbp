INSERT INTO fach VALUES (1, 'Mathematik',8);
INSERT INTO fach VALUES (2, 'Mathematik',7);
INSERT INTO fach VALUES (3,'Deutsch',8);
INSERT INTO fach VALUES (4,'Deutsch',7);
INSERT INTO fach VALUES (5,'Englisch',7);
INSERT INTO fach VALUES (6,'NaWi',8);

INSERT INTO schueler VALUES (1,'Joschua','Ahrend','Staaken','JAhrend@web.de',7,true);
INSERT INTO schueler VALUES (2,'Franziska','Aust','Staaken','faust@istdoch.net',8,true);
INSERT INTO schueler VALUES (3,'Michael','Berend','Hakenfelde','michi@Berend.com',7,true);
INSERT INTO schueler VALUES (4,'Stefan','Bussmann','Kladow','SBussi@hotmail.com',8,true);
INSERT INTO schueler VALUES (5,'Jana','Dussel','Kladow','JD@haha.com',9,true);
INSERT INTO schueler VALUES (6,'Andreas','Depp','Altstadt','ADepp@here.com',9,true);
INSERT INTO schueler VALUES (7,'Jan','Ebert','Altstadt','jan@ebert.de',8,true);
INSERT INTO schueler VALUES (8,'Hans','Grell','Hakenfelde','H.Grell@hotmail.com',9,true);
INSERT INTO schueler VALUES (9,'Bianca','Frei','Gatow','frei.Bia@weg.de',8,true);

INSERT INTO istTutor VALUES (2,1);
INSERT INTO istTutor VALUES (5,3);
INSERT INTO istTutor VALUES (5,4);
INSERT INTO istTutor VALUES (6,5);
INSERT INTO istTutor VALUES (8,2);
INSERT INTO istTutor VALUES (8,6);

INSERT INTO ort VALUES (1,'Bibliothek');
INSERT INTO ort VALUES (2,'Sprechzimmer 1');
INSERT INTO ort VALUES (3,'Sprechzimmer 2');
INSERT INTO ort VALUES (4,'Raum 201b');
INSERT INTO ort VALUES (5,'Raum 202b');
INSERT INTO ort VALUES (6,'Raum 301a');

INSERT INTO verfuegbar VALUES (2,3);
INSERT INTO verfuegbar VALUES (2,7);
INSERT INTO verfuegbar VALUES (5,0);
INSERT INTO verfuegbar VALUES (5,1);
INSERT INTO verfuegbar VALUES (5,3);
INSERT INTO verfuegbar VALUES (5,4);
INSERT INTO verfuegbar VALUES (6,2);
INSERT INTO verfuegbar VALUES (6,4);
INSERT INTO verfuegbar VALUES (6,6);
INSERT INTO verfuegbar VALUES (8,8);
INSERT INTO verfuegbar VALUES (8,9);

INSERT INTO slot VALUES (0,2014,45,'Mon',8);
INSERT INTO slot VALUES (1,2014,45,'Mit',9);
INSERT INTO slot VALUES (2,2014,46,'Don',9);
INSERT INTO slot VALUES (3,2014,47,'Mon',7);
INSERT INTO slot VALUES (4,2015,2,'Die',7);
INSERT INTO slot VALUES (5,2015,4,'Mon',0);
INSERT INTO slot VALUES (6,2015,4,'Mon',8);
INSERT INTO slot VALUES (7,2015,6,'Don',0);
INSERT INTO slot VALUES (8,2015,7,'Mit',9);
INSERT INTO slot VALUES (9,2015,10,'Mon',7);
INSERT INTO slot VALUES (10,2015,12,'Die',9);

-- typ(typName,
INSERT INTO typ VALUES ('Einzel',10.00);
INSERT INTO typ VALUES ('Gruppe',5.00);
INSERT INTO typ VALUES ('Frei',0.00);

-- stunde (Nr.,sNr,slotNr,tNr,fNr,rNr,typName,Bewertung,status) 
INSERT INTO stunde VALUES (0,3,3,2,1,4,'Einzel',2,true);
INSERT INTO stunde VALUES (1,3,7,2,1,4,'Einzel',2,true);
INSERT INTO stunde VALUES (2,4,0,5,3,3,'Gruppe',1,true);
INSERT INTO stunde VALUES (3,1,8,8,2,4,'Einzel',3,true);
INSERT INTO stunde VALUES (4,8,6,6,5,1,'Gruppe',4,true);


