<?php
// query_name_<i> und query_<i> ändern!
$query_name_26 = '17. Anzahl der Schueler im "Mittelalterkurs"';
$query_26 = "SELECT COUNT(SchuelerID) AS Schueler_im_Mittelalterkurs FROM Schueler NATURAL JOIN Kurs Where Kurs.Name = 'Mittelalterkurs'";


?>


