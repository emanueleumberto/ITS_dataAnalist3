# Chiediamo un nome, cognome, città ed età da terminale 
# verifichiamo inoltre se i valori inseriti sono corretti
# verifichiamo se l'utente è maggiorenne o minorenne
# verifichiamo inoltre se la città è compresa tra 
#   ['Milano', 'Roma', 'Napoli']
# se tutte le condizioni sono verificate
# stampare nel terminale 'nome cognome (città) 
#   anni è maggiorenne/minorenne
# altrimenti stampare messaggi di errore 

firstname = input('Inserisci il tuo nome: ').strip()
lastname = input('Inserisci il tuo cognome: ').strip()
city = input('Inserisci la tua città: ').strip()
age = int(input('Inserisci la tua età: ').strip())

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