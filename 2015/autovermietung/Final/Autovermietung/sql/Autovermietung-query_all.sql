\o Autovermietung-prot.txt
-- Versionsdatum:	23.6.2015
-- Autor: 			von D. Fröhlich, M. Möbius, R. Schönfeld
-- Thema: 			Miniwelt Autovermietung

-- Aufgabe 01 - Aufgaben sind zum kennenlernen der unterschiedlichen SQL Funktionen
-- Gib die Daten der Tabelle Auto aus.	
SELECT * 
FROM Auto;


-- Aufgabe 02
-- Gib alle Autos mit Kennzeichen an, die 2 Sitzplätze haben.	
SELECT ANr,Amodell 
FROM Auto 
WHERE ASitzplaetze = 2;


-- Aufgabe 03
-- Gib alle Autos mit Kennzeichen an, die mehr als 4 Sitzplätze haben.	
SELECT ANr,AModell
FROM Auto 
WHERE ASitzplaetze > 4;


-- Aufgabe 04
-- Gib alle Autos mit Kennzeichen an, die zwischen 2 und 4 Sitzplätze 
-- haben.	
SELECT ANr,AModell 
FROM Auto 
WHERE ASitzplaetze >= 2 AND ASitzplaetze <= 4;


-- Aufgabe 05
-- Gib alle Autos mit Kennzeichen an, die 2 Sitzplätze haben und in 
-- Station Nr. 1 stehen.	
SELECT ANr,AModell 
FROM Auto 
WHERE ASitzplaetze = 2 AND SNr = '1';


-- Aufgabe 06
-- Gib alle Auto mit Kennzeichen an, die Mittelklasse oder 
-- obMittelklasse sind und in Station Nr. 1 stehen.	
SELECT ANr,AModell 
FROM Auto 
WHERE (KName = 'Mittelklasse'  OR KName = 'obMittelklasse') AND Snr = '1';


-- Aufgabe 07
-- Gib die Kategorie an bei der der Tagespreis zwischen 30,00€ und 100,00€ liegt.
SELECT KName, KTagespreis  
FROM Kategorie 
WHERE KTagespreis between 30 AND 100;


-- Aufgabe 08
-- Welche Automodelle werden zu einem Tagespreis zwischen 30,00€ und 100,00€ angeboten?
SELECT DISTINCT Auto.AModell, Kategorie.KTagespreis  
FROM Auto, Kategorie 
WHERE (Kategorie.KTagespreis between 30 and 100) AND (Auto.KName = Kategorie.KName);


-- Aufgabe 09
-- In welchen Kennzeichen kommt der Buchstabe F vor?	
SELECT ANr 
FROM Auto 
WHERE ANr LIKE '%F%';


-- Aufgabe 10
-- Welche Autos haben eine Berliner Kennzeichen?	
SELECT ANr, AModell 
FROM Auto 
WHERE ANr LIKE 'B-%';


-- Aufgabe 11
-- Gib alle VW's  mit Kennzeichen aus.	
SELECT ANr, AModell 
FROM Auto 
WHERE AModell LIKE 'VW%';


-- Aufgabe 12
-- Gib alle Autos mit Kennzeichen an, sortiert nach den Stationen aus.	
SELECT ANr, Amodell, Snr 
FROM Auto 
GROUP BY SNr, ANr, Amodell 
ORDER BY SNr;


-- Aufgabe 13
-- Gib alle Autos mit Kennzeichen an, die in der Station Nr. 1 stehen 
-- aufsteigend sortiert nach Sitzplatznummer aus.	
SELECT ANr, AModell 
FROM Auto 
WHERE Snr = '1' 
ORDER BY ASitzplaetze ASC;


-- Aufgabe 14
-- Wie viele Autos gibt es mit 2 Sitzplätzen?	
SELECT count (*) 
FROM Auto 
WHERE ASitzplaetze = 2;


-- Aufgabe 15
-- Wie viele Sitzplätze gibt es in Station 3?	
SELECT sum (ASitzplaetze) 
FROM Auto 
WHERE Snr = '3';


-- Aufgabe 16
-- Gib den durchschnittlichen Tagespreis über alle Kategorien an.	
SELECT avg (KTagespreis) 
FROM Kategorie;


-- Aufgabe 17
-- Gib den Standort (Adresse) aller Mercedes C-Klassen an.	
SELECT DISTINCT AModell, SPLZ, SOrt, SStr 
FROM Auto NATURAL JOIN Station 
WHERE AModell='Mercedes C-Klasse';


-- Aufgabe 18
-- Gib das Zubehör aufsteigend sortiert nach Pauschalpreis an. Jeder
-- Name soll nur einmal auftreten.	
SELECT DISTINCT ZName, ZPauschale 
FROM Zubehoer 
ORDER BY ZPauschale;


-- Aufgabe 19
-- Zu welcher Kategorie gehört der Opel Astra?	
SELECT DISTINCT KName 
FROM Auto 
WHERE AModell = 'Opel Astra';


-- Aufgabe 20
-- Welches Winterzubehör ist in Köln verfügbar?
SELECT Zname 
FROM Zubehoer 
WHERE ZName = 'Winterreifen' AND SNr = '3' OR ZName ='Schneeketten' AND SNr = '3';


-- Aufgabe 21
-- Wie viele Kleinwagen gibt es in Berlin?
-- Dieselbe Anfrage mit Köln läuft wegen des Umlautes übrigens ins Leere
SELECT COUNT (*) 
FROM Auto NATURAL JOIN Station
WHERE SOrt = 'Berlin' AND KName='Kleinwagen';


-- Aufgabe 22
-- Wie viele Mietverträge für Oberklasse gibt es in Berlin?
SELECT COUNT (*) 
FROM Station NATURAL JOIN Vertrag
WHERE SOrt = 'Berlin' AND KName='Oberklasse';


-- Aufgabe 23
-- Anzahl der Verträge pro Kunde, absteigend sortiert.
SELECT count (*) AS Vertraege, MNr 
FROM Vertrag
GROUP BY MNr 
ORDER BY Vertraege DESC;


-- Aufgabe 24
-- Gib den Namen des Kunden der die meisten Verträge abgeschlossen hat?
SELECT count (*) AS Vertraege, Mieter.MVorname, Mieter.MName 
FROM Vertrag, Mieter 
WHERE Vertrag.MNr = Mieter.MNr 
GROUP BY Mieter.MVorname, Mieter.MName 
ORDER BY Vertraege DESC LIMIT 1;


-- Aufgabe 25
-- Gesamtmietzeit der Kunden absteigend sortiert?
SELECT SUM (VDauer) AS Miettage, MNr 
FROM Vertrag 
GROUP BY MNr 
ORDER BY Miettage DESC;


-- Aufgabe 26
-- Welcher Kunde mit Vor- und Nachname  hat die meisten Tage gebucht?
SELECT SUM (VDauer) AS Miettage, Mieter.MVorname, Mieter.MName 
FROM Vertrag, Mieter 
WHERE Vertrag.MNr = Mieter.MNr 
GROUP BY Mieter.MNr, Mieter.MVorname, Mieter.MName 
ORDER BY Miettage DESC LIMIT 1;


-- Aufgabe 27 - ab hier sind die Aufgaben eher auf Relationenalgebrazugeschnitten
-- Ort und PLZ aller Stationen und Mieter (UNION ALL in psql = doppelte werden nicht entfernt)
SELECT  SPLZ, SOrt
FROM    station
UNION
SELECT  MPLZ, MOrt
FROM    Mieter;


-- Aufgabe 28
-- Orte aller Mieter die nicht in einem Ort mit Station wohnen
SELECT  MOrt
FROM    Mieter
EXCEPT
SELECT  SOrt
FROM    Station;
-- oder SELECT DISTINCT MOrt FROM Mieter NATURAL JOIN Station WHERE MOrt != SORT;


-- Aufgabe 29
-- Vertragsnummer, Kategoriename und Ort aller Mieter die nicht in einem Ort mit Station wohnen
SELECT VNr, KName, MOrt
FROM VERTRAG NATURAL JOIN Mieter
WHERE MOrt NOT IN (
		SELECT SOrt
		FROM Station);


-- Aufgabe 30
-- Alle Mieternamen mit den von ihnen gebuchten Zubehör.
SELECT DISTINCT MName, MVorname, ZName
FROM  Mieter NATURAL JOIN Vertrag NATURAL JOIN gebucht NATURAL JOIN Zubehoer;


-- Aufgabe 31
-- Alle Mieternamen und ihre Stationsnummer der Mieter, die in einem Ort mit Station wohnen 
SELECT *
FROM  Mieter NATURAL JOIN Station
WHERE MOrt = SOrt;


-- Aufgabe 32
-- Vertragsnummern und Namen aller Mieter, die einen Vertrag abgeschlossen haben
SELECT VNr, MName, MName
FROM  Mieter NATURAL JOIN Vertrag;


-- Aufgabe 33
-- Alle Mieternamen die Kindersitze gebucht hatten. 
SELECT distinct MVorname, MName
FROM  Mieter NATURAL JOIN Vertrag NATURAL JOIN gebucht NATURAL JOIN Zubehoer
WHERE ZName = 'Kindersitz';


-- Aufgabe 34
-- Für welche Vertragsnummern sind mindestens zweimal Zubehör gebucht worden?
SELECT VNr, COUNT(VNr)
FROM gebucht
GROUP BY VNr
HAVING COUNT(VNr)>=2;


-- Aufgabe 35 - spezielle Datums SQL Anfrage
-- Welche Kategorien sind am 2015-05-10 an der Station Nr. 3 noch frei?
SELECT KName
FROM Auto
WHERE SNr = '3'
EXCEPT ALL
SELECT KName
FROM Vertrag
WHERE SNr = '3' AND VBeginn <= '2015-05-10' AND VBeginn + VDauer >= '2015-05-10';
\o
