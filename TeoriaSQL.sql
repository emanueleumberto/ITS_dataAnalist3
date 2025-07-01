-- Commenti a singola riga
/*
	Commenti 
    muti riga
*/

-- https://dbml.dbdiagram.io/docs/
-- https://dbdiagram.io/home
-- https://www.w3schools.com/

-- SQL ha diverse categorie di Statement
/*
	DDL -> Data Definition Language
			Definisce tutte le istruzioni di tipo SQL 
            per la creazione e gestione del DB
    DML -> Data Manipulation Language
			Definisce tutte le istruzioni di tipo SQL
            per inserimento e gestione di dati in un DB
    DQL -> Data Query Language
			Definisce tutte le istruzioni di tipo SQL
            per la lettura di dati da un DB
    DCL -> Data Control Language
			Definisce tutte le istruzioni di tipo SQL
            per la gestione e i permessi di un DB
*/

-- DDL -> Data Definition Language
-- CREATE | USE | ALTER | DROP | SHOW

/*
	-- DB
	CREATE DATABASE [IF NOT EXISTS] db_name;
    SHOW DATABASES;
    USE db_name;
    DROP DATABSE [IF EXISTS] db_name
    
    -- TABLE
    CREATE TABLE [IF NOT EXISTS] db_name.table_name (
		column_name datatype column_constraints,
        column_name datatype column_constraints,
        column_name datatype column_constraints,
        ....
        [constraint_name] table_constraints
    )
    
    ALTER TABLE db_name.table_name ADD COLUMN 
					column_name datatype column_constraints;
	ALTER TABLE db_name.table_name DROP COLUMN column_name;
    ALTER TABLE db_name.table_name MODIFY column_name datatype;
    SELECT VERSION();
    -- Rename con MySQL 8+
    ALTER TABLE db_name.table_name RENAME COLUMN 
					column_name TO new_column_name;
	-- Per MySQL < 8
	ALTER TABLE db_name.table_name CHANGE 
			column_name new_column_name datatype column_constraints;
	ALTER TABLE db_name.table_name ADD CONSTRAINT 
					constraint_name constraint_type(column_name)
                    [REFERENCES table_name(column_name)];
	ALTER TABLE db_name.table_name DROP CONSTRAINT constraint_name;

	DROP TABLE [IF EXISTS] db_name.table_name [CASCADE | RESTRICT]
    
    Relazione -> OneToOne
    Relazione -> OneToMany
    Relazione -> ManyToMany
    
-- DML -> Data Manipulation Language 
-- INSERT | UPDATE | DELETE

-- INSERT INTO db_name.table_name (column_name1, column_name2, ..., column_nameN)
--		VALUES (value1, value2, ..., valueN);

-- UPDATE db_name.table_name SET column_name1 = value1, 
			column_name2 = value2, ..., column_nameN = valueN
         WHERE column_name = value
         
-- DELETE FROM db_name.table_name WHERE column_name = value;

-- Comportamento predefinito di MySql -> Ogni istruzione di tipo DML viene automaticamente
-- scritta nel database subito dopo l'esecuzione
SET autocommit = 0; -- Disabilito l'auto commit di default
START TRANSACTION; -- BEGIN(Istruzione equivalente)
	-- Effettuo tutte le istruzioni di tipo DML (INSERT | UPDATE | DELETE)
ROLLBACK;
	-- Torno in uno stato precedente
COMMIT;
	-- Salvo le modifiche nel database
*/

-- DQL -> Data Query Language 
-- SELECT 	-> Un elenco di colonne o tutto (*) da esporre nel resultset di risultati
-- FROM		-> Indica una sorgente di dati da cui leggere (la/le tabelle di un DB)
-- WHERE	-> search_condition, applica un filtro sulle righe della tabella indicata nel FROM
-- GROUP BY	-> Aggrega dati in base ad una colonna della tabella
-- HAVING	-> search_condition, applica un filtro sulle righe della tabella filtrata e aggregata dal GROUP BY
-- ORDER BY	-> consente di definire un ordinamento ben preciso in base ad una colonna della tabella
-- LIMIT	-> consente di definire un numero definito di record
--
-- SELECT [DISTINCT] column_name1, column_name2, ... column_nameN | * | aggregate_function(expression)
-- 	FROM table_name
-- 	[WHERE search_condition]
-- 	[GROUP BY]
-- 	[HAVING search_condition]
-- 	[ORDER BY]
-- 	[LIMIT n]

/* 
	Operatori di confronto della search condition
    = (Uguale)
    > (maggiore di)
    < (minore di)
    >= (maggiore uguale)
    <= (minore uguale)
    <> | != (diverso da)
    !< (non minore di)
    !> (non maggiore di)

	Operatori logici
    AND (restituisce TRUE solo se entrambe le condizioni booleane restituiscono TRUE)
    OR (restituisce TRUE se almeno una delle due condizioni booleane restituiscono TRUE)
    
    LIKE (contiene ... | caratteri jolly %_)
    BETWEEN (restituisce tutti i valori compresi tra >= AND <=)
    IN | NOT IN (Elenco di valori in cui individuare una corrispondenza)
    
    WHERE district = 'California'
    WHERE district LIKE 'Ca%'
    WHERE district LIKE 'C_l%'
    WHERE district IN ('California', 'Texas')
        
*/

/*
	Functions
    String Functions
    https://dev.mysql.com/doc/refman/8.4/en/string-functions.html
    CONCAT(column_1, ' - ', column_2 ) -> Funzione che ci permette di concatenare dati contenuti in due o più colonne
    UPPER('string' | column_name) -> Funzione che ci restituisce una stringa o il valore del campo in maiuscolo
    LOWER('string' | column_name) -> Funzione che ci restituisce una stringa o il valore del campo in minuscolo
    LENGTH('string' | column_name) -> Funzione che ci restituisce la lunghezza di una stringa o del valore di un campo
    TRIM('string' | column_name) -> Funzione che restituisce una stringa senza spazi vuoti prima o dopo il valore inserito
    
    Numeric Functions
    https://dev.mysql.com/doc/refman/8.4/en/numeric-functions.html
    COUNT(* | DISTINCT column_name ) -> Funzione che restituisce il numero di record restituiti da una query
    FORMAT(number | column_name, 2) -> Funzione che restituisce un numero decimale formattato
    TRUNCATE(number | column_name, 2) -> Funzione che restituisce un numero decimale troncato
    ABS(number | column_name) -> Funzione che restituisce un valore assoluto, senza segno
    AVG(column_name) -> Funzione che restituisce la media di valori di una colonna 
    CEIL(column_name) -> Funzione che restituisce un valore arrotondato per eccesso
    FLOOR(column_name) -> Funzione che restituisce un valore arrotondato per difetto
    ROUND(column_name) -> Funzione che restituisce un valore arrotondato la numero intero più vicino
    RAND() -> Funzione che restituisce un numero casuale compreso tra 0 e 1
    MAX(column_name) -> Funzione che restituisce il valore massimo contenuto in una colonna 
    MIN(column_name) -> Funzione che restituisce il valore minimo contenuto in una colonna 
    SUM(column_name) -> Funzione che restituisce la somma dei valori contenuti in una colonna 
    
    Date Functions
    https://dev.mysql.com/doc/refman/8.4/en/date-and-time-functions.html
    ADDDATE(date, n) -> Funzione che aggiunge n ad una data
    ADDTIME(time, n) -> Funzione che aggiunge n ad un orario
    CURRENT_DATE() -> Funzione che restituisce una data nel formato 'YYYY-MM-GG'(String)
	CURRENT_TIME() -> Funzione che restituisce un orario nel formato 'HH-MM-SS'(String)
    CURRENT_TIMESTAMP() -> Funzione che restituisce data e orario del momento
    DATEDIFF(date1, date2) -> Funzione che calcola la differenza di giorni tra due date
    DAY(date) -> Funzione che restituisce il giorno da una data
    MONTH(date) -> Funzione che restituisce il mese da una data
    YEAR(date) -> Funzione che restituisce l'anno da una data
    HOUR(datetime) -> Funzione che restituisce l'ora da un valore orario
    MINUTE(datetime) -> Funzione che restituisce i minuti da un valore orario
    SECOND(datetime) -> Funzione che restituisce i secondi da un valore orario
    
    Advanced Functions
    ISNULL(column_name) -> Funzione che restituisce un valore 1 o 0 in base al valore null di una colonna
	LAST_INSERT_ID() -> Funzione che restituisce l'ultimo valore del campo id(Primary Key) inserito in una tabella 
   
	Join tra tabelle
		SELECT [DISTINCT] column_name1, column_name2, ... column_nameN | * | aggregate_function(expression)
		FROM table_name1
        INNER | LEFT | RIGHT JOIN table_name2 ON condition
        INNER | LEFT | RIGHT JOIN table_name3 ON condition
        ...
        INNER | LEFT | RIGHT JOIN table_nameN ON condition
		[WHERE search_condition]
		[GROUP BY]
		[HAVING search_condition]
		[ORDER BY]
		[LIMIT n]
   
   SubQuery o InnerQuery -> Sono query inserite in altre query, 
   una query annidata dipende da una query esterna
   posso inserire query annidate in: SELECT, FROM, WHERE
   
   SELECT [DISTINCT] column_name1, column_name2, ..., column_nameN | * | aggregate_function(expression) 
   FROM (
		SELECT [DISTINCT] column_name ...
        FROM table_name
        [WHERE search_condition]
        ...
   )
   [WHERE search_condition]
   [GROUP BY]
   [HAVING search_condition]
   [ORDER BY]
   [LIMIT n]
   
   _______________________________________________________
   
   SELECT (
		SELECT [DISTINCT] column_name ...
        FROM table_name
        [WHERE search_condition]
        ...
   ) 
   FROM table_name
   [WHERE search_condition]
   [GROUP BY]
   [HAVING search_condition]
   [ORDER BY]
   [LIMIT n]
   
   _______________________________________________________
   
   SELECT [DISTINCT] column_name1, column_name2, ..., column_nameN | * | aggregate_function(expression) 
   FROM table_name
   [WHERE (
		SELECT [DISTINCT] column_name ...
        FROM table_name
        [WHERE search_condition]
        ...
   ) ]
   [GROUP BY]
   [HAVING search_condition]
   [ORDER BY]
   [LIMIT n]
*/

/*

	View
    CREATE [OR REPLACE] VIEW view_name AS 
		SELECT [DISTINCT] column_name1, column_name2, ... column_nameN | * | aggregate_function(expression)
		FROM table_name1
        INNER | LEFT | RIGHT JOIN table_name2 ON condition
        INNER | LEFT | RIGHT JOIN table_name3 ON condition
        ...
        INNER | LEFT | RIGHT JOIN table_nameN ON condition
		[WHERE search_condition]
		[GROUP BY]
		[HAVING search_condition]
		[ORDER BY]
		[LIMIT n]
	
    SELECT * FROM view_name;
    DROP VIEW [IF EXISTS] view_name
        
	Stored Procedures
		
	DELIMITER &&
        CREATE PROCEDURE procedure_name [[IN | OUT | INOUT] parameter_name datatype ....]
        BEGIN
			....
		END &&
	DELIMITER;
		
	CALL procedure_name (parameter/s)
	DROP PROCEDURE [IF EXISTS] procedure_name
    
    Custom Function
    
    DETERMINISTIC -> La funzione restituisce sempre lo stesso valore quando 
					 viene invocata con gli stessi paramentri di input
	NOT DETERMINISTIC -> La funzione può restituire risultati diversi 
						 con gli stessi valori di input (NOW(), RAND())
						
    DELIMITER &&
    CREATE FUNCTION function_name(parameter_name datatype, ...)
		[RETURNS datatype]
        [NOT] DETERMINISTIC 
        BEGIN
			...
		END &&
	DELEIMITER ;
    
    SELECT function_name()
    DROP FUNCTION [IF EXISTS] function_name
    
    -- Esempio Deterministic
		DELIMITER &&
			CREATE FUNCTION calcolaIva(prezzo DECIMAL(10,2))
				RETURNS DECIMAL(10,2)
				DETERMINISTIC
                BEGIN
					RETURN prezzo + (prezzo * 0.22);
				END &&
		DELIMITER ;

	-- Esempio Not Deterministic
		DELIMITER &&
			CREATE FUNCTION calcolaOraLegale(ora INT)
				RETURNS TIME
				NOT DETERMINISTIC
                BEGIN
					RETURN CONCAT(HOUR(NOW()) + ora, '-', MINUTE(NOW()), '-', SECOND(NOW())) 
				END &&
		DELIMITER ;
    SELECT calcolaOraLegale(1)
    
    DELIMITER &&
	CREATE FUNCTION calcolaOraLegale(ora INT)
		RETURNS VARCHAR(100)
		NOT DETERMINISTIC
        BEGIN
			RETURN CONCAT(HOUR(NOW()) + ora, '-', MINUTE(NOW()), '-', SECOND(NOW()));
		END &&
DELIMITER ;
SELECT calcolaOraLegale(1);

*/




-- DDL -> DATABASE
DROP DATABASE IF EXISTS test_db;
CREATE DATABASE IF NOT EXISTS test_db;
USE test_db;
 
-- DDL -> TABLE
-- users -> user_id - firstname - lastname - age - city - fiscal_code
CREATE TABLE IF NOT EXISTS test_db.users (
	user_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(25) NOT NULL,
    lastname VARCHAR(25) NOT NULL,
    age INT2 UNSIGNED NULL DEFAULT 18,
    city VARCHAR(50) NULL,
    email VARCHAR(50) NOT NULL UNIQUE
	-- CONSTRAINT user_pk PRIMARY KEY(user_id)
);
ALTER TABLE test_db.users RENAME COLUMN name TO firstname;
-- ALTER TABLE test_db.users CHANGE name firstname VARCHAR(25) NOT NULL;
ALTER TABLE test_db.users ADD COLUMN fiscal_code VARCHAR(16) NOT NULL UNIQUE;
ALTER TABLE test_db.users MODIFY fiscal_code CHAR(16);
ALTER TABLE test_db.users DROP COLUMN email;

-- DROP TABLE IF EXISTS test_db.users;
-- DROP DATABASE IF EXISTS test_db;

-- Relazione OneToOne
-- signin -> signin_id - email - password - user_id
CREATE TABLE IF NOT EXISTS test_db.signin (
	signin_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(50) NOT NULL,
    user_id INT NOT NULL UNIQUE,
    CONSTRAINT signin_user_fk 
		FOREIGN KEY(user_id) 
		REFERENCES test_db.users(user_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

/*CREATE TABLE IF NOT EXISTS test_db.signin (
	signin_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(50) NOT NULL,
    CONSTRAINT signin_user_fk 
		FOREIGN KEY(signin_id) 
		REFERENCES test_db.users(user_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);*/

-- Relazione OneToMany o ManyToOne
-- cars -> car_id - car_name - car_license_plate - user_id
CREATE TABLE IF NOT EXISTS test_db.cars (
	car_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    car_name VARCHAR(50) NOT NULL,
    car_license_plate CHAR(7) NOT NULL UNIQUE,
    user_id INT NULL,
    CONSTRAINT car_user_fk FOREIGN KEY(user_id)
		REFERENCES test_db.users(user_id)
        ON UPDATE CASCADE ON DELETE CASCADE
);

-- Relazione ManyToMany
-- courses -> course_id - course_name - course_code - course_hours
CREATE TABLE IF NOT EXISTS test_db.courses (
	course_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    course_code INT4 NOT NULL,
    course_hours INT NULL DEFAULT 200
);

ALTER TABLE test_db.courses ADD CONSTRAINT course_code_uk UNIQUE(course_code);

-- users_courses -> users_courses_id - user_id - course_id - registration_date
CREATE TABLE IF NOT EXISTS test_db.users_courses (
	users_courses_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    course_id INT NOT NULL
    /*
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
						ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT users_courses_fk1 FOREIGN KEY(user_id) 
		REFERENCES test_db.users(user_id),
	CONSTRAINT users_courses_fk2 FOREIGN KEY(course_id)
		REFERENCES test_db.courses(course_id)
	*/
);

ALTER TABLE test_db.users_courses 
		ADD COLUMN registration_date TIMESTAMP 
        DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

-- ALTER TABLE test_db.users_courses ADD CONSTRAINT users_courses_id_pk PRIMARY KEY(users_courses_id);

ALTER TABLE test_db.users_courses
		ADD CONSTRAINT users_courses_fk1 FOREIGN KEY(user_id) 
        REFERENCES test_db.users(user_id)
        ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE test_db.users_courses
		ADD CONSTRAINT users_courses_fk2 FOREIGN KEY(course_id)
        REFERENCES test_db.courses(course_id)
        ON DELETE CASCADE ON UPDATE CASCADE;

-- DML
-- users -> user_id - firstname - lastname - age - city - fiscal_code
INSERT INTO test_db.users(firstname, lastname, age, city, fiscal_code)
			VALUES ('Mario', 'Rossi', 23, 'Roma', 'ABC123DEF456GHI7');
INSERT INTO test_db.users(firstname, lastname, fiscal_code)
			VALUES ('Giuseppe', 'Verdi', 'ABC123DEF456GHI8');
INSERT INTO test_db.users(firstname, lastname, age, city, fiscal_code)
			VALUES ('Francesca', 'Neri', 28, 'Milano', 'ABC123DEF456GHI9');

UPDATE test_db.users SET city = 'Palermo', age = 19 WHERE user_id = 3;

DELETE FROM test_db.users WHERE user_id = 3;

SELECT * FROM test_db.users;

-- signin -> signin_id - email - password - user_id
INSERT INTO test_db.signin (email, password, user_id)
		VALUES  ('m.rossi@example.com', 'Pa$$w0rd!', 1),
				('f.neri@example.com', 'Pa$$w0rd!', 5);
 
 INSERT INTO test_db.signin (email, password, user_id)
		VALUES  ('g.verdi@example.com', 'Pa$$w0rd!', 6);

INSERT INTO test_db.signin (email, password, user_id)
		VALUES  ('test@example.com', 'test', 5);
        
DELETE FROM test_db.users WHERE user_id = 5;
        
SELECT * FROM test_db.signin;
        
-- cars -> car_id - car_name - car_license_plate - user_id
INSERT INTO test_db.cars (car_name, car_license_plate, user_id)
		VALUES  ('Fiat Panda', 'AB123CD', 1),
				('Ford Fiesta', 'CD456FE', 6),
                ('Renault Clio', 'EF789GH', 1);

DELETE FROM test_db.users WHERE user_id = 1;

SELECT * FROM test_db.cars;

-- courses -> course_id - course_name - course_code - course_hours
INSERT INTO test_db.courses (course_name, course_code, course_hours)
		VALUES  ('SQL', 1, 40),
				('Python', 2, 60),
                ('Java', 3, 100);

SELECT * FROM test_db.courses;

-- users_courses -> users_courses_id - user_id - course_id - registration_date
INSERT INTO test_db.users_courses (user_id, course_id)
		VALUES  (6, 1),
				(6, 2);
                
DELETE FROM test_db.users WHERE user_id = 6;

SELECT * FROM test_db.users_courses;

-- TRANSACTION COMMIT
-- products (product_id, title, category, price)
-- orders (order_id, user_id, order_date, total)
-- order_details (detail_id, order_id, product_id, qt, price)
CREATE TABLE IF NOT EXISTS test_db.products (
	product_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(250) NOT NULL,
    category VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL
);

CREATE TABLE IF NOT EXISTS test_db.orders (
	order_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    total DECIMAL(10,2) NOT NULL,
    CONSTRAINT user_order_fk FOREIGN KEY(user_id) REFERENCES users(user_id)
);

CREATE TABLE IF NOT EXISTS test_db.order_details (
	detail_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    qt INT UNSIGNED DEFAULT 1,
    price DECIMAL(10,2) NOT NULL,
    CONSTRAINT order_detail_fk FOREIGN KEY(order_id) 
		REFERENCES orders(order_id) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT order_detail_product_fk FOREIGN KEY(product_id) 
		REFERENCES products(product_id) 
);

INSERT INTO test_db.products (title, category, price)
	VALUES  ('Smartphone X200', 'Elettronica', 399.99),
			('Tastiera Meccanica RGB', 'Informatica', 89.90),
			('Borraccia Termica 750ml', 'Casa e Cucina', 17.50),
			('Zaino Antifurto UrbanTech', 'Accessori', 45.00),
			('Cuffie Bluetooth Noise Cancel', 'Audio', 79.99),
			('Maglietta Cotone Bio L', 'Abbigliamento', 14.90),
			('Mouse Wireless Ergonomico', 'Informatica', 29.99),
			('Set Penne Colorate 12pz', 'Cartoleria', 6.49),
			('Power Bank 20000mAh', 'Accessori', 32.99),
			('Lampada da Tavolo LED Touch', 'Illuminazione', 25.00);

/*INSERT INTO test_db.orders (user_id, total) VALUES (8, 70.00);
INSERT INTO test_db.order_details(order_id, product_id, price) 
	VALUES  (1, 4, 45.00),
			(1, 10, 25.00);
*/

-- Esempio 1 senza condizioni
SET autocommit = 0; -- Disabilito l'auto commit di default
START TRANSACTION; 
-- Effettuo tutte le istruzioni di tipo DML (INSERT | UPDATE | DELETE)
-- Inserisco un ordine nella tabella orders
INSERT INTO test_db.orders (user_id, total) VALUES (8, 70.00);
-- Ottendo l'id generato per l'oridine appena inserito
SET @order_id = LAST_INSERT_ID();
-- Inserisco i dettagli dell'ordine appena inserito
INSERT INTO test_db.order_details(order_id, product_id, price) 
VALUES  (@order_id, 4, 45.00),
		(@order_id, 10, 25.00);	
-- ROLLBACK; -- Torno in uno stato precedente
COMMIT; -- Salvo le modifiche nel database

-- Esempio 2 con istruzioni condizionali da utilizzare solo in una function o una store procedure
/*SET autocommit = 0; -- Disabilito l'auto commit di default
START TRANSACTION; 
-- Effettuo tutte le istruzioni di tipo DML (INSERT | UPDATE | DELETE)
BEGIN -- Blocco di istruzioni principale
	-- Inserisco un ordine nella tabella orders
	INSERT INTO test_db.orders (user_id, total) VALUES (8, 70.00);
    -- Ottendo l'id generato per l'oridine appena inserito
	SET @order_id = LAST_INSERT_ID();
	-- Inserisco i dettagli dell'ordine appena inserito
	INSERT INTO test_db.order_details(order_id, product_id, price) 
	VALUES  (@order_id, 4, 45.00),
			(@order_id, 10, 25.00);
	-- Verifica di una condizione
    IF(70.00 > 0) THEN
		COMMIT; -- Salvo le modifiche nel database
	ELSE 
		ROLLBACK; -- Torno in uno stato precedente
	END IF;
END;*/

SELECT * FROM test_db.users;
SELECT * FROM test_db.products;
SELECT * FROM test_db.orders;
SELECT * FROM test_db.order_details;

-- DQL
-- SELECT [DISTINCT] column_name1, column_name2, ... column_nameN | * | aggregate_function(expression)
-- 	FROM table_name
-- 	[WHERE search_condition]
-- 	[GROUP BY]
-- 	[HAVING search_condition]
-- 	[ORDER BY]
-- 	[LIMIT n]

USE sakila;
SELECT * FROM sakila.address;
SELECT address, district FROM sakila.address;
SELECT COUNT(*) FROM sakila.address;
SELECT * FROM sakila.address WHERE district = 'California';
SELECT COUNT(*) AS numRighe FROM sakila.address WHERE district = 'California';
SELECT DISTINCT district FROM sakila.address;

SELECT * FROM sakila.film;
SELECT COUNT(*) FROM sakila.film;
SELECT * FROM sakila.film WHERE release_year = 2006 AND rental_duration > 6;
SELECT * FROM sakila.film WHERE release_year = 2005 OR rental_duration > 6;
SELECT * FROM sakila.film WHERE release_year = 2005 AND (rental_duration < 6 OR rental_rate = 2.99);

SELECT * FROM sakila.film WHERE title = 'AFRICAN EGG';
SELECT * FROM sakila.film WHERE title LIKE '%APA%';
SELECT * FROM sakila.film WHERE title LIKE '%APE';
SELECT * FROM sakila.film WHERE title LIKE 'AP%';
SELECT * FROM sakila.film WHERE title LIKE 'AP_C%';

SELECT * FROM sakila.film WHERE length BETWEEN 50 AND 60;
SELECT * FROM sakila.film WHERE length >= 50 AND length <= 60;
SELECT * FROM sakila.film WHERE title BETWEEN 'AC%' AND 'AM%';

SELECT * FROM sakila.film WHERE rating IN ('NC-17', 'R', 'PG-13');
SELECT * FROM sakila.film WHERE rating NOT IN ('NC-17', 'R', 'PG-13');

SELECT CONCAT(title, ' (', release_year, ')') FROM sakila.film WHERE title LIKE '%APE';
SELECT LOWER(title) FROM sakila.film WHERE title LIKE '%APE';
SELECT UPPER(title) FROM sakila.film WHERE title LIKE '%APE';
SELECT LENGTH(title) FROM sakila.film WHERE title LIKE '%APE';
SELECT * FROM sakila.film WHERE LENGTH(title)  > 20;

SELECT district, COUNT(*) AS numCity 	-- 7
	FROM sakila.address					-- 1
    WHERE city_id > 300					-- 2
    GROUP BY district					-- 3
    HAVING numCity >= 2					-- 4
    ORDER BY numCity DESC				-- 5
    LIMIT 5 OFFSET 0;					-- 6

-- JOIN example
SELECT * FROM sakila.rental;
SELECT * FROM sakila.customer;
SELECT * FROM sakila.staff;

SELECT rental_id, rental_date, return_date, c.first_name, 
		c.last_name, c.email, s.first_name AS staff_firstname, 
        s.last_name AS staff_lastname, s.email AS staff_email
	FROM sakila.rental AS r
    INNER JOIN sakila.customer AS c ON r.customer_id = c.customer_id
    INNER JOIN sakila.staff AS s ON r.staff_id = s.staff_id;

-- INNER QUERY example
SELECT * FROM sakila.customer;
SELECT * FROM sakila.rental;

-- Visualizzare il numero di noleggi effettuato da ogni cliente
SELECT c.customer_id, c.first_name, c.last_name, (
		SELECT COUNT(*) FROM sakila.rental AS r 
			WHERE r.customer_id = c.customer_id
	) AS total_rental
	FROM sakila.customer AS c;

-- Visualizzare i clienti che hanno effettuato 
-- almento un noleggio nel periodo di agosto 2005
SELECT c.first_name, c.last_name FROM sakila.customer AS c
	WHERE c.customer_id  IN (
		SELECT r.customer_id FROM sakila.rental AS r 
			WHERE YEAR(r.rental_date) = 2005 AND MONTH(r.rental_date) = 8 
    );

-- Calcolare il numero di noleggi effettuati per mese nel 2005
SELECT mese, COUNT(*) AS totale_noleggi FROM (
	SELECT rental_id, MONTHNAME(rental_date) AS mese FROM sakila.rental 
		WHERE YEAR(rental_date) = 2005
) AS sub
GROUP BY mese

