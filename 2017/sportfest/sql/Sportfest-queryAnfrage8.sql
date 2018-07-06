//SQL Anfragen mit Kommentaren Projekt Datenbank Sportfest
//Anfrage8...welcher Lehrer beaufsichtigt den Wettkampf „Kugelstoßen“ ?
select PNr, LName from Lehrer natural join Wettkaempfe natural join Wettkampfstaetten natural join stattfinden where WName = 'Kugelstoßen';


