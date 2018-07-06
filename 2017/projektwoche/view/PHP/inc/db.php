<?php

// Verbindungsaufbau und Auswahl der Datenbank
$dbconn = pg_connect("host=localhost dbname=lewein user=lewein password=niewel")
    or die('Verbindungsaufbau fehlgeschlagen: ' . pg_last_error());
    
?>
