<?php
// query_name_<i> und query_<i> ändern!
$query_name_22 = '13. Klasse(n) mit mehr als 5 Schuelern';
$query_22 = "SELECT  Klasse, COUNT(Klasse) AS Anzahl FROM Schueler GROUP BY Klasse HAVING COUNT(Klasse)>5";


?>


