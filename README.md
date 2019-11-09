# SBD_FunManager

# Opis funkcjonalności:
	Program umożliwiający zapisywanie filmów/seriali/gier/książek
	, ocenianie ich i umieszczanie na listach w zależności od stopnia
	ukończenia.

# Encje:
	1.Ukończone
	2.Oczekujące
	3.W Trakcie
	4.Użytkownicy
	5.Gry
	6.Książki
	7.Filmy
	8.Seriale
	9.Autorzy(książki)
	10.Producenci(gry)
	11.Reżyserzy(filmy/seriale)

# Diagram relacji:
	Przedstawia następujące zależności:
	- Każdy użytkownik posiada jedną listę ukończonych, oczekujących, w trakcie
	- Każda lista posiada jednego użytkownika
	- Każda gra, serial, film, książka może być na wielu listach ukończonych, oczekujących, w trakcie
	- Każda lista może posiadać wiele gier, książek, filmów, seriali
	- Każda książka, gra ma jednego autora, producenta
	- Każdy film, serial może mieć wiele reżyserów
	- Każdy autor, producent, reżyser może posiadać wiele książek, gier, filmów lub seriali
	
	Aby zmienić diagram należy otowrzyć plik xml na stronie www.draw.io i odpowiednio zedytować.
