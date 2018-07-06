<?php
// query_name_<i> und query_<i> ändern!
$query_name_27 = '18. Uebersicht  der Kurse mit der Anzahl der verantwortlichen SuSlle Lehrer, die irgendwann in der Woche im Museumsdorf sind';
$query_27 = "SELECT Kurs.Name, SUM(Schueler.istVerantwortlich) AS Anzahl_verantwortliche_SuS FROM Schueler NATURAL JOIN Kurs GROUP BY Kurs.KursID";


?>


