<?php
	include 'conn.inc.php';
	echo "<strong>Folgende Gemüsesorten sind eingespeichert: </strong><br/>";
	$erg = $con->query("SELECT sname, gname FROM sorten NATURAL JOIN gemuese");
	$i = 1;
	foreach ($erg as $row) {
		echo "$i".". ".($row[0]).' ('."$row[1]".')';
		echo "<br/>";
		$i++;
	}
	
	$con = 0
?>
