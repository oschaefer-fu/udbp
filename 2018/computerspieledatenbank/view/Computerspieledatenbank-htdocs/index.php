<!-- Autor: M. Kark, J. Schult -->
<!-- Datum: 11.06.2018 -->
<!-- Zweck: Formuar zur Abfrage von Informationen zu einen Computerspiel -->

<!-- Festlegung der Übergabeprameter und Zieldatei -->
<form action="ausgabe.php" method="post" />

<?php
	// Einführender Text
	echo "<p>Wählen Sie ein Spiel aus, für das Sie Informationen erhalten wollen.</p>";

	// Verbindung zur lokalen Datenbank wird hergestellt
	$con = new PDO ('pgsql:host=localhost;dbname=lewein','lewein');
	
	// es werden alle Namen der Computerspiele über eine interne Abfrage in die
	// Variable sname geladen
    $sname = $con -> query ("SELECT sname
                             FROM   computerspiel;");
    
    // Die Startzeile für eine Auswahl, das Ergebnis der Auswahl wird als 'titel' an die ausgabe.php übergeben                     
	echo "<select name='titel' size=1>";
	// Die Inhalte der Variable sname werden jeweils als Auswahl zur Verfügung gestellt
    foreach ($sname as $row) {
      echo "<option value='".$row['sname']."'>Spiel: ".$row['sname']."</option>";
    }
    // Die Auswahl wird beendet
    echo "</select>";
    
    // Die Datenbankverbindung wird getrennt
    $con = null;
    
?>

<p>Wählen Sie die gewünschten Informationen aus.</p>

<!-- Hier werden die Kontrollkästchen geschaffen, sie bekommen einen Namen, um in ausgabe.php auf sie zuzugreifen -->
<!-- und einen Wert, am Ende kommt noch der Text mit dem sie auf der Seite dann auftauchen. -->
<p><input type="checkbox" name="publisher" value="pname"> Publisher</p>

<p><input type="checkbox" name="erjahr" value="ejahr"> Erscheinungsjahr</p>

<p><input type="checkbox" name="multi" value="mp"> Multiplayer</p>

<p><input type="checkbox" name="frseko" value="fsk"> FSK</p>

<!-- hier werden die ganzen Informationen an ausgabe.php geschickt und die Seite wird auch aufgerufen -->
<input type="submit" name="sent" value="Suchen" />


