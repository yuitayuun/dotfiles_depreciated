# Lista zadań Python - Rozwiązania

## Zadanie 1
Napisz program, który policzy deltę dla równania kwadratowego. Wyświetl wynik w konsoli.

**Oczekiwany rezultat:**
```
Delta wynosi: 4
```

**Rozwiązanie:**
```python
a=3
b=-4
c=1
delta=b**2-4*a*c
print(f'Delta wynosi: {delta}')
```

## Zadanie 2
Do kolejnych zmiennych (x1,x2,x3 oraz x4) przypisz następujące wartości: znak nowej linii, znak tabulatora, znak \\\\ (backslash), cudzysłów. Wszystkie zmienne wydrukuj w jednej linii.

**Oczekiwany rezultat:**
```
koniec linii:
 tabulator:	backslash:\\\\ cudzysłów:"
```

**Rozwiązanie:**
```python
x1='\n'
x2="\t"
x3="\\"
x4="\""
print(f"koniec linii:{x1} tabulator:{x2} backslash:{x3} cudzysłów:{x4}")
```

## Zadanie 3
Dana jest nazwa pliku przypisana do zmiennej nazwa. Wytnij z tej nazwy rozszerzenie (z kropką) i wyświetl go w konsoli.

**Oczekiwany rezultat:**
```
.jpg
```

**Rozwiązanie 1:**
```python
nazwa="plik1.jpg"
print(nazwa[-4:])
```

**Rozwiązanie 2:**
```python
nazwa="plik1.jpg"
print(nazwa[5:])
```

## Zadanie 4
Wyznacz środek odcinka o końcach w punktach A = (2, 4), B = (-4, 6).

**Oczekiwany rezultat:**
```
Środek odcinka AB: (-1.0, 5.0)
```

**Rozwiązanie:**
```python
x1=2
y1=4
x2=-4
y2=6
s1=(x1+x2)/2
s2=(y1+y2)/2
print(f'Środek odcinka AB: ({s1}, {s2})')
```

## Zadanie 5
Napisz program, który wyznaczy wszystkie liczby dwucyfrowe podzielne przez 7.

**Oczekiwany rezultat:**
```
14,21,28,35,42,49,56,63,70,77,84,91,98
```

**Rozwiązanie:**
```python
wynik=[]
for x in range(10,100):
    if x%7==0:
        wynik.append(str(x))
print(",".join(wynik))
```

## Zadanie 6
Wygeneruj ciąg arytmetyczny skończony, w którym pierwszy wyraz jest równy 0, ostatni wyraz nie jest większy niż 100, natomiast różnica w tym ciągu wynosi 3.

**Oczekiwany rezultat:**
```
[0, 3, 6, 9, 12, 15, 18, 21, 24, 27, 30, 33, 36, 39, 42, 45, 48, 51, 54, 57, 60, 63, 66, 69, 72, 75, 78, 81, 84, 87, 90, 93, 96, 99]
```

**Rozwiązanie:**
```python
lista=[]
for x in range(0,100,3):
    lista.append(x)
print(lista)
```

## Zadanie 7
Napisz program, który utworzy histogram - rozkład częstości w postaci słownika liter przechowywanych w liście.

**Oczekiwany rezultat:**
```
{'x': 3, 'y': 4, 'z': 2}
```

**Rozwiązanie:**
```python
lista=['x','y','z','y','x','y','y','z','x']
slownik={}
for litera in lista:
    if litera not in slownik.keys():
        slownik[litera] = 1
    else:
        slownik[litera] += 1
print(slownik)
```

## Zadanie 8
Podana jest niepełna lista imion. Posługując się instrukcją for oraz poleceniem continue wydrukuj do konsoli tylko poprawnie przekazane imiona.

**Oczekiwany rezultat:**
```
Jacek
Tomek
Monika
Barbara
```

**Rozwiązanie:**
```python
names=['Jacek','Tomek','Monika',None,'Barbara']
for name in names:
    if name is None:
        continue
    print(name)
```

## Zadanie 9
Dane są następujące zmienne. Przy użyciu formatowania f-string wyświetl informacje o wartościach logicznych reprezentowanych przez te wartości.

**Oczekiwany rezultat:**
```
Wartość logiczna x1 to False.
Wartość logiczna x2 to False.
Wartość logiczna x3 to True.
Wartość logiczna x4 to False.
Wartość logiczna x5 to True.
Wartość logiczna x6 to False.
Wartość logiczna x7 to True.
```

**Rozwiązanie:**
```python
x1=None
x2=False
x3='False'
x4=0
x5=100
x6=""
x7="ABC"
print(f"Wartość logiczna x1 to {bool(x1)}.")
print(f"Wartość logiczna x2 to {bool(x2)}.")
print(f"Wartość logiczna x3 to {bool(x3)}.")
print(f"Wartość logiczna x4 to {bool(x4)}.")
print(f"Wartość logiczna x5 to {bool(x5)}.")
print(f"Wartość logiczna x6 to {bool(x6)}.")
print(f"Wartość logiczna x7 to {bool(x7)}.")
```

## Zadanie 10
Dane są poniższe kody. Używając odpowiedniej metody sprawdź czy kody składają się tylko ze znaków alfanumerycznych.

**Oczekiwany rezultat:**
```
Kod 1: False
Kod 2: True
```

**Rozwiązanie:**
```python
kod1='AKRTB-20'
kod2='AKRTB20'
print(f'Kod 1: {kod1.isalnum()}')
print(f'Kod 2: {kod2.isalnum()}')
```

## Zadanie 11
Dana jest zmienna napis. Wydrukuj w konsoli ten łańcuch z następującymi modyfikacjami: tylko wielkie litery, tylko małe litery, bez spacji z dwóch stron, bez spacji z lewej strony, bez spacji z prawej strony, bez spacji z dwóch stron oraz zapisany małymi literami.

**Oczekiwany rezultat:**
```
Napis zmieniony: PYTHON .
Napis zmieniony: python .
Napis zmieniony:Python.
Napis zmieniony:Python .
Napis zmieniony: Python.
Napis zmieniony:python.
```

**Rozwiązanie:**
```python
napis=" Python "
print(f"Napis zmieniony:{napis.upper()}.")
print(f"Napis zmieniony:{napis.lower()}.")
print(f"Napis zmieniony:{napis.strip()}.")
print(f"Napis zmieniony:{napis.lstrip()}.")
print(f"Napis zmieniony:{napis.rstrip()}.")
print(f"Napis zmieniony:{napis.strip().lower()}.")
```

## Zadanie 12
Dana jest zmienna zdanie. Napisz program, który wyświetla jeden z dwóch poniższych komunikatów w zależności od tego, czy zdanie rozpoczyna się od wyrazu "Programowanie".

**Oczekiwany rezultat:**
```
Pierwszy wyraz to:'Programowanie'
```

**Rozwiązanie:**
```python
zdanie="Programowanie w języku Python"
if zdanie.startswith("Programowanie "):
    print("Pierwszy wyraz to:'Programowanie'")
else:
    print("Inny wyraz na początku zdania")
```

## Zadanie 13
Dana jest zmienna zdanie. Napisz program, który wyświetla jeden z poniższych komunikatów w zależności od tego, czy zdanie kończy się od wyrazem "Python".

**Oczekiwany rezultat:**
```
Ostatni wyraz to:'Python'
```

**Rozwiązanie:**
```python
zdanie="Programowanie w języku Python."
if zdanie.endswith(" Python") or zdanie.endswith(" Python."):
    print("Ostatni wyraz to:'Python'")
else:
    print("Inny wyraz na końcu zdania")
```

## Zadanie 14
Dane są zmienne. Połącz te dane w jeden napis (wykonaj konkatenację) i wynik wyświetl w konsoli.

**Oczekiwany rezultat:**
```
cena produktu: 12.5
```

**Rozwiązanie 1:**
```python
napis="cena produktu: "
cena=12.50
print(napis+str(cena))
```

**Rozwiązanie 2:**
```python
napis="cena produktu: "
cena=12.50
print(napis,cena)
```

## Zadanie 15
Dana jest zmienna kod. Usuń dywizy z tego zapisu, wynik zapisz w zmiennej o takiej samej nazwie i wydrukuj w konsoli.

**Oczekiwany rezultat:**
```
2371924545
```

**Rozwiązanie:**
```python
kod='237-192-45-45'
kod=kod.replace("-","")
print(kod)
```

## Zadanie 16
Dana jest zmienna zdanie. Zlicz liczbę wystąpień litery P w zdaniu i wyświetl wynik korzystając z formatowania f-string.

**Oczekiwany rezultat:**
```
Liczba wystąpień litery P: 2
```

**Rozwiązanie:**
```python
zdanie="Programowanie w języku Python"
print(f"Liczba wystąpień litery P: {zdanie.count('P')}")
```

## Zadanie 17
Dana jest zmienna owoce przechowująca łańcuch tekstowy. Używając odpowiedniej metody podziel tekst na wyrazy i umieść je w liście.

**Oczekiwany rezultat:**
```
['Jabłko', 'Banan', 'Śliwka', 'Pomidor']
```

**Rozwiązanie:**
```python
owoce="Jabłko,Banan,Śliwka,Pomidor"
lista=owoce.split(",")
print(lista)
```

## Zadanie 18
Dany jest zbiór. Używając odpowiedniej metody dodaj do tego zbioru kolejne elementy, usuń element, wydrukuj zawartość zbioru oraz informację o liczbie owoców.

**Oczekiwany rezultat:**
```
{'czereśnia', 'śliwka', 'gruszka'}
Liczba owoców: 3
```

**Rozwiązanie:**
```python
owoce={"jabłko","gruszka"}
owoce.add("śliwka")
owoce.add("czereśnia")
owoce.remove("jabłko")
print(owoce)
print(f"Liczba owoców: {len(owoce)}")
```

## Zadanie 19
Dana jest następująca tupla zawierająca łańcuch tekstowy. Usuń spacje, zamień litery na małe, wyznacz zbiór wszystkich liter, pomniejsz go o litery samogłoskowe i wydrukuj w konsoli.

**Oczekiwany rezultat:**
```
{'z','r','n','j','p','g','w','m','k','t','h'}
```

**Rozwiązanie:**
```python
napis="Programowanie w języku Python"
napis=napis.replace(" ","")
napis=napis.lower()
litery=set(napis)
samogloski={"a","e","o","u","ó","i","y","ą","ę"}
litery=litery.difference(samogloski)
print(litery)
```

## Zadanie 20
Dane są zbiory A i B. Wyznacz różnicę, sumę oraz część wspólną zbiorów A i B.

**Oczekiwany rezultat:**
```
Różnica zbiorów A i B: {9, 6}
Suma zbiorów A i B: {3, 5, 6, 7, 8, 9, 10}
Część wspólna zbiorów A i B: {8, 3, 5}
```

**Rozwiązanie:**
```python
A={5,3,6,8,9}
B={5,10,3,7,8}
print(f"Różnica zbiorów A i B: {A.difference(B)}")
print(f"Suma zbiorów A i B: {A.union(B)}")
print(f"Część wspólna zbiorów A i B: {A.intersection(B)}")
```

## Zadanie 21
Dane są dwie listy miast. Utwórz trzecią listę która będzie połączeniem tych list, posortuj ją i wydrukuj.

**Oczekiwany rezultat:**
```
['Gdańsk', 'Kraków', 'Poznań', 'Szczecin', 'Warszawa', 'Łódź']
```

**Rozwiązanie:**
```python
miasta1=['Warszawa','Łódź','Kraków']
miasta2=["Poznań","Gdańsk","Szczecin"]
miasta3=miasta1+miasta2
miasta3.sort()
print(miasta3)
```

## Zadanie 22
Dane są dwie tuple zawierające nazwy miast. Utwórz trzecią tuplę która będzie połączeniem tych tupli.

**Oczekiwany rezultat:**
```
('Warszawa', 'Łódź', 'Kraków', 'Poznań', 'Gdańsk', 'Szczecin')
```

**Rozwiązanie:**
```python
miasta1=('Warszawa','Łódź','Kraków')
miasta2=("Poznań","Gdańsk","Szczecin")
miasta3=miasta1+miasta2
print(miasta3)
```

## Zadanie 23
Dane są lista i tupla zawierające nazwy miast. Dołącz elementy z tupli do listy, posortuj ją i wyświetl w konsoli.

**Oczekiwany rezultat:**
```
['Gdańsk', 'Kraków', 'Poznań', 'Szczecin', 'Warszawa', 'Łódź']
```

**Rozwiązanie:**
```python
miasta1=['Warszawa','Łódź','Kraków']
miasta2=("Poznań","Gdańsk","Szczecin")
miasta1.extend(miasta2)
miasta1.sort()
print(miasta1)
```

## Zadanie 24
Dana jest tupla, której elementami są dwie dwuelementowe tuple z danymi osób. Utwórz nową tuplę w której do indeksu 1 będzie przypisana kolejna osoba.

**Oczekiwany rezultat:**
```
(('Jan', 20), ('Joanna', 22), ('Monika', 25))
```

**Rozwiązanie:**
```python
osoby=(("Jan",20),("Monika",25))
osoby=(osoby[0],("Joanna",22),osoby[1])
print(osoby)
```

## Zadanie 25
Dana jest tupla. Przy użyciu formatowania f-string wyświetl w kolejnych wierszach informację o liczbie odpowiedzi tak oraz nie.

**Oczekiwany rezultat:**
```
Odpowiedzi tak: 4
Odpowiedzi nie: 2
```

**Rozwiązanie:**
```python
tupla1=('nie','tak','tak','nie','tak','tak')
print(f"Odpowiedzi tak: {tupla1.count('tak')}")
print(f"Odpowiedzi nie: {tupla1.count('nie')}")
```

## Zadanie 26
Dana jest następująca tupla. Utwórz nową tuplę o tym samym identyfikatorze zawierającą takie same elementy ale ułożone w kolejności alfabetycznej.

**Oczekiwany rezultat:**
```
('Anna', 'Bożena', 'Damian', 'Krystyna', 'Monika')
```

**Rozwiązanie:**
```python
imiona=("Monika","Anna","Damian","Bożena","Krystyna")
imiona=tuple(sorted(list(imiona)))
print(imiona)
```

## Zadanie 27
Dana jest następująca zagnieżdżona struktura list zawierająca informacje o notowaniach spółek. Wyświetl skrót firmy 1, wartość firmy 2, zmień notowanie firmy 3 na 200 i wyświetl całą listę.

**Oczekiwany rezultat:**
```
ABA
420
[['firma1', ['ABA', 320]], ['firma2', ['BBF', 420]], ['firma3', ['CAA', 200]]]
```

**Rozwiązanie:**
```python
notowania=[['firma1',['ABA',320]],['firma2',['BBF',420]],['firma3',['CAA',120]]]
print(notowania[0][1][0])
print(notowania[1][1][1])
notowania[2][1][1]=200
print(notowania)
```

## Zadanie 28
Dana jest lista liczb. Zamień elementy o indeksach od 3 do 5 następującą listą, usuń ostatni element, usuń pierwszy element i wydrukuj zmodyfikowaną listę.

**Oczekiwany rezultat:**
```
[56, 3, 5, 6, 7, 8, 9, 35, 8, 5, 34, 43, 33, 26, 18]
```

**Rozwiązanie:**
```python
lista=[2,56,3,45,1,2,35,8,5,34,43,33,26,18,7]
lista[3:6]=[5,6,7,8,9]
lista.pop()
lista.pop(0)
print(lista)
```

## Zadanie 29
Dana jest lista liczb. Wydrukuj w konsoli: 4 początkowe elementy listy, 4 ostatnie elementy listy oraz elementy o indeksach od 5 do 10.

**Oczekiwany rezultat:**
```
[2, 56, 3, 45]
[33, 26, 18, 7]
[2, 35, 8, 5, 34, 43]
```

**Rozwiązanie:**
```python
lista=[2,56,3,45,1,2,35,8,5,34,43,33,26,18,7]
print(lista[:4])
print(lista[-4:])
print(lista[5:11])
```

## Zadanie 30
Dana jest lista miasta. Dodaj do listy: Poznań, Gdańsk. Usuń z listy Warszawę, posortuj listę i wydrukuj w konsoli.

**Oczekiwany rezultat:**
```
['Gdańsk', 'Kraków', 'Poznań', 'Łódź']
```

**Rozwiązanie:**
```python
miasta=['Warszawa','Łódź','Kraków']
miasta.append("Poznań")
miasta.append("Gdańsk")
miasta.remove("Warszawa")
miasta.sort()
print(miasta)
```

## Zadanie 31
Dana jest lista. Napisz program zliczający liczbę wystąpień elementu "A" na tej liście i wyświetl wynik przy użyciu formatowania f-string.

**Oczekiwany rezultat:**
```
Liczba elementów A: 5
```

**Rozwiązanie:**
```python
lista1=["A","B","A","A","B","A","A","B"]
print(f"Liczba elementów A: {lista1.count('A')}")
```

## Zadanie 32
Utwórz program, który będzie losować liczby z zakresu 0 do 100 tak długo, aż nie zostanie wylosowana liczba 50.

**Oczekiwany rezultat (przykładowy):**
```
[31, 65, 70, 35, 101, 71, 70, 33, 53, 6, 65, 92, 31, 80, 69, 60, 83, 36, 42, 1, 69, 62, 86, 53, 79, 89, 100, 26, 35, 2, 42, 62, 82, 78, 65, 9, 51, 50]
```

**Rozwiązanie:**
```python
import random
x=random.randint(0,100)
lista=[x]
while x!=50:
    x=random.randint(0,100)
    lista.append(x)
print(lista)
```

## Zadanie 33
Przy użyciu pętli wydrukuj w konsoli następującą tabelę.

**Oczekiwany rezultat:**
```
1*1=1
1*2=2
1*3=3
2*1=2
2*2=4
2*3=6
3*1=3
3*2=6
3*3=9
```

**Rozwiązanie:**
```python
for x in range(1,4):
    for y in range(1,4):
        print(f"{x}*{y}={x*y}")
```

## Zadanie 34
Napisz program, który wylosuje 1000 razy liczbę z zakresu 0 do 100. Po zakończeniu losowań wyświetl dwie informacje: ile liczb zostało wylosowanych w zakresie od 0 do 50 oraz ile liczb zostało wylosowanych w zakresie 51 do 100.

**Oczekiwany rezultat (przykładowy):**
```
W zakresie od 0 do 50 wylosowano: 510 liczb.
W zakresie od 51 do 100 wylosowano: 490 liczb.
```

**Rozwiązanie:**
```python
import random
zakres1=0
zakres2=0
for x in range(1000):
    los=random.randint(0,100)
    if los in range(0,51):
        zakres1+=1
    else:
        zakres2+=1
print(f"W zakresie od 0 do 50 wylosowano: {zakres1} liczb.")
print(f"W zakresie od 51 do 100 wylosowano: {zakres2} liczb.")
```

## Zadanie 35
Dana jest następująca lista plików graficznych. Na podstawie tej listy wyznacz zbiór wszystkich nazw plików (bez rozszerzenia) oraz oddzielny zbiór wszystkich rozszerzeń plików (bez kropki).

**Oczekiwany rezultat:**
```
{'plik5', 'plik2', 'plik4', 'plik1', 'plik3'}
{'jpg', 'bmp', 'png'}
```

**Rozwiązanie:**
```python
pliki=["plik1.jpg","plik2.bmp","plik3.jpg","plik4.png","plik5.jpg"]
nazwy=set()
rozszerzenia=set()
for x in pliki:
    podzielony=x.split(".")
    nazwy.add(podzielony[0])
    rozszerzenia.add(podzielony[1])
print(nazwy)
print(rozszerzenia)
```

## Zadanie 36
Dany jest słownik zawierający informacje o stolicach różnych krajów. Przenieś do listy wszystkie nazwy stolic, posortuj tę listę, następnie wydrukuj. Przenieś do drugiej listy wszystkie nazwy krajów, posortuj tę listę, następnie wydrukuj.

**Oczekiwany rezultat:**
```
['Berlin', 'Madryt', 'Oslo', 'Paryż', 'Rzym', 'Warszawa']
['Francja', 'Hiszpania', 'Niemcy', 'Norwegia', 'Polska', 'Włochy']
```

**Rozwiązanie:**
```python
slownik={
    "Warszawa":"Polska",
    "Berlin":"Niemcy",
    "Paryż":"Francja",
    "Rzym":"Włochy",
    "Madryt":"Hiszpania",
    "Oslo":"Norwegia"
}
stolice=sorted(list(slownik.keys()))
print(stolice)
kraje=sorted(list(slownik.values()))
print(kraje)
```

## Zadanie 37
Dany jest słownik uczniowie, którego wartościami są słowniki zawierające dane poszczególnych uczniów. Zaktualizuj wzrost uczennicy Joanna na 160 cm, zaktualizuj wiek uczennicy Monika na 15, dodaj do słownika nowego ucznia i wydrukuj zmieniony słownik.

**Oczekiwany rezultat:**
```
{'id1': {'imię': 'Adam', 'wiek': 15, 'wzrost': 150}, 'id2': {'imię': 'Joanna', 'wiek': 16, 'wzrost': 160}, 'id3': {'imię': 'Monika', 'wiek': 15, 'wzrost': 144}, 'id4': {'imię': 'Jacek', 'wiek': 15, 'wzrost': 152}}
```

**Rozwiązanie:**
```python
uczniowie={
    "id1":{"imię":"Adam","wiek":15,"wzrost":150},
    "id2":{"imię":"Joanna","wiek":16,"wzrost":156},
    "id3":{"imię":"Monika","wiek":14,"wzrost":144}
}
uczniowie["id2"]["wzrost"]=160
uczniowie["id3"]["wiek"]=15
uczniowie["id4"]={"imię":"Jacek","wiek":15,"wzrost":152}
print(uczniowie)
```

## Zadanie 38
Dana jest lista zawierające kody. Przekształć tę listę w słownik złożony z par: indeks-kod.

**Oczekiwany rezultat:**
```
{0: 'AAB', 1: 'CDA', 2: 'ADB', 3: 'BBC', 4: 'AAA', 5: 'CBB', 6: 'BBA', 7: 'CCC'}
```

**Rozwiązanie:**
```python
kody=['AAB','CDA','ADB','BBC','AAA','CBB','BBA','CCC']
slownik=dict(enumerate(kody))
print(slownik)
```

## Zadanie 39
Dany jest słownik. Wyświetl w konsoli listę imion z tego słownika, która będzie posortowana i nie będzie zawierać powtórzeń.

**Oczekiwany rezultat:**
```
['Adam', 'Anna', 'Grzegorz', 'Jacek', 'Joanna', 'Monika']
```

**Rozwiązanie:**
```python
studenci={
    "id1":"Adam",
    "id2":"Monika",
    "id3":"Joanna",
    "id4":"Adam",
    "id5":"Grzegorz",
    "id6":"Anna",
    "id7":"Jacek"
}
print(sorted(list(set(studenci.values()))))
```

## Zadanie 40
Dany jest słownik zawierający dane o produktach i cenach. Zamień cenę produktu 2 na 250, usuń produkt 4, dodaj nowy produkt (produkt6) z ceną 400 i wydrukuj zawartość słownika.

**Oczekiwany rezultat:**
```
{'produkt1': 100, 'produkt2': 250, 'produkt3': 120, 'produkt5': 300, 'produkt6': 400}
```

**Rozwiązanie:**
```python
produkty={
    "produkt1":100,
    "produkt2":150,
    "produkt3":120,
    "produkt4":200,
    "produkt5":300
}
produkty["produkt2"]=250
produkty.pop("produkt4")
produkty["produkt6"]=400
print(produkty)
```

## Zadanie 41
Zdefiniuj funkcję, do której jako argument można przekazywać dowolny obiekt iterowalny zawierający łańcuchy tekstowe, i która zwraca listę łańcuchów o długości większej niż 7 znaków.

**Oczekiwany rezultat:**
```
['komputer', 'klawiatura', 'drukarka']
```

**Rozwiązanie:**
```python
def zliczaj_wieksze_niz_7(wyrazy):
    wynik=[]
    for wyraz in wyrazy:
        if len(wyraz)>7:
            wynik.append(wyraz)
    return wynik

lista=["komputer","monitor","laptop","klawiatura","drukarka"]
lista2=zliczaj_wieksze_niz_7(lista)
print(lista2)
```

## Zadanie 42
Zdefiniuj funkcję, która będzie sprawdzać, czy iterowalny obiekt przekazany jako argument zawiera unikalne wartości.

**Oczekiwany rezultat 1:**
```
True
```

**Oczekiwany rezultat 2:**
```
False
```

**Rozwiązanie:**
```python
def unikalne(elementy):
    return len(elementy)==len(set(elementy))

lista=[1,2,3,4]
print(unikalne(lista))
lista=[1,2,4,4]
print(unikalne(lista))
```

## Zadanie 43
Zdefiniuj funkcję, która będzie usuwać duplikaty z listy przekazanej jako argument i będzie zwracać wynik w postaci posortowanej listy.

**Oczekiwany rezultat:**
```
['A', 'B', 'C', 'D']
```

**Rozwiązanie:**
```python
def usun_duplikaty(dane):
    return sorted(list(set(dane)))

lista=["A","D","C","A","B","C","D","A","B","C","B","D"]
lista2=usun_duplikaty(lista)
print(lista2)
```

## Zadanie 44
Utwórz funkcję, która będzie zwracać długość najdłuższego wyrazu w obiekcie iterowalnym.

**Oczekiwany rezultat:**
```
10
```

**Rozwiązanie 1:**
```python
def najdluzszy_wyraz(wyrazy):
    x=0
    for wyraz in wyrazy:
        if len(wyraz)>x:
            x=len(wyraz)
    return x

sprzet=["komputer","monitor","laptop","klawiatura","drukarka"]
print(najdluzszy_wyraz(sprzet))
```

**Rozwiązanie 2:**
```python
def najdluzszy_wyraz2(wyrazy):
    lista=[0]
    for wyraz in wyrazy:
        lista.append(len(wyraz))
    return max(lista)

sprzet=["komputer","monitor","laptop","klawiatura","drukarka"]
print(najdluzszy_wyraz2(sprzet))
```

## Zadanie 45
Utwórz funkcję, która będzie zwracać najmniejszą z trzech liczb przekazywanych jako argument.

**Oczekiwany rezultat:**
```
3
2
5
```

**Rozwiązanie:**
```python
def minimum(a,b,c):
    if a<b and a<c:
        return a
    elif b<c:
        return b
    else:
        return c

print(minimum(3,5,7))
print(minimum(4,2,7))
print(minimum(8,7,5))
```

## Zadanie 46
Napisz funkcję do której można przekazywać obiekt iterowalny zawierający dowolne wartości i która będzie zwracała tylko łańcuchy (wartości typu string) dłuższe niż 3 znaki.

**Oczekiwany rezultat:**
```
['abcd', 'True', 'dwanaście']
```

**Rozwiązanie:**
```python
def lancuchy_dluzsze_niz_3(wykaz):
    wynik=[]
    for x in wykaz:
        if isinstance(x,str):
            if len(x)>3:
                wynik.append(x)
    return wynik

dane=["abcd",12,"True",False,12,"dwanaście"]
print(lancuchy_dluzsze_niz_3(dane))
```

## Zadanie 47
Przy użyciu Notatnika utwórz plik tekstowy tekst1.txt (kodowanie UTF8) w katalogu "c:/pliki". Napisz program, który odczyta zawartość tego pliku do zmiennej dane i zamieni fragmenty "wyraz" na "x".

**Oczekiwany rezultat:**
```
Zawartość: x1 x2 x3
x4 x5 x6
x7 x8 x9
x10 x11 x12
Typ zmiennej dane: <class 'str'>
Długość tekstu: 38
```

**Rozwiązanie:**
```python
f=open("C:/pliki/tekst1.txt", mode="r", encoding="utf-8")
dane=f.read()
f.close()
dane=dane.replace("wyraz","x")
print(f"Zawartość: {dane}")
print(f"Typ zmiennej dane: {type(dane)}")
print(f"Długość tekstu: {len(dane)}")
```

## Zadanie 48
Przy użyciu Notatnika utwórz plik tekstowy tekst1.txt (kodowanie UTF8) w katalogu "c:/pliki". Napisz program, który odczyta zawartość tego pliku i przeniesie ją do listy dane.

**Oczekiwany rezultat:**
```
21
21
21
23
```

**Rozwiązanie:**
```python
with open("C:/pliki/tekst1.txt", mode="r", encoding="utf-8") as plik:
    dane=plik.readlines()
for wiersz in dane:
    print(len(wiersz))
```

## Zadanie 49
Napisz program, który wygeneruje 100 liczb losowych w zakresie 0 do 1000 i wynik zamieści w liście, a następnie przeniesie zawartość tej listy do pliku tekstowego tekst2.txt.

**Rozwiązanie:**
```python
import random
losy=[]
for x in range(100):
    losy.append(str(random.randint(0,1000))+"\n")
with open("C:/pliki/tekst2.txt", mode="w", encoding="utf-8") as plik:
    plik.writelines(losy)
```

## Zadanie 50
Utwórz klasę Prostokat. Obiekty tej klasy muszą przechowywać informacje o długości boków prostokąta oraz o jego polu i obwodzie.

**Oczekiwany rezultat:**
```
Obwód: 60
Pole: 200
```

**Rozwiązanie:**
```python
class Prostokat:
    def __init__(self,a,b):
        self.bok_a=a
        self.bok_b=b
        self.oblicz_obwod()
        self.oblicz_pole()
    
    def oblicz_obwod(self):
        self.obwod=(2*self.bok_a)+(2*self.bok_b)
    
    def oblicz_pole(self):
        self.pole=self.bok_a*self.bok_b

pr1=Prostokat(10,20)
print(f"Obwód: {pr1.obwod}")
print(f"Pole: {pr1.pole}")
```
