/*==============================================================*/
/* DBMS name:      Sybase SQL Anywhere 12                       */
/* Created on:     08.02.2021 20:44:09                          */
/*==============================================================*/


if exists(select 1 from sys.sysforeignkey where role='FK_Dyzur_Pokoj') then
    alter table DyzurPracyPracownika
       delete foreign key FK_Dyzur_Pokoj
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_Dyzur_Pracownik') then
    alter table DyzurPracyPracownika
       delete foreign key FK_Dyzur_Pracownik
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_Hotel_Usluga2') then
    alter table FK_Hotel_Usluga
       delete foreign key FK_Hotel_Usluga2
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_Hotel_Usluga') then
    alter table FK_Hotel_Usluga
       delete foreign key FK_Hotel_Usluga
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_Pokoj_UdogodnieniaPokoju2') then
    alter table FK_Pokoj_UdogodnieniaPokoju
       delete foreign key FK_Pokoj_UdogodnieniaPokoju2
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_Pokoj_UdogodnieniaPokoju') then
    alter table FK_Pokoj_UdogodnieniaPokoju
       delete foreign key FK_Pokoj_UdogodnieniaPokoju
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_Hotel_Pokoj') then
    alter table Pokoj
       delete foreign key FK_Hotel_Pokoj
end if;

if exists(select 1 from sys.sysforeignkey where role='Pokoj_TypPokoju') then
    alter table Pokoj
       delete foreign key Pokoj_TypPokoju
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_Pozycja_Hotel') then
    alter table PozycjaRezerwacji
       delete foreign key FK_Pozycja_Hotel
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_Pozycja_Rezerwacja') then
    alter table PozycjaRezerwacji
       delete foreign key FK_Pozycja_Rezerwacja
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_Pozycja_Usluga') then
    alter table PozycjaRezerwacji
       delete foreign key FK_Pozycja_Usluga
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_Hotel_Pracownik') then
    alter table Pracownik
       delete foreign key FK_Hotel_Pracownik
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_Rezerwacja_Pokoj') then
    alter table Rezerwacja
       delete foreign key FK_Rezerwacja_Pokoj
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_Sklad-Rezerwacja') then
    alter table Sklad
       delete foreign key "FK_Sklad-Rezerwacja"
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_Sklad_Gosc') then
    alter table Sklad
       delete foreign key FK_Sklad_Gosc
end if;

drop index if exists DyzurPracyPracownika.Dyzur_Pracownik_FK;

drop index if exists DyzurPracyPracownika.Dyzur_Pokoj_FK;

drop table if exists DyzurPracyPracownika;

drop index if exists FK_Hotel_Usluga.Hotel_Usluga2_FK;

drop index if exists FK_Hotel_Usluga.Hotel_Usluga_FK;

drop index if exists FK_Hotel_Usluga.Hotel_Usluga_PK;

drop table if exists FK_Hotel_Usluga;

drop index if exists FK_Pokoj_UdogodnieniaPokoju.Pokoj_UdogodnieniaPokoju2_FK;

drop index if exists FK_Pokoj_UdogodnieniaPokoju.Pokoj_UdogodnieniaPokoju_FK;

drop index if exists FK_Pokoj_UdogodnieniaPokoju.Pokoj_UdogodnieniaPokoju_PK;

drop table if exists FK_Pokoj_UdogodnieniaPokoju;

drop index if exists Gosc.Gosc_PK;

drop table if exists Gosc;

drop index if exists Hotel.Hotel_PK;

drop table if exists Hotel;

drop index if exists Pokoj.Hotel_Pokoj_FK;

drop index if exists Pokoj.Pokoj_TypPokoju_FK;

drop index if exists Pokoj.Pokoj_PK;

drop table if exists Pokoj;

drop index if exists PozycjaRezerwacji.Pozycja_Usluga_FK;

drop index if exists PozycjaRezerwacji.Pozycja_Rezerwacja_FK;

drop index if exists PozycjaRezerwacji.Pozycja_Hotel_FK;

drop index if exists PozycjaRezerwacji.PozycjaRezerwacji_PK;

drop table if exists PozycjaRezerwacji;

drop index if exists Pracownik.Hotel_Pracownik_FK;

drop index if exists Pracownik.Pracownik_PK;

drop table if exists Pracownik;

drop index if exists Rezerwacja.Rezerwacja_Pokoj_FK;

drop index if exists Rezerwacja.Rezerwacja_PK;

drop table if exists Rezerwacja;

drop index if exists Sklad."Sklad-Rezerwacja_FK";

drop index if exists Sklad.Sklad_FK;

drop index if exists Sklad.Sklad_PK;

drop table if exists Sklad;

drop index if exists TypPokoju.TypPokoju_PK;

drop table if exists TypPokoju;

drop index if exists UdogodnieniaPokoju.UdogodnieniaPokoju_PK;

drop table if exists UdogodnieniaPokoju;

drop index if exists Usluga.Usluga_PK;

drop table if exists Usluga;

/*==============================================================*/
/* Table: DyzurPracyPracownika                                  */
/*==============================================================*/
create table DyzurPracyPracownika 
(
   NrPokoju             integer                        not null,
   IDOsoby              integer                        not null,
   DatOD                date                           null,
   DatDO                date                           null,
   constraint PK_DYZURPRACYPRACOWNIKA primary key (NrPokoju, IDOsoby)
);

comment on table DyzurPracyPracownika is 
'Dyzur pracy pracownika OD DO.';

comment on column DyzurPracyPracownika.NrPokoju is 
'Informacje o numerze pokoju. Numer pokoju jest kluczem glownym. Jest wymagany.';

comment on column DyzurPracyPracownika.DatOD is 
'Dyzur od';

comment on column DyzurPracyPracownika.DatDO is 
'Dyzur do';

/*==============================================================*/
/* Index: Dyzur_Pokoj_FK                                        */
/*==============================================================*/
create index Dyzur_Pokoj_FK on DyzurPracyPracownika (
NrPokoju ASC
);

/*==============================================================*/
/* Index: Dyzur_Pracownik_FK                                    */
/*==============================================================*/
create index Dyzur_Pracownik_FK on DyzurPracyPracownika (
IDOsoby ASC
);

/*==============================================================*/
/* Table: FK_Hotel_Usluga                                       */
/*==============================================================*/
create table FK_Hotel_Usluga 
(
   IDHotelu             integer                        not null,
   IDUslugi             integer                        not null,
   constraint PK_FK_HOTEL_USLUGA primary key (IDHotelu, IDUslugi)
);

comment on table FK_Hotel_Usluga is 
'Zwiazek (relacja) pomiedzy hotelem a usluga';

comment on column FK_Hotel_Usluga.IDHotelu is 
'Identyfikator hotelu.';

/*==============================================================*/
/* Index: Hotel_Usluga_PK                                       */
/*==============================================================*/
create unique index Hotel_Usluga_PK on FK_Hotel_Usluga (
IDHotelu ASC,
IDUslugi ASC
);

/*==============================================================*/
/* Index: Hotel_Usluga_FK                                       */
/*==============================================================*/
create index Hotel_Usluga_FK on FK_Hotel_Usluga (
IDHotelu ASC
);

/*==============================================================*/
/* Index: Hotel_Usluga2_FK                                      */
/*==============================================================*/
create index Hotel_Usluga2_FK on FK_Hotel_Usluga (
IDUslugi ASC
);

/*==============================================================*/
/* Table: FK_Pokoj_UdogodnieniaPokoju                           */
/*==============================================================*/
create table FK_Pokoj_UdogodnieniaPokoju 
(
   NrPokoju             integer                        not null,
   IDUdogodnieniaPokoju integer                        not null,
   constraint PK_FK_POKOJ_UDOGODNIENIAPOKOJU primary key (NrPokoju, IDUdogodnieniaPokoju)
);

comment on table FK_Pokoj_UdogodnieniaPokoju is 
'Zwiazek (relacja) pomiedzy pokojem a udogodnieniami w pokoju.';

comment on column FK_Pokoj_UdogodnieniaPokoju.NrPokoju is 
'Informacje o numerze pokoju. Numer pokoju jest kluczem glownym. Jest wymagany.';

comment on column FK_Pokoj_UdogodnieniaPokoju.IDUdogodnieniaPokoju is 
'Identyfikator udogodnienia pokoju';

/*==============================================================*/
/* Index: Pokoj_UdogodnieniaPokoju_PK                           */
/*==============================================================*/
create unique index Pokoj_UdogodnieniaPokoju_PK on FK_Pokoj_UdogodnieniaPokoju (
NrPokoju ASC,
IDUdogodnieniaPokoju ASC
);

/*==============================================================*/
/* Index: Pokoj_UdogodnieniaPokoju_FK                           */
/*==============================================================*/
create index Pokoj_UdogodnieniaPokoju_FK on FK_Pokoj_UdogodnieniaPokoju (
NrPokoju ASC
);

/*==============================================================*/
/* Index: Pokoj_UdogodnieniaPokoju2_FK                          */
/*==============================================================*/
create index Pokoj_UdogodnieniaPokoju2_FK on FK_Pokoj_UdogodnieniaPokoju (
IDUdogodnieniaPokoju ASC
);

/*==============================================================*/
/* Table: Gosc                                                  */
/*==============================================================*/
create table Gosc 
(
   IDOsoby              integer                        not null,
   Imie                 char(50)                       not null,
   Nazwisko             char(50)                       not null,
   PESEL                char(11)                       null,
   NrPaszportu          char(9)                        null,
   Miejscowosc          char(50)                       null,
   KodPocztowy          char(6)                        null,
   Ulica                char(50)                       null,
   NrBudynku            char(10)                       null,
   NrMieszkania         char(10)                       null,
   NrTelefonu           char(22)                       null,
   constraint PK_GOSC primary key (IDOsoby)
);

comment on table Gosc is 
'Goœæ hotelu. Zawiera informacje osobowe oraz dane o goœciu hotelu.';

comment on column Gosc.Imie is 
'Imie osoby.';

comment on column Gosc.Nazwisko is 
'Nazwisko osoby.';

comment on column Gosc.PESEL is 
'PESEL osoby.';

comment on column Gosc.NrPaszportu is 
'W przypadku osoby ktora nie posiada PESEL nalezy podac numer paszportu. Paszport sklada sie z 2 liter i 7 cyfr. Np: AA1234567.';

comment on column Gosc.Miejscowosc is 
'Miejscowoœæ w której mieszka osoba.';

comment on column Gosc.KodPocztowy is 
'Kod pocztowy miejscowosci podany w formacie z myœlnikiem: XX-XXX, np: 21-500.';

comment on column Gosc.Ulica is 
'Ulica na której znajduje sie miejsce zamieszkania osoby.';

comment on column Gosc.NrBudynku is 
'Numer budynku zamieszkania osoby, np numer domu lub numer bloku.';

comment on column Gosc.NrMieszkania is 
'Numer mieszkania w bloku osoby. Je¿eli osoba mieszka w domu a nie w bloku, to nie wpisujemy tutaj danych.';

comment on column Gosc.NrTelefonu is 
'Numer telefonu osoby. Dlugoœæ 22, aby móc wpisaæ numery kierunkowe róznych krajów.';

/*==============================================================*/
/* Index: Gosc_PK                                               */
/*==============================================================*/
create unique index Gosc_PK on Gosc (
IDOsoby ASC
);

/*==============================================================*/
/* Table: Hotel                                                 */
/*==============================================================*/
create table Hotel 
(
   IDHotelu             integer                        not null,
   NazwaHotelu          char(50)                       null,
   IloscGwiazdek        integer                        null
   	constraint CKC_ILOSCGWIAZDEK_HOTEL check (IloscGwiazdek is null or (IloscGwiazdek between 1 and 5)),
   KrajH                char(50)                       null default 'Polska',
   MiejscowoscH         char(50)                       not null,
   KodPocztowyH         char(6)                        null,
   UlicaH               char(50)                       not null,
   NrBudynkuH           char(10)                       not null,
   constraint PK_HOTEL primary key (IDHotelu)
);

comment on table Hotel is 
'Informacje o danym hotelu.';

comment on column Hotel.IDHotelu is 
'Identyfikator hotelu.';

comment on column Hotel.NazwaHotelu is 
'Nazwa hotelu.';

comment on column Hotel.IloscGwiazdek is 
'Ilosc gwiazdek hotelu w skali 1-5.';

comment on column Hotel.KrajH is 
'Kraj w którym znajduje sie hotel.';

comment on column Hotel.MiejscowoscH is 
'Miejscowosc w ktorej znajduje sie hotel.';

comment on column Hotel.KodPocztowyH is 
'Kod pocztowy miejscowosci w ktorej znajduje sie hotel. Podany w formacie XX-XXX np. 21-500.';

comment on column Hotel.UlicaH is 
'Nazwa ulicy na ktorej znajduje sie hotel,';

comment on column Hotel.NrBudynkuH is 
'Numer budynku.';

comment on primary key on Hotel is 
'Pi Hotelu.';

/*==============================================================*/
/* Index: Hotel_PK                                              */
/*==============================================================*/
create unique index Hotel_PK on Hotel (
IDHotelu ASC
);

/*==============================================================*/
/* Table: Pokoj                                                 */
/*==============================================================*/
create table Pokoj 
(
   NrPokoju             integer                        not null,
   IDTypuPokoju         integer                        not null,
   IDHotelu             integer                        not null,
   Stan                 char(1)                        not null,
   constraint PK_POKOJ primary key (NrPokoju)
);

comment on table Pokoj is 
'Pokoj zawiera informacje o numerze pokoju oraz jego aktualnym stanie. Czy jest zarezerwowany czy jest wolny. Z- Zarezerwowany W - Wolny.';

comment on column Pokoj.NrPokoju is 
'Informacje o numerze pokoju. Numer pokoju jest kluczem glownym. Jest wymagany.';

comment on column Pokoj.IDTypuPokoju is 
'ID typu pokoju.';

comment on column Pokoj.IDHotelu is 
'Identyfikator hotelu.';

comment on column Pokoj.Stan is 
'Informacje o stanie pokoju. Z - zarezerwowany. W - wolny.';

comment on primary key on Pokoj is 
'PI Pokoju';

/*==============================================================*/
/* Index: Pokoj_PK                                              */
/*==============================================================*/
create unique index Pokoj_PK on Pokoj (
NrPokoju ASC
);

/*==============================================================*/
/* Index: Pokoj_TypPokoju_FK                                    */
/*==============================================================*/
create index Pokoj_TypPokoju_FK on Pokoj (
IDTypuPokoju ASC
);

/*==============================================================*/
/* Index: Hotel_Pokoj_FK                                        */
/*==============================================================*/
create index Hotel_Pokoj_FK on Pokoj (
IDHotelu ASC
);

/*==============================================================*/
/* Table: PozycjaRezerwacji                                     */
/*==============================================================*/
create table PozycjaRezerwacji 
(
   IDHotelu             integer                        not null,
   NrPokoju             integer                        not null,
   IDRezerwacji         integer                        not null,
   IDUslugi             integer                        not null,
   constraint PK_POZYCJAREZERWACJI primary key (NrPokoju, IDHotelu, IDRezerwacji, IDUslugi)
);

comment on table PozycjaRezerwacji is 
'Pozycja rezerwacji.';

comment on column PozycjaRezerwacji.IDHotelu is 
'Identyfikator hotelu.';

comment on column PozycjaRezerwacji.NrPokoju is 
'Informacje o numerze pokoju. Numer pokoju jest kluczem glownym. Jest wymagany.';

comment on column PozycjaRezerwacji.IDRezerwacji is 
'Identyfikator rezerwacji.';

comment on column PozycjaRezerwacji.IDUslugi is 
'Identyfikator uslugi';

/*==============================================================*/
/* Index: PozycjaRezerwacji_PK                                  */
/*==============================================================*/
create unique index PozycjaRezerwacji_PK on PozycjaRezerwacji (
NrPokoju ASC,
IDHotelu ASC,
IDRezerwacji ASC,
IDUslugi ASC
);

/*==============================================================*/
/* Index: Pozycja_Hotel_FK                                      */
/*==============================================================*/
create index Pozycja_Hotel_FK on PozycjaRezerwacji (
IDHotelu ASC
);

/*==============================================================*/
/* Index: Pozycja_Rezerwacja_FK                                 */
/*==============================================================*/
create index Pozycja_Rezerwacja_FK on PozycjaRezerwacji (
NrPokoju ASC,
IDRezerwacji ASC
);

/*==============================================================*/
/* Index: Pozycja_Usluga_FK                                     */
/*==============================================================*/
create index Pozycja_Usluga_FK on PozycjaRezerwacji (
IDUslugi ASC
);

/*==============================================================*/
/* Table: Pracownik                                             */
/*==============================================================*/
create table Pracownik 
(
   IDOsoby              integer                        not null,
   IDHotelu             integer                        null,
   Imie                 char(50)                       not null,
   Nazwisko             char(50)                       not null,
   PESEL                char(11)                       null,
   NrPaszportu          char(9)                        null,
   Miejscowosc          char(50)                       null,
   KodPocztowy          char(6)                        null,
   Ulica                char(50)                       null,
   NrBudynku            char(10)                       null,
   NrMieszkania         char(10)                       null,
   NrTelefonu           char(22)                       null,
   StanPracownika       char(1)                        null,
   constraint PK_PRACOWNIK primary key (IDOsoby)
);

comment on table Pracownik is 
'Pracownik hotelu. Zawiera dane osobowe i informacje o pracowniku.';

comment on column Pracownik.IDHotelu is 
'Identyfikator hotelu.';

comment on column Pracownik.Imie is 
'Imie osoby.';

comment on column Pracownik.Nazwisko is 
'Nazwisko osoby.';

comment on column Pracownik.PESEL is 
'PESEL osoby.';

comment on column Pracownik.NrPaszportu is 
'W przypadku osoby ktora nie posiada PESEL nalezy podac numer paszportu. Paszport sklada sie z 2 liter i 7 cyfr. Np: AA1234567.';

comment on column Pracownik.Miejscowosc is 
'Miejscowoœæ w której mieszka osoba.';

comment on column Pracownik.KodPocztowy is 
'Kod pocztowy miejscowosci podany w formacie z myœlnikiem: XX-XXX, np: 21-500.';

comment on column Pracownik.Ulica is 
'Ulica na której znajduje sie miejsce zamieszkania osoby.';

comment on column Pracownik.NrBudynku is 
'Numer budynku zamieszkania osoby, np numer domu lub numer bloku.';

comment on column Pracownik.NrMieszkania is 
'Numer mieszkania w bloku osoby. Je¿eli osoba mieszka w domu a nie w bloku, to nie wpisujemy tutaj danych.';

comment on column Pracownik.NrTelefonu is 
'Numer telefonu osoby. Dlugoœæ 22, aby móc wpisaæ numery kierunkowe róznych krajów.';

comment on column Pracownik.StanPracownika is 
'Stan pracownika potrzebny do przydzielenia pracownika do danego zadania. Z- zajêty W- wolny.';

/*==============================================================*/
/* Index: Pracownik_PK                                          */
/*==============================================================*/
create unique index Pracownik_PK on Pracownik (
IDOsoby ASC
);

/*==============================================================*/
/* Index: Hotel_Pracownik_FK                                    */
/*==============================================================*/
create index Hotel_Pracownik_FK on Pracownik (
IDHotelu ASC
);

/*==============================================================*/
/* Table: Rezerwacja                                            */
/*==============================================================*/
create table Rezerwacja 
(
   NrPokoju             integer                        not null,
   IDRezerwacji         integer                        not null,
   DataOD               date                           not null,
   DataDO               date                           not null,
   constraint PK_REZERWACJA primary key (NrPokoju, IDRezerwacji)
);

comment on table Rezerwacja is 
'Rezerwacja zawiera informacje o rezerwacji. Daty: od do. Podanie terminu rezerwacji od do jest wymagane.';

comment on column Rezerwacja.NrPokoju is 
'Informacje o numerze pokoju. Numer pokoju jest kluczem glownym. Jest wymagany.';

comment on column Rezerwacja.IDRezerwacji is 
'Identyfikator rezerwacji.';

comment on column Rezerwacja.DataOD is 
'Data rozpoczecia rezerwacji. Czli rezerwacja OD.';

comment on column Rezerwacja.DataDO is 
'Data zakonczenia rezerwacji. Czli rezerwacja DO.';

comment on primary key on Rezerwacja is 
'PI Rezerwacji.';

/*==============================================================*/
/* Index: Rezerwacja_PK                                         */
/*==============================================================*/
create unique index Rezerwacja_PK on Rezerwacja (
NrPokoju ASC,
IDRezerwacji ASC
);

/*==============================================================*/
/* Index: Rezerwacja_Pokoj_FK                                   */
/*==============================================================*/
create index Rezerwacja_Pokoj_FK on Rezerwacja (
NrPokoju ASC
);

/*==============================================================*/
/* Table: Sklad                                                 */
/*==============================================================*/
create table Sklad 
(
   IDOsoby              integer                        not null,
   NrPokoju             integer                        not null,
   IDRezerwacji         integer                        not null,
   constraint PK_SKLAD primary key (NrPokoju, IDOsoby, IDRezerwacji)
);

comment on table Sklad is 
'Sklad rezerwacji.';

comment on column Sklad.NrPokoju is 
'Informacje o numerze pokoju. Numer pokoju jest kluczem glownym. Jest wymagany.';

comment on column Sklad.IDRezerwacji is 
'Identyfikator rezerwacji.';

/*==============================================================*/
/* Index: Sklad_PK                                              */
/*==============================================================*/
create unique index Sklad_PK on Sklad (
NrPokoju ASC,
IDOsoby ASC,
IDRezerwacji ASC
);

/*==============================================================*/
/* Index: Sklad_FK                                              */
/*==============================================================*/
create index Sklad_FK on Sklad (
IDOsoby ASC
);

/*==============================================================*/
/* Index: "Sklad-Rezerwacja_FK"                                 */
/*==============================================================*/
create index "Sklad-Rezerwacja_FK" on Sklad (
NrPokoju ASC,
IDRezerwacji ASC
);

/*==============================================================*/
/* Table: TypPokoju                                             */
/*==============================================================*/
create table TypPokoju 
(
   IDTypuPokoju         integer                        not null,
   CenaP                integer                        not null,
   IluOsobowy           integer                        null,
   LiczbaLozek          integer                        null,
   RodzajPokoju         char(1)                        null,
   constraint PK_TYPPOKOJU primary key (IDTypuPokoju)
);

comment on table TypPokoju is 
'TypPokoju zawiera informacje o typie pokoju, takie jak cena liczba lozek ilu osobowy pokoj. Czy jest to apartament czy standadrowy pokoj,';

comment on column TypPokoju.IDTypuPokoju is 
'ID typu pokoju.';

comment on column TypPokoju.CenaP is 
'Cena za jedna dobe wynajmu pokojuj w PLN.';

comment on column TypPokoju.IluOsobowy is 
'Informacja ilu osobowy jest pokoj. Pokoj moze byc dwuosobowy, jednoosobowy trzyosobowy.';

comment on column TypPokoju.LiczbaLozek is 
'Informacja o liczbie lozek.';

comment on column TypPokoju.RodzajPokoju is 
'Rodzaj pokoju, czy jest to S - standardowy pokoj czy A - apartament. ';

comment on primary key on TypPokoju is 
'PI typu pokoju.';

/*==============================================================*/
/* Index: TypPokoju_PK                                          */
/*==============================================================*/
create unique index TypPokoju_PK on TypPokoju (
IDTypuPokoju ASC
);

/*==============================================================*/
/* Table: UdogodnieniaPokoju                                    */
/*==============================================================*/
create table UdogodnieniaPokoju 
(
   IDUdogodnieniaPokoju integer                        not null,
   Balkon               char(1)                        null,
   WidokNaMorze         char(1)                        null,
   Lazienka             char(1)                        null,
   Wanna                char(1)                        null,
   Prysznic             char(1)                        null,
   Barek                char(1)                        null,
   TV                   char(1)                        null,
   WiFi                 char(1)                        null,
   Klimatyzacja         char(1)                        null,
   constraint PK_UDOGODNIENIAPOKOJU primary key (IDUdogodnieniaPokoju)
);

comment on table UdogodnieniaPokoju is 
'UdogodnieniaPokoju zawiera informacje o udogodnieniach / wyposazeniu danego pokoju. Np czy zawiera TV: T - tak. N - nie.';

comment on column UdogodnieniaPokoju.IDUdogodnieniaPokoju is 
'Identyfikator udogodnienia pokoju';

comment on column UdogodnieniaPokoju.Balkon is 
'Czy zawiera balkon: T- tak. N - nie.';

comment on column UdogodnieniaPokoju.WidokNaMorze is 
'Czy zawiera widok na morze: T- tak. N - nie.';

comment on column UdogodnieniaPokoju.Lazienka is 
'Czy zawiera lazienke: T- tak. N - nie.';

comment on column UdogodnieniaPokoju.Wanna is 
'Czy zawiera w lazience wanne: T- tak. N - nie.';

comment on column UdogodnieniaPokoju.Prysznic is 
'Czy zawiera w lazience prysznic: T- tak. N - nie.';

comment on column UdogodnieniaPokoju.Barek is 
'Czy zawiera barek z alkoholem: T- tak. N - nie.';

comment on column UdogodnieniaPokoju.TV is 
'Czy zawiera pakiet telewizyjny: T- tak. N - nie.';

comment on column UdogodnieniaPokoju.WiFi is 
'Czy zawiera WiFi: T- tak. N - nie.';

comment on column UdogodnieniaPokoju.Klimatyzacja is 
'Czy zawiera klimatyzacje: T- tak. N - nie.';

comment on primary key on UdogodnieniaPokoju is 
'PI udogodnienia pokoju.';

/*==============================================================*/
/* Index: UdogodnieniaPokoju_PK                                 */
/*==============================================================*/
create unique index UdogodnieniaPokoju_PK on UdogodnieniaPokoju (
IDUdogodnieniaPokoju ASC
);

/*==============================================================*/
/* Table: Usluga                                                */
/*==============================================================*/
create table Usluga 
(
   IDUslugi             integer                        not null,
   CenaU                integer                        not null,
   Restauracja          char(1)                        null,
   Basen                char(1)                        null,
   SPA                  char(1)                        null,
   Sauna                char(1)                        null,
   Silownia             char(1)                        null,
   TransferLotniskowy   char(1)                        null,
   Parking              char(1)                        null,
   constraint PK_USLUGA primary key (IDUslugi)
);

comment on table Usluga is 
'Usluga zawiera informacje odnosnie uslug w hotelu.';

comment on column Usluga.CenaU is 
'Cena uslugi  w PLN.';

comment on column Usluga.Restauracja is 
'Czy usluga zawiera restauracje: T- tak N - nie.';

comment on column Usluga.Basen is 
'Czy usluga zawiera basen: T- tak N - nie.';

comment on column Usluga.SPA is 
'Czy usluga zawiera SPA: T- tak N - nie.';

comment on column Usluga.Sauna is 
'Czy usluga zawiera saune: T- tak N - nie.';

comment on column Usluga.Silownia is 
'Czy usluga zawiera silownie: T- tak N - nie.';

comment on column Usluga.TransferLotniskowy is 
'Czy posiada transfer lotniskowy czyli oferowanie przejazdu z/do lotniska z/do hotelu. T - tak N - nie.';

comment on column Usluga.Parking is 
'Czy usluga zawiera   parking: T- tak N - nie.';

comment on primary key on Usluga is 
'PI uslugi.';

/*==============================================================*/
/* Index: Usluga_PK                                             */
/*==============================================================*/
create unique index Usluga_PK on Usluga (
IDUslugi ASC
);

alter table DyzurPracyPracownika
   add constraint FK_Dyzur_Pokoj foreign key (NrPokoju)
      references Pokoj (NrPokoju)
      on update restrict
      on delete cascade;

alter table DyzurPracyPracownika
   add constraint FK_Dyzur_Pracownik foreign key (IDOsoby)
      references Pracownik (IDOsoby)
      on update restrict
      on delete cascade;

alter table FK_Hotel_Usluga
   add constraint FK_Hotel_Usluga2 foreign key (IDHotelu)
      references Hotel (IDHotelu)
      on update restrict
      on delete cascade;

comment on foreign key FK_Hotel_Usluga.FK_Hotel_Usluga2 is 
'Zwiazek (relacja) pomiedzy hotelem a usluga';

alter table FK_Hotel_Usluga
   add constraint FK_Hotel_Usluga foreign key (IDUslugi)
      references Usluga (IDUslugi)
      on update restrict
      on delete cascade;

comment on foreign key FK_Hotel_Usluga.FK_Hotel_Usluga is 
'Zwiazek (relacja) pomiedzy hotelem a usluga';

alter table FK_Pokoj_UdogodnieniaPokoju
   add constraint FK_Pokoj_UdogodnieniaPokoju2 foreign key (NrPokoju)
      references Pokoj (NrPokoju)
      on update restrict
      on delete cascade;

comment on foreign key FK_Pokoj_UdogodnieniaPokoju.FK_Pokoj_UdogodnieniaPokoju2 is 
'Zwiazek (relacja) pomiedzy pokojem a udogodnieniami w pokoju.';

alter table FK_Pokoj_UdogodnieniaPokoju
   add constraint FK_Pokoj_UdogodnieniaPokoju foreign key (IDUdogodnieniaPokoju)
      references UdogodnieniaPokoju (IDUdogodnieniaPokoju)
      on update restrict
      on delete cascade;

comment on foreign key FK_Pokoj_UdogodnieniaPokoju.FK_Pokoj_UdogodnieniaPokoju is 
'Zwiazek (relacja) pomiedzy pokojem a udogodnieniami w pokoju.';

alter table Pokoj
   add constraint FK_Hotel_Pokoj foreign key (IDHotelu)
      references Hotel (IDHotelu)
      on update restrict
      on delete cascade;

comment on foreign key Pokoj.FK_Hotel_Pokoj is 
'Jeden Hotel posiada wiele pokojow. Jeden pokoj moze byc w jednym hotelu.';

alter table Pokoj
   add constraint Pokoj_TypPokoju foreign key (IDTypuPokoju)
      references TypPokoju (IDTypuPokoju)
      on update restrict
      on delete cascade;

comment on foreign key Pokoj.Pokoj_TypPokoju is 
'Zwiazek pomiedzy Pokojem a TypemPokoju. Typow pokoju moze miec wiele pokojow, 1 Pokoj moze miec tylko 1 Typ Pokoju.';

alter table PozycjaRezerwacji
   add constraint FK_Pozycja_Hotel foreign key (IDHotelu)
      references Hotel (IDHotelu)
      on update restrict
      on delete cascade;

alter table PozycjaRezerwacji
   add constraint FK_Pozycja_Rezerwacja foreign key (NrPokoju, IDRezerwacji)
      references Rezerwacja (NrPokoju, IDRezerwacji)
      on update restrict
      on delete cascade;

alter table PozycjaRezerwacji
   add constraint FK_Pozycja_Usluga foreign key (IDUslugi)
      references Usluga (IDUslugi)
      on update restrict
      on delete cascade;

alter table Pracownik
   add constraint FK_Hotel_Pracownik foreign key (IDHotelu)
      references Hotel (IDHotelu)
      on update restrict
      on delete cascade;

comment on foreign key Pracownik.FK_Hotel_Pracownik is 
'Jeden hotel zatrudnia wielu pracownikow.';

alter table Rezerwacja
   add constraint FK_Rezerwacja_Pokoj foreign key (NrPokoju)
      references Pokoj (NrPokoju)
      on update restrict
      on delete cascade;

alter table Sklad
   add constraint "FK_Sklad-Rezerwacja" foreign key (NrPokoju, IDRezerwacji)
      references Rezerwacja (NrPokoju, IDRezerwacji)
      on update restrict
      on delete cascade;

alter table Sklad
   add constraint FK_Sklad_Gosc foreign key (IDOsoby)
      references Gosc (IDOsoby)
      on update restrict
      on delete cascade;

