/log Autovermietung-prot2.txt
% Versionsdatum:	23.6.2015
% Autor: 			von D. Fröhlich, M. Möbius, R. Schönfeld
% Thema: 			Miniwelt Autovermietung


% Aufgabe 01 - Aufgaben sind zum kennenlernen der unterschiedlichen SQL Funktionen
% Gib die Daten der Tabelle Auto aus.	
project ANr,AModell,ASitzplaetze,KName,SNr (Auto);


% Aufgabe 02
% Gib alle Auto mit Kennzeichen an, die 2 Sitzplätze haben.	
project ANr,AModell (select ASitzplaetze = 2 (Auto));


% Aufgabe 03
% Gib alle Auto mit Kennzeichen an, die mehr als 4 Sitzplätze haben.	
project ANr,AModell (select ASitzplaetze > 4 (Auto));


% Aufgabe 04
% Gib alle Auto mit Kennzeichen an, die zwischen 2 und 4 Sitzplätze 
% haben.	
project ANr,AModell (select ASitzplaetze <= 4 and ASitzplaetze >= 2 (Auto));


% Aufgabe 05
% Gib alle Autos mit Kennzeichen an, die 2 Sitzplätze haben und in 
% Station Nr. 1 stehen.	
project ANr,AModell (select ASitzplaetze = 2 and SNr = '1' (Auto));


% Aufgabe 06
% Gib alle Auto mit Kennzeichen an, die Mittelklasse oder 
% obMittelklasse sind und in Station Nr. 1 stehen.	
project ANr,AModell (select (KName = 'Mittelklasse'  or KName = 'obMittelklasse') and SNr = '1' (Auto));


% Aufgabe 07
% Gib die Kategorie an bei der der Tagespreis zwischen 30,00€ und 100,00€ liegt.
project KName, KTagespreis (select KTagespreis <= 100.00 and KTagespreis >= 30.00  (Kategorie));


% Aufgabe 08
% Welche Automodelle werden zu einem Tagespreis zwischen 30,00€ und 100,00€ angeboten?
project Auto.AModell, Kategorie.KTagespreis (select Kategorie.KTagespreis >= 30.00 and Kategorie.KTagespreis <= 100.00 (Auto njoin Kategorie));


% Aufgabe 09
% In welchen Kennzeichen kommt der Buchstabe F vor?	
% SELECT ANr from Auto where ANr like '%F%'
% es handelt sich nicht um Realationenalgebra, ist daher nicht umsetzbar


% Aufgabe 10
% Welche Autos haben eine Berliner Kennzeichen?	
% es handelt sich nicht um Realationenalgebra, ist daher nicht umsetzbar


% Aufgabe 11
% Gib alle VW's mit Kennzeichen aus.
% es handelt sich nicht um Realationenalgebra, ist daher nicht umsetzbar


% Aufgabe 12
% Gib alle Auto mit Kennzeichen an, sortiert nach den Stationen aus.	
% GROUP BY, ORDER BY ist keine Realationenalgebra, daher nur teilweise umsetzbar
project ANr, AModell, SNr (Auto); 


% Aufgabe 13
% Gib alle Auto mit Kennzeichen an, die in der Station Nr. 1 stehen 
% aufsteigend sortiert nach Sitzplatznummer aus.	
% ORDER BY ASC ist keine Realationenalgebra, daher nur teilweise umsetzbar
project ANr, AModell (select SNr = '1' (Auto));


% Aufgabe 14
% Wie viele Autos gibt es mit 2 Sitzplätzen?	
% bei COUNT handelt es sich nicht um Realationenalgebra, ist daher nicht umsetzbar


% Aufgabe 15
% Wie viele Sitzplätze gibt es in Station 3?	
% bei SUM handelt es sich nicht um Realationenalgebra, ist daher nicht umsetzbar


% Aufgabe 16
% Gib den durchschnittlichen Tagespreis über alle Kategorien an.	
% bei AVG handelt es sich nicht um Realationenalgebra, ist daher nicht umsetzbar


% Aufgabe 17
% Gib den Standort (Adresse) aller Mercedes C-KLasse an.	
project AModell, SPLZ, SOrt, SStr (select AModell = 'Mercedes C-Klasse' (Auto njoin Station));


% Aufgabe 18
% Gib das Zubehör aufsteigend sortiert nach Pauschalpreis an. Jeder
% Name soll nur einmal auftreten.	
% DISTINCT, ORDER BY ist keine Realationenalgebra, daher nur teilweise umsetzbar
project ZName, ZPauschale (Zubehoer);


% Aufgabe 19
% Zu welcher Kategorie gehört der Opel Astra?	
project KName (select AModell = 'Opel Astra' (Auto));


% Aufgabe 20
% Welches Winterzubehör ist in Köln verfügbar?
project ZName (select (ZName = 'Winterreifen' AND SNr = '3') OR (ZName ='Schneeketten' AND SNr = '3') (Zubehoer));


% Aufgabe 21
% Wie viele Kleinwagen gibt es in Berlin?
% bei COUNT handelt es sich nicht um Realationenalgebra, ist daher nur teilweise umsetzbar
project ANr, KName, SOrt (select SOrt = 'Berlin' and KName='Kleinwagen' (Auto njoin Station));


% Aufgabe 22
% Wie viele Mietverträge für Oberklasse gibt es in Berlin?
% bei COUNT handelt es sich nicht um Realationenalgebra, ist daher nur teilweise umsetzbar
project MNr, KName, SOrt (select SOrt='Berlin' and KName='Oberklasse' (Vertrag njoin Station));


% Aufgabe 23
% Anzahl der Verträge pro Kunde, absteigend sortiert.
% bei COUNT, GROUP BY, ORDER BY handelt es sich nicht um Realationenalgebra, ist daher nicht umsetzbar


% Aufgabe 24
% Gib den Namen des Kunden der die meisten Verträge abgeschlossen hat?
% bei COUNT, GROUP BY, ORDER BY handelt es sich nicht um Realationenalgebra, ist daher nicht umsetzbar


% Aufgabe 25
% Gesamtmietzeit der Kunden absteigend sortiert?
% bei SUM, GROUP BY, ORDER BY handelt es sich nicht um Realationenalgebra, ist daher nicht umsetzbar


% Aufgabe 26
% Welcher Kunde mit Vor- und Nachname  hat die meisten Tage gebucht?
% bei SUM, GROUP BY, ORDER BY handelt es sich nicht um Realationenalgebra, ist daher nicht umsetzbar


% Aufgabe 27 - ab hier sind die Aufgaben auf eher Relationenalgebra zugeschnitten
% Ort und PLZ aller Stationen und Mieter (union all in psql = doppelte werden nicht entfernt)
(project SPLZ, SOrt (Station)) union (project MPLZ, MOrt (Mieter));


% Aufgabe 28
% Orte aller Mieter die nicht in einem Ort mit Station wohnen
(project MOrt (Mieter)) difference (project SOrt (Station));


% Aufgabe 29
% Vertragsnummer, Kategoriename und Ort aller Mieter die nicht in einem Ort mit Station wohnen
project VNr, KName, MOrt
(
	(project MOrt (Mieter)) difference (project SOrt (Station))
	njoin
	Vertrag
	njoin 
	Mieter
);


% Aufgabe 30
% Alle Mieternamen mit den von ihnen gebuchten Zubehör.
project MName, MVorname, ZName (Mieter njoin Vertrag njoin gebucht njoin Zubehoer);


% Aufgabe 31
% Alle Mieternamen und ihre Stationsnummer der Mieter, die in einem Ort mit Station wohnen 
(rename Stat (SNr, SPLZ, MOrt, SStr) (Station)) njoin Mieter;


% Aufgabe 32
% Vertragsnummern und Namen aller Mieter, die einen Vertrag abgeschlossen haben
project VNr, MName, MName (Vertrag njoin Mieter);


% Aufgabe 33
% Alle Mieternamen die Kindersitze gebucht hatten. 
MietKind (MVorname, MName, ZName) :=
	project MVorname, MName, ZName (Vertrag njoin gebucht njoin Zubehoer njoin Mieter);
MietKind division
	(project ZName (select ZName = 'Kindersitz' (MietKind)));


% Aufgabe 34
% Für welche Vertragsnummern sind mindestens zweimal Zubehör gebucht worden?
VerZub1 (VNr1, ZNr1) := 
	project VNr, ZNr (gebucht);
VerZub2 (VNr2, ZNr2) := VerZub1;
project VNr1 (select ZNr1 <> ZNr2 and VNr1 = VNr2 (VerZub1 product VerZub2)); 


/nolog
