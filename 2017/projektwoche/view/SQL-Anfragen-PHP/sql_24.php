<?php
// query_name_<i> und query_<i> ändern!
$query_name_24 = '15. Anzahl der Exkursionsbegleitungen der Lehrer"';
$query_24 = "SELECT Kuerzel, COUNT(Start) AS Exkursionsbegleitungen FROM Aufsicht WHERE NOT (Start=940 and Ende=1000 or Start=1140 and Ende=1210) Group By Kuerzel";


?>


