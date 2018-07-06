<html>

<head> 
<title>Autovermietung DMR</title>
</head>

<body>
<?php
echo "<br>";
echo "Willkommen auf der Website der Autovermietung DMR!<br><br>";
?>	

<?php 
date_default_timezone_set("Europe/Berlin");
$timestamp = time ();
$wochentag = date (l);

switch ($wochentag) {
	case 'Monday': $wochentag = 'Montag'; break;
	case 'Tuesday': $wochentag = 'Dienstag'; break;
	case 'Wednesday': $wochentag = 'Mittwoch'; break;
	case 'Thursday': $wochentag = 'Donnerstag'; break;
	case 'Friday': $wochentag = 'Freitag'; break;
	case 'Saturday': $wochentag = 'Samstag'; break;
	case 'Sunday': $wochentag = 'Sonntag'; break;
	default: echo "Fehler im Programm!"; break;
}

$datum = date ("d.m.Y",$timestamp);
$uhrzeit = date ("H:i", $timestamp);
echo "Heute ist $wochentag, der $datum.<br><br>";
echo "Es ist $uhrzeit Uhr.<br><br>";
?>


<?php
echo "<br>";
echo "Folgende Fahrzeugkategorien können wir Ihnen anbieten:<br>";
?>	

<?php
$con = pg_connect("host=localhost port=5432 dbname= lewein");
$sql = pg_query($con, "SELECT  DISTINCT KName FROM auto");

while ($row = pg_fetch_row($sql)){
		echo "$row[0] <br>";
		}
?>
</body>
</html>

