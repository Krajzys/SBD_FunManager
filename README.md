# SBD_FunManager

# Opis funkcjonalności:
	Program umożliwiający zapisywanie filmów/seriali/gier/książek
	, ocenianie ich i umieszczanie na listach w zależności od stopnia
	ukończenia.

# Encje:
	1.Ukończone { kategoria, tytuł, autor }
	2.Oczekujące { kategoria, tytuł, autor }
	3.W Trakcie { kategoria, tytuł, autor }
	4.Użytkownicy { id, nazwa }
	5.Gry { id, producent, tytuł, kategoria, rok_produkcji }
	6.Książki { id, autor, tytuł, kategoria, rok_wydania }
	7.Filmy { id, reżyser, tytuł, kategoria, rok_produkcji }
	8.Seriale { id, reżyser, tytuł, kategoria, rok }
	9.Autorzy(książki) { id, imię_i_nazwisko }
	10.Producenci(gry) { id, imię_i_nazwisko }
	11.Reżyserzy(filmy/seriale) { id, imię_i_nazwisko }
	
	* dla encji Ukończone, Oczekujące oraz W Trakcie kategoria to: { gra, książka, film, serial }, dla pozostałych encji kategoria to np. dramat, komedia, zręcznościowa, strategiczna
	** Dla encji Seriale proponuję aby rok określał rok produkcji pierwszego sezonu

# Diagram relacji:
	Przedstawia następujące zależności:
	- Każdy użytkownik posiada jedną listę ukończonych, oczekujących, w trakcie
	- Każda lista posiada jednego użytkownika
	- Każda gra, serial, książka może być na wielu listach ukończonych, oczekujących, w trakcie
	- Każdy film może być na wielu listach ukończonych, oczekujących
	- Każda lista może posiadać wiele gier, książek, filmów, seriali
	- Każda książka, gra ma jednego autora, producenta
	- Każdy film, serial może mieć wiele reżyserów
	- Każdy autor, producent, reżyser może posiadać wiele książek, gier, filmów lub seriali
	
	Aby zmienić diagram należy otowrzyć plik xml na stronie www.draw.io i odpowiednio zedytować.
