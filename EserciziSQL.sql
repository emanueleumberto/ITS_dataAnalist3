-- Organizzazione istituti bancari
CREATE DATABASE IF NOT EXISTS organizzazione_istituti_bancari;

USE organizzazione_istituti_bancari;

CREATE TABLE IF NOT EXISTS banche(
	codice INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    indirizzo VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS filiali(
	codice INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    indirizzo VARCHAR(255) NOT NULL,
    telefono VARCHAR(25),
    codice_banca INT NOT NULL,
    CONSTRAINT banca_filiale_fk FOREIGN KEY(codice_banca)
		REFERENCES banche(codice)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS direttori(
	codice INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    cognome VARCHAR(100) NOT NULL,
    nome VARCHAR(100) NOT NULL,
    telefono VARCHAR(25),
    email VARCHAR(100) NOT NULL UNIQUE,
    codice_filiale INT NOT NULL UNIQUE,
    CONSTRAINT filiale_direttore_fk FOREIGN KEY(codice_filiale)
		REFERENCES filiali(codice)
        ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS impiegati(
	codice INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    cognome VARCHAR(100) NOT NULL,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    mansione VARCHAR(50) NOT NULL,
    codice_filiale INT NOT NULL,
    CONSTRAINT filiale_impiegato_fk FOREIGN KEY(codice_filiale)
		REFERENCES filiali(codice)
        ON UPDATE CASCADE ON DELETE RESTRICT
);

-- DML
INSERT INTO organizzazione_istituti_bancari.banche (nome, indirizzo) 
	VALUES  ('Banca Nova Italia S.p.A.', 'Via dei Mercanti, 45 – 00184 Roma (RM)'),
			('Credito Popolare del Centro', 'Piazza Garibaldi, 12 – 06123 Perugia (PG)'),
            ('Banca Tirrenica S.r.l.', 'Corso Vittorio Emanuele II, 88 – 80122 Napoli (NA)');
INSERT INTO organizzazione_istituti_bancari.filiali (indirizzo, telefono, codice_banca)
	VALUES  ('Via Roma, 101 – 00185 Roma (RM)', '06 4789 1122', 1),
			('Corso Italia, 56 – 50123 Firenze (FI)', '055 2398 764', 2),
            ('Piazza Castello, 8 – 10121 Torino (TO)', '011 5612 900', 3),
            ('Via Toledo, 321 – 80134 Napoli (NA)', '081 5578 433', 2),
            ('Viale della Libertà, 120 – 90143 Palermo (PA)', '091 6543 221', 1),
            ('Via Emilia Est, 42 – 41121 Modena (MO)', '059 2233 198', 1),
            ('Via Garibaldi, 75 – 16124 Genova (GE)', '010 5521 009', 3),
            ('Via Milano, 10 – 23900 Lecco (LC)', '0341 6722 11', 1),
            ('Via della Repubblica, 203 – 59100 Prato (PO)', '0574 899 300', 2),
            ('Piazza Cavour, 9 – 04100 Latina (LT)', '0773 4412 88', 1);
INSERT INTO organizzazione_istituti_bancari.direttori (cognome,nome,telefono,email,codice_filiale)
	VALUES  ('Rossi', 'Marco', '320 4567 891', 'marco.rossi@bancanova.it', 1),
			('Bianchi', 'Laura', '331 9988 776', 'laura.bianchi@bancanova.it', 2),
            ('Esposito', 'Andrea', '339 1122 334', 'andrea.esposito@bancanova.it', 3),
            ('Verdi', 'Chiara', '347 5566 778', 'chiara.verdi@bancanova.it', 4),
            ('Gallo', 'Stefano', '348 2211 900', 'stefano.gallo@bancanova.it', 5),
            ('Romano', 'Federica', '345 7788 909', 'federica.romano@bancanova.it', 6),
            ('Conti', 'Alessandro', '333 4455 778', 'alessandro.conti@bancanova.it', 7),
            ('De Luca', 'Paola', '328 6677 443', 'paola.deluca@bancanova.it', 8),
            ('Greco', 'Matteo', '327 3322 100', 'matteo.greco@bancanova.it', 9),
            ('Moretti', 'Elisa', '349 7766 554', 'elisa.moretti@bancanova.it', 10);
INSERT INTO organizzazione_istituti_bancari.impiegati (cognome,nome,email,mansione,codice_filiale)
	VALUES 	('Rossi', 'Luca', 'luca.rossi@bancanova.it', 'Addetto sportello', 1),
			('Ferrari', 'Anna', 'anna.ferrari@bancanova.it', 'Consulente clienti', 3),
			('Russo', 'Davide', 'davide.russo@bancanova.it', 'Addetto contabilità', 2),
			('Greco', 'Sara', 'sara.greco@bancanova.it', 'Addetto sportello', 5),
			('Conti', 'Giulia', 'giulia.conti@bancanova.it', 'Analista crediti', 8),
			('Bianchi', 'Alessio', 'alessio.bianchi@bancanova.it', 'Addetto prestiti', 6),
			('Romano', 'Claudia', 'claudia.romano@bancanova.it', 'Operatore back office', 10),
			('De Angelis', 'Marco', 'marco.deangelis@bancanova.it', 'Addetto sportello', 9),
			('Galli', 'Ilaria', 'ilaria.galli@bancanova.it', 'Consulente clienti', 4),
			('Marino', 'Simone', 'simone.marino@bancanova.it', 'Addetto contabilità', 3),
			('Fontana', 'Chiara', 'chiara.fontana@bancanova.it', 'Addetto sportello', 7),
			('Serra', 'Antonio', 'antonio.serra@bancanova.it', 'Operatore back office', 7),
			('Villa', 'Federica', 'federica.villa@bancanova.it', 'Addetto prestiti', 2),
			('Grassi', 'Michele', 'michele.grassi@bancanova.it', 'Consulente clienti', 5),
			('Martini', 'Paola', 'paola.martini@bancanova.it', 'Addetto sportello', 9),
			('Ferri', 'Gabriele', 'gabriele.ferri@bancanova.it', 'Analista crediti', 10),
			('Monti', 'Elena', 'elena.monti@bancanova.it', 'Addetto contabilità', 1),
			('Sartori', 'Lorenzo', 'lorenzo.sartori@bancanova.it', 'Addetto sportello', 3),
			('Testa', 'Valentina', 'valentina.testa@bancanova.it', 'Consulente clienti', 2),
			('Parisi', 'Fabio', 'fabio.parisi@bancanova.it', 'Addetto prestiti', 6);

SELECT * FROM organizzazione_istituti_bancari.banche;
SELECT * FROM organizzazione_istituti_bancari.filiali;
SELECT * FROM organizzazione_istituti_bancari.direttori;
SELECT * FROM organizzazione_istituti_bancari.impiegati;
-- Organizzazione scolastica

CREATE DATABASE IF NOT EXISTS organizzazione_scolastica;

USE organizzazione_scolastica;

CREATE TABLE IF NOT EXISTS istituti (
	codice INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    indirizzo VARCHAR(255) NOT NULL,
    nalunni INT UNSIGNED,
    nclassi INT UNSIGNED,
    ndocenti INT UNSIGNED
);

CREATE TABLE IF NOT EXISTS classi (
	codice INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nalunni INT UNSIGNED,
    nome VARCHAR(100) NOT NULL,
    codice_istituto INT NOT NULL,
    CONSTRAINT classi_istituto FOREIGN KEY(codice_istituto)
		REFERENCES istituti(codice)
        ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS studenti (
	cognome VARCHAR(100) NOT NULL,
    nome VARCHAR(100) NOT NULL,
    datanascita DATE NULL,
    sesso CHAR(1) NULL,
    indirizzo VARCHAR(255) NOT NULL,
    cap CHAR(5) NOT NULL,
    comune VARCHAR(100) NOT NULL,
    provincia CHAR(2) NOT NULL,
    codice_classe INT NOT NULL,
    CONSTRAINT studente_pk PRIMARY KEY(cognome, nome),
    CONSTRAINT studente_classe_fk FOREIGN KEY(codice_classe)
		REFERENCES classi(codice)
);

CREATE TABLE IF NOT EXISTS docenti (
	codice INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	cognome VARCHAR(100) NOT NULL,
    nome VARCHAR(100) NOT NULL,
    datanascita DATE NULL,
    sesso CHAR(1) NULL,
    indirizzo VARCHAR(255) NOT NULL,
    cap CHAR(5) NOT NULL,
    comune VARCHAR(100) NOT NULL,
    provincia CHAR(2) NOT NULL
);

CREATE TABLE IF NOT EXISTS classi_docenti (
	codice_docente INT NOT NULL,
    codice_classe INT NOT NULL,
    materia VARCHAR(100) NOT NULL,
    CONSTRAINT classi_docenti_fk1 FOREIGN KEY(codice_docente)
		REFERENCES docenti(codice),
	CONSTRAINT classi_docenti_fk2 FOREIGN KEY(codice_classe)
		REFERENCES classi(codice)
);



-- DML 
INSERT INTO organizzazione_scolastica.istituti 
				(nome, indirizzo, nalunni, nclassi, ndocenti)
		VALUES  ('Istituto Comprensivo Galileo Galilei', 'Via della Scienza, 12 – 00146 Roma (RM)', 820, 38, 75),
				('Liceo Scientifico Alessandro Volta', 'Viale Europa, 45 – 20126 Milano (MI)', 950, 42, 88),
				('Istituto Tecnico Industriale Enrico Fermi', 'Via dei Tecnici, 3 – 80143 Napoli (NA)', 1040, 47, 92);

INSERT INTO organizzazione_scolastica.classi (nalunni, nome, codice_istituto)
	VALUES  (23, '1A', 1),(25, '1B', 1),(22, '2A', 1),(24, '2B', 1),
			(26, '3A', 2),(27, '3B', 2),(25, '4A', 2),(23, '4B', 2),
			(21, '5A', 2),(24, '1A', 3),(22, '1B', 3),(26, '2A', 3),
			(27, '2B', 3),(23, '3A', 3),(25, '3B', 3);
		
INSERT INTO organizzazione_scolastica.studenti (cognome, nome, datanascita, sesso, indirizzo, cap, comune, provincia, codice_classe)
	VALUES 	('Villadicani', 'Rosina', '2008-10-10', 'F', 'Piazza Polani 747 Piano 6', '41279', 'Sesto Gian ligure', 'BA', 4),
			('Alfonsi', 'Baccio', '2009-01-07', 'M', 'Canale Bianca 43', '01108', 'Cimini calabro', 'TO', 11),
			('Moretti', 'Anita', '2011-05-14', 'M', 'Incrocio Lovato 53', '06061', 'Gustavo veneto', 'AN', 7),
			('Blasi', 'Cristina', '2008-01-08', 'M', 'Strada Lombardi 35 Piano 9', '96846', 'Sesto Iolanda terme', 'RM', 2),
			('Canali', 'Rosalia', '2009-08-17', 'M', 'Contrada Erika 3 Appartamento 48', '53458', 'Sesto Iolanda', 'BA', 9),
			('Dellucci', 'Patrizio', '2008-09-27', 'M', 'Via Bernardo 21', '81511', 'Borgo Enrico ligure', 'SR', 4),
			('Majewski', 'Letizia', '2008-05-14', 'F', 'Borgo Ivan 96', '44950', 'Quarto Fiamma', 'BA', 8),
			('Magrassi', 'Annamaria', '2009-10-19', 'F', 'Viale Boezio 74 Piano 0', '17105', 'Quarto Tatiana laziale', 'RM', 13),
			('Cassarà', 'Luciano', '2010-08-07', 'M', 'Piazza Ettore 73', '30220', 'Valguarnera umbro', 'CT', 6),
			('Leonetti', 'Greco', '2007-09-01', 'F', 'Viale Salvemini 76', '64960', 'Borgo Giuseppe', 'FI', 4),
			('Salvini', 'Alfio', '2005-06-20', 'M', 'Viale Fallaci 939', '27442', 'Settimo Raffaello terme', 'MO', 2),
			('Boccaccio', 'Clelia', '2008-03-28', 'M', 'Incrocio Nico 656', '70721', 'San Letizia', 'AN', 10),
			('Tamburi', 'Calogero', '2009-12-22', 'M', 'Borgo Majewski 784', '22612', 'Bernardi sardo', 'TR', 2),
			('Scarpa', 'Gloria', '2008-11-14', 'F', 'Strada Nedda 399 Appartamento 95', '82272', 'Babbo terme', 'AN', 10),
			('Ceravolo', 'Jacopo', '2011-01-31', 'F', 'Borgo Lauretta 80', '84558', 'Udinese lido', 'PA', 4),
			('Siffredi', 'Enzo', '2008-11-19', 'F', 'Borgo Antonucci 73', '58423', 'Settimo Eugenia calabro', 'BA', 5),
			('Giannetti', 'Lorenzo', '2008-04-29', 'F', 'Via Petruzzi 89', '77588', 'Salieri veneto', 'FI', 11),
			('Guarneri', 'Irma', '2009-01-12', 'F', 'Contrada Maglio 94 Appartamento 00', '82477', 'Angeli a mare', 'VR', 6),
			('Fallaci', 'Giuliano', '2007-09-08', 'M', 'Viale Victoria 7 Appartamento 40', '12560', 'Quarto Nanni lido', 'RM', 8),
			('Alfonsi', 'Gelsomina', '2009-02-28', 'M', 'Contrada Martino 5', '23172', 'Montanelli lido', 'NA', 9),
			('Balbo', 'Michelotto', '2009-03-07', 'M', 'Borgo Morellato 4 Piano 0', '76814', 'San Raimondo sardo', 'TN', 5),
			('Monaco', 'Michelangelo', '2005-07-17', 'M', 'Contrada Fabrizi 5', '91300', 'Calbo veneto', 'PD', 15),
			('Lerner', 'Milena', '2006-12-23', 'M', 'Piazza Scarponi 1', '24406', 'Navarria laziale', 'BA', 6),
			('Lollobrigida', 'Telemaco', '2007-07-07', 'F', 'Canale Sole 7', '66119', 'Turchetta umbro', 'BO', 8),
			('Baroffio', 'Alessia', '2010-10-07', 'F', 'Strada Adriana 3', '88316', 'Bernardo laziale', 'TR', 13),
			('Finotto', 'Morena', '2010-02-07', 'M', 'Canale Umberto 155', '54659', 'San Annalisa', 'SR', 5),
			('Gianetti', 'Giacobbe', '2006-02-04', 'M', 'Strada Ettore 4', '51898', 'Maurilio sardo', 'FI', 5),
			('Franceschi', 'Giada', '2011-01-10', 'M', 'Borgo Cimini 843', '84749', 'Borgo Tiziano', 'TO', 12),
			('Milanesi', 'Bernardo', '2011-04-06', 'M', 'Rotonda Sole 06', '18142', 'Settimo Annetta a mare', 'PA', 5),
			('Grimani', 'Temistocle', '2005-11-11', 'M', 'Stretto Donatello 2', '70227', 'Sesto Vito', 'GE', 4),
			('Comeriato', 'Danilo', '2009-02-12', 'F', 'Rotonda Gottardi 152 Appartamento 66', '95419', 'Marzorati sardo', 'TN', 8),
			('Corcos', 'Paulina', '2009-12-08', 'F', 'Borgo Zeffirelli 102 Appartamento 82', '31625', 'Biagio sardo', 'MI', 2),
			('Camuccini', 'Camillo', '2006-06-18', 'F', 'Rotonda Amalia 5', '48162', 'Quarto Salvi', 'PA', 1),
			('Monti', 'Coriolano', '2007-11-09', 'M', 'Rotonda Donatello 139 Piano 7', '05980', 'Ciampi calabro', 'GE', 13),
			('Alboni', 'Fredo', '2009-04-21', 'M', 'Contrada Correr 114 Piano 5', '73891', 'Virgilio calabro', 'PA', 3),
			('Scarponi', 'Ubaldo', '2008-04-04', 'F', 'Contrada Chinnici 491 Appartamento 29', '23493', 'Gemma sardo', 'SR', 12),
			('Cignaroli', 'Coriolano', '2006-12-09', 'F', 'Contrada Gasperi 6 Piano 6', '87985', 'Sesto Leonardo ligure', 'SR', 1),
			('Rizzo', 'Durante', '2010-02-04', 'M', 'Via Ruggeri 5 Appartamento 86', '13351', 'Quarto Maurilio umbro', 'NA', 15),
			('Speri', 'Alina', '2008-03-03', 'M', 'Vicolo Nina 619', '75596', 'Borsellino a mare', 'SR', 1),
			('Combi', 'Lucrezia', '2008-05-06', 'F', 'Viale Baccio 0', '85879', 'Baresi nell''emilia', 'AN', 9),
			('Venditti', 'Antonello', '2010-08-17', 'M', 'Canale Spallanzani 5', '54272', 'Quarto Virgilio', 'CT', 3),
			('Prodi', 'Michele', '2006-08-30', 'M', 'Contrada Broschi 798', '70397', 'Anita veneto', 'CA', 6),
			('Pratesi', 'Stefano', '2009-11-08', 'M', 'Strada Camilla 6 Piano 3', '64750', 'Milo sardo', 'PD', 4),
			('Bondumier', 'Livio', '2010-02-20', 'M', 'Contrada Camilleri 77', '75550', 'Borgo Fiorenzo ligure', 'TO', 6),
			('Lombroso', 'Salvi', '2007-10-07', 'F', 'Incrocio Galiazzo 488 Piano 1', '87990', 'Angelica laziale', 'TR', 12),
			('Vercelloni', 'Gianpietro', '2005-12-08', 'M', 'Canale Fabrizia 5', '42700', 'Quarto Patrizio sardo', 'BA', 14),
			('Vanvitelli', 'Rosalia', '2011-06-03', 'M', 'Contrada Galasso 9', '42451', 'Jacuzzi lido', 'BO', 15),
			('Puglisi', 'Dino', '2006-11-09', 'F', 'Contrada Tagliafierro 34', '96101', 'Borgo Angelica del friuli', 'RM', 3),
			('Conti', 'Virginia', '2006-11-18', 'F', 'Strada Lauretta 739', '50963', 'Settimo Tina a mare', 'CT', 13),
			('Serraglio', 'Lisa', '2008-05-09', 'M', 'Strada Benedetto 487 Piano 2', '08992', 'Sesto Aurora del friuli', 'PA', 3),
			('Marcacci', 'Melania', '2009-12-17', 'M', 'Piazza Norbiato 806 Piano 0', '44749', 'Raimondo laziale', 'MO', 14),
			('Farinelli', 'Ivan', '2010-11-04', 'M', 'Vicolo Pasqual 65 Appartamento 55', '55601', 'Quarto Niccolò salentino', 'BZ', 4),
			('Segrè', 'Lazzaro', '2008-07-03', 'M', 'Rotonda Rosina 4 Appartamento 76', '86011', 'San Coriolano lido', 'VR', 6),
			('Lucarelli', 'Rosario', '2008-10-31', 'F', 'Incrocio Monaco 296', '78808', 'Casini umbro', 'BA', 4),
			('Pacelli', 'Costanzo', '2006-11-30', 'M', 'Stretto Adelmo 4 Appartamento 04', '20009', 'Settimo Veronica calabro', 'VE', 7),
			('Oliboni', 'Fernanda', '2006-06-12', 'F', 'Viale Enzo 365 Appartamento 27', '84758', 'Ossani sardo', 'PA', 14),
			('Murri', 'Raffaele', '2010-03-12', 'M', 'Canale Isabella 0', '37497', 'Mondadori calabro', 'PA', 6),
			('Verga', 'Milena', '2006-05-02', 'F', 'Borgo Daria 19 Appartamento 65', '81961', 'Graziano umbro', 'SR', 6),
			('Giusti', 'Licia', '2008-01-06', 'M', 'Viale Tomaselli 13', '27559', 'Settimo Giampaolo', 'TO', 15),
			('Savorgnan', 'Giuliana', '2006-02-28', 'F', 'Contrada Turrini 4 Piano 1', '89691', 'Duse salentino', 'BO', 10),
			('Giannuzzi', 'Eliana', '2010-06-28', 'F', 'Strada Fabrizio 200 Appartamento 12', '83847', 'San Orazio', 'MI', 2),
			('Silvestri', 'Ennio', '2009-05-08', 'F', 'Viale Mocenigo 249', '40967', 'Settimo Gioacchino', 'PD', 12),
			('Nicolucci', 'Adriana', '2006-03-07', 'F', 'Stretto Dario 46 Appartamento 61', '05560', 'Surian umbro', 'CT', 10),
			('Papafava', 'Elvira', '2005-07-21', 'M', 'Vicolo Sergius 41 Appartamento 16', '41647', 'Benvenuto nell''emilia', 'MO', 15),
			('Abbagnale', 'Girolamo', '2008-09-13', 'M', 'Stretto Hugo 475 Piano 4', '54952', 'Bonatti del friuli', 'PA', 1),
			('Volterra', 'Gianpietro', '2009-02-12', 'F', 'Rotonda Ernesto 698 Appartamento 67', '30008', 'Settimo Fabrizia', 'RM', 9),
			('Ziani', 'Monica', '2006-10-31', 'M', 'Via Puccio 85', '11371', 'Novaro umbro', 'PD', 7),
			('Versace', 'Diana', '2006-06-23', 'M', 'Stretto Patrizia 4', '56570', 'Chiaramonte nell''emilia', 'GE', 10),
			('Onisto', 'Giancarlo', '2010-11-07', 'F', 'Vicolo Schicchi 61 Piano 8', '20944', 'San Paola', 'TO', 12),
			('Fabbri', 'Greco', '2010-01-01', 'F', 'Viale Petruzzi 2 Piano 3', '47225', 'Settimo Dionigi terme', 'TN', 5),
			('Cainero', 'Gaetano', '2006-02-19', 'F', 'Piazza Alderano 99 Piano 2', '29831', 'Settimo Alberto', 'GE', 7),
			('Cainero', 'Pierina', '2007-01-13', 'F', 'Rotonda Almagià 80', '65951', 'Trincavelli calabro', 'SR', 3),
			('Zacchia', 'Eliana', '2005-09-10', 'M', 'Vicolo Bacosi 8 Piano 0', '07684', 'Eliana nell''emilia', 'CT', 11),
			('Miniati', 'Clelia', '2009-02-25', 'F', 'Rotonda Alessia 463 Piano 4', '59963', 'Greco calabro', 'BO', 10),
			('Medici', 'Marco', '2007-01-15', 'F', 'Piazza Emo 024', '21070', 'Infantino lido', 'MO', 9),
			('Pontecorvo', 'Rosaria', '2006-09-13', 'M', 'Canale Pisani 419', '17404', 'Settimo Ottone', 'CA', 5),
			('Trentini', 'Paride', '2009-09-30', 'M', 'Incrocio Gianinazzi 56 Appartamento 65', '17378', 'Settimo Flavio', 'CT', 13),
			('Chigi', 'Cipriano', '2011-01-23', 'F', 'Vicolo Trevisani 15 Appartamento 84', '63086', 'Claudia veneto', 'VR', 8),
			('Druso', 'Biagio', '2009-10-10', 'F', 'Via Ronaldo 694', '72817', 'Ornella salentino', 'VE', 9),
			('Crisafulli', 'Dina', '2009-03-23', 'F', 'Piazza Adriano 6', '27698', 'Ida ligure', 'BO', 11),
			('Rusticucci', 'Gianmarco', '2008-06-24', 'M', 'Viale Lucarelli 9', '96345', 'Olga laziale', 'CA', 9),
			('Merisi', 'Gabriele', '2008-07-01', 'F', 'Piazza Foconi 1', '80830', 'Borgo Enzo umbro', 'NA', 14),
			('Vitturi', 'Silvio', '2010-05-26', 'M', 'Viale Griselda 84', '42782', 'Simonetta lido', 'CA', 4),
			('Cilea', 'Arnaldo', '2009-02-04', 'M', 'Canale Antonioni 1', '18644', 'Borgo Giada', 'FI', 1),
			('Pellico', 'Angelo', '2007-12-03', 'M', 'Rotonda Malaparte 2 Piano 0', '61407', 'Borgo Marisa a mare', 'BA', 8),
			('Scamarcio', 'Liliana', '2010-01-03', 'M', 'Stretto Bresciani 4', '93721', 'San Sophia', 'VR', 7),
			('Ravaglioli', 'Clelia', '2006-07-22', 'M', 'Vicolo Capuana 0', '67396', 'Gianluigi veneto', 'MO', 8),
			('Carli', 'Camilla', '2005-07-11', 'F', 'Strada Tolentino 269 Piano 5', '14620', 'Quarto Ernesto', 'BA', 3),
			('Giannotti', 'Fortunata', '2008-03-16', 'M', 'Piazza Maura 272 Appartamento 28', '75114', 'Borgo Sandra del friuli', 'TO', 13),
			('Cammarata', 'Giulia', '2008-05-05', 'F', 'Contrada Matilda 02', '76109', 'Castiglione a mare', 'BA', 3),
			('Nitto', 'Matteo', '2005-12-05', 'F', 'Contrada Tamburello 8', '64421', 'Zanichelli a mare', 'MI', 9),
			('Randazzo', 'Arnaldo', '2008-03-06', 'M', 'Viale Casarin 27 Piano 3', '01348', 'Settimo Patrizia', 'TO', 8),
			('Casini', 'Sandra', '2005-07-03', 'M', 'Piazza Nicola 38 Piano 2', '36234', 'Corbo umbro', 'VR', 11),
			('Infantino', 'Fiorino', '2005-11-22', 'F', 'Rotonda Luisa 5 Piano 3', '05885', 'Quarto Caterina', 'VR', 10),
			('Sagredo', 'Stella', '2011-03-26', 'F', 'Borgo Boiardo 5 Appartamento 19', '17128', 'Settimo Lauretta a mare', 'SR', 8),
			('Sibilia', 'Ruggiero', '2007-05-22', 'M', 'Incrocio Nico 11 Appartamento 89', '61133', 'Settimo Dionigi umbro', 'BZ', 8),
			('Pezzali', 'Ludovica', '2006-12-27', 'F', 'Strada Interminelli 008', '66788', 'Borgo Clelia', 'BA', 14),
			('Taliani', 'Giulia', '2007-05-14', 'F', 'Via Alessia 118', '88362', 'Borgo Baldassare lido', 'TN', 8),
			('Orsini', 'Gianpaolo', '2011-03-19', 'M', 'Stretto Lanfranchi 89', '26287', 'Settimo Flora', 'PA', 8),
			('Tanzini', 'Antonietta', '2010-04-02', 'M', 'Contrada Michelangeli 993 Piano 2', '93604', 'San Vanessa', 'CA', 4),
			('Sabbatini', 'Sandro', '2008-08-28', 'F', 'Strada Marcantonio 57 Piano 4', '77270', 'Zecchini umbro', 'GE', 6),
			('Bassi', 'Bettina', '2009-04-24', 'M', 'Vicolo Taliani 194 Appartamento 75', '71222', 'Sesto Stefano umbro', 'FI', 3),
			('Gargallo', 'Valentina', '2007-09-21', 'M', 'Borgo Corrado 381', '63148', 'Borgo Pierluigi', 'MO', 12),
			('Corradi', 'Gloria', '2009-04-11', 'M', 'Strada Salandra 893 Appartamento 31', '91584', 'Fortunata salentino', 'VE', 2),
			('Gualtieri', 'Giosuè', '2008-12-25', 'F', 'Incrocio Fuseli 64', '80836', 'Martina laziale', 'CT', 6),
			('Maspero', 'Nino', '2009-04-22', 'F', 'Via Rodolfo 756 Appartamento 51', '95500', 'Graziella lido', 'CT', 1),
			('Gadda', 'Greca', '2010-07-26', 'M', 'Contrada Daniele 70 Piano 6', '88896', 'Quarto Livia', 'CT', 7),
			('Metella', 'Paulina', '2007-02-07', 'M', 'Via Vecoli 45 Piano 8', '83122', 'Priscilla del friuli', 'AN', 7),
			('Guidone', 'Fiorenzo', '2008-03-26', 'F', 'Stretto Lombardi 1 Appartamento 54', '13700', 'Sesto Romeo', 'RM', 6),
			('Tirabassi', 'Renzo', '2006-04-08', 'F', 'Borgo Prada 838 Appartamento 35', '09981', 'Borgo Bartolomeo laziale', 'MO', 14);

INSERT INTO organizzazione_scolastica.docenti (cognome, nome, datanascita, sesso, indirizzo, cap, comune, provincia)
	VALUES 	('Rossi', 'Marco', '1980-03-15', 'M', 'Via Roma 12', '00185', 'Roma', 'RM'),
			('Bianchi', 'Lucia', '1975-07-22', 'F', 'Viale Mazzini 45', '50121', 'Firenze', 'FI'),
			('Verdi', 'Antonio', '1988-11-03', 'M', 'Via Garibaldi 8', '80132', 'Napoli', 'NA'),
			('Russo', 'Giulia', '1983-05-10', 'F', 'Via Dante 20', '24121', 'Bergamo', 'BG'),
			('Ferrari', 'Stefano', '1970-02-27', 'M', 'Corso Italia 17', '16121', 'Genova', 'GE'),
			('Esposito', 'Marta', '1986-09-14', 'F', 'Via Milano 30', '10121', 'Torino', 'TO'),
			('Ricci', 'Lorenzo', '1990-12-19', 'M', 'Via Venezia 9', '30121', 'Venezia', 'VE'),
			('Marino', 'Chiara', '1978-06-06', 'F', 'Piazza Duomo 3', '20121', 'Milano', 'MI'),
			('Greco', 'Fabio', '1985-08-30', 'M', 'Via Napoli 18', '89125', 'Reggio Calabria', 'RC'),
			('Bruno', 'Elena', '1982-10-11', 'F', 'Via Trieste 7', '34121', 'Trieste', 'TS'),
			('Galli', 'Roberto', '1979-04-25', 'M', 'Via Manzoni 11', '25121', 'Brescia', 'BS'),
			('Costa', 'Francesca', '1987-03-01', 'F', 'Via Torino 5', '15048', 'Valenza', 'AL'),
			('Fontana', 'Davide', '1981-01-17', 'M', 'Via Salaria 50', '02100', 'Rieti', 'RI'),
			('Conti', 'Alessia', '1992-07-09', 'F', 'Viale Marconi 22', '09123', 'Cagliari', 'CA'),
			('De Luca', 'Paolo', '1984-10-28', 'M', 'Via Cavour 6', '92100', 'Agrigento', 'AG'),
			('Barbieri', 'Serena', '1976-05-13', 'F', 'Via Emilia 14', '43121', 'Parma', 'PR'),
			('Lombardi', 'Andrea', '1991-12-05', 'M', 'Via Mazzini 3', '60121', 'Ancona', 'AN'),
			('Martini', 'Ilaria', '1989-09-20', 'F', 'Via Leopardi 10', '56121', 'Pisa', 'PI'),
			('Moretti', 'Giorgio', '1980-06-18', 'M', 'Via Verdi 7', '38121', 'Trento', 'TN'),
			('Rinaldi', 'Valentina', '1986-02-02', 'F', 'Via Aldo Moro 33', '67100', 'LAquila', 'AQ');
            
INSERT INTO organizzazione_scolastica.classi_docenti (codice_docente, codice_classe, materia)
	VALUES  (1, 3, 'Matematica'),
			(2, 5, 'Italiano'),
			(3, 1, 'Storia'),
			(4, 7, 'Geografia'),
			(5, 2, 'Inglese'),
			(6, 10, 'Scienze'),
			(7, 4, 'Fisica'),
			(8, 6, 'Educazione fisica'),
			(9, 9, 'Arte'),
			(10, 11, 'Musica'),
			(11, 8, 'Tecnologia'),
			(12, 14, 'Religione'),
			(13, 12, 'Francese'),
			(14, 1, 'Storia'),
			(15, 13, 'Italiano'),
			(16, 15, 'Matematica'),
			(17, 3, 'Geografia'),
			(18, 6, 'Scienze'),
			(19, 4, 'Fisica'),
			(20, 2, 'Inglese'),
			(3, 10, 'Matematica'),
			(7, 5, 'Tecnologia'),
			(9, 14, 'Musica'),
			(12, 8, 'Educazione fisica'),
			(15, 11, 'Francese');
            
SELECT * FROM organizzazione_scolastica.istituti;
SELECT * FROM organizzazione_scolastica.classi;
SELECT * FROM organizzazione_scolastica.studenti;
SELECT * FROM organizzazione_scolastica.docenti;
SELECT * FROM organizzazione_scolastica.classi_docenti;


-- Esercizi SQL
-- 1 -> Seleziona il DB sakila 
USE sakila;
-- 2 -> Visualizza il nome e il cognome di tutti gli attori 
-- 			dalla tabella actor.
SELECT first_name, last_name FROM sakila.actor;
-- 3 -> Devi trovare il numero identificativo, il nome e il cognome 
--  		di un attore, di cui conosci solo il nome, "Joe".
SELECT actor_id, first_name, last_name 
	FROM sakila.actor WHERE first_name = "Joe";
-- 4 -> Trova tutti gli attori il cui cognome contiene le lettere 'GEN'.
SELECT * FROM sakila.actor WHERE last_name LIKE '%GEN%';
-- 5 -> Trova tutti gli attori i cui cognomi contengono le lettere 'LI'. 
-- 			Questa volta, ordina le righe per cognome e nome, 
-- 			in quest'ordine.
SELECT * FROM sakila.actor WHERE last_name LIKE '%LI%' 
	ORDER BY last_name, first_name;
-- 6 -> Utilizzando IN, visualizzare le colonne country_id e country 
-- 			della tab country dei seguenti paesi: Afghanistan, Bangladesh e China
SELECT country_id, country FROM sakila.country
	WHERE country IN ('Afghanistan', 'Bangladesh' , 'China');
-- 7 -> Aggiungi una middle_name colonna alla tabella actor. 
-- 			Posizionalo tra first_name e last_name.
ALTER TABLE sakila.actor 
	ADD COLUMN middle_name VARCHAR(100) NULL AFTER first_name;
SELECT * FROM sakila.actor;
-- 8 -> Ora elimina la middle_name colonna.
ALTER TABLE sakila.actor DROP COLUMN middle_name;

-- 9 -> Elenca i cognomi degli attori e il numero degli attori che hanno quel cognome.
-- 		Assegna un nome alla colonna 'Actor LastName' e 'LastName Count'
SELECT last_name AS 'Actor LastName', COUNT(last_name) AS 'LastName Count' 
	FROM sakila.actor GROUP BY last_name;
-- 10 -> Visualizza il nome e il cognome di ciascun attore in un'unica colonna 
-- 		in lettere minuscole. Assegna un nome alla colonna 'Actor Name'.
SELECT LOWER(CONCAT(first_name, ' ', last_name)) AS 'Actor Name' 
	FROM sakila.actor;
-- 11 -> Elenca i cognomi degli attori e il numero di attori che hanno quel cognome, 
-- 		ma solo per i nomi condivisi da almeno due attori
SELECT last_name AS 'Actor LastName', COUNT(last_name) AS 'LastName Count' 
	FROM sakila.actor GROUP BY last_name HAVING COUNT(last_name) >= 2;
-- 12 -> Visualizzare 'Nome Cognome' di ciascun membro dello staff (Staff Member)
SELECT CONCAT(first_name, ' ', last_name) AS 'Staff Member' FROM sakila.staff;
-- 13 -> Calcola il totale speso da ciascun cliente nella tabella payment
SELECT customer_id, SUM(amount) AS total_amount 
	FROM sakila.payment GROUP BY customer_id;
-- 14 -> Mostra gli importi dei pagamenti arrotondati al numero intero più vicino 
-- 		nella tabella payment
SELECT amount, ROUND(amount) AS round FROM sakila.payment;
-- 15 -> Mostra il titolo e la durata (90 min) dei film con 
-- 		durata compresa tra 90 e 120 minuti ed ordina per durata
SELECT title, CONCAT(length, ' min') FROM sakila.film 
	WHERE length BETWEEN 90 AND 120 ORDER BY length DESC;
-- 16 -> Mostra della tabella paymnet il numero di pagamenti effettuati,
-- 		la media dei pagamenti effettuati, il pagamento minimo effettuato e 
-- 		il pagamento massimo effettuato da ciascun cliente
SELECT customer_id, COUNT(amount) AS number_amount, 
	FORMAT(AVG(amount), 2) AS avg_amount, MAX(amount) AS max_amount, 
    MIN(amount) AS min_amount
	FROM sakila.payment GROUP BY customer_id;
-- 17 -> Trova la data del primo noleggio registrato (rental)
	SELECT MIN(rental_date) AS primo_noleggio FROM sakila.rental;
-- 18 -> Conta il numero di noleggi per ogni anno (rental)
	SELECT YEAR(rental_date) AS anno, COUNT(*) AS numero_noleggi 
		FROM sakila.rental GROUP BY anno ;
-- 19 -> Calcola la durata media di un noleggio in giorni (rental)
	SELECT FORMAT(AVG(DATEDIFF(return_date, rental_date)), 2) AS durata_media_noleggio
		FROM sakila.rental;
-- 20 -> Elenca tutti i noleggi con durata superiore a 3 giorni (rental)
	SELECT rental_id, rental_date, return_date, 
			customer_id, staff_id, DATEDIFF(return_date, rental_date) AS durata_noleggio
		FROM sakila.rental WHERE DATEDIFF(return_date, rental_date) > 3;
-- 21 -> Mostra l’ultima data di noleggio effettuata (rental)
	SELECT MAX(rental_date) AS ultimo_noleggio FROM sakila.rental;
-- 22 -> Elenca i noleggi effettuati nel mese di dicembre 2005 (rental)
	SELECT rental_id, rental_date, return_date, customer_id, staff_id
		FROM sakila.rental WHERE MONTH(rental_date) = 12 AND YEAR(rental_date) = 2005;
-- 23 -> Mostra il giorno della settimana per ciascun noleggio (rental) -> DAYNAME
	SELECT rental_id, rental_date, return_date, customer_id, 
		staff_id, DAYNAME(rental_date)
		FROM sakila.rental;
-- 24 -> Conta i noleggi effettuati di domenica (DAYOFWEEK) -> 1 = Domenica
	SELECT COUNT(*) AS noleggi_domenica 
		FROM sakila.rental WHERE DAYOFWEEK(rental_date) = 1;
-- 25 -> Visualizza i noleggi effettuati tra il 1° e il 15 gennaio 2006
	SELECT * FROM sakila.rental 
		WHERE rental_date BETWEEN '2006-01-01' AND '2006-01-15';
-- 26 -> Mostra i primi 10 noleggi effettuati con la data formattata 'GG/MM/AAAA' (DATE_FORMAT)
	SELECT rental_id, DATE_FORMAT(rental_date, '%d/%m/%Y') AS data_formattata 
		FROM sakila.rental LIMIT 10;
-- 27 -> Utilizzare JOIN per visualizzare il nome e il cognome, 
-- 		 nonché l'indirizzo, di ciascun membro dello staff. 
-- 		 Utilizza le tabelle staff e address
	SELECT * FROM sakila.staff;
    SELECT * FROM sakila.address;
    SELECT s.first_name, s.last_name, a.address FROM sakila.staff AS s 
		LEFT JOIN sakila.address AS a ON s.address_id = a.address_id; 
-- 28 -> Da utilizzare JOIN per visualizzare 'Nome Cognome' di 
-- 		 ciascun membro dello staff (Staff Member) l'importo totale di
--  	 ciascun membro (Total Amount) del personale nell'agosto del 2005. 
-- 		 Utilizzare le tabelle staff e payment.
	SELECT * FROM sakila.staff;
    SELECT * FROM sakila.payment;
    SELECT CONCAT(s.first_name, ' ', s.last_name) AS 'Staff Member', 
    FORMAT(SUM(p.amount), 2) AS 'Total Amount'
		FROM sakila.staff AS s 
		LEFT JOIN sakila.payment AS p ON s.staff_id = p.staff_id
        -- WHERE p.payment_date BETWEEN '2005-08-01' AND '2005-08-31'
        -- WHERE YEAR(p.payment_date) = 2005 AND MONTH(p.payment_date) = 8
        -- WHERE p.payment_date LIKE '2005-08%'
        WHERE p.payment_date >= '2005-08-01' AND p.payment_date <= '2005-08-31'
        GROUP BY s.staff_id;
-- 29 -> Elenca ogni film e il numero di attori elencati per quel film. 
-- 		 stampa solo i film che hanno almeno 5 attori
-- 		 Utilizzare tabelle film_actor e film. Utilizza INNER JOIN.
	SELECT * FROM sakila.film;
    SELECT * FROM sakila.film_actor;
    SELECT f.title, COUNT(fa.actor_id) AS 'Numero Attori' FROM sakila.film AS f 
		LEFT JOIN sakila.film_actor AS fa ON f.film_id = fa.film_id
        GROUP BY f.title
        HAVING COUNT(fa.actor_id) >= 5;
-- 30 -> Utilizza le subquery per visualizzare i titoli dei film che iniziano con 
-- 		le lettere K e Q e la cui lingua è l'inglese.

-- Soluzione con SubQuery
SELECT f.title FROM sakila.film AS f 
	WHERE (f.title LIKE 'K%' OR f.title LIKE 'Q%') AND f.language_id = (
		SELECT l.language_id FROM sakila.language AS l WHERE l.name = 'English'
    );
-- Soluzione con JOIN
SELECT f.title FROM sakila.film AS f 
	INNER JOIN sakila.language AS l ON f.language_id = l.language_id
    WHERE (f.title LIKE 'K%' OR f.title LIKE 'Q%') AND l.name = 'English';

-- 31 -> Utilizza le subquery per visualizzare Nome e Cognome di tutti  
-- 		gli attori che appaiono nel film 'Alone Trip'

-- Soluzione con SubQuery
SELECT CONCAT(a.first_name, ' ' ,a.last_name) AS Actor_name
	FROM sakila.actor AS a 
	WHERE a.actor_id IN (
		SELECT fa.actor_id FROM sakila.film_actor AS fa 
			WHERE fa.film_id = (
				SELECT f.film_id AS film_title FROM sakila.film AS f WHERE f.title = 'Alone Trip'
			)
);

-- Soluzione con JOIN
SELECT CONCAT(a.first_name, ' ' , a.last_name) AS Actor_name FROM sakila.film AS f 
	INNER JOIN sakila.film_actor AS fa ON f.film_id = fa.film_id
    INNER JOIN sakila.actor AS a ON fa.actor_id = a.actor_id
    WHERE f.title = 'Alone Trip';

-- 32 -> Utilizzando le subquery trova qual è il film con la durata maggiore, 
-- 		indicandone titolo e durata. Se fossero più di uno elencali in ordine di titolo.

-- Soluzione con SubQuery
SELECT f.title, f.length FROM sakila.film AS f 
	WHERE f.length = (
		SELECT MAX(f.length) FROM sakila.film AS f
    )
    ORDER BY f.title;

-- 33 -> Trova quali sono i film la cui durata è maggiore di almeno 60 minuti 
-- 		della durata media di tutti i film.

-- Soluzione con SubQuery
SELECT f.title, f.length FROM sakila.film AS f 
	WHERE f.length > (
		SELECT AVG(f.length) FROM sakila.film AS f) + 60
	ORDER BY f.length;

-- 34 -> Trova qual è il film con il maggior numero di attori, indicandone titolo 
-- 		e numero di attori. Se fossero più di uno elencali in ordine di titolo.

SELECT * FROM sakila.film;
SELECT * FROM sakila.actor;
SELECT * FROM sakila.film_actor;

-- 1 -> raggruppo il numero di attori per film
SELECT f.film_id, f.title, COUNT(fa.actor_id) AS num_attori FROM sakila.film AS f
	INNER JOIN sakila.film_actor AS fa ON f.film_id = fa.film_id
    GROUP BY f.film_id;
-- 2 -> selezione il numero massimo di attori per film
SELECT MAX(num_attori) FROM (
	SELECT f.film_id, f.title, COUNT(fa.actor_id) AS num_attori FROM sakila.film AS f
	INNER JOIN sakila.film_actor AS fa ON f.film_id = fa.film_id
    GROUP BY f.film_id
) AS t;

-- 3 -> unisco le due query precedetni per risolvere il problema
SELECT * FROM (
	SELECT f.film_id, f.title, COUNT(fa.actor_id) AS num_attori FROM sakila.film AS f
		INNER JOIN sakila.film_actor AS fa ON f.film_id = fa.film_id
		GROUP BY f.film_id
) AS t
	WHERE num_attori = (SELECT MAX(num_attori) FROM (
		SELECT f.film_id, f.title, COUNT(fa.actor_id) AS num_attori FROM sakila.film AS f
		INNER JOIN sakila.film_actor AS fa ON f.film_id = fa.film_id
		GROUP BY f.film_id
	) AS n
) ORDER BY t.title;

-- 4 -> Soluzione con utlizzo delle Viste
USE sakila;
CREATE OR REPLACE VIEW count_actor AS 
	SELECT f.film_id, f.title, COUNT(fa.actor_id) AS num_attori FROM sakila.film AS f
	INNER JOIN sakila.film_actor AS fa ON f.film_id = fa.film_id
	GROUP BY f.film_id;
    
SELECT * FROM count_actor
	WHERE num_attori = (SELECT MAX(num_attori) FROM count_actor);
    
DROP VIEW count_actor;

-- Stored Procedures

-- Stored Procedures senza parametri
DELIMITER &&
	CREATE PROCEDURE getAllFilms()
    BEGIN
		SELECT * FROM sakila.film;
	END &&
DELIMITER ;
CALL getAllFilms();

-- Stored Procedures con parametri di tipo input
DELIMITER &&
	CREATE PROCEDURE getNumFilm(IN num_row INT)
    BEGIN
		SELECT * FROM sakila.film LIMIT num_row;
	END &&
DELIMITER ;
CALL getNumFilm(30);
CALL getNumFilm(5);

DELIMITER &&
	CREATE PROCEDURE getNameAndLastnameByFilm(IN filmName VARCHAR(100))
    BEGIN
		SELECT CONCAT(a.first_name, ' ' , a.last_name) AS Actor_name 
			FROM sakila.film AS f 
			INNER JOIN sakila.film_actor AS fa ON f.film_id = fa.film_id
			INNER JOIN sakila.actor AS a ON fa.actor_id = a.actor_id
			WHERE f.title = filmName;
    END &&
DELIMITER ;
CALL getNameAndLastnameByFilm('Alone Trip');
CALL getNameAndLastnameByFilm('AFRICAN EGG');
CALL getNameAndLastnameByFilm('ANGELS LIFE');
CALL getNameAndLastnameByFilm('arizona bang');

-- Stored Procedures con parametri di tipo output
DELIMITER &&
	CREATE PROCEDURE maxLengthFilm(OUT maxLength INT)
	BEGIN
		SELECT MAX(f.length) INTO maxLength FROM sakila.film AS f;
    END &&
DELIMITER ;
CALL maxLengthFilm(@maxlengthFilm);
SELECT @maxlengthFilm;

-- Stored Procedures con parametri di tipo input e output
DELIMITER &&
	CREATE PROCEDURE getFilmNameByID(IN idFilm INT, OUT filmName VARCHAR(100))
    BEGIN
		SELECT f.title INTO filmName 
			FROM sakila.film AS f WHERE f.film_id = idFilm;
    END &&
DELIMITER ;

SET @idFilm = 5;
CALL getFilmNameByID(@idFilm, @filmTitle);
SELECT @filmTitle;
CALL getNameAndLastnameByFilm(@filmTitle);

-- Stored Procedures con parametro di tipo input e output
DELIMITER &&
	CREATE PROCEDURE getLengthFilmByID(INOUT numFilm INT)
    BEGIN
		SELECT f.length INTO numFilm 
			FROM sakila.film AS f WHERE f.film_id = numFilm;
	END &&
DELIMITER ;

SET @paramFilm = 17;
CALL getLengthFilmByID(@paramFilm);
SELECT @paramFilm;

-- Esercizi Stored Procedures
-- 1 -> creare una procedura che, dato un customer_id,  
-- 		visualizzare id e data dei noleggi effettuati.
DELIMITER &&
	CREATE PROCEDURE customerRental(IN p_customer_id INT)
    BEGIN
		SELECT r.rental_id, r.rental_date 
			FROM sakila.rental AS r 
            WHERE r.customer_id = p_customer_id;
    END &&
DELIMITER ;
CALL customerRental(23);

-- 2 -> creare una procedura che elenca i noleggi avvenuti tra due date.

DELIMITER &&
	CREATE PROCEDURE rentalBetweenDate(IN p_start_date DATE, IN p_end_date DATE)
    BEGIN
		SELECT r.rental_id, r.rental_date, r.return_date, r.customer_id 
			FROM sakila.rental AS r 
			WHERE r.rental_date BETWEEN p_start_date AND p_end_date;
    END &&
DELIMITER ;
CALL rentalBetweenDate('2005-05-24', '2005-05-26');

-- 3 -> creare una procedura che inserisce un nuovo cliente 
-- 		solo se non esiste già con stessa email.
SELECT * FROM sakila.customer ORDER BY customer_id DESC;

DELIMITER &&
	CREATE PROCEDURE insertCustomer(
							IN p_store_id INT,
                            IN p_first_name VARCHAR(100),
                            IN p_last_name VARCHAR(100),
                            IN p_email VARCHAR(100),
                            IN p_address_id INT)
	BEGIN
		IF NOT EXISTS (
			SELECT * FROM sakila.customer AS c WHERE c.email = p_email
		) THEN
			INSERT INTO sakila.customer(store_id, first_name, 
						last_name, email, address_id, create_date)
			VALUES (p_store_id , UPPER(p_first_name), UPPER(p_last_name), p_email, 
					p_address_id, NOW());
			SELECT 'Cliente inserito con successo' AS messaggio;
		ELSE 
			SELECT 'Cliente già presente nel DB' AS messaggio;
		END IF;
	END &&
DELIMITER ;
CALL insertCustomer(1, 'Mario', 'Rossi', 'm.rossi@example.com', 47);
CALL insertCustomer(2, 'Giuseppe', 'Verdi', 'g.verdi@example.com', 24);

-- Esempio Funzione
DELIMITER &&
	CREATE FUNCTION durataFilm(film_length INT)
		RETURNS VARCHAR (25)
        DETERMINISTIC
        BEGIN
			DECLARE duration VARCHAR(25);
            IF(film_length <= 75) THEN 
				SET duration = 'Film Corto';
			ELSEIF (film_length <= 150) THEN
				SET duration = 'Film Medio';
			ELSE
				SET duration = 'Film Lungo';
			END IF;
            RETURN duration;
        END &&
DELIMITER ;

SELECT durataFilm(180);
SELECT * FROM sakila.film;
SELECT title, length, durataFilm(length) FROM sakila.film;
SELECT title, length FROM sakila.film WHERE durataFilm(length) = 'Film Lungo';








