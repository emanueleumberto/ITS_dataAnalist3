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