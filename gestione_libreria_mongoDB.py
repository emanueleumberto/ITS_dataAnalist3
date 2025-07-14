""" Creare un'applicazione in Python che utilizza MongoDB per gestire un 
sistema di libreria, includendo la gestione del prestito dei libri.

Setup del progetto:

Installare le librerie necessarie (pymongo per interagire con MongoDB).
Creare un database chiamato libreria e una collezione chiamata libri opz(utenti).

Definizione del libro: Ogni libro deve avere i seguenti attributi:

titolo (string)
autore (string)
anno_pubblicazione (int)
genere (string)
disponibile (boolean)
prestiti (lista di oggetti che contengono informazioni sul prestito, 
come nome del prestatario e data del prestito)

Funzionalità dell'applicazione:

Aggiungi libro: Implementare una funzione che consente di aggiungere 
                un nuovo libro alla collezione.
Visualizza libri: Implementare una funzione che mostra tutti i libri 
                presenti nella collezione, evidenziando se sono disponibili o meno.
Modifica libro: Implementare una funzione che consente di modificare 
                le informazioni di un libro esistente
                (identificato da titolo o autore).
Elimina libro: Implementare una funzione per rimuovere un libro dalla collezione.
Prestito libro: Implementare una funzione che consente di prestare un libro 
                a un utente. Dovrà aggiornare lo stato del libro e registrare 
                le informazioni del prestito.
Restituzione libro: Implementare una funzione che consente di restituire un libro, 
                aggiornando lo stato del libro e rimuovendo il prestito dalla lista.

Interfaccia utente:

Creare un semplice menu a console che permetta all'utente di scegliere quale operazione eseguire (aggiungere, visualizzare, modificare, eliminare, prestare o restituire un libro).
Gestire le eccezioni per garantire che l'input dell'utente sia valido.


 """
 
 
from pymongo import MongoClient
from datetime import datetime

connectionString = 'mongodb+srv://admin:md75U6GzY7aY7YpG@cluster0.7opl1ou.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0'
cluster = MongoClient(connectionString)
db = cluster['EsercizioLibreriaMongoDb']

if "books" not in db.list_collection_names():
    # Se non presente la crea, altrimenti la ignora
    db.create_collection("books")
    
# Collection utenti (opzionale) se vogliamo utilizzare le reference
if "users" not in db.list_collection_names():
    # Se non presente la crea, altrimenti la ignora
    db.create_collection("users")
    
books = db['books']
users = db['users']

# Funzioni per la gestione della libreria

# Aggiungi libro: Implementare una funzione che consente di aggiungere un nuovo libro alla collezione.
def add_book():
    book = {
        "title": input('Inserisci titolo:') or 'Follia',
        "author": input('Inserisci autore:') or 'Patrick McGrath',
        "publication_year": int(input('Inserisci anno di pubblicazione:')) or 2012,
        "genre": input('Inserisci genere:') or 'Narrativa',
        "available": True,
        "loans": []
    }
    result = books.insert_one(book)
    if result.inserted_id:
        print(f'Libro {book["title"]} salvato nel DB!')
    else:
        print(f'Errore di salvataggio!!!')
        
# Visualizza libri: Implementare una funzione che mostra tutti i libri presenti nella collezione, evidenziando se sono disponibili o meno.
def view_books():
    bookList = books.find()

    for book in bookList:
        stato = 'Disponibile' if book['available'] else 'Non Disponibile'
        print(f"{book['_id']} -> {book['title']} ({book['author']}) anno di pubblicazione: {book['publication_year']} Genere: {book['genre']} Stato: {stato}")

# Prestito libro: Implementare una funzione che consente di prestare un libro a un utente. 
# Dovrà aggiornare lo stato del libro e registrare le informazioni del prestito. 
def loan_book():
    print('******** Elenco libri ***********')
    view_books()
    title = input('Inserisci il titolo del libro:')
    book = books.find_one({'title': title})
    
    print(book)
    
    if book and book['available']:
        user = {
            'name': input('Inserisci nome e cognome dell\'utente:'),
            'data': datetime.now()
        }
        books.update_one(
            {'title': book['title']}, 
            {"$set": {
                "available": False,
                "loans":[user]
        }})
        print(f'Libro {title} preso in prestito da {user['name']}')
    else: 
        print(f'Libro {title} non disponibile!!')

# Restituzione libro: Implementare una funzione che consente di restituire un libro, 
# aggiornando lo stato del libro e rimuovendo il prestito dalla lista.

def return_book():
    title = input('Inserisci il titolo del libro da restituire:')
    book = books.find_one({'title': title})
    
    if book and not book['available']:
        book['loans'].pop()
        books.update_one(
            {'title': book['title']}, 
            {"$set": {
                "available": True,
                "loans":book['loans']
        }})
        print(f'Libro {title} restituito!!')
    else: 
        print(f'Libro {title} non disponibile!!')

# add_book()
# view_books()
# loan_book()
# return_book()