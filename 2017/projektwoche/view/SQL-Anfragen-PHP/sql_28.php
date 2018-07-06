<?php
// query_name_<i> und query_<i> ändern!
$query_name_28 = '19. Durchschnittlicher Kursstart pro Tag';
$query_28 = "SELECT Name, AVG(Start) AS Durchnittlicher_Kursstart_pro_Tag FROM Termin NATURAL JOIN Kurs GROUP BY KursID, Name";


?>


