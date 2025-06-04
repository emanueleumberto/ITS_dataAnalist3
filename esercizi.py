
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
libroCostoso = max(catalogo, key=lambda libro: libro[3])
print(f"📖 Libro più costoso: {libroCostoso[0]} di {libroCostoso[1]}, €{libroCostoso[3]:.2f}")

# - Poiché le tuple sono immutabili, spiega in un commento come 
#   potresti aggiornare il prezzo di un libro 

vecchio_libro = catalogo[0]
nuovo_prezzo = 13.99
nuovo_libro = (vecchio_libro[0], vecchio_libro[1], vecchio_libro[2], nuovo_prezzo)
print(f"Vecchio: {vecchio_libro}")
print(f"Nuovo:  {nuovo_libro}")

print('----------------------------------------------')


# Esercizio 5

# Sei incaricato di gestire le iscrizioni a due eventi: 
# Python Day e Data Science Lab. 
# Ogni partecipante fornisce il proprio nome, cognome, città e età. 
# Alcuni partecipanti possono iscriversi a entrambi gli eventi. 
# Il tuo compito è analizzare i dati raccolti utilizzando set e dizionari.
# - Tramite un ciclo effettuare la registrazione di partecipanti e 
#   prevedere un fine registrazione.
# - Richiedere all'utente tramite input di inserire N partecipanti al Python Day, 
#   fornendo per ciascun iscritto il nome, il cognome, la città ed età 
#   (es. Alice,Neri,Roma,30).
# - Richiedere all'utente di inserire i partecipanti al Data Science Lab, 
#   con le stesse modalità.
# - Memorizzare i dati in dizionari, dove le chiavi sono nome,cognome,citta ed eta  
# - Controllare le età degli iscritti e se superiore a 20 salvarli 
#   in un set di nome PythonDay o DataScienceLab altrimenti stampare un errore.
# - Utilizzare i set per determinare:
#       L'insieme completo dei partecipanti unici.
#       I partecipanti iscritti a entrambi gli eventi.
#       I partecipanti esclusivi di ciascun evento.
# - Stampare:
#       il numero totale e i partecipanti a ciascun evento
#       il numero totale e i partecipanti unici    
#       il numero totale e i partecipanti esclusivi di ciascun evento. 

st = 'Alice,Neri,Roma,30'
s = st.split(',') # ['Alice', 'Neri', 'Roma', 30]
s[0].strip() # Alice

python_day = set(('Alice,Neri,Roma,30', 'Mario,Rossi,Milano,35', 'Francesca,Neri,Palermo,22'))
data_science_lab = set(('Giuseppe,Verdi,Torino,54', 'Alice,Neri,Roma,30', 'Antonio,Bianchi,Firenze,52'))

print('--------- Registrazione Partecipanti --------------')
while True:
    dati = input("Inserisci dati partecipante es.Alice,Neri,Roma,30 o fine per terminare: ").strip()
    if dati.strip().lower() == 'fine':
        break
    dati_partecipante = dati.split(',')
    if len(dati_partecipante) == 4:
        eta = int(dati_partecipante[3])
        if eta > 20:
            """ partecipante_dict= {
                'nome': dati_partecipante[0],
                'cognome': dati_partecipante[1],
                'citta': dati_partecipante[2],
                'eta': eta
            }
            print(type(partecipante_dict), partecipante_dict) """
            
            while True:
                print('A quale evento vuoi registrarti?')
                dati_evento = input('1 - Python Day | 2 - Data Science Lab -> ')
                if(dati_evento not in ['1', '2']):
                    print('Evento non corretto...')
                else:
                    if dati_evento == '1':
                        print(f"Registrazione effettuata a Python Day")
                        python_day.add(dati)
                    else:
                        print(f"Registrazione effettuata a Data Science Lab")
                        data_science_lab.add(dati)
                    break
        else:
           print('Età inferiore a 20... non puoi registrarti all\'evento') 
    else:
        print('Formato valori inseriti errato, es.Alice,Neri,Roma,30')
    

# L'insieme completo dei partecipanti unici.
partecipanti_unici = python_day.union(data_science_lab)
# print(partecipanti_unici)
# partecipanti_unici = python_day | data_science_lab
# print(partecipanti_unici)

# I partecipanti iscritti a entrambi gli eventi.
partecipanti_comuni = python_day.intersection(data_science_lab)
# print(partecipanti_comuni)
# partecipanti_comuni = python_day & data_science_lab
# print(partecipanti_comuni)

# I partecipanti esclusivi di ciascun evento.
partecipanti_python_day = python_day.difference(data_science_lab)
# print(partecipanti_python_day)
# partecipanti_python_day = python_day - data_science_lab
# print(partecipanti_python_day)
partecipanti_data_science_lab = data_science_lab.difference(python_day)

# print(python_day)
# print(data_science_lab)

# - Stampare:
#       il numero totale e i partecipanti a ciascun evento
#       il numero totale e i partecipanti unici    
#       il numero totale e i partecipanti esclusivi di ciascun evento. 

""" print('Numero totale e i partecipanti a ciascun evento')
print(' ***** Python Day *****')
for partecipante in python_day:
    dati_partecipante = partecipante.split(',')
    partecipante_dict= {
        'nome': dati_partecipante[0],
        'cognome': dati_partecipante[1],
        'citta': dati_partecipante[2],
        'eta': eta
    }
    print(f"    Partecipante: {partecipante_dict['nome']} {partecipante_dict['cognome']} anni {partecipante_dict['eta']} - {partecipante_dict['citta']}")
print(f"Numero totale partecipanti: {len(python_day)}")

print(' ***** Data Science Lab *****')
for partecipante in data_science_lab:
    dati_partecipante = partecipante.split(',')
    partecipante_dict= {
        'nome': dati_partecipante[0],
        'cognome': dati_partecipante[1],
        'citta': dati_partecipante[2],
        'eta': eta
    }
    print(f"    Partecipante: {partecipante_dict['nome']} {partecipante_dict['cognome']} anni {partecipante_dict['eta']} - {partecipante_dict['citta']}")
print(f"Numero totale partecipanti: {len(data_science_lab)}")

print()
print('Numero totale e i partecipanti unici')
print(' ***** Partecipanti unici *****')
for partecipante in partecipanti_unici:
    dati_partecipante = partecipante.split(',')
    partecipante_dict= {
        'nome': dati_partecipante[0],
        'cognome': dati_partecipante[1],
        'citta': dati_partecipante[2],
        'eta': eta
    }
    print(f"    Partecipante: {partecipante_dict['nome']} {partecipante_dict['cognome']} anni {partecipante_dict['eta']} - {partecipante_dict['citta']}")
print(f"Numero totale partecipanti: {len(partecipanti_unici)}")

print()
print('Numero totale e partecipanti iscritti ad entrambi gli eventi')
print(' ***** Partecipanti comuni *****')
for partecipante in partecipanti_comuni:
    dati_partecipante = partecipante.split(',')
    partecipante_dict= {
        'nome': dati_partecipante[0],
        'cognome': dati_partecipante[1],
        'citta': dati_partecipante[2],
        'eta': eta
    }
    print(f"    Partecipante: {partecipante_dict['nome']} {partecipante_dict['cognome']} anni {partecipante_dict['eta']} - {partecipante_dict['citta']}")
print(f"Numero totale partecipanti: {len(partecipanti_comuni)}")

print()
print('Numero totale e partecipanti esclusivi di Python Day')
print(' ***** Partecipanti esclusivi di Python Day *****')
for partecipante in partecipanti_python_day:
    dati_partecipante = partecipante.split(',')
    partecipante_dict= {
        'nome': dati_partecipante[0],
        'cognome': dati_partecipante[1],
        'citta': dati_partecipante[2],
        'eta': eta
    }
    print(f"    Partecipante: {partecipante_dict['nome']} {partecipante_dict['cognome']} anni {partecipante_dict['eta']} - {partecipante_dict['citta']}")
print(f"Numero totale partecipanti: {len(partecipanti_python_day)}")

print()
print('Numero totale e partecipanti esclusivi di Data Science Lab')
print(' ***** Partecipanti esclusivi di Data Science Lab *****')
for partecipante in partecipanti_data_science_lab:
    dati_partecipante = partecipante.split(',')
    partecipante_dict= {
        'nome': dati_partecipante[0],
        'cognome': dati_partecipante[1],
        'citta': dati_partecipante[2],
        'eta': eta
    }
    print(f"    Partecipante: {partecipante_dict['nome']} {partecipante_dict['cognome']} anni {partecipante_dict['eta']} - {partecipante_dict['citta']}")
print(f"Numero totale partecipanti: {len(partecipanti_data_science_lab)}")
 """
 
 
# Soluzione con utilizzo di funzioni
def stampaPartecipanti(titolo, partecipanti):
    print('/n')
    print(f" ***** Partecipanti esclusivi di {titolo} *****")
    for partecipante in partecipanti:
        dati_partecipante = partecipante.split(',')
        partecipante_dict= {
            'nome': dati_partecipante[0],
            'cognome': dati_partecipante[1],
            'citta': dati_partecipante[2],
            'eta': eta
        }
        print(f"    Partecipante: {partecipante_dict['nome']} {partecipante_dict['cognome']} anni {partecipante_dict['eta']} - {partecipante_dict['citta']}")
    print(f"Numero totale partecipanti: {len(partecipanti)}")
    
stampaPartecipanti('Python Day', python_day)
stampaPartecipanti('Data Science Lab', data_science_lab)
stampaPartecipanti('Partecipanti unici', partecipanti_unici)
stampaPartecipanti('Partecipanti comuni', partecipanti_comuni)
stampaPartecipanti('Partecipanti esclusivi di Python Day', partecipanti_python_day)
stampaPartecipanti('Partecipanti esclusivi di Data Science Lab', partecipanti_data_science_lab)

print('------- Fine -------')


# Esercizio 6

# Chiedere all'utente tramite input il numero di registrazioni 
# da effettuare,
# tramite una funzione registrare n utenti con questa forma
# {'firstname': '', 'lastname': '', 'age': '', 'city': ''}
# inserire gli utenti in una lista e ritornare la lista
# Tramite una seconda funzione, passare la lista di utenti registrati 
# come paramentro e stampare nel terminale il contenuto

def registrazione(num):
    users = []
    while len(users) < int(num):
        user = {'firstname': '', 'lastname': '', 'age': '', 'city': ''}

        user['firstname'] = input('Inserisci il nome: ')
        user['lastname'] = input('Inserisci il cognome: ')
        user['age'] = input('Inserisci età: ')
        user['city'] = input('Inserisci città: ')
        
        users.append(user)
    return users
    
def stampa(users):
    for ele in users:
        print(f"Ciao {ele['firstname']} {ele['lastname']} - {ele['city']} | anni: {ele['age']}")
        
print('------------------------------------------------')
    
numRegistrazioni = input('Inserisci il numero di registrazioni che vuoi fare: ')
userList = registrazione(numRegistrazioni)
stampa(userList) 

print('------------------------------------------------')

numRegistrazioni = input('Inserisci il numero di registrazioni che vuoi fare: ')
userList = registrazione(numRegistrazioni)
stampa(userList) 

# Esercizio 7

# Creare un’applicazione Python per simulare la generazione di profili utente 
# utilizzando un modulo esterno (genuine-fake) e 
# organizzare il progetto con file separati
# generatore.py:
#   Importa GenuineFake dal modulo genuine-fake.
#   Definisce una funzione genera_profili(n) che:
#       Genera n profili fittizi contenenti:
#           Nome completo, Email, Data di nascita, eta(calcolata)
#           Indirizzo (città + stato), data creazione(datetime)
#       Restituisce i dati come lista di dizionari.
# main.py:
#   Importa genera_profili da generatore.py
#   Chiede all’utente quanti profili generare.
#   Visualizza i profili in output, ben formattati.

import generatore as g

numProfili = int(input('Quanti profili utente vuoi generare?'))
listaProfili = g.genera_profili(numProfili)
g.stampa_profili(listaProfili)
