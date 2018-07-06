\o schulgarten-query.ans
\qecho ----------------------------------------------------------------------------------
\qecho SELECT * FROM * (WHERE *) Anfragen
\qecho ----------------------------------------------------------------------------------
\qecho

\qecho 1) Welche Gemüsearten sind in der Datenbank?
\qecho 
SELECT * FROM gemuese;

\qecho 2) Wie heißen die Arbeitsschritte, die im Garten verrichtet werden müssen?
\qecho 

SELECT taetigkeit FROM arbeitsschritte;

\qecho 3) Wie heißen die Händler, die in Berlin ansässig sind?
\qecho 

SELECT hname FROM haendler WHERE ort='Berlin';

\qecho 4) Wie heißen die Gemüsearten, die zur Familie der Blattgemüse gehören?
\qecho 

SELECT gname FROM gemuese WHERE familie='Blattgemuese';

\qecho 5) Welche sind die Gemüsesorten, die nicht zur Familie der Blattgemüse gehören
\qecho 
SELECT gname FROM gemuese WHERE NOT familie='Blattgemuese';

\qecho 6) Geben Sie die Beete nach ihrer Größe sortiert an.
\qecho 
SELECT * FROM beet ORDER BY groesse;

\qecho 7) Geben Sie alle Beete an, deren Groesse zwischen 2 und 3 m^2 liegen.
\qecho 
SELECT * FROM beet WHERE groesse BETWEEN 2.0 AND 3.0;

\qecho 8) Geben Sie die Gemüsesorten (Name und Anbaubeginn) sortiert nach frühestem Anbaubeginn an.
\qecho 
SELECT sname, fruehesteranbau FROM sorten ORDER BY fruehesteranbau;

\qecho ----------------------------------------------------------------------------------
\qecho Anfragen mit Aggregatsfunktionen
\qecho ----------------------------------------------------------------------------------
\qecho

\qecho 9) Geben Sie die gesamte Anbaufläche des Gartens an.
\qecho
SELECT SUM(groesse) FROM beet;

\qecho 10-12) Geben Sie an, wie lang die durchschnittliche Anbaudauer der Sorten ist und geben Sie die maximale und minimale Anbaudauer an.
\qecho 
SELECT AVG (anbaudauer) FROM sorten;
SELECT MAX (anbaudauer) FROM sorten;
SELECT MIN (anbaudauer) FROM sorten;

\qecho ----------------------------------------------------------------------------------
\qecho Anfragen mit JOIN
\qecho ----------------------------------------------------------------------------------
\qecho

\qecho 13) Geben Sie die Namen der Gemüsesorten mit ihren zugehörigen Gemüsearten und deren Familie an.
\qecho 
SELECT s.sname, g.gname, g.familie FROM sorten s NATURAL JOIN gemuese g;

\qecho 14) Geben Sie die Namen und den tatsächlichen Anbaubeginn der angebauten Pflanzen an.
\qecho 
SELECT sname, tatsaechlicheranbau FROM angebautes NATURAL JOIN sorten;

\qecho 15) Welche Abpackungen von Tigerella gibt es?
\qecho 
SELECT packungsmenge, packungseinheit FROM vertrieb NATURAL JOIN sorten WHERE sname = 'Tigerella';

\qecho 16) Geben Sie die Namen der Gemüsesorten an, die auf Beet 2 wachsen.
\qecho 
SELECT sname FROM angebautes NATURAL JOIN sorten WHERE bnr = 2;

\qecho 17) Welche Haendler vertreiben die Gemüsesorte Hokaido.
\qecho 
SELECT h.hname FROM sorten s NATURAL JOIN vertrieb v NATURAL JOIN haendler h WHERE s.sname = 'Hokaido';

\qecho 18) Geben Sie eine Liste der auf den Beeten wachsenden Gemüsesorten (bnr, sname) an - sortiert nach Beetnummer.
\qecho 
SELECT b.bnr, s.sname FROM beet b NATURAL JOIN angebautes a NATURAL JOIN sorten s ORDER BY b.bnr;

\qecho 19) Geben Sie an, von welchen Händlern die tatsächlich angebauten Sorten bezogen werden können.
\qecho 
SELECT DISTINCT hname FROM haendler, vertrieb, angebautes WHERE haendler.hnr = vertrieb.hnr AND vertrieb.snr = angebautes.snr;

\qecho 20) Geben Sie eine Liste mit den Gemuesesorten (Name und Familie) und den zugehörigen Händlern an
\qecho 
SELECT v.hnr, v.snr, s.sname, g.gname, h.hname FROM vertrieb v NATURAL JOIN haendler h NATURAL JOIN sorten s NATURAL JOIN gemuese g;



\qecho ----------------------------------------------------------------------------------
\qecho Spezielle Anfragen an die Schulgarten-Datenbank
\qecho ----------------------------------------------------------------------------------
\qecho

\qecho 21) Darf auf Beet Nr. 7 Spinat angebaut werden?
\qecho Anmerkung: Wenn die Zahl aus der Ausgabe kleiner als 4 ist, darf das Gemüse angebaut werden
\qecho 
SELECT gname, schneckenfaktor * schneckenbeliebtheit FROM beet b, gemuese g WHERE b.bnr = 7 AND g.gname = 'Spinat';

\qecho 22) Welche Beete (bnr) und Gemüsesorten (gnr, gname) haben zusammen ein 'Schneckenprodukt' (Schneckenfaktor * Schneckenbeliebtheit), das kleiner gleich 4 ist - geordnet nach dem Schneckenprodukt?
\qecho 
SELECT bnr, gnr, gname, schneckenfaktor*schneckenbeliebtheit FROM gemuese g, beet b WHERE b.schneckenfaktor*g.schneckenbeliebtheit < 4 ORDER BY b.schneckenfaktor*g.schneckenbeliebtheit;

