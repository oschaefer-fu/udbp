//SQL Anfragen mit Kommentaren Projekt Datenbank Sportfest
//Anfrage6...wann findet der Wettkampf „Kugelstoßen“ statt ?
select SFZeit from Stattfinden natural join Wettkaempfe where WName = 'Kugelstoßen';

