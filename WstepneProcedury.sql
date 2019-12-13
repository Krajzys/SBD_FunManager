create or replace procedure wstaw_nowa_ksiazke_nowy_tworca
(tytul_z VARCHAR2, rok_z DATE, imie_z VARCHAR2, nazwisko_z VARCHAR2)
is
begin
insert into Pozycja(id_pozycja, tytul, rok, typ) values(znalezione_id, tytul_z, rok_z, 'ksiazka');
insert into Ksiazka();
insert into Autor(imie, nazwisko) values(imie_z, nazwisko_z);
insert into Autor_Ksiazka(imie, nazwisko) values(imie_z, nazwisko_z);
end;
/
create or replace procedure wstaw_nowy_film_nowy_tworca
(tytul_z VARCHAR2, rok_z DATE, imie_z VARCHAR2, nazwisko_z VARCHAR2)
is
begin
insert into Pozycja(id_pozycja, tytul, rok, typ) values(znalezione_id, tytul_z, rok_z, 'film');
insert into Film();
insert into Rezyser(imie, nazwisko) values(imie_z, nazwisko_z);
insert into Rezyser_Film(imie, nazwisko) values(imie_z, nazwisko_z);
end;
/
create or replace procedure wstaw_nowy_serial_nowy_tworca
(tytul_z VARCHAR2, rok_z DATE, imie_z VARCHAR2, nazwisko_z VARCHAR2)
is
begin
insert into Pozycja(id_pozycja, tytul, rok, typ) values(znalezione_id, tytul_z, rok_z, 'serial');
insert into Serial();
insert into Rezyser(imie, nazwisko) values(imie_z, nazwisko_z);
insert into Rezyser_Serial(imie, nazwisko) values(imie_z, nazwisko_z);
end;
/
create or replace procedure wstaw_nowy_serial_sezonow_nowy_tworca
(tytul_z VARCHAR2, rok_z DATE, imie_z VARCHAR2, nazwisko_z VARCHAR2, liczba_sezonow_z NUMBER)
is
begin
insert into Pozycja(id_pozycja, tytul, rok, typ) values(znalezione_id, tytul_z, rok_z, 'serial');
insert into Serial(liczba_zesonow) values(liczba_sezonow_z);
insert into Rezyser(imie, nazwisko) values(imie_z, nazwisko_z);
insert into Rezyser_Serial(imie, nazwisko) values(imie_z, nazwisko_z);
end;
/
create or replace procedure wstaw_nowa_gre_nowy_tworca_rok_zalozenia
(tytul_z VARCHAR2, rok_z DATE, nazwa_z VARCHAR2, rok_zalozenia_z DATE)
is
begin
insert into Pozycja(id_pozycja, tytul, rok, typ) values(znalezione_id, tytul_z, rok_z, 'gra');
insert into Gra();
insert into Producent(nazwa, rok_zalozenia) values(nazwa_z, rok_zalozenia_z);
end;
