
# Esercizio 1
# Chiediamo un nome, cognome, città ed età da terminale 
# verifichiamo inoltre se i valori inseriti sono corretti
# verifichiamo se l'utente è maggiorenne o minorenne
# verifichiamo inoltre se la città è compresa tra 
#   ['Milano', 'Roma', 'Napoli']
# se tutte le condizioni sono verificate
# stampare nel terminale 'nome cognome (città) 
#   anni è maggiorenne/minorenne
# altrimenti stampare messaggi di errore 

firstname = 'Mario' #input('Inserisci il tuo nome: ').strip()
lastname = 'Rossi' #input('Inserisci il tuo cognome: ').strip()
city = 'Roma' #input('Inserisci la tua città: ').strip()
age = 20 #int(input('Inserisci la tua età: ').strip())

if(len(firstname) >= 3 and len(lastname) >= 3 and len(city) >= 0):
    if(age >= 0 and age <= 120):
        if(city in ['Milano', 'Roma', 'Napoli']):
            str = '{} {} ({}) anni {} - {}'
            if(age < 18):
                print(str.format(firstname, lastname, city, age, 'minorenne'))
            else:
                print(str.format(firstname, lastname, city, age, 'maggiorenne'))
        else:
            print("Città non compresa tra ['Milano', 'Roma', 'Napoli']!!")
    else:
        print("Valore età errato!!")
else:
    print("Valori inseriti Errati!!!")
    
print('----------------------------------------------')

# Esercizio 2
# Scriviamo un programma che chiede in input 3 nomi. 
# Dopo stampare le prime 3 cifre del nome seguito da ...

# Soluzione non del tutto corretta
# nome1 = input('Inserisci il nome: ')
# nome2 = input('Inserisci il nome: ')
# nome3 = input('Inserisci il nome: ')
# print(nome1[0:3] + '...')
# print(nome2[0:3] + '...')
# print(nome3[0:3] + '...')

# Soluzione senza l'utilizzo di una lista
c = 0
l = int(input("quanti nomi vuoi inserire? "))
while c<l:
    nome = input('Inserisci il nome: ')
    print(nome[0:3] + '...')
    c += 1

# Soluzione con la lista
listaNomi = [] # list()
l = int(input("quanti nomi vuoi inserire? "))

while (len(listaNomi) < l):
    listaNomi.append(input('Inserisci il nome: '))
else:
    for ele in listaNomi:
       print(ele[0:3] + '...')

# Utilizzando una lista, chiedere da input 5 nomi univoci 
# (senza duplicati). Dopo stampare il numero di inserimenti 
# fatti e la lista di nomi

listaNomi = [] # list()
ins = 0
while (len(listaNomi) < 0):
    nome = input('Inserisci il nome: ')
    ins += 1
    if(nome not in listaNomi):
        listaNomi.append(nome)
else:
    print(ins, listaNomi)
    
print('----------------------------------------------')

# Esercizio 3

# Crea una tupla chiamata persona contenente le seguenti informazioni:
# nome, cognome, età, città
# Stampa l'intera tupla
# Stampa separatamente ciascun elemento della tupla(Uno per riga)
# inserendo una etichetta chiara (Nome: , Cognome: ...)
# verifica se l'età è maggiore o uguale a 18 e stampa un messaggio 
# adeguato (La persona nome cognome è maggiorenne oppure minorenne)

persona = ('Mario', 'Rossi', 25, 'Roma')
print(persona)
(nome, cognome, eta, citta) = persona
# print('Nome:', nome, 'Cognome:', cognome, 'Età: ', eta, 'Città: ',citta)
print(f"Nome: {nome} Cognome: {cognome}, Età: {eta} Città: {citta}")
if(eta >= 18):
    # print('La persona ' + nome + ' ' + cognome + ' è maggiorenne')
    print(f"La persona {nome} {cognome} è maggiorenne")
else:
    # print('La persona ' + nome + ' ' + cognome + ' è minorenne')
    print(f"La persona {nome} {cognome} è minorenne")
    
print('----------------------------------------------')

# Esercizio 4

# Un piccolo negozio di libri desidera gestire il proprio catalogo 
# in maniera semplice. 
# Ogni libro è rappresentato da una tupla contenente le seguenti 
# informazioni: 
# (titolo: str, autore: str, anno_pubblicazione: int, prezzo: float)
# Scrivi uno script Python che soddisfi i seguenti requisiti:
# - Crea una lista di almeno 5 libri, ciascuno rappresentato 
#   come una tupla nel formato sopra indicato.
# - Stampa tutti i libri presenti nel catalogo, uno per riga, 
#   formattando le informazioni in modo leggibile 
#   (es. “Titolo: ..., Autore: ..., Anno: ..., Prezzo: ...”).
# - Chiedi all’utente un anno, quindi stampa tutti i libri 
#   pubblicati dopo quell’anno.
# - Chiedi all’utente il nome di un autore e mostra 
#   tutti i libri scritti da quell’autore.
# - Calcola e stampa il prezzo medio dei libri presenti nel catalogo.
# - Trova e stampa il libro più costoso nel catalogo.
# - Poiché le tuple sono immutabili, spiega in un commento come 
#   potresti aggiornare il prezzo di un libro 



# Crea una lista di almeno 5 libri, ciascuno rappresentato 
#   come una tupla nel formato indicato.
# (titolo: str, autore: str, anno_pubblicazione: int, prezzo: float)

catalogo = [
    ("Il nome della rosa", "Umberto Eco", 1980, 12.99),
    ("1984", "George Orwell", 1949, 9.50),
    ("Il piccolo principe", "Antoine de Saint-Exupéry", 1943, 7.20),
    ("Harry Potter e la pietra filosofale", "J.K. Rowling", 1997, 15.00),
    ("Il signore degli anelli", "J.R.R. Tolkien", 1954, 18.75)
]

# - Stampa tutti i libri presenti nel catalogo, uno per riga, 
#   formattando le informazioni in modo leggibile 
#   (es. “Titolo: ..., Autore: ..., Anno: ..., Prezzo: ...”).

for libro in catalogo:
    (titolo, autore, anno_pubblicazione, prezzo) = libro
    print(f"Titolo: {titolo}, Autore: {autore}, Anno: {anno_pubblicazione}, Prezzo: {prezzo}")

print()

# - Chiedi all’utente un anno, quindi stampa tutti i libri 
#   pubblicati dopo quell’anno.

anno = int(input('Inserisci anno di pubblicazione: '))
print(f"Libri pubblicati dopo il {anno}: ")
libriTrovati = False

for libro in catalogo:
    if(libro[2] > anno): # libro[2] = anno_pubblicazione
        print(f"    - {libro[0]} -> {libro[2]}")
        libriTrovati = True
if(not libriTrovati):
    print(f"    Non ci sono libri pubblicati dopo il {anno}")
    
print()

# - Chiedi all’utente il nome di un autore e mostra 
#   tutti i libri scritti da quell’autore.

nomeAutore = input('Inserisci il nome di un autore: ').strip().upper()
print(f"Libri pubblicati da {nomeAutore.title()}: ")
libriTrovati = False

for libro in catalogo:
    if(libro[1].upper()== nomeAutore): # libro[1] = autore
        print(f"    - {libro[0]} -> {libro[1]}")
        libriTrovati = True

if(not libriTrovati):
    print(f"    Non ci sono libri di questo autore ({nomeAutore.title()})")
    
print()

# - Calcola e stampa il prezzo medio dei libri presenti nel catalogo.
# Soluzione 1
sommaPrezzoLibri = 0
for libro in catalogo:
    sommaPrezzoLibri += libro[3]
prezzoMedio = sommaPrezzoLibri / len(catalogo)
print(f"Prezzo medio dei libri nel catalogo: {prezzoMedio} ")

# Soluzione 2
prezziLibri = [libro[3] for libro in catalogo] 
print(prezziLibri)
prezzoMedio = sum(prezziLibri) / len(catalogo)
print(f"Prezzo medio dei libri nel catalogo: {prezzoMedio} ")

print()

# - Trova e stampa il libro più costoso nel catalogo.

# Soluzione 1
libroCostoso = catalogo[0]
for libro in catalogo:
    if(libro[3] > libroCostoso[3]):
        libroCostoso = libro
print(f"Il libro più costoso nel catalogo è: {libroCostoso[0]} ")

# Soluzione 2
def estrai_prezzo(libro):
    return libro[3]  # restituisce il prezzo (indice 3)

libroCostoso = max(catalogo, key=estrai_prezzo)

# Soluzione 3
libroCostoso = max(catalogo, key=lambda x: x[3])
print(f"📖 Libro più costoso: {libroCostoso[0]} di {libroCostoso[1]}, €{libroCostoso[3]:.2f}")

# - Poiché le tuple sono immutabili, spiega in un commento come 
#   potresti aggiornare il prezzo di un libro 

vecchio_libro = catalogo[0]
nuovo_prezzo = 13.99
nuovo_libro = (vecchio_libro[0], vecchio_libro[1], vecchio_libro[2], nuovo_prezzo)
print(f"Vecchio: {vecchio_libro}")
print(f"Nuovo:  {nuovo_libro}")

print('----------------------------------------------')