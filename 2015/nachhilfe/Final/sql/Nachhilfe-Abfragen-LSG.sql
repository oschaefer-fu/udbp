01) "Alle Schueler aus Kladow"
 snr | vorname |   name   | ortsteil |        mail        | klasse | eltok 
-----+---------+----------+----------+--------------------+--------+-------
   4 | Stefan  | Bussmann | Kladow   | SBussi@hotmail.com |      8 | t
   5 | Jana    | Dussel   | Kladow   | JD@haha.com        |      9 | t
(2 Zeilen)

02) "Die Namen aller Schueler, die noch kein OK der Eltern haben"
 vorname | name 
---------+------
 Jonas   | Logo
(1 Zeile)

03) "Die Vornamen und Namen aller Schueler der 9. Klasse"
  name  
--------
 Dussel
 Depp
 Grell
(3 Zeilen)

04) "Die Namen der Schueler der 8. Klasse mit ihrem Ortsteil"
 klasse |   name   |   ortsteil   
--------+----------+--------------
      8 | Aust     | Staaken
      8 | Bussmann | Kladow
      8 | Ebert    | Altstadt
      8 | Frei     | Gatow
      8 | Meinike  | Siemensstadt
      8 | Schmidt  | Siemensstadt
(6 Zeilen)

05) "Die Namen und E-Mailadressen aller Tutoren in der Altstadt"
 name |      mail      
------+----------------
 Depp | ADepp@here.com
(1 Zeile)

06) "Die Daten aller Tutoren für Mathematik Stufe 7"
 snr | vorname  |  name   |   ortsteil   |        mail         | klasse | eltok | fnr 
-----+----------+---------+--------------+---------------------+--------+-------+-----
   8 | Hans     | Grell   | Hakenfelde   | H.Grell@hotmail.com |      9 | t     |   2
  13 | Anna     | Meinike | Siemensstadt | N.Meinike@web.de    |      8 | t     |   2
  14 | Michaela | Schmidt | Siemensstadt | MSchmidt@mail.de    |      8 | t     |   2
(3 Zeilen)

06a) "Die Daten aller Tutoren für Mathematik Stufe 7; realisiert ohne NATURAL JOIN"
 snr | vorname  |  name   |   ortsteil   |        mail         | klasse | eltok | snr | fnr 
-----+----------+---------+--------------+---------------------+--------+-------+-----+-----
   8 | Hans     | Grell   | Hakenfelde   | H.Grell@hotmail.com |      9 | t     |   8 |   2
  13 | Anna     | Meinike | Siemensstadt | N.Meinike@web.de    |      8 | t     |  13 |   2
  14 | Michaela | Schmidt | Siemensstadt | MSchmidt@mail.de    |      8 | t     |  14 |   2
(3 Zeilen)

06b) "Die Daten aller Tutoren für Mathematik Stufe 7; realisiert mit Unteranfrage"
 snr | vorname  |  name   |   ortsteil   |        mail         | klasse | eltok 
-----+----------+---------+--------------+---------------------+--------+-------
   8 | Hans     | Grell   | Hakenfelde   | H.Grell@hotmail.com |      9 | t
  13 | Anna     | Meinike | Siemensstadt | N.Meinike@web.de    |      8 | t
  14 | Michaela | Schmidt | Siemensstadt | MSchmidt@mail.de    |      8 | t
(3 Zeilen)

07) " Die Namen, Vornamen, Ortsteile aller Schüler, die keine Tutoren sind"
   name   | vorname |   ortsteil   
----------+---------+--------------
 Bussmann | Stefan  | Kladow
 Ebert    | Jan     | Altstadt
 Logo     | Jonas   | Stresow
 Berend   | Michael | Hakenfelde
 Ahrend   | Joschua | Staaken
 Schulz   | Nikolai | Stresow
 Fink     | Leila   | Siemensstadt
 Frei     | Bianca  | Gatow
(8 Zeilen)

08) "Die Nummern aller stattgefundenen Stunden mit dem Namen des unterrichteten Fachs"
 stdnr |   fname    
-------+------------
     0 | Mathematik
     1 | Mathematik
     2 | Deutsch
     3 | Mathematik
     4 | Englisch
     5 | Mathematik
     6 | Mathematik
     7 | Mathematik
     8 | Mathematik
     9 | Mathematik
    10 | Mathematik
(11 Zeilen)

09) "Die Namen aller Tutoren mit der durchschnittlichen Bewertung ihrer Stunden"
  name   |          avg           
---------+------------------------
 Dussel  | 1.00000000000000000000
 Meinike |     2.1666666666666667
 Depp    |     4.0000000000000000
 Grell   |     3.0000000000000000
 Aust    |     2.0000000000000000
(5 Zeilen)

10) "Die Namen und E-Mailadressen aller Tutoren mit ihren Fächern"
  name   |        mail         |   fname    | fnr 
---------+---------------------+------------+-----
 Aust    | faust@istdoch.net   | Mathematik |   1
 Dussel  | JD@haha.com         | Deutsch    |   3
 Dussel  | JD@haha.com         | Deutsch    |   4
 Depp    | ADepp@here.com      | Englisch   |   5
 Grell   | H.Grell@hotmail.com | Mathematik |   2
 Grell   | H.Grell@hotmail.com | NaWi       |   6
 Meinike | N.Meinike@web.de    | Mathematik |   2
 Schmidt | MSchmidt@mail.de    | Deutsch    |   4
 Schmidt | MSchmidt@mail.de    | Mathematik |   2
(9 Zeilen)

11) "Eine Kostenauflistung (Summen) nach Schülernamen (Teilnehmer)"
  sum  |   name   
-------+----------
  5.00 | Bussmann
 20.00 | Berend
 10.00 | Schulz
 15.00 | Ahrend
  5.00 | Grell
 15.00 | Logo
(6 Zeilen)

12) "Die Einnahmen (Summen) von Tutorin Meinike (sNr = 13) von ihren Schülern (Namen der Teilnehmer)"
  name  |  sum  
--------+-------
 Logo   | 15.00
 Ahrend |  5.00
 Schulz | 10.00
(3 Zeilen)

13) "Alle von Tutor Depp angebotenen Slots (Tag,Stunde,KW,Schuljahr)"
 name | tag | stunde | kw | schuljahr 
------+-----+--------+----+-----------
 Depp | Mon |      8 |  4 |      2015
 Depp | Die |      7 |  2 |      2015
 Depp | Don |      9 | 46 |      2014
(3 Zeilen)

14) "Die Namen und E-Mailadressen aller Tutoren die Slots in 2015 anbieten mit den entsprechenden Slots, aufsteigend nach Kalenderwochen"
  name   |        mail         | tag | stunde | kw | schuljahr 
---------+---------------------+-----+--------+----+-----------
 Depp    | ADepp@here.com      | Die |      7 |  2 |      2015
 Dussel  | JD@haha.com         | Die |      7 |  2 |      2015
 Depp    | ADepp@here.com      | Mon |      8 |  4 |      2015
 Meinike | N.Meinike@web.de    | Mon |      0 |  4 |      2015
 Grell   | H.Grell@hotmail.com | Don |      9 |  6 |      2015
 Meinike | N.Meinike@web.de    | Don |      9 |  6 |      2015
 Grell   | H.Grell@hotmail.com | Don |      8 |  6 |      2015
 Aust    | faust@istdoch.net   | Don |      9 |  6 |      2015
 Grell   | H.Grell@hotmail.com | Mit |      9 |  7 |      2015
 Schmidt | MSchmidt@mail.de    | Mon |      7 | 10 |      2015
 Meinike | N.Meinike@web.de    | Die |      9 | 12 |      2015
(11 Zeilen)

15) "Die Namen und E-Mailadressen aller Tutoren die Slots in KW 7, 2015 anbieten mit den entsprechenden Slots, sortiert nach Tagen"
 name  |        mail         | tag | stunde | kw | schuljahr 
-------+---------------------+-----+--------+----+-----------
 Grell | H.Grell@hotmail.com | Mit |      9 |  7 |      2015
(1 Zeile)

16)"Die Namen und E-Mailadressen aller Tutoren die Slots in 2015 anbieten mit den entsprechenden Slots und den angebotenen Fächern (Fachname und Stufe)"
  name   |        mail         | tag | stunde | kw | schuljahr |   fname    | stufe 
---------+---------------------+-----+--------+----+-----------+------------+-------
 Dussel  | JD@haha.com         | Die |      7 |  2 |      2015 | Deutsch    |     8
 Dussel  | JD@haha.com         | Die |      7 |  2 |      2015 | Deutsch    |     7
 Depp    | ADepp@here.com      | Die |      7 |  2 |      2015 | Englisch   |     7
 Depp    | ADepp@here.com      | Mon |      8 |  4 |      2015 | Englisch   |     7
 Meinike | N.Meinike@web.de    | Mon |      0 |  4 |      2015 | Mathematik |     7
 Aust    | faust@istdoch.net   | Don |      9 |  6 |      2015 | Mathematik |     8
 Grell   | H.Grell@hotmail.com | Don |      9 |  6 |      2015 | Mathematik |     7
 Grell   | H.Grell@hotmail.com | Don |      9 |  6 |      2015 | NaWi       |     8
 Grell   | H.Grell@hotmail.com | Don |      8 |  6 |      2015 | Mathematik |     7
 Grell   | H.Grell@hotmail.com | Don |      8 |  6 |      2015 | NaWi       |     8
 Meinike | N.Meinike@web.de    | Don |      9 |  6 |      2015 | Mathematik |     7
 Grell   | H.Grell@hotmail.com | Mit |      9 |  7 |      2015 | Mathematik |     7
 Grell   | H.Grell@hotmail.com | Mit |      9 |  7 |      2015 | NaWi       |     8
 Schmidt | MSchmidt@mail.de    | Mon |      7 | 10 |      2015 | Deutsch    |     7
 Schmidt | MSchmidt@mail.de    | Mon |      7 | 10 |      2015 | Mathematik |     7
 Meinike | N.Meinike@web.de    | Die |      9 | 12 |      2015 | Mathematik |     7
(16 Zeilen)

17) "Die Namen aller Tutoren sortiert nach der durchschnittlichen Bewertung ihrer Stunden (absteigend)"
  name   |          avg           
---------+------------------------
 Depp    |     4.0000000000000000
 Grell   |     3.0000000000000000
 Meinike |     2.1666666666666667
 Aust    |     2.0000000000000000
 Dussel  | 1.00000000000000000000
(5 Zeilen)

18) "Die durchschnittliche Bewertung der Stunden von Tutor Aust"
 name |        avg         
------+--------------------
 Aust | 2.0000000000000000
(1 Zeile)

18a) "Die durchschnittlichen Bewertung der Stunden von Tutor Aust (mit View Tutoren)"
 name |        avg         
------+--------------------
 Aust | 2.0000000000000000
(1 Zeile)

19) "Alle stattgefundenen Mathe-Stunden mit den Tutorennamen und der Stundenbewertung, sortiert nach Stundennummern"
 stdnr |  name   | bewertung 
-------+---------+-----------
     0 | Aust    |         2
     1 | Aust    |         2
     3 | Grell   |         3
     5 | Meinike |         1
     6 | Meinike |         2
     7 | Meinike |         1
     8 | Meinike |         3
     9 | Meinike |         4
    10 | Meinike |         2
(9 Zeilen)

20.) "Die Teilnehmer (Name) der Mathematikstunde (Fachname) bei Meinike am Donnerstag in der 6.KW (SlotNummer 7)"
  name  | slotnr |   fname    
--------+--------+------------
 Ahrend |      7 | Mathematik
 Schulz |      7 | Mathematik
 Logo   |      7 | Mathematik
(3 Zeilen)

21) "Die Einnahmen (Summe) der Tutorin Meinike von Schülern (Name) nach der 4. KW (Kalenderwoche des Slots)"
 kw |  name  | sum  
----+--------+------
  4 | Schulz | 5.00
  4 | Logo   | 5.00
(2 Zeilen)

22) "Alle Nachhilfestunden für Mathematik in der 6.KW (Tutorname, Tag, Stunde, Jahr)"
  name   | tag | stunde | schuljahr 
---------+-----+--------+-----------
 Grell   | Don |      9 |      2015
 Grell   | Don |      8 |      2015
 Meinike | Don |      9 |      2015
(3 Zeilen)

23) "Alle Nachhilfestunden die von Schüler Arend im Jahr 2015 besucht wurden"
 snr | slotnr | stdnr | tnr | fnr | rnr | typname | bewertung | status | schuljahr | kw | tag | stunde | vorname |  name  | ortsteil |      mail      | klasse | eltok 
-----+--------+-------+-----+-----+-----+---------+-----------+--------+-----------+----+-----+--------+---------+--------+----------+----------------+--------+-------
   1 |      8 |     3 |   8 |   2 |   4 | Einzel  |         3 | t      |      2015 |  6 | Don |      8 | Joschua | Ahrend | Staaken  | JAhrend@web.de |      7 | t
   1 |      7 |     5 |  13 |   2 |   2 | Gruppe  |         1 | t      |      2015 |  6 | Don |      9 | Joschua | Ahrend | Staaken  | JAhrend@web.de |      7 | t
(2 Zeilen)

23a) "Alle Nachhilfestunden die von Schüler Arend im Jahr 2015 besucht wurden - mit Unteranfrage"
 slotnr | stdnr | snr | tnr | fnr | rnr | typname | bewertung | status | schuljahr | kw | tag | stunde 
--------+-------+-----+-----+-----+-----+---------+-----------+--------+-----------+----+-----+--------
      8 |     3 |   1 |   8 |   2 |   4 | Einzel  |         3 | t      |      2015 |  6 | Don |      8
      7 |     5 |   1 |  13 |   2 |   2 | Gruppe  |         1 | t      |      2015 |  6 | Don |      9
(2 Zeilen)

24)"Die Namen und E-Mailadressen aller Tutoren die am Donnerstag, 9. Stunde, 6.KW in 2015 verfügbar sind mit den von ihnen unterrichteten Fächern."
  name   |        mail         |   fname    | stufe 
---------+---------------------+------------+-------
 Aust    | faust@istdoch.net   | Mathematik |     8
 Grell   | H.Grell@hotmail.com | Mathematik |     7
 Grell   | H.Grell@hotmail.com | NaWi       |     8
 Meinike | N.Meinike@web.de    | Mathematik |     7
(4 Zeilen)

24a)"Die Namen und E-Mailadressen aller Tutoren die am Donnerstag, 9. Stunde, 6.KW in 2015 verfügbar sind. - mit Unterabfrage a"
  name   |        mail         |   fname    | stufe 
---------+---------------------+------------+-------
 Aust    | faust@istdoch.net   | Mathematik |     8
 Grell   | H.Grell@hotmail.com | Mathematik |     7
 Grell   | H.Grell@hotmail.com | NaWi       |     8
 Meinike | N.Meinike@web.de    | Mathematik |     7
(4 Zeilen)

24b) "Die Namen und E-Mailadressen aller Tutoren die am Donnerstag, 9. Stunde, 6.KW in 2015 verfügbar sind. - mit Unterabfrage b (Alternative)"
  name   |        mail         |   fname    | stufe 
---------+---------------------+------------+-------
 Aust    | faust@istdoch.net   | Mathematik |     8
 Grell   | H.Grell@hotmail.com | Mathematik |     7
 Grell   | H.Grell@hotmail.com | NaWi       |     8
 Meinike | N.Meinike@web.de    | Mathematik |     7
(4 Zeilen)

25) "Namen und E-Mailadressen aller Tutoren sortiert nach Ortsteil" - mit Unterabfrage
   ortsteil   |  vorname  |  name   |        mail         
--------------+-----------+---------+---------------------
 Staaken      | Franziska | Aust    | faust@istdoch.net
 Siemensstadt | Anna      | Meinike | N.Meinike@web.de
 Siemensstadt | Michaela  | Schmidt | MSchmidt@mail.de
 Altstadt     | Andreas   | Depp    | ADepp@here.com
 Kladow       | Jana      | Dussel  | JD@haha.com
 Hakenfelde   | Hans      | Grell   | H.Grell@hotmail.com
(6 Zeilen)

26) "Anzahl aller stattgefundenen Stunden"
 anzahl 
--------
     11
(1 Zeile)

27) "Alle Tutoren"
 tnr |  name   
-----+---------
   2 | Aust
  13 | Meinike
  14 | Schmidt
   6 | Depp
   5 | Dussel
   8 | Grell
(6 Zeilen)

28) "Alle Stunden (Stundennummer) mit den Namen der Tutoren, sortiert nach Stundennummern."
 stdnr |  name   
-------+---------
     0 | Aust
     1 | Aust
     2 | Dussel
     3 | Grell
     4 | Depp
     5 | Meinike
     6 | Meinike
     7 | Meinike
     8 | Meinike
     9 | Meinike
    10 | Meinike
(11 Zeilen)

29) "Alle Stunden von Meinike, die stattgefunden haben, sortiert nach Stundennummern."
 stdnr |  name   
-------+---------
     5 | Meinike
     6 | Meinike
     7 | Meinike
     8 | Meinike
     9 | Meinike
    10 | Meinike
(6 Zeilen)

30) "Alle Stunden von Meinike "
 stdnr |   fname    | bewertung 
-------+------------+-----------
     5 | Mathematik |         1
     6 | Mathematik |         2
     7 | Mathematik |         1
     8 | Mathematik |         3
     9 | Mathematik |         4
    10 | Mathematik |         2
(6 Zeilen)

