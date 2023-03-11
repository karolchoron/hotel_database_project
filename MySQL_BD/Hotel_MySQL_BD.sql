/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     10.02.2021 05:04:02                          */
/*==============================================================*/

USE Hotel_BD;

drop table if exists DyzurPracyPracownika;

drop table if exists FK_Hotel_Usluga;

drop table if exists FK_Pokoj_UdogodnieniaPokoju;

drop table if exists Gosc;

drop table if exists Hotel;

drop table if exists Pokoj;

drop table if exists PozycjaRezerwacji;

drop table if exists Pracownik;

drop table if exists Rezerwacja;

drop table if exists Sklad;

drop table if exists TypPokoju;

drop table if exists UdogodnieniaPokoju;

drop table if exists Usluga;

/*==============================================================*/
/* Table: DyzurPracyPracownika                                  */
/*==============================================================*/
create table DyzurPracyPracownika
(
   NrPokoju             int not null comment 'Informacje o numerze pokoju. Numer pokoju jest kluczem glownym. Jest wymagany.',
   IDOsoby              int not null,
   DatOD                date comment 'Dyzur od',
   DatDO                date comment 'Dyzur do',
   primary key (NrPokoju, IDOsoby)
);

alter table DyzurPracyPracownika comment 'Dyzur pracy pracownika OD DO.';

/*==============================================================*/
/* Table: FK_Hotel_Usluga                                       */
/*==============================================================*/
create table FK_Hotel_Usluga
(
   IDHotelu             int not null comment 'Identyfikator hotelu.',
   IDUslugi             int not null,
   primary key (IDHotelu, IDUslugi)
);

alter table FK_Hotel_Usluga comment 'Zwiazek (relacja) pomiedzy hotelem a usluga';

/*==============================================================*/
/* Table: FK_Pokoj_UdogodnieniaPokoju                           */
/*==============================================================*/
create table FK_Pokoj_UdogodnieniaPokoju
(
   NrPokoju             int not null comment 'Informacje o numerze pokoju. Numer pokoju jest kluczem glownym. Jest wymagany.',
   IDUdogodnieniaPokoju int not null comment 'Identyfikator udogodnienia pokoju',
   primary key (NrPokoju, IDUdogodnieniaPokoju)
);

alter table FK_Pokoj_UdogodnieniaPokoju comment 'Zwiazek (relacja) pomiedzy pokojem a udogodnieniami w pokoju';

/*==============================================================*/
/* Table: Gosc                                                  */
/*==============================================================*/
create table Gosc
(
   IDOsoby              int not null comment 'Identyfikator osoby',
   Imie                 char(50) not null comment 'Imie osoby.',
   Nazwisko             char(50) not null comment 'Nazwisko osoby.',
   PESEL                char(11) comment 'PESEL osoby.',
   NrPaszportu          char(9) comment 'W przypadku osoby ktora nie posiada PESEL nalezy podac numer paszportu. Paszport sklada sie z 2 liter i 7 cyfr. Np: AA1234567.',
   Miejscowosc          char(50) comment 'Miejscowoæ w której mieszka osoba.',
   KodPocztowy          char(6) comment 'Kod pocztowy miejscowosci podany w formacie z mylnikiem: XX-XXX, np: 21-500.',
   Ulica                char(50) comment 'Ulica na której znajduje sie miejsce zamieszkania osoby.',
   NrBudynku            char(10) comment 'Numer budynku zamieszkania osoby, np numer domu lub numer bloku.',
   NrMieszkania         char(10) comment 'Numer mieszkania w bloku osoby. Je¿eli osoba mieszka w domu a nie w bloku, to nie wpisujemy tutaj danych.',
   NrTelefonu           char(22) comment 'Numer telefonu osoby. Dlugoæ 22, aby móc wpisaæ numery kierunkowe róznych krajów.',
   primary key (IDOsoby)
);

alter table Gosc comment 'Goæ hotelu. Zawiera informacje osobowe oraz dane o gociu h';

/*==============================================================*/
/* Table: Hotel                                                 */
/*==============================================================*/
create table Hotel
(
   IDHotelu             int not null comment 'Identyfikator hotelu.',
   NazwaHotelu          char(50) comment 'Nazwa hotelu.',
   IloscGwiazdek        int comment 'Ilosc gwiazdek hotelu w skali 1-5.',
   KrajH                char(50) default 'Polska' comment 'Kraj w którym znajduje sie hotel.',
   MiejscowoscH         char(50) not null comment 'Miejscowosc w ktorej znajduje sie hotel.',
   KodPocztowyH         char(6) comment 'Kod pocztowy miejscowosci w ktorej znajduje sie hotel. Podany w formacie XX-XXX np. 21-500.',
   UlicaH               char(50) not null comment 'Nazwa ulicy na ktorej znajduje sie hotel,',
   NrBudynkuH           char(10) not null comment 'Numer budynku.',
   primary key (IDHotelu)
);

alter table Hotel comment 'Informacje o danym hotelu.';

/*==============================================================*/
/* Table: Pokoj                                                 */
/*==============================================================*/
create table Pokoj
(
   NrPokoju             int not null comment 'Informacje o numerze pokoju. Numer pokoju jest kluczem glownym. Jest wymagany.',
   IDTypuPokoju         int not null comment 'ID typu pokoju.',
   IDHotelu             int not null comment 'Identyfikator hotelu.',
   Stan                 char(1) not null comment 'Informacje o stanie pokoju. Z - zarezerwowany. W - wolny.',
   primary key (NrPokoju)
);

alter table Pokoj comment 'Pokoj zawiera informacje o numerze pokoju oraz jego aktualny';

/*==============================================================*/
/* Table: PozycjaRezerwacji                                     */
/*==============================================================*/
create table PozycjaRezerwacji
(
   IDHotelu             int not null comment 'Identyfikator hotelu.',
   NrPokoju             int not null comment 'Informacje o numerze pokoju. Numer pokoju jest kluczem glownym. Jest wymagany.',
   IDRezerwacji         int not null comment 'Identyfikator rezerwacji.',
   IDUslugi             int not null comment 'Identyfikator uslugi',
   primary key (NrPokoju, IDHotelu, IDRezerwacji, IDUslugi)
);

alter table PozycjaRezerwacji comment 'Pozycja rezerwacji.';

/*==============================================================*/
/* Table: Pracownik                                             */
/*==============================================================*/
create table Pracownik
(
   IDOsoby              int not null comment 'Identyfikator osoby',
   IDHotelu             int comment 'Identyfikator hotelu.',
   Imie                 char(50) not null comment 'Imie osoby.',
   Nazwisko             char(50) not null comment 'Nazwisko osoby.',
   PESEL                char(11) comment 'PESEL osoby.',
   NrPaszportu          char(9) comment 'W przypadku osoby ktora nie posiada PESEL nalezy podac numer paszportu. Paszport sklada sie z 2 liter i 7 cyfr. Np: AA1234567.',
   Miejscowosc          char(50) comment 'Miejscowoæ w której mieszka osoba.',
   KodPocztowy          char(6) comment 'Kod pocztowy miejscowosci podany w formacie z mylnikiem: XX-XXX, np: 21-500.',
   Ulica                char(50) comment 'Ulica na której znajduje sie miejsce zamieszkania osoby.',
   NrBudynku            char(10) comment 'Numer budynku zamieszkania osoby, np numer domu lub numer bloku.',
   NrMieszkania         char(10) comment 'Numer mieszkania w bloku osoby. Je¿eli osoba mieszka w domu a nie w bloku, to nie wpisujemy tutaj danych.',
   NrTelefonu           char(22) comment 'Numer telefonu osoby. Dlugoæ 22, aby móc wpisaæ numery kierunkowe róznych krajów.',
   StanPracownika       char(1) comment 'Stan pracownika potrzebny do przydzielenia pracownika do danego zadania. Z- zajêty W- wolny.',
   primary key (IDOsoby)
);

alter table Pracownik comment 'Pracownik hotelu. Zawiera dane osobowe i informacje o pracow';

/*==============================================================*/
/* Table: Rezerwacja                                            */
/*==============================================================*/
create table Rezerwacja
(
   NrPokoju             int not null comment 'Informacje o numerze pokoju. Numer pokoju jest kluczem glownym. Jest wymagany.',
   IDRezerwacji         int not null comment 'Identyfikator rezerwacji.',
   DataOD               date not null comment 'Data rozpoczecia rezerwacji. Czli rezerwacja OD.',
   DataDO               date not null comment 'Data zakonczenia rezerwacji. Czli rezerwacja DO.',
   primary key (NrPokoju, IDRezerwacji)
);

alter table Rezerwacja comment 'Rezerwacja zawiera informacje o rezerwacji. Daty: od do. Pod';

/*==============================================================*/
/* Table: Sklad                                                 */
/*==============================================================*/
create table Sklad
(
   IDOsoby              int not null,
   NrPokoju             int not null comment 'Informacje o numerze pokoju. Numer pokoju jest kluczem glownym. Jest wymagany.',
   IDRezerwacji         int not null comment 'Identyfikator rezerwacji.',
   primary key (NrPokoju, IDOsoby, IDRezerwacji)
);

alter table Sklad comment 'Sklad rezerwacji.';

/*==============================================================*/
/* Table: TypPokoju                                             */
/*==============================================================*/
create table TypPokoju
(
   IDTypuPokoju         int not null comment 'ID typu pokoju.',
   CenaP                int not null comment 'Cena za jedna dobe wynajmu pokojuj w PLN.',
   IluOsobowy           int comment 'Informacja ilu osobowy jest pokoj. Pokoj moze byc dwuosobowy, jednoosobowy trzyosobowy.',
   LiczbaLozek          int comment 'Informacja o liczbie lozek.',
   RodzajPokoju         char(1) comment 'Rodzaj pokoju, czy jest to S - standardowy pokoj czy A - apartament. ',
   primary key (IDTypuPokoju)
);

alter table TypPokoju comment 'TypPokoju zawiera informacje o typie pokoju, takie jak cena ';

/*==============================================================*/
/* Table: UdogodnieniaPokoju                                    */
/*==============================================================*/
create table UdogodnieniaPokoju
(
   IDUdogodnieniaPokoju int not null comment 'Identyfikator udogodnienia pokoju',
   Balkon               char(1) comment 'Czy zawiera balkon: T- tak. N - nie.',
   WidokNaMorze         char(1) comment 'Czy zawiera widok na morze: T- tak. N - nie.',
   Lazienka             char(1) comment 'Czy zawiera lazienke: T- tak. N - nie.',
   Wanna                char(1) comment 'Czy zawiera w lazience wanne: T- tak. N - nie.',
   Prysznic             char(1) comment 'Czy zawiera w lazience prysznic: T- tak. N - nie.',
   Barek                char(1) comment 'Czy zawiera barek z alkoholem: T- tak. N - nie.',
   TV                   char(1) comment 'Czy zawiera pakiet telewizyjny: T- tak. N - nie.',
   WiFi                 char(1) comment 'Czy zawiera WiFi: T- tak. N - nie.',
   Klimatyzacja         char(1) comment 'Czy zawiera klimatyzacje: T- tak. N - nie.',
   primary key (IDUdogodnieniaPokoju)
);

alter table UdogodnieniaPokoju comment 'UdogodnieniaPokoju zawiera informacje o udogodnieniach / wyp';

/*==============================================================*/
/* Table: Usluga                                                */
/*==============================================================*/
create table Usluga
(
   IDUslugi             int not null,
   CenaU                int not null comment 'Cena uslugi  w PLN.',
   Restauracja          char(1) comment 'Czy usluga zawiera restauracje: T- tak N - nie.',
   Basen                char(1) comment 'Czy usluga zawiera basen: T- tak N - nie.',
   SPA                  char(1) comment 'Czy usluga zawiera SPA: T- tak N - nie.',
   Sauna                char(1) comment 'Czy usluga zawiera saune: T- tak N - nie.',
   Silownia             char(1) comment 'Czy usluga zawiera silownie: T- tak N - nie.',
   TransferLotniskowy   char(1) comment 'Czy posiada transfer lotniskowy czyli oferowanie przejazdu z/do lotniska z/do hotelu. T - tak N - nie.',
   Parking              char(1) comment 'Czy usluga zawiera   parking: T- tak N - nie.',
   primary key (IDUslugi)
);

alter table Usluga comment 'Usluga zawiera informacje odnosnie uslug w hotelu.';

alter table DyzurPracyPracownika add constraint FK_Dyzur_Pokoj foreign key (NrPokoju)
      references Pokoj (NrPokoju) on delete cascade on update restrict;

alter table DyzurPracyPracownika add constraint FK_Dyzur_Pracownik foreign key (IDOsoby)
      references Pracownik (IDOsoby) on delete cascade on update restrict;

alter table FK_Hotel_Usluga add constraint FK_Hotel_Usluga2 foreign key (IDHotelu)
      references Hotel (IDHotelu) on delete cascade on update restrict;

alter table FK_Hotel_Usluga add constraint FK_Hotel_Usluga foreign key (IDUslugi)
      references Usluga (IDUslugi) on delete cascade on update restrict;

alter table FK_Pokoj_UdogodnieniaPokoju add constraint FK_Pokoj_UdogodnieniaPokoju2 foreign key (NrPokoju)
      references Pokoj (NrPokoju) on delete cascade on update restrict;

alter table FK_Pokoj_UdogodnieniaPokoju add constraint FK_Pokoj_UdogodnieniaPokoju foreign key (IDUdogodnieniaPokoju)
      references UdogodnieniaPokoju (IDUdogodnieniaPokoju) on delete cascade on update restrict;

alter table Pokoj add constraint FK_Hotel_Pokoj foreign key (IDHotelu)
      references Hotel (IDHotelu) on delete cascade on update restrict;

alter table Pokoj add constraint Pokoj_TypPokoju foreign key (IDTypuPokoju)
      references TypPokoju (IDTypuPokoju) on delete cascade on update restrict;

alter table PozycjaRezerwacji add constraint FK_Pozycja_Hotel foreign key (IDHotelu)
      references Hotel (IDHotelu) on delete cascade on update restrict;

alter table PozycjaRezerwacji add constraint FK_Pozycja_Rezerwacja foreign key (NrPokoju, IDRezerwacji)
      references Rezerwacja (NrPokoju, IDRezerwacji) on delete cascade on update restrict;

alter table PozycjaRezerwacji add constraint FK_Pozycja_Usluga foreign key (IDUslugi)
      references Usluga (IDUslugi) on delete cascade on update restrict;

alter table Pracownik add constraint FK_Hotel_Pracownik foreign key (IDHotelu)
      references Hotel (IDHotelu) on delete cascade on update restrict;

alter table Rezerwacja add constraint FK_Rezerwacja_Pokoj foreign key (NrPokoju)
      references Pokoj (NrPokoju) on delete cascade on update restrict;

alter table Sklad add constraint "FK_Sklad-Rezerwacja" foreign key (NrPokoju, IDRezerwacji)
      references Rezerwacja (NrPokoju, IDRezerwacji) on delete cascade on update restrict;

alter table Sklad add constraint FK_Sklad_Gosc foreign key (IDOsoby)
      references Gosc (IDOsoby) on delete cascade on update restrict;

