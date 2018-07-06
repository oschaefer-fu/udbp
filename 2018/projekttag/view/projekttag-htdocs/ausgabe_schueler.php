<!-- Autoren:	Iris Münzner, Frank Möbius
	 Datum:		04.06.2018
	 Zweck:		html/PHP Skript zur Erstellung einer Sicht in PHP
				Lösung zur Aufgabe 2
################################################################### -->

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>
Ausgabe der Schüler eines Projektes
</title>
</head>
<link rel = "stylesheet" type = "text/css" href= "style.css" />

<body>
	<?php
		/*-- Aufbau einer Datenbankverbindung 
		 * 	 Die notwendigen Funktionen "verbinden()" und "schliessen()" stehen in der Datei verbindung.inc.php. */
		$pid = $_POST['pid'];
		include "verbindung.inc.php";		
		$con = verbinden();
		
		/* 	 Aufbau der Abfrage mit dem Ergebnis der dynamischen Abfrage aus dem Eingabefeld */
		$result = $con->prepare("SELECT sid, svname, sname FROM schueler 
								WHERE pid = ". $pid . ";");
		$result -> execute();
		$con = beenden();
		
		/* 	 Tabellarische Ausgabe */
		echo "<h1>Ausgabe der Schüler im Projekt $pid</h1>";
		
		echo "<table>
				<tr>
					<th>Schüler-ID</th>
					<th>Vorname</th>
					<th>Nachname</th>
			    </tr>
			";
	
		/*-- Durchlaufen des Ergebnisarrays zur tabellarischen Ausgabe */
		foreach($result as $row) {
			echo "
				<tr>
				<td>	" . $row['sid'] . "</td>
				<td> 	" . $row['svname'] . "</td>
				<td> 	" . $row['sname'] . "</td>
				</tr>
			";
		}
		echo "</table>";
		
		
	?>
	
</body>

</body>
</html>
