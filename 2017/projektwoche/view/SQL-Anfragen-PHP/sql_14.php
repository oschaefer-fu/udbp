<?php
// query_name_<i> und query_<i> ändern!
$query_name_14 = '5. Alle Raeume (und Exkursions- und Aufsichtsorte), die am Montag nicht belegt sind';
$query_14 = "SELECT Name FROM Ort EXCEPT SELECT Name FROM Ort NATURAL JOIN Termin WHERE Tag = 1";

?>
