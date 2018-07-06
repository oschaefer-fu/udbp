<html>


<?php
	include 'conn.inc.php';
	
	$beetnummer = $_POST['Beet'];	
	$erg = $con->query("SELECT sname FROM sorten NATURAL JOIN angebautes WHERE angebautes.bnr = $beetnummer");
	
	if ($beetnummer != 0) {
		echo "Auf Beet "."$beetnummer"." wächst Folgendes: <br/>";
	}
	$i = 1;
	foreach ($erg as $row) {
		echo "$i".". ".($row[0]);
		echo "<br/>";
		$i++;
	}
	
	
	echo "<br/><br/>";
	
	$con = 0;
?>

<form name="Beetnummer" method="POST">
	Was wächst auf Beet Nummer x? <br>
	<input type="radio" name="Beet" value= "0"> Beet  0<br>
	<input type="radio" name="Beet" value= "1"> Beet  1<br>
	<input type="radio" name="Beet" value= "2"> Beet  2<br>
	<input type="radio" name="Beet" value= "3"> Beet  3<br>
	<input type="radio" name="Beet" value= "4"> Beet  4<br>
	<input type="radio" name="Beet" value= "5"> Beet  5<br>
	<input type="submit" value="Anzeigen">
</form>


</html>
