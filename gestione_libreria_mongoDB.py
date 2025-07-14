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