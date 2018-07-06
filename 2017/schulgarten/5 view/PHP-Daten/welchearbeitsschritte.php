<?php
	include 'conn.inc.php';
	echo "<strong>Folgende Arbeitsschritte gibt es in unserem Garten: </strong><br/>";
	$erg = $con->query("SELECT taetigkeit FROM arbeitsschritte");
	$i = 1;
	foreach ($erg as $row) {
		echo "$i".". ".($row[0]);
		echo "<br/>";
		$i++;
	}
	
	$con = 0
?>

