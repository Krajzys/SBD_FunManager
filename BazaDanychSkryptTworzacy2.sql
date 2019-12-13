CREATE TABLE Uzytkownik (
    id_uzytkownika INTEGER GENERATED ALWAYS AS IDENTITY,
    nazwa VARCHAR(30),
    CONSTRAINT pk_uzytkownik PRIMARY KEY (id_uzytkownika)
);

CREATE TABLE Gatunek(
    nazwa VARCHAR(30) PRIMARY KEY
);

CREATE TABLE Producent(
    nazwa VARCHAR(30) PRIMARY KEY,
    rok_zalozenia DATE
);

CREATE TABLE Autor(
    imie VARCHAR(30),
    nazwisko VARCHAR(30),
    CONSTRAINT pk_autor PRIMARY KEY(imie, nazwisko)
);

CREATE TABLE Rezyser(
    imie VARCHAR(30),
    nazwisko VARCHAR(30),
    CONSTRAINT pk_rezyser PRIMARY KEY(imie, nazwisko)
);

CREATE TABLE Pozycja(
    id_pozycja INTEGER GENERATED ALWAYS AS IDENTITY,
    tytul VARCHAR(50),
    rok DATE,
    typ VARCHAR(7),
    CONSTRAINT pk_pozycja PRIMARY KEY (id_pozycja)
);

CREATE TABLE W_trakcie(
    id_uzytkownika INTEGER,
    id_pozycja INTEGER,
    data_rozpoczecia DATE,
    stopien_ukonczenia NUMBER(3,5),
    CONSTRAINT pk_w_trakcie PRIMARY KEY(id_uzytkownika, id_pozycja),
    CONSTRAINT fk_w_trakcie_1 FOREIGN KEY(id_pozycja) REFERENCES Pozycja(id_pozycja),
    CONSTRAINT fk_w_trakcie_2 FOREIGN KEY(id_uzytkownika) REFERENCES Uzytkownik(id_uzytkownika)
);

CREATE TABLE Ukonczona(
    id_uzytkownika INTEGER,
    id_pozycja INTEGER,
    data_ukoczenia DATE,
    CONSTRAINT pk_ukonczona PRIMARY KEY(id_uzytkownika, id_pozycja),
    CONSTRAINT fk_ukonczona_1 FOREIGN KEY(id_pozycja) REFERENCES Pozycja(id_pozycja),
    CONSTRAINT fk_ukonczona_2 FOREIGN KEY(id_uzytkownika) REFERENCES Uzytkownik(id_uzytkownika)
);

CREATE TABLE Oczekujaca(
    id_uzytkownika INTEGER,
    id_pozycja INTEGER,
    priorytet NUMBER(2,2),
    CONSTRAINT pk_oczekujaca PRIMARY KEY(id_uzytkownika, id_pozycja),
    CONSTRAINT fk_oczekujaca_1 FOREIGN KEY(id_pozycja) REFERENCES Pozycja(id_pozycja),
    CONSTRAINT fk_oczekujaca_2 FOREIGN KEY(id_uzytkownika) REFERENCES Uzytkownik(id_uzytkownika)
);

CREATE TABLE Pozycja_Gatunek(
    id_pozycja INTEGER,
    nazwa VARCHAR(30),
    CONSTRAINT pk_pozycja_gatunek PRIMARY KEY(id_pozycja, nazwa),
    CONSTRAINT fk_pozycja_gatunek_id_pozycja FOREIGN KEY(id_pozycja) REFERENCES Pozycja(id_pozycja),
    CONSTRAINT fk_pozycja_gatunek_nazwa FOREIGN KEY(nazwa) REFERENCES Gatunek(nazwa)
);

CREATE TABLE Film(
    id_pozycja INTEGER,
    CONSTRAINT pk_film PRIMARY KEY(id_pozycja),
    CONSTRAINT fk_film FOREIGN KEY(id_pozycja) REFERENCES Pozycja(id_pozycja)
);

CREATE TABLE Gra(
    id_pozycja INTEGER,
    nazwa VARCHAR(30),
    CONSTRAINT pk_gra PRIMARY KEY(id_pozycja),
    CONSTRAINT fk_gra_1 FOREIGN KEY(id_pozycja) REFERENCES Pozycja(id_pozycja),
    CONSTRAINT fk_gra_2 FOREIGN KEY(nazwa) REFERENCES Producent(nazwa)
);

CREATE TABLE Ksiazka(
    id_pozycja INTEGER,
    CONSTRAINT pk_ksiazka PRIMARY KEY(id_pozycja),
    CONSTRAINT fk_ksiazka FOREIGN KEY(id_pozycja) REFERENCES Pozycja(id_pozycja)
);

CREATE TABLE Serial(
    id_pozycja INTEGER,
    liczba_sezonow INTEGER,
    CONSTRAINT pk_serial PRIMARY KEY(id_pozycja),
    CONSTRAINT fk_serial FOREIGN KEY(id_pozycja) REFERENCES Pozycja(id_pozycja)
);

CREATE TABLE Autor_Ksiazka(
    id_pozycja INTEGER,
    imie VARCHAR(30),
    nazwisko VARCHAR(30),
    CONSTRAINT pk_autor_ksiazka PRIMARY KEY (id_pozycja, imie, nazwisko),
    CONSTRAINT fk_autor_ksiazka_id_pozycja FOREIGN KEY(id_pozycja) REFERENCES Ksiazka(id_pozycja),
    CONSTRAINT fk_autor_ksiazka_imie_nazwisko FOREIGN KEY(imie, nazwisko) REFERENCES Autor(imie, nazwisko)
);

CREATE TABLE Rezyser_Serial(
    id_pozycja INTEGER,
    imie VARCHAR(30),
    nazwisko VARCHAR(30),
    CONSTRAINT pk_rezyser_serial PRIMARY KEY (id_pozycja, imie, nazwisko),
    CONSTRAINT fk_rezyser_serial_id_pozycja FOREIGN KEY(id_pozycja) REFERENCES Serial(id_pozycja),
    CONSTRAINT fk_rezyser_serial_imie_nazwisko FOREIGN KEY(imie, nazwisko) REFERENCES Rezyser(imie, nazwisko)
);

CREATE TABLE Rezyser_Film(
    id_pozycja INTEGER,
    imie VARCHAR(30),
    nazwisko VARCHAR(30),
    CONSTRAINT pk_rezyser_film PRIMARY KEY (id_pozycja, imie, nazwisko),
    CONSTRAINT fk_rezyser_film_id_pozycja FOREIGN KEY(id_pozycja) REFERENCES Film(id_pozycja),
    CONSTRAINT fk_rezyser_film_imie_nazwisko FOREIGN KEY(imie, nazwisko) REFERENCES Rezyser(imie, nazwisko)
);
/

/*
DROP TABLE pozycja CASCADE CONSTRAINTS;
DROP TABLE autor CASCADE CONSTRAINTS;
DROP TABLE rezyser CASCADE CONSTRAINTS;
DROP TABLE serial CASCADE CONSTRAINTS;
DROP TABLE film CASCADE CONSTRAINTS;
DROP TABLE gra CASCADE CONSTRAINTS;
DROP TABLE ukonczona CASCADE CONSTRAINTS;
DROP TABLE w_trakcie CASCADE CONSTRAINTS;
DROP TABLE oczekujaca CASCADE CONSTRAINTS;
DROP TABLE autor_ksiazka CASCADE CONSTRAINTS;
DROP TABLE gatunek CASCADE CONSTRAINTS;
DROP TABLE ksiazka CASCADE CONSTRAINTS;
DROP TABLE pozycja_gatunek CASCADE CONSTRAINTS;
DROP TABLE producent CASCADE CONSTRAINTS;
DROP TABLE rezyser_film CASCADE CONSTRAINTS;
DROP TABLE rezyser_serial CASCADE CONSTRAINTS;
DROP TABLE uzytkownik CASCADE CONSTRAINTS;
*/
