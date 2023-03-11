TYPE=VIEW
query=select `hotel_bd`.`pracownik`.`IDOsoby` AS `IDOsoby`,`hotel_bd`.`pracownik`.`Nazwisko` AS `Nazwisko`,`hotel_bd`.`pracownik`.`Imie` AS `Imie`,`hotel_bd`.`pokoj`.`NrPokoju` AS `NrPokoju`,`hotel_bd`.`rezerwacja`.`DataOD` AS `NaKiedyPrzygotowac` from `hotel_bd`.`pracownik` join `hotel_bd`.`pokoj` join `hotel_bd`.`hotel` join `hotel_bd`.`rezerwacja` join `hotel_bd`.`pozycjarezerwacji` where `hotel_bd`.`pracownik`.`IDHotelu` = `hotel_bd`.`hotel`.`IDHotelu` and `hotel_bd`.`hotel`.`IDHotelu` = `hotel_bd`.`pokoj`.`IDHotelu` and `hotel_bd`.`hotel`.`IDHotelu` = `hotel_bd`.`pozycjarezerwacji`.`IDHotelu` and `hotel_bd`.`pozycjarezerwacji`.`IDRezerwacji` = `hotel_bd`.`rezerwacja`.`IDRezerwacji` and `hotel_bd`.`rezerwacja`.`NrPokoju` = `hotel_bd`.`pokoj`.`NrPokoju` and `hotel_bd`.`pracownik`.`StanPracownika` = \'W\' order by `hotel_bd`.`rezerwacja`.`DataOD` desc
md5=343825c6121dff52e0a8684221acdd8d
updatable=1
algorithm=0
definer_user=root
definer_host=localhost
suid=1
with_check_option=0
timestamp=2021-02-10 16:07:42
create-version=2
source=SELECT Pracownik.IDOsoby\n	,Pracownik.Nazwisko\n	,Pracownik.Imie\n	,Pokoj.NrPokoju\n	,Rezerwacja.DataOD AS NaKiedyPrzygotowac\nFROM Pracownik\n	,Pokoj\n	,Hotel\n	,Rezerwacja\n	,PozycjaRezerwacji\nWHERE Pracownik.IDHotelu = Hotel.IDHotelu\n	AND Hotel.IDHotelu = Pokoj.IDHotelu\n	AND Hotel.IDHotelu = PozycjaRezerwacji.IDHotelu\n	AND PozycjaRezerwacji.IDRezerwacji = Rezerwacja.IDRezerwacji\n	AND Rezerwacja.NrPokoju = Pokoj.NrPokoju\n	AND Pracownik.StanPracownika = \'W\'\nORDER BY NaKiedyPrzygotowac DESC
client_cs_name=utf8mb4
connection_cl_name=utf8mb4_general_ci
view_body_utf8=select `hotel_bd`.`pracownik`.`IDOsoby` AS `IDOsoby`,`hotel_bd`.`pracownik`.`Nazwisko` AS `Nazwisko`,`hotel_bd`.`pracownik`.`Imie` AS `Imie`,`hotel_bd`.`pokoj`.`NrPokoju` AS `NrPokoju`,`hotel_bd`.`rezerwacja`.`DataOD` AS `NaKiedyPrzygotowac` from `hotel_bd`.`pracownik` join `hotel_bd`.`pokoj` join `hotel_bd`.`hotel` join `hotel_bd`.`rezerwacja` join `hotel_bd`.`pozycjarezerwacji` where `hotel_bd`.`pracownik`.`IDHotelu` = `hotel_bd`.`hotel`.`IDHotelu` and `hotel_bd`.`hotel`.`IDHotelu` = `hotel_bd`.`pokoj`.`IDHotelu` and `hotel_bd`.`hotel`.`IDHotelu` = `hotel_bd`.`pozycjarezerwacji`.`IDHotelu` and `hotel_bd`.`pozycjarezerwacji`.`IDRezerwacji` = `hotel_bd`.`rezerwacja`.`IDRezerwacji` and `hotel_bd`.`rezerwacja`.`NrPokoju` = `hotel_bd`.`pokoj`.`NrPokoju` and `hotel_bd`.`pracownik`.`StanPracownika` = \'W\' order by `hotel_bd`.`rezerwacja`.`DataOD` desc
mariadb-version=100417
