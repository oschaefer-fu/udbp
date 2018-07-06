<html>

<?php
	include 'conn.inc.php';
	
	echo "Wählen Sie einen Händler, um das Angebot zu sehen.";
	
	$erg=$con->query("SELECT hname FROM haendler");
	$select = "<form name=\"Haendlername\" method=\"POST\">";
	$select.= '<select name="haendler">';
	$select.='<option value=-1>'."".'</option>';
	
	
	$i = 0;
	foreach ($erg as $row) {
		$select.='<option value='."$i".'>'."$row[0]".'</option>';	
		$i++;
	}
	$select.='</select>';
	
	$select.= "<input type=\"submit\" value=\"Anzeigen\">"."</form>";
	echo $select;
	
	
	$haendler_id = $_POST['haendler'];
	$haendler_name;
	$erg= $con->query("SELECT hname FROM haendler WHERE hnr = $haendler_id");
	foreach ($erg as $row) {
		$haendler_name = $row[0];
	}
	
	echo "<br/><strong> $haendler_name bietet folgende Sorten an:<br/></strong>";
	
	$erg=$con->query("SELECT sname FROM sorten, vertrieb WHERE sorten.snr = vertrieb.snr AND vertrieb.hnr = $haendler_id");
	$i = 1;
	foreach ($erg as $row) {
		echo "$i".". ".($row[0]);
		echo "<br/>";
		$i++;
	}
	
	
	$con = 0;
?>

</html>
