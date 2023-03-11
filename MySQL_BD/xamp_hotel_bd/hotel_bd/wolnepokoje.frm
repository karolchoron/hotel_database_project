TYPE=VIEW
query=select `tp`.`CenaP` AS `CenaZaPokoj`,`po`.`NrPokoju` AS `NrPokoju`,`tp`.`RodzajPokoju` AS `RodzajPokoju`,`tp`.`LiczbaLozek` AS `LiczbaLozek`,`tp`.`IluOsobowy` AS `IluOsobowy`,`up`.`Balkon` AS `Balkon`,`up`.`WidokNaMorze` AS `WidokNaMorze`,`up`.`Lazienka` AS `Lazienka`,`up`.`Wanna` AS `Wanna`,`up`.`Prysznic` AS `Prysznic`,`up`.`Barek` AS `Barek`,`up`.`TV` AS `TV`,`up`.`WiFi` AS `WiFi`,`up`.`Klimatyzacja` AS `Klimatyzacja` from `hotel_bd`.`pokoj` `po` join `hotel_bd`.`fk_pokoj_udogodnieniapokoju` `fkpu` join `hotel_bd`.`udogodnieniapokoju` `up` join `hotel_bd`.`typpokoju` `tp` where `po`.`IDTypuPokoju` = `tp`.`IDTypuPokoju` and `po`.`NrPokoju` = `fkpu`.`NrPokoju` and `fkpu`.`IDUdogodnieniaPokoju` = `up`.`IDUdogodnieniaPokoju` and `po`.`Stan` = \'W\' group by `tp`.`CenaP`,`po`.`NrPokoju`,`tp`.`RodzajPokoju`,`tp`.`LiczbaLozek`,`tp`.`IluOsobowy`,`up`.`Balkon`,`up`.`WidokNaMorze`,`up`.`Lazienka`,`up`.`Wanna`,`up`.`Prysznic`,`up`.`Barek`,`up`.`TV`,`up`.`WiFi`,`up`.`Klimatyzacja` order by `tp`.`CenaP` desc
md5=18ee8da588e406014e8cca8df4039a8f
updatable=0
algorithm=0
definer_user=root
definer_host=localhost
suid=2
with_check_option=0
timestamp=2021-02-10 05:30:59
create-version=2
source=SELECT \n    TP.CenaP AS CenaZaPokoj\n	,PO.NrPokoju\n	,TP.RodzajPokoju\n	,TP.LiczbaLozek\n	,TP.IluOsobowy\n	,UP.Balkon\n	,UP.WidokNaMorze\n	,UP.Lazienka\n	,UP.Wanna\n	,UP.Prysznic\n	,UP.Barek\n	,UP.TV\n	,UP.WiFi\n	,UP.Klimatyzacja\n\nFROM Pokoj PO\n	,FK_Pokoj_UdogodnieniaPokoju FKPU\n	,UdogodnieniaPokoju UP\n	,TypPokoju TP\nWHERE PO.IDTypuPokoju = TP.IDTypuPokoju\n	AND PO.NrPokoju = FKPU.NrPokoju\n	AND FKPU.IDUdogodnieniaPokoju = UP.IDUdogodnieniaPokoju\n	AND PO.Stan = \'W\'\nGROUP BY\n    TP.CenaP \n    ,PO.NrPokoju\n	,TP.RodzajPokoju\n	,TP.LiczbaLozek\n	,TP.IluOsobowy\n	,UP.Balkon\n	,UP.WidokNaMorze\n	,UP.Lazienka\n	,UP.Wanna\n	,UP.Prysznic\n	,UP.Barek\n	,UP.TV\n	,UP.WiFi\n	,UP.Klimatyzacja\nORDER BY TP.CenaP DESC
client_cs_name=utf8mb4
connection_cl_name=utf8mb4_general_ci
view_body_utf8=select `tp`.`CenaP` AS `CenaZaPokoj`,`po`.`NrPokoju` AS `NrPokoju`,`tp`.`RodzajPokoju` AS `RodzajPokoju`,`tp`.`LiczbaLozek` AS `LiczbaLozek`,`tp`.`IluOsobowy` AS `IluOsobowy`,`up`.`Balkon` AS `Balkon`,`up`.`WidokNaMorze` AS `WidokNaMorze`,`up`.`Lazienka` AS `Lazienka`,`up`.`Wanna` AS `Wanna`,`up`.`Prysznic` AS `Prysznic`,`up`.`Barek` AS `Barek`,`up`.`TV` AS `TV`,`up`.`WiFi` AS `WiFi`,`up`.`Klimatyzacja` AS `Klimatyzacja` from `hotel_bd`.`pokoj` `po` join `hotel_bd`.`fk_pokoj_udogodnieniapokoju` `fkpu` join `hotel_bd`.`udogodnieniapokoju` `up` join `hotel_bd`.`typpokoju` `tp` where `po`.`IDTypuPokoju` = `tp`.`IDTypuPokoju` and `po`.`NrPokoju` = `fkpu`.`NrPokoju` and `fkpu`.`IDUdogodnieniaPokoju` = `up`.`IDUdogodnieniaPokoju` and `po`.`Stan` = \'W\' group by `tp`.`CenaP`,`po`.`NrPokoju`,`tp`.`RodzajPokoju`,`tp`.`LiczbaLozek`,`tp`.`IluOsobowy`,`up`.`Balkon`,`up`.`WidokNaMorze`,`up`.`Lazienka`,`up`.`Wanna`,`up`.`Prysznic`,`up`.`Barek`,`up`.`TV`,`up`.`WiFi`,`up`.`Klimatyzacja` order by `tp`.`CenaP` desc
mariadb-version=100417
