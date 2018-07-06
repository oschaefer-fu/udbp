<!-- Autor: J. Schult -->
<!-- Datum: 11.06.2018 -->
<!-- Zweck: Ausgabedatei für die Suchabfrage an ein Computerspiel 
            der Computerspieledatenbank. -->


<form action="index.php" method="post" />

<!-- Festlegung der Spaltenbreite für die Kopfzeile der Tabelle -->
<style>
      th         { border: 1px solid; width: 160px; }
</style>


<h1> Die gewünschten Informationen: </h1>

  <?php
  
	// Verbindung zur lokalen Datenbank wird aufgebaut:
    $con = new PDO ('pgsql:host=localhost;dbname=lewein','lewein');
    
    // eine weitere Variable wird ins Leben gerufen, die bestimmt, welche Inforamtionen aus der
    // Datenbank abgefragt werden, sname wird immer abgefragt
    $weiteres = "sname";
    
    // wenn das Kontrollkästchen im Index gesetzt ist, wird die "Suchvariable" durch die 
    // entsprechenden Suchbegriffe erweitert
    if ($_POST["publisher"]) {
	  $weiteres .= ",pname";
	}
    if ($_POST["erjahr"]) {
	  $weiteres .= ",ejahr";
    } 
    if ($_POST["multi"]) {
	  $weiteres .= ",mp";
    } 
    if ($_POST["frseko"]) {
	  $weiteres .= ",fsk";
    } 
    
    // die Anfrage wird vorbereitet, dabei wird die Suchvariable als String direkt mit 
    // in die Suchabfrage integriert
    $sname = $con -> prepare ("SELECT " . $weiteres . "
                               FROM   computerspiel,publisher
                               WHERE  computerspiel.pid = publisher.pid
									  AND sname = :titel ;");
   
   // die Suchanfrage wird ausgeführt und das Ergebnis dann in die Variable 'sname' geschrieben
    $sname->execute(
      array (':titel' => $_POST['titel']) //,':eintrag' => $weiteres), 2 Variable im Array funktioniert nicht
    );
    
    // Erstellen einer Tabelle zum Anzeigen der Ergebnisse
    echo "<table border ='1'>";
    // Erstellen einer Kopfzeile mit entsprechender Beschriftung
    echo "<thead>";
    // Erster Eintrag, nämlich der Spielename, der immer erscheint
		echo "<th>". "Name des Spiels" . "</th>";
	// Hinzufügen von den variablen Spalten 
		// Publishername
		if ($_POST["publisher"]) {
			echo "<th>". "Publishername" . "</th>";
		}
		//Erscheinungsjahr
		if ($_POST["erjahr"]) {
			echo "<th>". "Erscheinungsjahr" . "</th>";
		}
		// Multiplayer
		if ($_POST["multi"]) {
			echo "<th>". "Multiplayer" . "</th>";
		}
		if ($_POST["frseko"]) {
			echo "<th>". "FSK" . "</th>";
		}
	// Abschließen der ersten Zeile
	echo "</thead>";
	// Erstellen der nächsten Zeile mit den gelieferten Einträgen:
	echo "<tr>";	
	// Durchgehen aller Einträge	
		foreach ($sname as $row) {
			echo "<tr>";
			// Der Name wird immer geschrieben
			echo "<td align=center>". $row['sname'] . "</td>";
			// Die weiteren Informationen werden optional geschrieben
			if ($_POST["publisher"]) {
				echo "<td align=center>". $row['pname'] . "</td>";
			}
			if ($_POST["erjahr"]) {
				echo "<td align=center>". $row['ejahr'] . "</td>";
			}
			if ($_POST["multi"]) {
				// Da der Nutzer mit 0 und 1 nicht so viel anfangen kann
				// wird hier noch einmal die Ausgabe etwas "verbessert"
				if ($row['mp'] == 0) {
					echo "<td align=center>". "nein" . "</td>";
				} else {
					echo "<td align=center>". "ja" . "</td>";
				}
			}
			if ($_POST["frseko"]) {
				echo "<td align=center>". $row['fsk'] . "</td>";
			}
		}
	// Abschließen der Zeile
	echo "</tr>";	
    
    // Beendigung der Tabelle
    echo "</table>";
    // Noch mal einen kleinen Abstand zum zurück-Knopf
    echo "</br>";
    
    // Schließen der Verbindung zur Datenbank
    $con = null;
  
  ?>  

<input type="submit" name="sent" value="Zurück" />
