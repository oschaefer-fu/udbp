<?php
// query_name_<i> und query_<i> ändern!
$query_name_17 = '8. Alle Lehrer, die im Hof Aufsicht fuehren';
$query_17 = "SELECT DISTINCT Kuerzel FROM Lehrer NATURAL JOIN Aufsicht NATURAL JOIN Ort WHERE Name = 'Hof'";

?>
