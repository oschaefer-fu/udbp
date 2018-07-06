<?php
// query_name_<i> und query_<i> ändern!
$query_name_16 = '7. Alle Lehrer, die nicht in der Projektwoche eingesetzt werden (nicht einmal eine Aufsicht)"';
$query_16 = "SELECT Kuerzel FROM Lehrer EXCEPT (SELECT Kuerzel FROM Lehrer NATURAL JOIN Kurs UNION SELECT Kuerzel FROM Lehrer NATURAL JOIN Aufsicht)";

?>

