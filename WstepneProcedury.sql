create or replace procedure wstaw_ksiazke
(tytul_z VARCHAR2, rok_z DATE, imie_z VARCHAR2, nazwisko_z VARCHAR2, gdzie_dodac VARCHAR2, id_uzytkownika_z NUMBER)
is
    ile_pozycji number(7,2);
    my_id_pozycja number(7,2);
    ile_autorow number(7,2);
begin
    select count(*) into ile_autorow from Autor where imie=imie_z and nazwisko=nazwisko_z;
    select count(*) into ile_pozycji from Pozycja p natural join autor a where tytul=tytul_z and imie=imie_z and nazwisko=nazwisko_z;
    if ile_autorow < 1 then
        insert into Autor(imie, nazwisko) values(imie_z, nazwisko_z);
    end if;
    if ile_pozycji < 1 then
        insert into Pozycja(tytul, rok, typ) values(tytul_z, rok_z, 'ksiazka');
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
    end
end;
/
create or replace procedure wstaw_film
(tytul_z VARCHAR2, rok_z DATE, imie_z VARCHAR2, nazwisko_z VARCHAR2, gdzie_dodac VARCHAR2, id_uzytkownika_z NUMBER)
is
    ile_pozycji number(7,2);
    my_id_pozycja number(7,2);
    ilu_rezyserow number(7,2);
begin
    select count(*) into ilu_rezyserow from Rezyser where imie=imie_z and nazwisko=nazwisko_z;
    select count(*) into ile_pozycji from Pozycja p natural join rezyser r where tytul=tytul_z and imie=imie_z and nazwisko=nazwisko_z;
    if ilu_rezyserow < 1 then
        insert into Rezyser(imie, nazwisko) values(imie_z, nazwisko_z);
    end if;
    if ile_pozycji < 1 then
        insert into Pozycja(tytul, rok, typ) values(tytul_z, rok_z, 'film');
        select id_pozycja into my_id_pozycja from Pozycja where tytul=tytul_z and rok=rok_z and typ='film';
        insert into Film(id_pozycja) values(my_id_pozycja);
        insert into Rezyser_Film(imie, nazwisko, id_pozycja) values(imie_z, nazwisko_z, my_id_pozycja);
    end if;
    case gdzie_dodac
    when 'oczekujace' then
        insert into Oczekujace(id_uzytkownika, id_pozycja) values(id_uzytkownika_z, my_id_pozycja);
    when 'w_trakcie' then
        insert into W_trakcie(id_uzytkownika, id_pozycja) values(id_uzytkownika_z, my_id_pozycja);
    when 'ukonczona' then
        insert into Ukonczona(id_uzytkownika, id_pozycja) values(id_uzytkownika_z, my_id_pozycja);
    end
end;
/
create or replace procedure wstaw_serial
(tytul_z VARCHAR2, rok_z DATE, imie_z VARCHAR2, nazwisko_z VARCHAR2, gdzie_dodac VARCHAR2, id_uzytkownika_z NUMBER)
is
    ile_pozycji number(7,2);
    my_id_pozycja number(7,2);
    ilu_rezyserow number(7,2);
begin
    select count(*) into ilu_rezyserow from Rezyser where imie=imie_z and nazwisko=nazwisko_z;
    select count(*) into ile_pozycji from Pozycja p natural join rezyser r where tytul=tytul_z and imie=imie_z and nazwisko=nazwisko_z;
    if ilu_rezyserow < 1 then
        insert into Rezyser(imie, nazwisko) values(imie_z, nazwisko_z);
    end if;
    if ile_pozycji < 1 then
        insert into Pozycja(tytul, rok, typ) values(tytul_z, rok_z, 'serial');
        select id_pozycja into my_id_pozycja from Pozycja where tytul=tytul_z and rok=rok_z and typ='serial';
        insert into Serial(id_pozycja) values(my_id_pozycja);
        insert into Rezyser_Serial(imie, nazwisko, id_pozycja) values(imie_z, nazwisko_z, my_id_pozycja);
    end if;
    case gdzie_dodac
    when 'oczekujace' then
        insert into Oczekujace(id_uzytkownika, id_pozycja) values(id_uzytkownika_z, my_id_pozycja);
    when 'w_trakcie' then
        insert into W_trakcie(id_uzytkownika, id_pozycja) values(id_uzytkownika_z, my_id_pozycja);
    when 'ukonczona' then
        insert into Ukonczona(id_uzytkownika, id_pozycja) values(id_uzytkownika_z, my_id_pozycja);
    end
end;
/
create or replace procedure wstaw_gre
(tytul_z VARCHAR2, rok_z DATE, nazwa_z VARCHAR2, gdzie_dodac VARCHAR2, id_uzytkownika_z NUMBER)
is
    ile_pozycji number(7,2);
    my_id_pozycja number(7,2);
    ilu_producentow number(7,2);
begin
    select count(*) into ilu_producentow from Producent where nazwa=nazwa_z;
    select count(*) into ile_pozycji from Pozycja p natural join producent p where tytul=tytul_z and nazwa=nazwa_z;
    if ilu_producento < 1 then
        insert into Producent(nazwa) values(nazwa_z);
    end if;
    if ile_pozycji < 1 then
        insert into Pozycja(tytul, rok, typ) values(tytul_z, rok_z, 'gra');
        select id_pozycja into my_id_pozycja from Pozycja where tytul=tytul_z and rok=rok_z and typ='gra';
        insert into Gra(id_pozycja, nazwa) values(my_id_pozycja, nazwa_z);
    end if;
    case gdzie_dodac
    when 'oczekujace' then
        insert into Oczekujace(id_uzytkownika, id_pozycja) values(id_uzytkownika_z, my_id_pozycja);
    when 'w_trakcie' then
        insert into W_trakcie(id_uzytkownika, id_pozycja) values(id_uzytkownika_z, my_id_pozycja);
    when 'ukonczona' then
        insert into Ukonczona(id_uzytkownika, id_pozycja) values(id_uzytkownika_z, my_id_pozycja);
    end
end;
/
/* niesprawdzone. musze pozniej sprawdzic czy dziala. */
create or replace procedure przenies
(id_pozycja_z NUMBER, id_uzytkownika_z NUMBER, skad_usunac VARCHAR2, gdzie_dodac VARCHAR2)
is

begin
	case skad_usunac
    when 'oczekujace' then
        delete from oczekujace where id_pozycja=id_pozycja_z;
    when 'w_trakcie' then
        delete from w_trakcie where id_pozycja=id_pozycja_z;
    when 'ukonczona' then
        delete from ukonczona where id_pozycja=id_pozycja_z;
    end
    
	case gdzie_dodac
    when 'oczekujace' then
        insert into Oczekujace(id_uzytkownika, id_pozycja) values(id_uzytkownika_z, my_id_pozycja);
    when 'w_trakcie' then
        insert into W_trakcie(id_uzytkownika, id_pozycja, data_rozpoczecia) values(id_uzytkownika_z, id_pozycja_z, CURRENT_DATE);
    when 'ukonczona' then
        insert into W_trakcie(id_uzytkownika, id_pozycja, data_ukonczenia) values(id_uzytkownika_z, id_pozycja_z, CURRENT_DATE);
    end
    
end;

/
/* używane gdy mamy już wypełniony arkusz */
create or replace procedure edytuj_oczekujace
(id_pozycja_z NUMBER, typ_z VARCHAR2, tytul_z VARCHAR2, rok_z DATE, id_uzytkownika_z NUMBER, priorytet_z NUMBER)
is

begin
	update pozycja set tytul = tytul_z, rok = rok_z, typ = typ_z where id_pozycja = id_pozycja_z;
	update oczekujace set priorytet = priorytet_z where id_pozycja = id_pozycja_z and id_uzytkownika = id_uzytkownika_z;
	
	/* nie wiem czy dodawac tutaj mozliwosc edycji autora? czy jako osobna procedura? */
    
end;

/
/* używane gdy mamy już wypełniony arkusz */
create or replace procedure edytuj_w_trakcie
(id_pozycja_z NUMBER, typ_z VARCHAR2, tytul_z VARCHAR2, rok_z DATE, data_rozpoczecia_z DATE, id_uzytkownika_z NUMBER, stopien_ukonczenia_z NUMBER)
is

begin
	update pozycja set tytul = tytul_z, rok = rok_z, typ = typ_z where id_pozycja = id_pozycja_z;
	update w_trakcie set data_rozpoczecia = data_rozpoczecia_z, stopien_ukonczenia = stopien_ukonczenia_z where id_pozycja = id_pozycja_z and id_uzytkownika = id_uzytkownika_z;
    
end;

/

/* używane gdy mamy już wypełniony arkusz */
create or replace procedure edytuj_ukonczona
(id_pozycja_z NUMBER, typ_z VARCHAR2, tytul_z VARCHAR2, rok_z DATE, data_ukonczenia_z DATE, id_uzytkownika_z NUMBER, stopien_ukonczenia_z NUMBER)
is

begin
	update pozycja set tytul = tytul_z, rok = rok_z, typ = typ_z where id_pozycja = id_pozycja_z;
	update ukonczona set data_ukonczenia = data_ukonczenia_z where id_pozycja = id_pozycja_z and id_uzytkownika = id_uzytkownika_z;
    
end;

/


