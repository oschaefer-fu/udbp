<!-- Autoren:	Iris Münzner, Frank Möbius
	 Datum:		04.06.2018
	 Zweck:		html/PHP Skript zur Erstellung einer Sicht in PHP
				Startseite zur Lösung der Aufgabe 2
################################################################### -->

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>
Ausgabe Schüler
</title>
</head>

<link rel = "stylesheet" type = "text/css" href= "style.css" />

<body>
	<h1> Alle Schüler eines Projektes </h1>
	
	<!-- Erzeugung eines Eingabefelds mit Absende-Button -->
	<form action = "ausgabe_schueler.php" method = "post" />
	<input type ="text" name ="pid">
	<input type="submit" name="sendID" value="Weiter"/>

</body>
</html>
