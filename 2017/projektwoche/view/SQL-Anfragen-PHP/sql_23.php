<?php
// query_name_<i> und query_<i> ändern!
$query_name_23 = '14. Uebersicht der Lehrerkuerzel, inklusive Anzahl der Aufsichten (ohne Exkursionsbegleitungen)';
$query_23 = "SELECT Kuerzel, COUNT(Start) AS Anzahl_Aufsichten FROM Aufsicht WHERE (Start=940 and Ende=1000) or (Start=1140 and Ende=1210) GROUP BY Kuerzel";


?>


