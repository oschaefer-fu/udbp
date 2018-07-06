--SQL Anfragen mit Kommentaren Projekt Datenbank Sportfest
--Anfrage1...alle Schüler, die den Schwimmnachweis erbracht haben.
select SName from Schueler where Schwimmnachweis = True;
--Anfrage2...alle Wettkämpfe aus dem Bereich Koordination.
select WName from Wettkaempfe where Kategorie = 'Koordination';
--Anfrage3...alle Schüler, die Jahrgang 2000 sind ?
select SName from Schueler where Geburtsdatum between '2000-01-01' and '2000-12-31';
--Anfrage4...alle Wettkämpfe, die auf dem Sportplatz statfinden.
select WName from Wettkaempfe natural join Wettkampfstaetten where WKStName = 'Sportplatz';
--Anfrage5...alle Schüler, die am 800m-Lauf teilnehmen
select SName, Klasse from Schueler natural join Wettkaempfe where WName = '800m Lauf';
--Anfrage6...wann findet der Wettkampf „Kugelstoßen“ statt ?
select SFZeit from Stattfinden natural join Wettkaempfe where WName = 'Kugelstoßen';
--Anfrage7...welche Schüler des 10. Jahrgangs unterstützen um 09:00 Uhr die Aufsicht ?
select SName from Schueler natural join Aufsichtsunterstuetzung where Klasse = '10' AND UAZeit = '09:00';
--Anfrage8...welcher Lehrer beaufsichtigt den Wettkampf „Kugelstoßen“ ?
select PNr, LName from Lehrer natural join Wettkaempfe natural join Wettkampfstaetten natural join stattfinden where WName = 'Kugelstoßen';
--Anfrage9...welche Materialien werden von der Wettkampfstätte „Schwimmhalle“ benötigt ?
select MName from Material natural join Bedarf natural join Wettkampfstaetten natural join stattfinden where WKStName = 'Schwimmhalle';

