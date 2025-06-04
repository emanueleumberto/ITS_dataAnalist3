# Lezione 1

# Python NON è un linguaggio fortemente tipizzato
# Variabile -> Contenitore di dati

a = 5; # Dichiarazione ed inizializzazione di una varibile
# print(a); # Stampa 5
a = 'Ciao'; # Riassegnare un nuovo valore con tipo di dato diverso
# print(a); # Stampa Ciao

# Nomencalatura di una variabile
# CamelCase | PascalCase | SnakeCase
nomeDatoVariabile = 0; # -> CamelCase
NomeDatoVariabile = 0; # -> PascalCase
nome_dato_varibile = 0; # -> SnakeCase
nomedatovariable = 0; 
NOME_DATO_VARIABILE = 0; # -> Convezione Costante

# Assegnazioni singole
x = 1;
y = 2;
z = 3;
# Assegnazioni multiple
x, y, z = 1, 2, 3;
x = y = z = 1;

# Tipi di dato in Python
# - int     -> d = 5;
# - float   -> d = 5.5;
# - string  -> d = 'testo';
# - boolean -> d = True | False;
# - list    -> d = ['Roma', 'Napoli', 'Milano']
# - tuple   -> d = ('Roma', 'Napoli', 'Milano')
# - set     -> d = {'Roma', 'Napoli', 'Milano'}
# - dict    -> d = {"nome": "Mario", "cognome": "Rossi"}
# - range   -> d = range(5)

# Funzioni predefinite in Python
# print(param)  -> Funzione che stampa nel terminale il valore di param
# type(param)   -> Funzione che restituisce il tipo di dato di una variabile
# input()       -> Funzione che mi permette di inserire un valore da terminale
# len(str)      -> Funzione che restituisce la lunghezza di un valore di tipo Stringa
# help(function)-> Restituisce la documentazione della funzione inserita come paramentro

# Funzioni predefinite di Casting
# int(param)    -> restituisce un valore intero
# float(param)  -> restituisce un valore decimale
# str(param)    -> restituisce un valore di tipo stringa
# bool(param)   -> restituisce un valore booleano
#   bool(0) | bool('') | bool([]) | bool(()) | bool({}) -> False

n = '50'
print(n, type(n))
n = int(n)
print(n, type(n))
n = float(n)
print(n, type(n))
n = bool(n)
print(n, type(n))
n = str(n);
print(n, type(n))

# name = input('Inserisci il tuo nome: ');
# lastname = input('Inserisci il tuo cognome: ');
# age = input('Inserisci la tua età: ');

# anni = int(age);
# print(name, type(name), lastname, type(lastname), anni, type(anni));

# Lezione 2

# String in Python
# - Per creare una stringa in python si deve utilizzare '' oppure ""
# - Per creare una stringa multiriga si utilizzano ''' oppure """
# - Possiamo accedere ai singoli caratteri di una stringa tramite l'indice [i]
# - Possiamo selezionare porzioni di una stringa [n:m] da indice n incluso a m escluso
# - Funzioni predefinite per manipolare una stringa
#       lower() | upper() | split() | strip() | replace() | format() | len()

s = ' Sono una Stringa '
st = "Sono una stringa"
multiS = ''' Sono una
    Stringa multiriga '''
multiStr = """ Sono una
                Stringa multiriga """

print(s[0])
print(s[3:8])
print(s[:12])
print(s[5:])
print(s[9:16])
print(s[-5:-1])
print(s[-7:])

print(s.lower())
print(s.upper())
print(s.split(' '))
print(s.strip())
print(s.replace('n', 'x'))

nameA = 'Mario'
nameB = 'Giuseppe'
str = 'Ciao ' + nameA + ' e ' + nameB + ' sono una stringa'
print(str)

str = 'Ciao {} e {} sono una stringa'
print(str.format(nameA, nameB))

str = 'Ciao {1} e {0} sono una stringa'
print(str.format(nameA, nameB))

name = "Giuseppe"
lastname = "Verdi"
age = 45

str = 'Ciao {name} {lastname} ho {age} anni'
print(str.format(age = age, name = name, lastname = lastname))

# Lezione 3

# Operatori
# - Operatori di assegnamento [=]
# - Operatori aritmetici [+ - * / % ** //]
# - Operatori aritmetici di assegnamento [+= -= *= /= %=]
# - Operatori di comparazione restituiscono valori booleani
#   [> | < | >= | <= | != | == | is | is not | in | not in]
# - Operatori logici [and or not xor]
#       True and True -> True
#       True or False -> True
#       False xor False -> True
#       not(False) -> True

x, y = 10, 3

r = x + y # x - y | x * y | x / y | x % y | y ** 3 |  x // y
print(r)

x = x + 2
x += 2 # soluzione equivalente -> x = x + 2
print(x)

b = x == y
b = x is not 8
b = x not in [3, 5, 7]
b = 'i' not in 'Ciao'
print(b)

a = 10
b = 15
c = 10

res = a > 0 and b > 20 # False
res = a > 0 or b > 20 # True
res = a != 8 ^ b > 20 # False
res = not(a > 0) # False
print(res)

# Strutture di controllo
# - IF ELIF ELSE
#   if(condizione):
#       blocco di istruzioni
#   elif(condizione):
#       blocco di istruzioni
#   else:
#       blocco di istruzioni

a = 15
b = 15
c = 10

if a<b:
    print('A minore di B')
elif a==b:
    print('A uguale a B')
else:
    print('A maggiore di B')
    



# Lezione 4
# Strutture iterative o cicli
# - WHILE
#   while(condizione):
#       blocco di istruzioni
# - FOR
#   for ele in iterable
#       blocco di istruzioni

num = 0
while (num <= 5):
    print(num)
    num += 1

   
while True:
    num = input('Inserisci un numero o 0 per terminare: ')
    if int(num) == 0:
        break
    else:
        print("Sono True - " + num)
        
itr = range(0,10)
for e in itr:
    if(e%2 == 0):
        print(e)
else:
    print('--- FINE FOR ---')
    
print('--- FINE ---')

# Collection
# List | Tuple | Set | Dictionary
# è possibile creare liste, tuple, set con valori dello stesso tipo e/o di tipo diverso
# - List  -> Collezione di dati ORDINATE, MODIFICABILI e permettono DUPLICATI
#            c = ['Roma', 'Napoli', 'Milano']
# - Tuple -> Collezione di dati ORDINATE, IMMUTABILI e permettono DUPLICATI 
#            c = ('Roma', 'Napoli', 'Milano')
# - Set   -> Collezione di dati NON ORDINATE e per questo non indicizzabile, 
#            NON MODIFICABILI e NON permettono duplicati
#            c = {'Roma', 'Napoli', 'Milano'}
# - Dictionary -> Collezione di dati ORDINATE, MODIFICABILI e 
#            NON permettono duplicati
#            c = {"nome": "Mario", "cognome": "Rossi", "citta": "Roma"}

# List
# Collezione di dati ORDINATE, MODIFICABILI e permettono DUPLICATI
# list() | type() | len() | count();
# è possibile accedere ad elementi di una lista tramite un indice
# l[i] | l[i:n] | l[:n] | l[i:] | l[-i:-n]
# è possibile modificare valori di una lista tramite un indice
# l[i] = 'Nuovo Valore' | l[0:n] = ['valore1', ... , 'valoreN']
# è possibile aggiungere elementi ad una lista 
# append('Nuovo Valore') | insert(index, 'Nuovo Valore')
# è possibile rimuovere degli elementi da una lista
# remove(val) | pop() | pop(index) | del l[index] | del l | clear()
# è possibile unire due o più liste con extend(newList)
# è possibile ordinare una lista sort() | sort(reverse=True)
# è possibile copiare una lista nl = l.copy() | nl = list(l)
# è possibile iterare una lista tramite for o while
# for ele in l:
#   blocco di istruzioni

l = ['Roma', 'Napoli', 'Milano'] # []
print(l, type(l))
l = list(('Roma', 'Napoli', 'Milano', 'Roma')) # list()
print(l, type(l))
print('Lunghezza della lista: ', len(l))
print('Num di Roma: ', l.count('Roma'))
print(l[1])
print(l[1:3])
print(l[1:])
print(l[:2])
print(l[-3:-1])

l[1] = 'Palermo'
print(l)
l[1:3] = ['Cagliari', 'Firenze']
print(l)

l.append('Campobasso')
print(l)
l.insert(2, 'Perugia')
print(l)

l2 = ['Latina', 'Viterbo', 'Rieti', 'Roma', 'Frosinone']
l.extend(l2)
print(l)

l.sort()
print(l)
l.sort(reverse=True)
print(l)

ln = l # errato per creare una copia
ln = l.copy()
ln = list(l)
print(ln)

ln.pop()
print(ln)
ln.pop(3)
print(ln)
ln.remove('Rieti')
print(ln)

for e in l:
    print(e)
    
i = 0
while (i < len(l)):
    print(l[i])
    i += 1
    
# Lezione 5
# - Tuple -> Collezione di dati ORDINATE, IMMUTABILI 
#            e permettono DUPLICATI 
# tuple() | type() | len() | count();
# è possibile accedere ad elementi di una tupla tramite un indice
# t[i] | t[i:n] | t[:n] | t[i:] | t[-i:-n]
# non è possibile modificare una tupla
# è possibile unire due o più tuple con +
# è possibile fare l'unpack di una tupla
# (t1, t2, t3, t4) = t
# è possibile iterare una lista tramite for o while

ta = ('Roma', 'Napoli', 'Milano', 'Roma')
t = tuple(('Roma', 'Napoli', 'Milano', 'Roma'))
print(t, type(t), len(t), t.count('Roma'))

l = list(t)
l.append('Torino')
t = tuple(l)
print(t, type(t), len(t), t.count('Roma'))

t1 = t[0]
t1, t2 = t[0], t[1]
(t1, t2, t3, t4, t5) = t
print(t1, t2, t3, t4, t5)
(t1, t2, *t3, t4) = t
print(t1, t2, t3, t4)

bigt = ta + t
print(bigt)

# Lezione 6

# - Set   -> Collezione di dati NON ORDINATE e per questo non indicizzabile, 
#       NON MODIFICABILI e NON permettono duplicati
# s = {'Roma', 'Napoli', 'Milano'}
# set() | type() | len()
# NON è possibile modificare valori di un set perchè non abiamo un indice
# è possibile aggiungere elementi ad un set  -> add(val)
# è possibile rimuovere degli elementi da un set
# remove(val) | pop() | del s | clear()
# è possibile unire due o più set con union() -> 
#   Crea un nuovo set con tutti i dati dei set uniti senza duplicati (Full Join)
# è possibile unire due o più set con intersection() -> 
#   Crea un nuovo set con tutti i valori comuni (Inner Join)
# è possibile unire due o più set con difference() ->
#   Crea un nuovo set con tutti i valori del set principale (Left Join)
# è possibile unire due o più set con symmetric_difference() ->
#   Crea un nuovo set con tutti i valori non comuni (Contrario di Inner Join)

s1 = {'Roma', 'Napoli', 'Milano'}
s2 = set(('Torino', 'Roma', 'Firenze', 'Napoli'))
print(type(s1))
print(len(s1))

s1.add('Palermo')
s1.remove('Palermo')

s_union = s1.union(s2) # {'Roma', 'Napoli', 'Milano', 'Torino', 'Firenze'}
print('set union: ',s_union)
s_intersection = s1.intersection(s2) # {'Roma', 'Napoli'}
print('set intersection: ',s_intersection)
s_difference = s1.difference(s2) # {'Milano'}
print('set difference : ',s_difference)
s_symmetric_difference = s1.symmetric_difference(s2) # {'Milano', 'Torino', 'Firenze'}
print('set symmetric difference : ',s_symmetric_difference)

# - Dictionary -> Collezione di dati ORDINATE, MODIFICABILI e NON permettono duplicati
#  I dizionari sono un insieme di coppie chiave/valore, sono l'equivalente degli
#  oggetti in altri linguaggi
#   d = {"nome": "Mario", "cognome": "Rossi", "citta": "Roma"}
# dict() | type() | len()
# è possibile accedere ai valori di un dizionario tramite la chiave -> d[chiave]
# è possibile modificare valori di un dizionario tramite una chiave -> 
#   d[chiave] = nuovoValore| d.update({chiave: nuovoValore})
# è possibile rimuovere dati da un dizionario ->
#   pop(chiave) | del d[chiave] | del d | clear()
# è possibile copiare un dizionario nd = d.copy() | nd = dict(d)
# è possibile iterare un dizionario tramite il for

d1 = {"nome": "Mario", "cognome": "Rossi", "citta": "Roma", "anni": 45}
print(d1)
d2 = dict({"nome": "Mario", "cognome": "Rossi", "citta": "Roma", "anni": 45})
print(d2)
print(type(d1))
print(len(d1))
print(f"Ciao sono {d1['nome']} {d1['cognome']}")
d1['cognome'] = 'Verdi'
d1.update({"citta": "Milano"})
print(f"Ciao sono {d1['nome']} {d1['cognome']}")

# d1.pop("citta")
# del d1["anni"]
# d1.clear()
# del d1
# print(d1)

dc = d1.copy()
dc = dict(d1)
print(dc)

for k in d1: # itera le chiavi di un dizionario
    print(k, d1[k])
    
for k in d1.keys(): # itera le chiavi di un dizionario
    print(k)
    
for v in d1.values(): # itera i valori di un dizionario
    print(v)
    
for i in d1.items(): # itera le coppie chiave/valore di un dizionario
    print(i)
    
    
# Funzioni in Python
# Creazione di una funzione in python
# def nomeFunc(?parametri)
#   blocco di istruzioni
# Per eseguire una funzione -> nomeFunc()
# Per eseguire una funzione -> nomeFunc(param1, param2, ..., paramN)
# Per eseguire una funzione cone paramentri variabili -> nomeFunc(*params)
# Una funzione in python può avere dei valori di ritorno

def saluta():
    print("Ciao a tutti!!!")
    
def somma(num1, num2):
    res = num1 + num2
    print(f"Il risultato della somma tra {num1} e {num2} è: {res}")
    
def sommaTutto(*nums):
    #print(nums)
    res = 0
    for n in nums:
        res += n
    #print(f"Il risultato della somma è: {res}")
    return res
    
r = sommaTutto(8,3,6,34,2)
print(r)

# Lezione 7

# Moduli
# Un modulo è un file esterno che può contenere variabili, funzioni, classi, oggetti ecc
# Per poter utilizzare un modulo si deve importare nel progetto
# possiamo utilizzare degli alias per importare un modulo
# import miomodulo as mm
# abbiamo tutta una serie di moduli built in o moduli di terze parti 
# dir(nomemodulo) -> stampo tutti i metodi del modulo   

import miomodulo as mm # importo gli elementi definiti nel file miomodulo.py
# import math # importo l'intera libreria math nel progetto
from math import sqrt, floor, ceil # importo solo la funzione sqrt del modulo math
import platform as p # importo un modulo per la lettura del device con cui mi sto collegando
import datetime as d # importo un modulo per la gestione delle date

print(mm.miaVar) # utilizzo la variabile miaVar definita nel modulo miomodulo.py
print(mm.miaFunc()) # utilizzo la funzione maiFunc() definita nel modulo miomodulo.py

# Esempi modulo math
num = 12.9
# print(math.sqrt(num))
# print(math.floor(num))
# print(math.ceil(num))
print(sqrt(num))
print(floor(num))
print(ceil(num))

# Esempi modulo platform
print(p.architecture())
print(p.processor())
print(p.system())
print(p.python_version())
print(p.machine())

# Esempi modulo datetime
print(d.datetime.now())
print(d.date.today())
print(d.datetime.now().strftime("%H:%M"))
print(d.date.today().strftime("%d-%m-%Y"))

# PIP
# Installatore di pacchetti per python
# pip --version -> verifica la presenza e la versione di PIP installata
# py -m pip install --upgrade pip  -> aggiornamento di PIP
# https://pypi.org/ -> Python package
# https://pypi.org/project/Genuine-fake/

from genuine.fake import GenuineFake as gf
print(gf.name())
print(gf.book())
print(gf.american_president())
print(gf.car_brand())
print(gf.drink())
print(gf.random_date())

