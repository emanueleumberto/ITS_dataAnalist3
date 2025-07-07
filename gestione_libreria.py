""" 
Creare un'applicazione in Python che utilizza MySQL per gestire un sistema 
di libreria, includendo la gestione del prestito dei libri.

Setup del progetto:

Installare le librerie necessarie (mysql.connector per interagire con Mysql).
Creare un database chiamato libreria e una tabella chiamata libri 
opz(utenti, prestiti).

Definizione del libro: Ogni libro deve avere i seguenti attributi:

titolo (string)
autore (string)
anno_pubblicazione (int)
genere (string)
disponibile (boolean)
prestiti (lista di oggetti che contengono informazioni sul prestito, 
come nome del prestatario e data del prestito)

Funzionalità dell'applicazione:

Aggiungi libro:     Implementare una funzione che consente di aggiungere un nuovo 
                    libro alla collezione.
Visualizza libri:   Implementare una funzione che mostra tutti i libri presenti 
                    nella collezione, evidenziando se sono disponibili o meno.
Modifica libro:     Implementare una funzione che consente di modificare le 
                    informazioni di un libro esistente (identificato da titolo 
                    o autore).
Elimina libro:      Implementare una funzione per rimuovere un libro dalla 
                    collezione.
Prestito libro:     Implementare una funzione che consente di prestare un libro 
                    a un utente. Dovrà aggiornare lo stato del libro e 
                    registrare le informazioni del prestito.
Restituzione libro: Implementare una funzione che consente di restituire un libro, 
                    aggiornando lo stato del libro e rimuovendo il prestito 
                    dalla lista.

Interfaccia utente:

Creare un semplice menu a console che permetta all'utente di scegliere quale 
operazione eseguire (aggiungere, visualizzare, modificare, eliminare, 
prestare o restituire un libro).
Gestire le eccezioni per garantire che l'input dell'utente sia valido.
"""

import mysql.connector as mc

db = mc.connect(
    host='localhost',
    port=3306,
    user='root',
    password='root',
    database='libreria_db'
)

cursor = db.cursor()

def create_table_books():
    sql = """ CREATE TABLE IF NOT EXISTS books (
            book_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
            title VARCHAR(100) NOT NULL,
            author VARCHAR(100) NOT NULL,
            publication_year INT NOT NULL,
            genre VARCHAR(50) NOT NULL,
            available BOOLEAN NULL DEFAULT true
        ) """
    cursor.execute(sql)
    
def create_table_users():
    sql = """ CREATE TABLE IF NOT EXISTS users (
            user_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
            firstname VARCHAR(100) NOT NULL,
            lastname VARCHAR(100) NOT NULL,
            age INT NOT NULL,
            email VARCHAR(100) NOT NULL UNIQUE,
            phone VARCHAR(50) NOT NULL UNIQUE
        ) """
    cursor.execute(sql)
    
def create_table_loans():
    sql = """ CREATE TABLE IF NOT EXISTS loans (
            loan_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
            book_id INT NOT NULL,
            user_id INT NOT NULL,
            loan_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
                ON UPDATE CURRENT_TIMESTAMP,
            CONSTRAINT loan_book_fk FOREIGN KEY(book_id) REFERENCES books(book_id) 
                ON DELETE CASCADE ON UPDATE CASCADE,
            CONSTRAINT loan_user_fk FOREIGN KEY(user_id) REFERENCES users(user_id)
                ON DELETE CASCADE ON UPDATE CASCADE
        ) """
    cursor.execute(sql)

create_table_books()
create_table_users()
create_table_loans()

# Aggiungi libro:Implementare una funzione che consente di aggiungere un nuovo libro alla collezione.
def addBook():
    title = input('Inserisci titolo:') or 'Follia'
    author = input('Inserisci autore:') or 'Patrick McGrath'
    publication_year = int(input('Inserisci anno di pubblicazione:')) or 2012
    genre = input('Inserisci genere:') or 'Narrativa'
    
    sql = 'INSERT INTO books (title, author, publication_year, genre)\
                    VALUES (%s, %s, %s, %s)'
    values = (title, author, publication_year, genre)
    cursor.execute(sql, values)
    db.commit()
    if cursor._last_insert_id:
        print(f'Libro {title} salvato nel DB!')
    else:
        print(f'Errore di salvataggio!!!')

# Visualizza libri: Implementare una funzione che mostra tutti i libri presenti nella collezione, evidenziando se sono disponibili o meno.    
def viewBooks():
    sql = 'SELECT * FROM books'
    cursor.execute(sql)
    books = cursor.fetchall()

    for book in books:
        stato = 'Disponibile' if book[5] else 'Non Disponibile'
        print(f"{book[0]} -> {book[1]} ({book[2]}) anno di pubblicazione: {book[3]} Genere: {book[4]} Stato: {stato}")

# Visualizza libro: Implementare una funzione che mostra il dettagli di un libro
def book_detail(id):
    sql = 'SELECT * FROM books WHERE book_id = %s'
    cursor.execute(sql,(id,))
    book = cursor.fetchone()
    return book
    
# Modifica libro: Implementare una funzione che consente di modificare le informazioni di un libro esistente (identificato da id).
def updateBook():
    id = int(input('Inserisci il codice univoco del libro da modificare:'))
    book = book_detail(id)
    if book:
        title = input(f'Inserisci nuovo titolo ({book[1]}):') or book[1]
        author = input(f'Inserisci nuovo autore ({book[2]}):') or book[2]
        publication_year = int(input(f'Inserisci nuovo anno di pubblicazione ({book[3]}):')) or book[3]
        genre = input(f'Inserisci nuovo genere ({book[4]}):') or book[4]
        
        sql = 'UPDATE books SET title = %s, author = %s, publication_year = %s, \
                genre = %s WHERE book_id = %s'
        values = (title, author, publication_year, genre, book[0])
        cursor.execute(sql, values)
        db.commit()
        print(f'Libro {title} modificato nel DB.')
    else:
        print(f'Libro non trovato!')

# addBook()
# viewBooks()
# book_detail(2)
# updateBook()