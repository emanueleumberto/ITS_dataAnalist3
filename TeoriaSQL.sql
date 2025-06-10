-- Commenti a singola riga
/*
	Commenti 
    muti riga
*/

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
*/

-- DDL -> DATABASE
DROP DATABASE IF EXISTS test_db;
CREATE DATABASE IF NOT EXISTS test_db;
USE test_db;
 
-- DDL -> TABLE
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
ALTER TABLE test_db.users DROP COLUMN city;

DROP TABLE IF EXISTS test_db.users;
DROP DATABASE IF EXISTS test_db;
