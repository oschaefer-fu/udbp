<!-- Autor: Holger Huth
	 Datum:	15.06.2015
	 Zweck: Datenbankpraktikum php-Anwendung
-->
<!DOCTYPE html>
<html lang="de">
<head>
    <meta charset="UTF-8">
    <title> Sportfest </title>

</head>
<body>
	 <h1> Test Abfrage von Julian aus Sch??ler</h1>
<?php 
    try {
		//??ffneen der Datenbankverbindung
		$con  = new PDO ('pgsql:user=lewein, dbname=lewein', 'lewein', '');
		//Abfrage
		$query = $con->prepare(
			"SELECT  *
			FROM    schueler
			WHERE   SchVorname = 'Julian'            
				");
		//Ausgabe:
		$query->execute($array); //$array wird durch  $query augebaut
		
		//echo $query - geht  nicht, muss wohl in eine Ausgabemethode exportiert werden
		
		//foreach ($query as $key => $value) { //$query oder $array geht auch nicht
		//	echo "$key = $value<br>\n";
     
		//Wenn ich selber ein Feld erzeuge, kann ich abfragen
		$feld = array('SchID' => "1000", 'SchName' =>"Becker", 'SchVorname' => "Julian");
		echo "<b>nur ein Feldnamen:</b> <br>";
		echo $feld['SchID'] . " <br>\n";
	 
		echo "<b>Ohne Feldnamen:</b> <br>"; 
		foreach ($feld as $zeile) { //leider kann man $feld nicht durch $query ersetzen
			echo "$zeile<br>\n" ;
			}
	
		echo "<b>Mit Feldnamen:</b> <br>";
		foreach ($feld as $key => $value) {
			echo "$key = $value<br>\n";
			}
		//Ende der Ausgaben des per Hand gebauten Feldes
		echo "<b>nur die Abfrage:</b> <br>";
		print_r ( $query); 
	
		$con = null;
	} catch (PDOException $err) {
		echo "Fehler: " . $err->getMessage();
	}
	
?>


</body>
</html>
