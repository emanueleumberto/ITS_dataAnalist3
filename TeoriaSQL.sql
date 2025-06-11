-- Commenti a singola riga
/*
	Commenti 
    muti riga
*/

-- https://dbml.dbdiagram.io/docs/
-- https://dbdiagram.io/home

-- SQL ha diverse categorie di Statement
/*
	DDL -> Data Definition Language
			Definisce tutte le istruzioni di tipo SQL 
            per la creazione e gestione del DB
    DML -> Data Manipulation Language
			Definisce tutte le istruzioni di tipo SQL
            per la creazione e gestione di tabelle di un DB
    DQL -> Data Query Language
			Definisce tutte le istruzioni di tipo SQL
            per le lettura di dati da un DB
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
        ON DELETE CASCADE ON UPDATE CASCADE






