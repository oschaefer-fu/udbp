<!-- Autoren:	Iris Münzner, Frank Möbius
	 Datum:		04.06.2018
	 Zweck:		html/PHP Skript zur Erstellung einer Sicht in PHP
				Startseite zur Lösung der Aufgabe 3
################################################################### -->

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>
Ausgabe Schüler einer Klasse und ihrer gewählten Projekte 
</title>
</head>

<link rel = "stylesheet" type = "text/css" href= "style.css" />

<body>
	<h1> Alle Schüler einer Klasse und ihre gewählten Projekte </h1>
	<form action = "ausgabe_klasse.php" method = "post" />
	
	<?php
		/*-- Aufbau einer Datenbankverbindung 
		 * 	 Die notwendigen Funktionen "verbinden()" und "schliessen()" stehen in der Datei verbindung.inc.php. */
		include "verbindung.inc.php";
		$con = verbinden();
		/* 	 Erzeugung der Abfrage für den Drop-Down-Listeninhalt*/
		$result = $con->prepare("SELECT kname FROM klasse;");
		$result -> execute();
		$con = beenden();
		
		/* 	 Aufbau des Drop-Down-Menüs*/
		echo "<select name = 'klasse' />";
		foreach ($result as $row) {
			echo "<option>". $row['kname'] . "</option>";
			echo "<br/>;";
		}
		echo "</select>";
	?>
	
	<!--Absende-Button -->
	<input type="submit" name="sendID" value="Weiter"/>

</body>
</html>
