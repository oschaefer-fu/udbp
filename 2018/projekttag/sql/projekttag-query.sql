-- Autoren: Ricarda Galler, Fabian Weber
-- Datum: 	04.06.2018
-- Zweck:	Anfragen zum Projekttag-Datenbank-Projekt


-- ############  Einfache Anfragen auf einer Tabelle ############

-- 1
-- Frage: Welche Datensätze enthält die Tabelle Lehrkraft?
-- Sprachmittel: SELECT, FROM
	SELECT 		*
	FROM		Lehrkraft;

-- 2
-- Wie lauten die Namen und Vornamen aller Schüler/innen?
-- Sprachmittel: Auswahl einzelner Spalten/Attribute
	SELECT		sName, sVname
	FROM		Schueler;

-- 3
-- Frage: Wie viele Plätze hat der Computerraum?
-- Sprachmittel: WHERE-Bedinung
	SELECT		rPlaetze
	FROM		Raum
	WHERE		rName = 'Computerraum';

-- 4
-- Frage:Wie alt ist Norina Schulz?
-- Sprachmittel: WHERE-Bedingung mit AND-Verknüpfung
	SELECT		sAlter
	FROM		Schueler
	WHERE		sName = 'Schulz' AND sVname = 'Norina';

-- 5
-- Frage: Welche Schüler/innen (Name, Vorname) sind 15 oder 16 Jahre alt?
-- Sprachmittel: WHERE-Bedingung mit OR-Verknüpfung
	SELECT		sName, sVname
	FROM		Schueler
	WHERE		sAlter = 15 OR sAlter = 16;

-- 6
-- Frage: Welche Räume der Schule wurden für die Projekttage genutzt (sie enthalten den Namensbestandteil raum)?
-- Sprachmittel: WHERE-Bedingung mit LIKE-Operator	
	SELECT		rName
	FROM		Raum
	WHERE		rName LIKE '%raum%';	
	
	

-- ############  Anfragen über mehrere Tabellen (JOIN) ############

-- 7
-- Frage:Welche Lehrer/innen (Anrede, Nachname) betreuten ein Projekt?
-- Sprachmittel: NATURAL JOIN, Alias
	SELECT		L.lAnrede, L.lName
	FROM		Lehrkraft L NATURAL JOIN Aufsicht;

-- 8
-- Frage:Welche Schüler (Name, Vorname) haben am Projekt 'Ernährungspolitik' teilgenommen?
-- Sprachmittel: NATURAL JOIN mit WHERE-Bedingung
	SELECT 		S.sName, S.sVname
	FROM 		Schueler AS S NATURAL JOIN Projekt AS P
    WHERE		P.pName = 'Ernährungspolitik';

-- 9
-- Frage:Welche Räume (rID, Name) besitzen ein Smartboard?
-- Sprachmittel: NATURAL JOIN über drei Tabellen
	SELECT		R.rID, R.rName
	FROM		Raum R NATURAL JOIN Ausstattung A 
				NATURAL JOIN Raumausstattung
	WHERE		A.aArt = 'Smartboard';

-- 10
-- Frage: Welche Schüler/innen haben Geschwister an derselben Schule (gleicher Nachname)?
-- Sprachmittel: Cartesisches Produkt, Negation
	SELECT		S1.sName, S1.sVname
	FROM		Schueler S1, Schueler S2
	WHERE		S1.sName = S2.sName AND NOT S1.sVname = S2.sVname;

-- 11
-- Frage: In welchen Räumen hielt sich Mundo Kim während des Projekttages auf?
-- Sprachmittel: NATURAL JOIN über drei Tabellen mit WHERE-Bedingung und AND-Verknüpfung
	SELECT		R.rName
	FROM		Schueler S NATURAL JOIN Raumbelegung
				NATURAL JOIN Raum R
	WHERE		S.sVname = 'Mundo' AND S.sName = 'Kim';
	
	
	
-- ##############   Anfragen mit Durchschnitt und Differenz  ###########
-- 12
-- Frage: Welche Lehrer/innen (Anrede, Nachname) betreuten kein Projekt?
-- Sprachmittel: EXCEPT
	SELECT		lAnrede, lName
	FROM		Lehrkraft
	EXCEPT
	SELECT		L.lAnrede, L.lName
	FROM		Lehrkraft AS L NATURAL JOIN Aufsicht;

-- 13
-- Frage:Welche Räume besitzen sowohl eine Kreidetafel als auch ein Waschbecken?
-- Sprachmittel: INTERSECT
	SELECT 		R.rID, R.rName
	FROM		Raum R NATURAL JOIN Raumausstattung RA
				NATURAL JOIN Ausstattung A
	WHERE		A.aArt = 'Kreidetafel'
	INTERSECT
	SELECT		R.rID, R.rName
	FROM		Raum R NATURAL JOIN Raumausstattung RA
				NATURAL JOIN Ausstattung A
	WHERE		A.aArt = 'Waschbecken';


-- ############   Anfragen mit Aggregatfunktionen  #####################
-- 14
-- Frage: Wie viele Schüler/innen haben am Projekt 1 teilgenommen ?
-- Sprachmittel: COUNT
	SELECT 		COUNT(sID)
	FROM 		Schueler
	WHERE		pID = 1;
	
	
-- 15
-- Frage: Wie viele Schueler haben die einzelnen Klassen der Schule
-- Sprachmittel: COUNT, GROUP BY
	SELECT		kName, COUNT(sID)
	FROM		Schueler NATURAL JOIN Klasse
	GROUP BY	kName;

	
-- 16
-- Frage: Wie groß waren die höchsten durch ein Projekt veraursachten Kosten?
-- Sprachmittel: MAX
	SELECT		MAX(pKosten)
	FROM		Projekt;

-- 17
-- Frage: Wie wurden die Projekte im Durchschnitt benotet?
-- Sprachmittel: AVG
	SELECT		pName, AVG(sNote)
	FROM		Projekt NATURAL JOIN Schueler
	GROUP BY	pName;

-- 18
-- Frage: Welche Projekte wurden im Durchschnitt besser als 2 benotet?
-- Sprachmittel: AVG, HAVING
	SELECT		pName, AVG(sNote)
	FROM		Projekt NATURAL JOIN Schueler
	GROUP BY	pName
	HAVING		AVG(sNote) < 2;


-- ##################### Anfragen mit Quantoren ############################

-- 19
-- Frage: In welchen Projekten wurde die Note 0 (=o. B.) vergeben?
-- Sprachmittel: EXISTS
	SELECT		pName
	FROM		Projekt P
	WHERE		EXISTS
				(SELECT pName 
				 FROM	Projekt NATURAL JOIN Schueler
				 WHERE	pName = P.pName AND sNote = 0);



-- 20
-- Frage: Welches Projekt wurde im Durchschnitt schlechter bewertet als alle anderen?
-- Sprachmittel: ALL
	SELECT		pName, AVG(sNote)
	FROM		Projekt NATURAL JOIN Schueler
	GROUP BY	pName
	HAVING		AVG(sNote) >= ALL 
				(SELECT		AVG(sNote)
				 FROM		Projekt NATURAL JOIN Schueler
				 GROUP BY	pName);



