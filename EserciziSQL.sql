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
    codice_filiale INT NOT NULL,
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
