from genuine.fake import GenuineFake as gf
import datetime as d

def genera_profili(n):
    profili_utente = []
    
    while(len(profili_utente) < n):
        date_of_birth = gf.date_of_birth()
        utente = {
            'nomeCompleto': gf.name(), 
            'email': gf.email(),
            'dataNascita': date_of_birth,
            'eta': calcola_eta(date_of_birth),
            'indirizzo': gf.capital_city() + ' ' + gf.country(),
            'dataCreazione': d.date.today()}
        profili_utente.append(utente)
    
    return profili_utente

def calcola_eta(dataNascita):
    today_year = d.date.today().strftime('%Y')
    year_of_birth = dataNascita.split(' ')[2]
    return int(today_year) - int(year_of_birth)

def stampa_profili(listaProfili):
    print('******* Lista Profili generati *********')
    for p in listaProfili:
        print(f"Nome Profilo: {p['nomeCompleto']}")
        print(f"Email: {p['email']}")
        print(f"Data di Nascita: {p['dataNascita']}")
        print(f"Età: {p['eta']}")
        print(f"Indirizzo: {p['indirizzo']}")
        print(f"Data di creazione: {p['dataCreazione']}")
        print('-------------------------------')
        print()
    
    print(f"Numero di profili: {len(listaProfili)}" )