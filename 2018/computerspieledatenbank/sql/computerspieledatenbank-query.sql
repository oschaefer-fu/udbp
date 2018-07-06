------------------------------------------------------------------------------
--1. Aufgabe: Wann wurde welcher Publisher gegründet?

-- einfache Projektion aus einer Tabelle
SELECT GJahr, PName
FROM   Publisher;

------------------------------------------------------------------------------
--2. Aufgabe: Wann wurde '505Games' gegründet?

-- Projektion aus einer Tabelle die durch eine Bedingung eingeschränkt wurde.
SELECT GJahr
FROM   Publisher
WHERE  PName = '505Games';

------------------------------------------------------------------------------
--3. Aufgabe: Welche Spiele kannst du mit Freunden spielen?

-- Alle Spiele die Multiplayer haben
SELECT SName
FROM Computerspiel
WHERE MP = true;

------------------------------------------------------------------------------
--4. Aufgabe: Ausgabe einer Liste von Spielen mit Erscheinungsjahr, Publisher
--und FSK.

-- einfache Projektion und Natural Join
SELECT SName, PName, FSK
FROM Computerspiel NATURAL JOIN Publisher;

------------------------------------------------------------------------------
--5. Aufgabe: Welche Spiele dürfen erst ab dem 18. Lebensjahr/ 21. Lebensjahr
--gespielt werden?

-- einfache Abfrage, wobei der abgefragte Wert zwei Möglichkeiten hat
SELECT SName
FROM Computerspiel
WHERE FSK IN (18, 21);

------------------------------------------------------------------------------
--6. Aufgabe: Welche Spieler spielen momentan kein Spiel?

-- Wir nehmen alle Benutzer
SELECT   BName
FROM     Benutzer

-- ohne
EXCEPT

-- die Benutzer die ein Spiel besitzen
SELECT   BName
FROM     Benutzer NATURAL JOIN Besitz;

------------------------------------------------------------------------------
--7. Aufgabe: Welches Spiel ist noch keinen Eigenschaften zugeordnet?

-- Wir suchen alle Spiele
SELECT SName
FROM   Computerspiel
GROUP BY SName

-- die keine
EXCEPT

-- Eigenschaft besitzen.
SELECT SName
FROM   Computerspiel NATURAL JOIN Eigenschaften
GROUP BY SName;

------------------------------------------------------------------------------
--8. Aufgabe: Auf wie vielen Plattformen laufen die Spiele jeweils?

-- Hier werden einfach die Einträge in Kompatibilitaet gezählt
SELECT   SName,COUNT(*) AS Anzahl
FROM     Computerspiel NATURAL JOIN Kompatibilitaet
GROUP BY SName;	

------------------------------------------------------------------------------
--9. Aufgabe: Welche durchschnittliche Bewertung haben die Spiele?	

-- Die Computerspiele werden mit den Kommentaren verknüpft, und es wird jeweils
-- der Name ausgegeben mit dem Durchschnitt der Kommentarnoten zu einem Spiel.
SELECT 	 SName, AVG(KNote)
FROM	 Computerspiel NATURAL JOIN Kommentar
GROUP BY SName;

------------------------------------------------------------------------------
--10. Aufgabe: Welche durchschnittliche Bewertung haben die Publisher?
--Also der Durchschnitt über ihre Spiele.

-- Ähnliches Vorgehen wie bei 10. Hier wird aber noch die Verbindung zum
-- Publisher mit aufgebaut.
SELECT   PName, AVG(KNote)
FROM     Publisher NATURAL JOIN Computerspiel NATURAl JOIN Kommentar
GROUP BY PName;		

------------------------------------------------------------------------------
--11. Aufgabe: Welche Spieler besitzen das Spiel 'Fair Cry 5'?

-- Natural Join über die drei Tabellen, um an die Besitzer zu einem Spiel zu kommen
-- und dann die entsprechende Auswahl
SELECT BName
FROM   Computerspiel NATURAL JOIN Besitz NATURAL JOIN Benutzer
WHERE  Computerspiel.SName = 'Fair Cry V';

------------------------------------------------------------------------------
--12. Aufgabe: Welche Spiele werden momentan gespielt?

-- Durch das Natural join werden nur Computerspiele genommen, die aktuell
-- auch im Besitz sind (und somit auch gespielt werden)
SELECT SName
FROM   Computerspiel NATURAL JOIN Besitz
GROUP BY SName;

------------------------------------------------------------------------------
--13. Aufgabe: Welche(s) Computerpiel(e) wurde(n) in dem Jahr veröffentlicht, indem auch
--ein von Nintendo veröffentlichte Spiel raus kam?

-- Alle Spiele, die in einem Jahr veröffentlicht wurden, wo auch Nintendo ein 
-- Spiel veröffentlicht hat
SELECT SName
FROM   Computerspiel NATURAL JOIN Publisher
WHERE  EJahr IN (SELECT EJahr
							FROM Computerspiel NATURAL JOIN Publisher
							WHERE PName = 'Nintendo')

-- ohne die
EXCEPT

-- Spiele, die von Nintendo sind.
SELECT SNAME
FROM   Computerspiel NATURAL JOIN Publisher
WHERE  PName = 'Nintendo';

------------------------------------------------------------------------------
--14. Aufgabe: Wie alt sind die männlichen Nutzer?

-- Hier kommt die Age-Funktion von SQL zum tragen, die das gewünschte liefert
-- Age (datum1, datum2) gibt die Differenz zwischen datum1 und datum2 aus 
-- also datum1 - datum2
SELECT BName, AGE (Current_Date, GebDatum)
FROM Benutzer
WHERE Geschlecht = 'm';

------------------------------------------------------------------------------
--15. Aufgabe: Welche Spieler (BName und E-Mailadresse) besitzen 'Fair Cry V‘,
--aber nicht ‘Dad in Vinland‘? 

-- Alle Benutzer, die 'Fair Cry V' besitzen
SELECT BName, EMail
FROM Computerspiel NATURAL JOIN Benutzer NATURAL JOIN Besitz
WHERE SName = 'Fair Cry V'

-- ohne
EXCEPT

-- die Benutzer die 'Dad in Vinland' besitzen.
SELECT BName, EMail
FROM Computerspiel NATURAL JOIN Benutzer NATURAL JOIN Besitz
WHERE SName = 'Dad in Vinland';

------------------------------------------------------------------------------
--16. Aufgabe: Mit wem ist 'under-aged-freek' alles befreundet?

--Auswahl aller Spieler die in der Befreundet-Relation hinten stehen und 
--mit 'under-aged-freak' befreundet sind
SELECT B2.BName
FROM   Benutzer AS B1, Befreundet, Benutzer AS B2
WHERE  BID1 = B1.BID AND BID2 = B2.BID AND B1.BName = 'under-aged-freek'

-- Vereinigung (nötig, um redundante Daten in der befreundet-Realtion zu vermeiden)
UNION

--Auswahl aller Spieler die in der Befreundet-Relation vorne stehen und 
--mit 'under-aged-freak' befreundet sind
SELECT B1.BName
FROM   Benutzer AS B1, Befreundet, Benutzer AS B2
WHERE  BID1 = B1.BID AND BID2 = B2.BID AND B2.BName = 'under-aged-freek';

------------------------------------------------------------------------------
--17. Aufgabe: Welches Computerspiel hat die Eigenschaften 'Echtzeit' und 'Beat them Ups'

-- Alle Spiele mit der Eigenschaft 'Echtzeit'
SELECT SName
FROM Computerspiel NATURAL JOIN Eigenschaften NATURAL JOIN Schlagwort
WHERE WName = 'Echtzeit'

-- Die Schnittmenge wird gebildet
INTERSECT

-- Alle Spiele mit der Eigenschaft 'Beat them Ups'
SELECT SName
FROM Computerspiel NATURAL JOIN Eigenschaften NATURAL JOIN Schlagwort
WHERE WName = 'Beat them Ups';

------------------------------------------------------------------------------
--18. Aufgabe: Welches sind die Top-3 Spiele?

-- Alle momentan im Besitz befindlichen Spiele werden genommen, diese werden gezählt
-- in absteigender Reihenfolge angeordnet und nur die besten 3 werden angezeigt.
SELECT 		SNAME, COUNT(*)
FROM		Computerspiel NATURAL JOIN Besitz
GROUP BY	SName
ORDER BY	COUNT(*) DESC
LIMIT		3;

------------------------------------------------------------------------------
--19. Aufgabe: Welche(r) Spieler darf das Spiel aus dem Jahr 2018 nicht spielen?

-- Hier kommt das Datum mit ins Spiel. Mit current_date bekommt man das aktuelle
-- Datum. Age liefert die Differenz zwischen zwei Daten. Und uns interessiert 
-- davon mit Extract nur die Jahreszahl. Dies wird mit der FSK des Spiels
-- aus dem Jahr 2018 verglichen.
SELECT BName
FROM   Benutzer
WHERE  EXTRACT (Year from AGE(current_date, gebdatum)) < (SELECT fsk
														  FROM   Computerspiel
														  WHERE  EJahr = 2018);

------------------------------------------------------------------------------
--20. Aufgabe: Welcher Spieler ist mit Spielern über 18 befreundet?

-- Kombination aus Aufgabe 13 (age,date,...) und Aufgabe 5 wegen der 
-- Vermeidung der Redundanz in der befreundet-Raltaion
SELECT B2.BName
FROM   Benutzer AS B1, Befreundet, Benutzer AS B2
WHERE  BID1 = B1.BID AND BID2 = B2.BID AND EXTRACT (Year from AGE(current_date,B1.GebDatum) ) > 17

UNION

SELECT B1.BName
FROM   Benutzer AS B1, Befreundet, Benutzer AS B2
WHERE  BID1 = B1.BID AND BID2 = B2.BID AND EXTRACT (Year from AGE(current_date,B2.GebDatum) ) > 17;

------------------------------------------------------------------------------
--21. Aufgabe: Welcher Spieler gibt im Durchschnitt die schlechtesten Bewertungen?

-- Angabe aller Benutzer und ihrer durchschnittlichen Kommentarnote,
-- sortiert nach schlechtester Note und dort nur den ersten Eintrag
SELECT   BName, AVG(KNote)
FROM     Benutzer NATURAl JOIN Kommentar
GROUP BY BName					  
ORDER BY	AVG(KNote) DESC
LIMIT		1;

------------------------------------------------------------------------------
--22. Aufgabe: Welche Spiele lassen sich sowohl auf der Xbox, auf dem PC und auf
--der PS spielen?

-- Alle Spiele, die auf der 'XBox' laufen
SELECT SName
FROM   Computerspiel NATURAL JOIN Kompatibilitaet NATURAL JOIN Plattform
WHERE  PlaName = 'XBox'

-- geschnitten mit 
INTERSECT


-- allen Spielen die auf dem 'PC' laufen
SELECT SName
FROM Computerspiel NATURAL JOIN Kompatibilitaet NATURAL JOIN Plattform
WHERE PlaName = 'PC'

-- geschnitten mit
INTERSECT

-- allen Spielen die auf der 'PS' laufen.
SELECT SName
FROM Computerspiel NATURAL JOIN Kompatibilitaet NATURAL JOIN Plattform
WHERE PlaName = 'PS';

------------------------------------------------------------------------------
--23. Aufgabe: Welches Spiel(e) wurde(n) am häufigsten verkauft?

-- Wie bei Aufgabe 7., aber hier wird nur das erste Spiel angezeigt
SELECT 		SNAME
FROM		Computerspiel NATURAL JOIN Besitz
GROUP BY	SName
HAVING		COUNT(*) = (SELECT 	COUNT(*)
				   FROM   	Computerspiel NATURAL JOIN Besitz
				   GROUP BY	SName
				   ORDER BY	COUNT(*) DESC
				   LIMIT	1);

--alternativ

-- Um Probleme zu vermeiden, wenn es mehrere Titel gibt, die am häufigten gekauft
-- wurden, wird hier einfach das Maximum der verkauften Exemplare eines Spiel genommen,
-- in einer Unteranfrage ausgewertet und mit der eigentliche Abfrage verglichen.
SELECT 		SNAME
FROM		Computerspiel NATURAL JOIN Besitz
GROUP BY	SName
HAVING		COUNT(*) = ( SELECT  MAX(tab.menge)
						 FROM	 (SELECT 	SNAME,COUNT(*) AS menge
								  FROM		Computerspiel NATURAL JOIN Besitz
								  GROUP BY	SName) AS tab );
