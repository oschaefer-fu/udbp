<!-- Autoren:	Iris Münzner, Frank Möbius
	 Datum:		04.06.2018
	 Zweck:		html/PHP Skript zur Erstellung einer Sicht in PHP
				Startseite zur Lösung der Aufgabe 1
################################################################### -->
	 
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>
Projektanfrage
</title>
</head>

<link rel = "stylesheet" type = "text/css" href= "style.css" />

<body>
	<h1> Alle Projekte am Projekttag </h1>
	
	<!-- Erzeugung eines Buttons zum Aufruf der Ergebnisseite -->
	<form action = "ausgabe_projekte.php" method = "post" />
	<button type="submit" name="sendProjekt" value="0">Projekte</button>
	

</body>
</html>
