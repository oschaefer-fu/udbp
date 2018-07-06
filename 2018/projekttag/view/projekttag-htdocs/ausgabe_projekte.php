<!-- Autoren:	Iris Münzner, Frank Möbius
	 Datum:		04.06.2018
	 Zweck:		html/PHP Skript zur Erstellung einer Sicht in PHP
				Lösung zur Aufgabe 1
################################################################### -->

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>
Ausgabe der Projekte
</title>
</head>
<link rel = "stylesheet" type = "text/css" href= "style.css" />

<body>
	<h1>Ausgabe der Projekte</h1>
	<?php
		/*-- Aufbau einer Datenbankverbindung 
		 * 	 Die notwendigen Funktionen "verbinden()" und "schliessen()" stehen in der Datei verbindung.inc.php. */

		include "verbindung.inc.php";
		$con = verbinden();
		
		/* 	 Aufbau der statischen Abfrage */
		$result = $con->prepare("SELECT pID, pName FROM projekt;");
		$result -> execute();
		$con = beenden();
		
		/*-- tabellarische Ausgabe in HTML */
		echo "<table>
				<tr>
					<th>Projektnummer</th>
					<th>Projektname</th>
			    </tr>
			";
	
		/*-- Durchlaufen des Ergebnisarrays zur tabellarischen Ausgabe */
		foreach($result as $row) {
			echo "
				<tr>
				<td>	" . $row['pid'] . "</td>
				<td> 	" . $row['pname'] . "</td>
				</tr>
			";
		}
		echo "</table>";
	?>
	
</body>

</body>
</html>
