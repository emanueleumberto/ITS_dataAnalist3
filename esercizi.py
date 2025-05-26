
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
while (len(listaNomi) < 5):
    nome = input('Inserisci il nome: ')
    ins += 1
    if(nome not in listaNomi):
        listaNomi.append(nome)
else:
    print(ins, listaNomi)

# Crea una tupla chiamata persona contenente le seguenti informazioni:
# nome, cognome, età, città
# Stampa l'intera tupla
# Stampa separatamente ciascun elemento della tupla(Uno per riga)
# inserendo una etichetta chiara (Nome: , Cognome: ...)
# verifica se l'età è maggiore o uguale a 18 e stampa un messaggio 
# adeguato (La persona nome cognome è maggiorenne oppure minorenne)


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
#   (suggerisci di sostituire la tupla con una nuova).