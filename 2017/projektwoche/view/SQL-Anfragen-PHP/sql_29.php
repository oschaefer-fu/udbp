<?php
// query_name_<i> und query_<i> ändern!
$query_name_29 = '20. Anzahl der Sportlehrer';
$query_29 = "SELECT COUNT(Fach.FachID) AS Anzahl_Sportlehrer FROM Lehrer NATURAL JOIN unterrichtet INNER JOIN FACH ON unterrichtet.FachID = Fach.FachID WHERE Fach.Name='Sport'";


?>


