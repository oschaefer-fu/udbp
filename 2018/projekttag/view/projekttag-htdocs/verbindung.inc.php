<!-- Autoren:	Iris Münzner, Frank Möbius
	 Datum:		04.06.2018
	 Zweck:		html/PHP Skript zur Erstellung einer Sicht in PHP
				Bereitstellung von Funktionen zum Aufbau und Beenden
				der Verbindung zu einer Postgresql-Datenbank mit  den
				eingetragenen Zugangsdaten
################################################################### -->

<?php
	function verbinden() {
      $host='localhost';
      $user='lewein';
      $pw='niewel';
      $db='lewein';

      $vdaten='pgsql:host='.$host.';dbname='.$db;

      $verbindung = new PDO($vdaten, $user, $pw);
  
      return $verbindung;
	}

	function beenden() {
		return NULL;
	}

?>

