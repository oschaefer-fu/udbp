<?php
// query_name_<i> und query_<i> ändern!
$query_name_15 = '6. Die Kuerzel der Lehrer, die wenigstens einmal in der Woche arbeiten (Kurs, Exkursion, Aufsicht)';
$query_15 = "SELECT Kuerzel FROM Lehrer NATURAL JOIN Kurs UNION SELECT Kuerzel FROM Lehrer NATURAL JOIN Aufsicht";

?>

