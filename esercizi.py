
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

c = 0
l = int(input("quanti nomi vuoi inserire? "))
while c<l:
    nome = input('Inserisci il nome: ')
    print(nome[0:3] + '...')
    c += 1