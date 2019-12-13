create or replace procedure wstaw_ksiazke_nowy_tworca
(tytul_z VARCHAR2, rok_z DATE, imie_z VARCHAR2, nazwisko_z VARCHAR2, gdzie_dodac VARCHAR2, id_uzytkownika_z NUMBER)
is
declare
    ile_pozycji number;
    my_id_pozycja number;
    ile_autorow number;
begin
select count(*) into ile_autorow from Autor where imie=imie_z and nazwisko=nazwisko_z;
select count(*) into ile_pozycji from Pozycja p natural join autor a where tytul=tytul_z and imie=imie_z and nazwisko=nazwisko_z;
if ile_autorow < 1 then
    insert into Autor(imie, nazwisko) values(imie_z, nazwisko_z);
end if;
if ile_pozycji < 1 then
    insert into Pozycja(id_pozycja, tytul, rok, typ) values(my_id_pozycja, tytul_z, rok_z, 'ksiazka');
    /* Tutaj mysle ze moznaby np dodac kolumne data dodania, bo moze sie zdazyc ze dwie ksiazki maja ten sam tytul */
    select id_pozycja into my_id_pozycja from Pozycja where tytul=tytul_z and rok=rok_z and typ='ksiazka'; 
    insert into Ksiazka(id_pozycja) values(my_id_pozycja);
    insert into Autor_Ksiazka(imie, nazwisko, id_pozycja) values(imie_z, nazwisko_z, my_id_pozycja);
end if;
case gdzie_dodac
when 'oczekujace' then
insert into Oczekujace(id_uzytkownika, id_pozycja) values(id_uzytkownika_z, my_id_pozycja);
when 'w_trakcie' then
insert into W_trakcie(id_uzytkownika, id_pozycja) values(id_uzytkownika_z, my_id_pozycja);
when 'ukonczona' then
insert into Ukonczona(id_uzytkownika, id_pozycja) values(id_uzytkownika_z, my_id_pozycja);
end;

end;
/
declare
    ile number;
begin
    select count(*) into ile from Pozycja where tytul='Harry Potter';
    if ile > 0 then
    else
        dbms_output.put_line('else');
    end if;
end;
/
set serveroutput on;
/
select count(*) from Pozycja where tytul='Harry Potter';
/
select count(*) from Pozycja p natural join autor a where tytul='Harry Potter i Komnata Tajemnic' and imie='J.K' and nazwisko='Rowling';
/
select * from pozycja;
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
