<!-- Autoren:	Iris Münzner, Frank Möbius
	 Datum:		04.06.2018
	 Zweck:		html/PHP Skript zur Erstellung einer Sicht in PHP
				Lösung zur Aufgabe 3
################################################################### -->

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>
Ausgabe alles Schüler einer Klasse mit ihren gewählten Projekten
</title>
</head>
<link rel = "stylesheet" type = "text/css" href= "style.css" />

<body>
	<?php
		/*-- Aufbau einer Datenbankverbindung 
		 * 	 Die notwendigen Funktionen "verbinden()" und "schliessen()" stehen in der Datei verbindung.inc.php. */
		$klasse = $_POST['klasse'];
		include "verbindung.inc.php";
		$con = verbinden();
		
		/*-- Aubau der dynamischen Abfrage mit dem Ergebnis aus dem Drop-Down-Menü*/
		$result = $con->prepare("SELECT sname, svname, pname
								FROM Schueler NATURAL JOIN Klasse NATURAL JOIN Projekt
								WHERE kname = '" . $klasse . "';");
		$result -> execute();
		$con = beenden();
		
		echo "<h1>Ausgabe aller Schüler der Klasse $klasse und ihrer Projekte</h1>";
		
		/* 	Tabellarische Ausgabe*/
		echo "<table>
				<tr>
					<th>Vorname</th>
					<th>Nachname</th>
					<th>Projekt</th>
			    </tr>
			";
	
		/*-- Durchlaufen des Ergebnisarrays zur tabellarischen Ausgabe */
		foreach($result as $row) {
			echo "
				<tr>
				<td>	" . $row['svname'] . "</td>
				<td> 	" . $row['sname'] . "</td>
				<td> 	" . $row['pname'] . "</td>
				</tr>
			";
		}
		echo "</table>";
	?>
	
</body>

</body>
</html>
