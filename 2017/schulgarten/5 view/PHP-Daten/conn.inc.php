<?php
	try {
		//$con = new PDO ('pgsql:host=192.168.178.52; dbname=schulgarten', 'lewein', 'niewel');
		$con = new PDO ('pgsql:host=localhost; dbname=lewein', 'lewein', 'niewel');
		echo "<p style=’color:green’>Verbindung erfolgreich!</p>\n";
		echo "<a href=\"schulgarten.php\">Zurück zur Übersicht</a></br></br></br>";
	} catch (PDOException $e) {
		echo "Fehler: " . htmlspecialchars($e->getMessage ());
	}
?>

