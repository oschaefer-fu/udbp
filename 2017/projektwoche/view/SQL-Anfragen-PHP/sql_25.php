<?php
// query_name_<i> und query_<i> ändern!
$query_name_25 = '16. Anzahl  der SuS in den jeweiligen Kursen, mit Angabe der Kursnamen';
$query_25 = "SELECT  Name, COUNT(KursID) FROM Schueler NATURAL JOIN Kurs GROUP BY Name";


?>


