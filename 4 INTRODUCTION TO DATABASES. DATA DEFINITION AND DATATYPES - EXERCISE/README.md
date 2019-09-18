04 Exercises: Data Definition and Data Types
============================================

---
---

This document defines the **exercise assignments** for the ["Databases Basics -
MySQL" course \@ Software
University.](https://softuni.bg/courses/databases-basics-mysql)

---

04.01 Create Database
---------------------

You now know how to create database using the GUI of the Workbench. Now it’s
time to create it using SQL queries. In that task (and the several following it)
you will be required to create the database from the previous exercise **using
only SQL queries**. Firstly, just **create new database** named **minions.**

<br/>

### Solution: <a title="01 Create Database" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/a3a7202f7659f5e3f3e6557be908497539d90a33/4%20INTRODUCTION%20TO%20DATABASES.%20DATA%20DEFINITION%20AND%20DATATYPES%20-%20EXERCISE/homework.sql#L2">01 Create Database</a>
    -- ------------------------------------------
    -- 1. Create Database				
    -- ------------------------------------------
    
    CREATE DATABASE minions;
    
    USE minions;

---
04.02 Create Tables
-------------------

In the newly created database Minions add table **minions (id, name, age)**.
Then add new table **towns (id, name).** Set **id** columns of both tables to be
**primary key** as **constraint**. Submit your create table queries in Judge
together for both tables (one after another separated by “;”) as **Run queries &
check DB.**

<br/>

### Solution: <a title="02 Create Tables" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/a3a7202f7659f5e3f3e6557be908497539d90a33/4%20INTRODUCTION%20TO%20DATABASES.%20DATA%20DEFINITION%20AND%20DATATYPES%20-%20EXERCISE/homework.sql#L10">02 Create Tables</a>
    -- ------------------------------------------
    -- 2. Create Tables				
    -- ------------------------------------------
    
    CREATE TABLE minions (
        id INT PRIMARY KEY,
        name VARCHAR(50),
        age INT
    );
    
    CREATE TABLE towns (
        id INT PRIMARY KEY,
        name VARCHAR(50)
    );

---
04.03 Alter Minions Table
-------------------------

Change the structure of the Minions table to have **new column town_id** that
would be of the same type as the **id** column of **towns table**. Add **new
constraint** that makes **town_id foreign key** and references to **id** column
of **towns** table. Submit your create table query in Judge as **MySQL run
skeleton, run queries & check DB**

<br/>

### Solution: <a title="03 Alter Minions Table" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/a3a7202f7659f5e3f3e6557be908497539d90a33/4%20INTRODUCTION%20TO%20DATABASES.%20DATA%20DEFINITION%20AND%20DATATYPES%20-%20EXERCISE/homework.sql#L25">03 Alter Minions Table</a>
    -- ------------------------------------------
    -- 3. Alter Minions Table				
    -- ------------------------------------------
    
    ALTER TABLE minions
    ADD town_id INT;
    
    ALTER TABLE minions
    ADD CONSTRAINT FOREIGN KEY (town_id)
    REFERENCES towns(id);
---
04.04 Insert Records in Both Tables
-----------------------------------

**Populate both tables** with sample records given in the table below.

| **minions** |          | **towns** |             |   |        |          |
|-------------|----------|-----------|-------------|---|--------|----------|
| **id**      | **name** | **age**   | **town_id** |   | **id** | **name** |
| 1           | Kevin    | 22        | 1           |   | 1      | Sofia    |
| 2           | Bob      | 15        | 3           |   | 2      | Plovdiv  |
| 3           | Steward  | NULL      | 2           |   | 3      | Varna    |

Use only insert SQL queries. Submit your **INSERT statements** in Judge as **Run
skeleton, run queries & check DB**.

<br/>

### Solution: <a title="04 Insert Records in Both Tables" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/a3a7202f7659f5e3f3e6557be908497539d90a33/4%20INTRODUCTION%20TO%20DATABASES.%20DATA%20DEFINITION%20AND%20DATATYPES%20-%20EXERCISE/homework.sql#L36">04 Insert Records in Both Tables</a>
    -- ------------------------------------------
    -- 4. Insert Records in Both Tables				
    -- ------------------------------------------
    
    INSERT INTO towns
    	VALUES 	(1, 'Sofia'), 
    			(2, 'Plovdiv'), 
                (3, 'Varna');
    
    INSERT INTO minions (id, name, age, town_id)
    	VALUES	(1, 'Kevin', 22, 1), 
    			(2, 'Bob', 15, 3), 
                (3, 'Steward', NULL, 2);
      
---
04.05 Truncate Table Minions
----------------------------

**Delete all the data** from the **minions** table using **SQL query.** Submit
your query in Judge as **Run skeleton, run queries & check DB**.

<br/>

### Solution: <a title="05 Truncate Table Minions" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/a3a7202f7659f5e3f3e6557be908497539d90a33/4%20INTRODUCTION%20TO%20DATABASES.%20DATA%20DEFINITION%20AND%20DATATYPES%20-%20EXERCISE/homework.sql#L50">05 Truncate Table Minions</a>
    -- ------------------------------------------
    -- 5. Truncate Table Minions				
    -- ------------------------------------------
    
    TRUNCATE TABLE minions;

---
04.06 Drop All Tables
---------------------

**Delete all tables** from the **minions** database using **SQL query**. Submit
your query in Judge as **Run skeleton, run queries & check DB**.

<br/>

### Solution: <a title="06 Drop All Tables" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/a3a7202f7659f5e3f3e6557be908497539d90a33/4%20INTRODUCTION%20TO%20DATABASES.%20DATA%20DEFINITION%20AND%20DATATYPES%20-%20EXERCISE/homework.sql#L56">06 Drop All Tables</a>
    -- ------------------------------------------
    -- 6. Drop All Tables				
    -- ------------------------------------------
    
    DROP TABLE minions;
    DROP TABLE towns;
---
04.07 Create Table People
-------------------------

Using **SQL query** create table “**people**” with columns:

-   **id** – unique number for every person there will be **no more than
    231**-1**people.** (Auto incremented)

-   **name** – full name of the person will be **no more than 200 Unicode
    characters**. (Not null)

-   **picture** – image with **size up to 2 MB.** (Allow nulls)

-   **height** – In meters. Real number precise up to **2 digits** after
    floating point. (Allow nulls)

-   **weight** – In kilograms. Real number precise up to **2 digits** after
    floating point. (Allow nulls)

-   **gender** – Possible states are **m** or **f.** (Not null)

-   **birthdate –** (Not null)

-   **biography** – detailed biography of the person it can contain **max
    allowed Unicode characters.** (Allow nulls)

Make **id** primary key. Populate the table with **5 records**. Submit your
**CREATE** and **INSERT statements** in Judge as **Run queries & check DB**.

<br/>

### Solution: <a title="07 Create Table People" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/a3a7202f7659f5e3f3e6557be908497539d90a33/4%20INTRODUCTION%20TO%20DATABASES.%20DATA%20DEFINITION%20AND%20DATATYPES%20-%20EXERCISE/homework.sql#L63">07 Create Table People</a>
    -- ------------------------------------------
    -- 7. Create Table People 			
    -- ------------------------------------------
    
    CREATE TABLE people (
        id INT UNIQUE AUTO_INCREMENT,
        name VARCHAR(200) NOT NULL,
        picture BLOB,
        height DOUBLE(19 , 2 ),
        weight DOUBLE(19 , 2 ),
        gender enum('m','f') NOT NULL,
        birthdate DATE NOT NULL,
        biography TEXT
    );
    
    ALTER TABLE people
    ADD PRIMARY KEY (id);
    
    INSERT INTO people
    	VALUES	(1, 'Petar Petrov', NULL, NULL, NULL, 'm', '1985-07-27', NULL),
    			(2, 'Rangel Marinov', NULL, NULL, NULL, 'm', '1985-05-27', NULL),
    			(3, 'Stefan Varbev', NULL, NULL, NULL, 'm', '1985-12-02', NULL),
    			(4, 'Tixomir Rashev', NULL, NULL, NULL, 'm', '1985-05-01', NULL),
    			(5, 'Ivan Ivanov', NULL, NULL, NULL, 'm', '1975-09-16', NULL);
---
04.08 Create Table Users
------------------------

Using **SQL query** create table **users** with columns:

-   **id** – unique number for every user. There will be **no more than 263-1
    users.** (Auto incremented)

-   **username** – unique identifier of the user will be **no more than 30
    characters (non Unicode).** (Required)

-   **password** – password will be **no longer than 26 characters (non
    Unicode).** (Required)

-   **profile_picture** – image with **size up to 900 KB.**

-   **last_login_time**

-   **is_deleted** – shows if the user deleted his/her profile. Possible states
    are **true** or **false**.

Make **id** primary key. Populate the table with **5 records**. Submit your
**CREATE** and **INSERT statements**. Submit your **CREATE** and **INSERT
statements** as **Run queries & check DB.**

<br/>

### Solution: <a title="08 Create Table Users" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/a3a7202f7659f5e3f3e6557be908497539d90a33/4%20INTRODUCTION%20TO%20DATABASES.%20DATA%20DEFINITION%20AND%20DATATYPES%20-%20EXERCISE/homework.sql#L88">08 Create Table Users</a>
    -- ------------------------------------------
    -- 8. Create Table Users						
    -- ------------------------------------------
    
    CREATE TABLE users(
    	id BIGINT UNIQUE AUTO_INCREMENT, 
        username VARCHAR(30) UNIQUE NOT NULL, 
        password VARCHAR(26) NOT NULL, 
        profile_picture MEDIUMBLOB,
        last_login_time TIME, 
        is_deleted TINYINT NOT NULL
    );
    
    ALTER TABLE users
    ADD PRIMARY KEY (id);
    
    INSERT INTO users (`username`, `password`, `last_login_time`, `is_deleted`)
    	VALUES	('Petar Petrov', 'asd',  NULL, TRUE),
    			('Rangel Marinov', 'asdasd', NULL, FALSE),
    			('Stefan Varbev', 'qweqweqweq', NULL, FALSE),
    			('Tixomir Rashev', 'zxcsd', NULL, TRUE),
    			('Ivan Ivanov', 'jhasjdaksj', NULL, TRUE);
---
04.09 Change Primary Key
------------------------

Using **SQL queries** modify table **users** from the previous task. First
**remove current primary key** then create **new primary key** that would be
**combination** of fields **id** and **username**. The initial primary key name
on **id** is **pk_users**. Submit your query in Judge as **Run skeleton, run
queries & check DB**.

<br/>

### Solution: <a title="09 Change Primary Key" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/a3a7202f7659f5e3f3e6557be908497539d90a33/4%20INTRODUCTION%20TO%20DATABASES.%20DATA%20DEFINITION%20AND%20DATATYPES%20-%20EXERCISE/homework.sql#L112">09 Change Primary Key</a>
    - ------------------------------------------
    -- 9. Change Primary Keyusers
    -- ------------------------------------------
    
    ALTER TABLE users DROP PRIMARY KEY,
    ADD CONSTRAINT pk_users PRIMARY KEY (id, username);
---
04.10 Set Default Value of a Field
----------------------------------

Using **SQL queries** modify table **users**. Make the **default value** of
**last_login_time** field to be the **current time.** Submit your query in Judge
as **Run skeleton, run queries & check DB**.

<br/>

### Solution: <a title="10 Set Default Value of a Field" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/a3a7202f7659f5e3f3e6557be908497539d90a33/4%20INTRODUCTION%20TO%20DATABASES.%20DATA%20DEFINITION%20AND%20DATATYPES%20-%20EXERCISE/homework.sql#L119">10 Set Default Value of a Field</a>
    -- ------------------------------------------
    -- 10. Set Default Value of a Field
    -- ------------------------------------------
    
    ALTER TABLE users
    MODIFY COLUMN last_login_time
    TIMESTAMP
    NOT NULL DEFAULT CURRENT_TIMESTAMP; 
---
04.11 Set Unique Field
----------------------

Using **SQL queries** modify table **users**. Remove **username** field from the
primary key so only the field **id** would be primary key. Now **add unique
constraint** to the **username** field. The initial primary key name on (**id,
username)** is **pk_users**. Submit your query in Judge as **Run skeleton, run
queries & check DB**.

<br/>

### Solution: <a title="11 Set Unique Field" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/a3a7202f7659f5e3f3e6557be908497539d90a33/4%20INTRODUCTION%20TO%20DATABASES.%20DATA%20DEFINITION%20AND%20DATATYPES%20-%20EXERCISE/homework.sql#L128">11 Set Unique Field</a>
    -- ------------------------------------------
    -- 11. Set Unique Field 
    -- ------------------------------------------
    
    ALTER TABLE users
    DROP PRIMARY KEY,
    ADD CONSTRAINT pk_users PRIMARY KEY(id);
---
04.12 Movies Database
---------------------

Using **SQL queries** create **Movies** database with the following entities:

-   **directors** (id, director_name, notes)

-   **genres** (id, genre_name, notes)

-   **categories** (id, category_name, notes)

-   **movies** (id, title, director_id, copyright_year, length, genre_id,
    category_id, rating, notes)

Set most **appropriate data types** for each column. **Set primary key** to each
table. Populate each table with **5 records**. Make sure the columns that are
present in 2 tables would be of the **same data type**. Consider which fields
are always required and which are optional. Submit your **CREATE TABLE** and
**INSERT statements** as **Run queries & check DB.**

<br/>

### Solution: <a title="12 Movies Database" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/a3a7202f7659f5e3f3e6557be908497539d90a33/4%20INTRODUCTION%20TO%20DATABASES.%20DATA%20DEFINITION%20AND%20DATATYPES%20-%20EXERCISE/homework.sql#L136">12 Movies Database</a>
    -- ------------------------------------------
    -- 12. Movies Database
    -- ------------------------------------------
    
    CREATE DATABASE Movies;
    
    USE Movies;
    
    CREATE TABLE directors (
        id INT PRIMARY KEY AUTO_INCREMENT, 
        director_name VARCHAR(50) NOT NULL, 
        notes TEXT
    );
    
    CREATE TABLE genres (
    	id INT PRIMARY KEY AUTO_INCREMENT, 
        genre_name VARCHAR(50) NOT NULL,
        notes TEXT
    );
    
    CREATE TABLE categories (
    	id INT PRIMARY KEY AUTO_INCREMENT, 
        category_name VARCHAR(50) NOT NULL,
        notes TEXT
    );
    
    CREATE TABLE movies (
        id INT PRIMARY KEY AUTO_INCREMENT,
        title VARCHAR(50) NOT NULL,
        director_id INT ,
        copyright_year DATE NOT NULL,
        length INT NOT NULL,
        genre_id INT NOT NULL,
        category_id INT NOT NULL,
        rating INT,
        notes TEXT
    );
    
    INSERT INTO directors (id, director_name)
    	VALUES
    		(1, 'firstName'),
    		(2, 'secondName'),
    		(3, 'thisrdName'),
    		(4, 'fourthName'),
    		(5, 'fifthName');
    
    INSERT INTO genres (id, genre_name)
    	VALUES
    		(1, 'firstGenre'),
    		(2, 'secondGenre'),
    		(3, 'thisrdGenre'),
    		(4, 'fourthGenre'),
    		(5, 'fifthGenre');
    
    INSERT INTO categories (id, category_name)
    	VALUES
    		(1, 'firstCategory'),
    		(2, 'secondCategory'),
    		(3, 'thisrdCategory'),
    		(4, 'fourthCategory'),
    		(5, 'fifthCategory');
    
    INSERT INTO movies (id, title, copyright_year, length, genre_id, category_id)
    	VALUES
    		(5,'firstTitle', '1988-02-22',123,2,4),
    		(6,'secondTitle', '2012-02-02',134,2,2),
    		(7,'thirdTitle', '2000-12-18',125,2,9),
    		(8,'fourthTitle', '2013-05-22',143,5,8),
    		(9,'fifthTitle', '1999-07-07',163,5,5);
    
    /*
    ALTER TABLE movies
    ADD CONSTRAINT FOREIGN KEY (director_id)
    REFERENCES directors(id),
    ADD CONSTRAINT FOREIGN KEY (genre_id)
    REFERENCES genres(id), 
    ADD CONSTRAINT FOREIGN KEY (category_id)
    REFERENCES categories(id);
    */
---
04.13 Car Rental Database
-------------------------

Using **SQL queries** create **car_rental** database with the following
entities:

-   **categories** (**id**, **category**, **daily_rate**, **weekly_rate**,
    **monthly_rate**, **weekend_rate**)

-   **cars** (**id**, **plate_number**, **make**, **model**, **car_year**,
    **category_id**, **doors**, **picture**, **car_condition**, **available**)

-   **employees** (**id**, **first_name**, **last_name**, **title**, **notes**)

-   **customers** (**id**, **driver_licence_number**, **full_name**,
    **address**, **city**, **zip_code**, **notes**)

-   **rental_orders** (**id**, **employee_id**, **customer_id**, **car_id**,
    **car_condition**, **tank_level**, **kilometrage_start**,
    **kilometrage_end**, **total_kilometrage**, **start_date**, **end_date**,
    **total_days**, **rate_applied**, **tax_rate**, **order_status**, **notes**)

Set most **appropriate data types** for each column. **Set primary key** to each
table. Populate each table with **3 records**. Make sure the columns that are
present in 2 tables would be of the **same data type**. Consider which fields
are always required and which are optional. Submit your **CREATE TABLE** and
**INSERT statements** as **Run queries & check DB.**

<br/>

### Solution: <a title="13 Car Rental Database" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/a3a7202f7659f5e3f3e6557be908497539d90a33/4%20INTRODUCTION%20TO%20DATABASES.%20DATA%20DEFINITION%20AND%20DATATYPES%20-%20EXERCISE/homework.sql#L216">13 Car Rental Database</a>
    -- ------------------------------------------
    -- 13. Car Rental Database						83 / 100
    -- ------------------------------------------
    
    CREATE DATABASE car_rental;
    
    USE car_rental;
    
    CREATE TABLE categories (
    	id INT PRIMARY KEY AUTO_INCREMENT, 
        category VARCHAR(50) NOT NULL, 
        daily_rate DECIMAL(19,2), 
        weekly_rate DECIMAL(19,2), 
        monthly_rate DECIMAL(19,2), 
        weekend_rate DECIMAL(19,2)
    );
    
    INSERT INTO categories(category)
    	VALUES 
    		('firstCategory'), 
            ('secondCategory'), 
            ('thirdCategory');
    
    CREATE TABLE cars (
        id INT PRIMARY KEY AUTO_INCREMENT,
        plate_number INT NOT NULL,
        make VARCHAR(50),
        model VARCHAR(50) NOT NULL,
        car_year DATE,
        category_id INT,
        doors INT,
        picture BLOB,
        car_condition TEXT,
        available BOOLEAN NOT NULL
    );
    
    INSERT INTO cars (plate_number, model, available)
    	VALUES
    		(1234, 'AUDI', TRUE), 
    		(98734923, 'BMW', FALSE), 
    		(12379, 'MERCEDES_BENZ', TRUE); 
            
    
    CREATE TABLE employees (
    	id INT PRIMARY KEY AUTO_INCREMENT, 
        first_name VARCHAR(50) NOT NULL,
        last_name VARCHAR(50) NOT NULL,
        title VARCHAR(50), 
        notes TEXT
    );
    
    INSERT INTO employees (first_name, last_name)
    	VALUES 
    		('Angel', 'Rashkov'),
    		('Blaze', 'Ivanov'),
    		('Kircho', 'Vanilov');
    
    CREATE TABLE customers (
    	id INT PRIMARY KEY AUTO_INCREMENT,
        driver_licence_number VARCHAR(50), 
        full_name VARCHAR(50) NOT NULL, 
        address TEXT, 
        city VARCHAR(50), 
        zip_code INT, 
        notes TEXT
    );
    
    INSERT INTO customers (full_name)
    	VALUES 
    		('Stefcho stefchev'),
    		('Martin Xristov'),
    		('Mansi Mansev');
    
    CREATE TABLE rental_orders (
    	id INT PRIMARY KEY AUTO_INCREMENT, 
        employee_id INT NOT NULL, 
        customer_id INT NOT NULL,
        car_id INT NOT NULL, 
        car_condition TEXT, 
        tank_level INT, 
        kilometrage_start INT, 
        kilometrage_end INT, 
        total_kilometrage INT, 
        start_date DATE,
        end_date DATE, 
        total_days INT, 
        rate_applied VARCHAR(50), 
        tax_rate DECIMAL(19, 2),
        order_status VARCHAR(50), 
        notes TEXT
    );
    
    INSERT INTO rental_orders(employee_id, customer_id, car_id)
    	VALUES
    		(1,2,3),
    		(3,4,5),
    		(7,9,8);
---
04.14 Hotel Database
--------------------

Using **SQL queries** create **Hotel** database with the following entities:

-   **employees** (**id**, **first_name**, **last\_**name, **title**, **notes**)

-   **customers** (**account_number**, **first_name**, **last_name**,
    **phone_number**, **emergency_name**, **emergency_number**, **notes**)

-   **room_status** (**room_status**, **notes**)

-   **room_types** (**room_type**, **notes**)

-   **bed_types** (**bed_type**, **notes**)

-   **rooms** (**room_number**, **room_type**, **bed_type**, **rate**,
    **room_status**, **notes**)

-   **payments** (**id**, **employee_id**, **payment_date**, **account_number**,
    **first_date_occupied**, **last_date_occupied**, **total_days**,
    **amount_charged**, **tax_rate**, **tax_amount**, **payment_total**,
    **notes**)

-   **occupancies** (**id**, **employee_id**, **date_occupied**,
    **account_number**, **room_number**, **rate_applied**, **phone_charge**,
    **notes**)

Set most **appropriate data types** for each column. **Set primary key** to each
table. Populate each table with **3 records**. Make sure the columns that are
present in 2 tables would be of the **same data type**. Consider which fields
are always required and which are optional. Submit your **CREATE TABLE** and
**INSERT statements** as **Run queries & check DB.**

<br/>

### Solution: <a title="14 Hotel Database" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/a3a7202f7659f5e3f3e6557be908497539d90a33/4%20INTRODUCTION%20TO%20DATABASES.%20DATA%20DEFINITION%20AND%20DATATYPES%20-%20EXERCISE/homework.sql#L314">14 Hotel Database</a>
    -- ------------------------------------------
    -- 14. Hotel Database
    -- ------------------------------------------
    
    CREATE DATABASE Hotel;
    
    USE Hotel;
    
    CREATE TABLE employees (
        id INT PRIMARY KEY AUTO_INCREMENT,
        first_name VARCHAR(30) NOT NULL,
        last_name VARCHAR(30) NOT NULL,
        title VARCHAR(30),
        notes TEXT
    );
    
    INSERT INTO employees (first_name, last_name)
    	VALUES 
    		('asd', 'asd'),
    		('aasd', 'asssd'),
    		('aaasd', 'asssssd');
    
    CREATE TABLE customers (
        account_number INT PRIMARY KEY,
        first_name VARCHAR(30) NOT NULL,
        last_name VARCHAR(30) NOT NULL,
        phone_number INT,
        emergency_name VARCHAR(30),
        emergency_number INT,
        notes TEXT
    );
    
    INSERT INTO customers (account_number, first_name, last_name)
    	VALUES
    		(3213123, 'asdads', 'adserevv'),
    		(322313123, 'asjhdads', 'adhjserevv'),
    		(321323123, 'asdakkds', 'adserehjgvv');
    
    CREATE TABLE room_status (
        room_status VARCHAR(30) PRIMARY KEY,
        notes TEXT
    );
    
    INSERT INTO room_status (room_status)
    	VALUES
    		('inUse'), 
            ('free'), 
            ('occupied');
    
    CREATE TABLE room_types (
        room_type VARCHAR(50) PRIMARY KEY,
        notes TEXT
    );
    
    INSERT INTO room_types (room_type)
    	VALUES
    		('single'),
    		('double'),
    		('appartment');
    
    CREATE TABLE bed_types (
        bed_type VARCHAR(50) PRIMARY KEY,
        notes TEXT
    );
    
    INSERT INTO bed_types (bed_type)
    	VALUES 
    		('ONE BED'), 
            ('DOUBLE BED'),
            ('DOUBLE BED + CHILD BED');
    
    CREATE TABLE rooms (
        room_number INT PRIMARY KEY,
        room_type VARCHAR(50),
        bed_type VARCHAR(50),
        rate INT NOT NULL,
        room_status VARCHAR(50),
        notes TEXT
    );
    
    INSERT INTO rooms (room_number, rate)
    	VALUES
    		(1, 5), 
            (2, 6), 
            (3, 2);
    
    CREATE TABLE payments (
        id INT AUTO_INCREMENT PRIMARY KEY,
        employee_id INT,
        payment_date DATE,
        account_number INT NOT NULL,
        first_date_occupied DATE,
        last_date_occupied DATE,
        total_days INT,
        amount_charged DECIMAL(19 , 2 ),
        tax_rate DECIMAL(19 , 2 ),
        tax_amount DECIMAL(19 , 2 ),
        payment_total DECIMAL(19 , 2 ),
        notes TEXT
    );
    
    INSERT INTO payments (account_number)
    	VALUES 
    		(9301230), 
            (3662131), 
            (123);
    
    CREATE TABLE occupancies (
        id INT PRIMARY KEY AUTO_INCREMENT,
        employee_id INT,
        date_occupied DATE,
        account_number INT,
        room_number INT,
        rate_applied INT,
        phone_charge DECIMAL(19 , 2 ),
        notes TEXT NOT NULL
    );
    
    INSERT INTO occupancies (notes)
    	VALUES 
    		('dasdasd'),
    		('dasdasdasdas'),
    		('dasdassdddsd');
---
04.15 Create SoftUni Database
-----------------------------

Now create bigger database called **soft_uni.** You will use database in the
future tasks. It should hold information about

-   **towns** (**id**, **name**)

-   **addresses** (**id**, **address_text**, **town_id**)

-   **departments** (**id**, **name**)

-   **employees** (**id**, **first_name**, **middle_name**, **last_name**,
    **job_title**, **department_id**, **hire_date**, **sa**lary, **address_id**)

**Id** columns are **auto incremented** starting from 1 and increased by 1 (1,
2, 3, 4…). Make sure you **use appropriate data types** for each column. Add
**primary** and **foreign keys as constraints** for each table. Use **only SQL
queries**. Consider which fields are always required and which are optional.
Submit your **CREATE TABLE** *statements* as **Run queries & check DB.**

<br/>

### Solution: <a title="15 Create SoftUni Database" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/a3a7202f7659f5e3f3e6557be908497539d90a33/4%20INTRODUCTION%20TO%20DATABASES.%20DATA%20DEFINITION%20AND%20DATATYPES%20-%20EXERCISE/homework.sql#L438">15 Create SoftUni Database</a>
    -- ------------------------------------------
    -- 15. Create SoftUni Database
    -- ------------------------------------------
    
    CREATE DATABASE soft_uni;
    
    USE soft_uni;
    
    CREATE TABLE towns (
        id INT PRIMARY KEY AUTO_INCREMENT,
        name VARCHAR(30)
    );
    
    CREATE TABLE addresses (
        id INT PRIMARY KEY AUTO_INCREMENT ,
        address_text VARCHAR(50),
        town_id INT,
        CONSTRAINT fk_addresses_towns FOREIGN KEY (town_id)
            REFERENCES towns (id)
    );
    
    CREATE TABLE departments (
        id INT PRIMARY KEY AUTO_INCREMENT,
        name VARCHAR(30)
    );
    
    CREATE TABLE employees (
        id INT PRIMARY KEY AUTO_INCREMENT,
        first_name VARCHAR(30),
        middle_name VARCHAR(30),
        last_name VARCHAR(30),
        job_title VARCHAR(50),
        department_id INT,
        hire_date DATE,
        salary DECIMAL(19 , 2 ),
        address_id INT,
        CONSTRAINT fk_empplyees_departments FOREIGN KEY (department_id)
            REFERENCES departments (id),
        CONSTRAINT fk_employees_addresses FOREIGN KEY (address_id)
            REFERENCES addresses (id)
    );

---
04.16 Backup Database
---------------------

By using **mysqldump command** from MySql command line make a backup of the
database **soft_uni,** from the previous tasks, into a file named
“**softuni-backup.sql**”. Drop your database from Heidi or MySQL Workbench. Then
restore the database from the created backup file by using **mysql command
line**.

---
04.17 Basic Insert
------------------

Use the **SoftUni** database and insert some data **using SQL queries**.

| **name**              | **job_title**   | **department**       | **hire_date** | **salary** |
|-----------------------|-----------------|----------------------|---------------|------------|
| Ivan Ivanov Ivanov    | .NET Developer  | Software Development | 01/02/2013    | 3500.00    |
| Petar Petrov Petrov   | Senior Engineer | Engineering          | 02/03/2004    | 4000.00    |
| Maria Petrova Ivanova | Intern          | Quality Assurance    | 28/08/2016    | 525.25     |
| Georgi Terziev Ivanov | CEO             | Sales                | 09/12/2007    | 3000.00    |
| Peter Pan Pan         | Intern          | Marketing            | 28/08/2016    | 599.88     |

-   **towns:** Sofia, Plovdiv, Varna, Burgas

-   **departments:** Engineering, Sales, Marketing, Software Development,
    Quality Assurance

-   **employees:**

Submit your **INSERT** queries in Judge as **Run skeleton, run queries & check
DB**.

<br/>

### Solution: <a title="17 Basic Insert" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/a3a7202f7659f5e3f3e6557be908497539d90a33/4%20INTRODUCTION%20TO%20DATABASES.%20DATA%20DEFINITION%20AND%20DATATYPES%20-%20EXERCISE/homework.sql#L480">17 Basic Insert</a>
    -- ------------------------------------------
    -- 17. Basic Insert 
    -- ------------------------------------------
    
    INSERT INTO towns(name)
    	VALUES
    		('Sofia'),
    		('Plovdiv'),
    		('Varna'),
    		('Burgas');
    
    INSERT INTO departments(name)
    	VALUES
    		('Engineering'),
            ('Sales'),
            ('Marketing'), 
            ('Software Development'), 
            ('Quality Assurance');
            
    INSERT INTO employees (first_name, middle_name, last_name, job_title, department_id, hire_date ,salary)
    	VALUES
    		('Ivan','Ivanov','Ivanov','.NET Developer',4,'2013-02-01','3500.00'),
    		('Petar','Petrov','Petrov','Senior Engineer',1,'2004-03-02','4000.00'),
    		('Maria','Petrova','Ivanova','Intern',5,'2016-08-28','525.25'),
    		('Georgi','Terziev','Ivanov','CEO',2,'2007-12-09','3000.00'),
    		('Peter','Pan','Pan','Intern',3,'2016-08-28','599.88');
---
04.18 Basic Select All Fields
-----------------------------

Use the **soft_uni** database and first select all records from the **towns**,
then from **departments** and finally from **employees** table. Use SQL queries
and submit them to Judge at once. Submit your query statements as **Prepare DB &
Run queries.**

<br/>

### Solution: <a title="18 Basic Select All Fields" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/a3a7202f7659f5e3f3e6557be908497539d90a33/4%20INTRODUCTION%20TO%20DATABASES.%20DATA%20DEFINITION%20AND%20DATATYPES%20-%20EXERCISE/homework.sql#L508">18 Basic Select All Fields</a>
    -- ------------------------------------------
    -- 18. Basic Select All Fields
    -- ------------------------------------------            
    
    SELECT * FROM towns;
    SELECT * FROM departments;
    SELECT * FROM employees;
---
04.19 Basic Select All Fields and Order Them
--------------------------------------------

Modify queries from previous problem by sorting:

-   **towns** - alphabetically by name

-   **departments** - alphabetically by name

-   **employees** - descending by salary

Submit your query statements as **Prepare DB & Run queries.**

<br/>

### Solution: <a title="19 Basic Select All Fields and Order Them" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/a3a7202f7659f5e3f3e6557be908497539d90a33/4%20INTRODUCTION%20TO%20DATABASES.%20DATA%20DEFINITION%20AND%20DATATYPES%20-%20EXERCISE/homework.sql#L516">19 Basic Select All Fields and Order Them</a>
    -- ------------------------------------------
    -- 19. Basic Select All Fields and Order Them
    -- ------------------------------------------
    
    SELECT * FROM towns
    ORDER BY towns.name ASC;
    
    SELECT * FROM departments
    ORDER BY departments.name ASC;
    
    SELECT * FROM employees
    ORDER BY employees.salary DESC;

---
04.20 Basic Select Some Fields
------------------------------

Modify queries from previous problem to show only **some of the columns**. For
table:

-   **towns** – **name**

-   **departments** – **name**

-   **employees** – **first_name**, **last_name**, **job_title**, **salary**

**Keep the ordering** from the previous problem. Submit your query statements as
**Prepare DB & Run queries**.

<br/>

### Solution: <a title="20 Basic Select Some Fields" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/a3a7202f7659f5e3f3e6557be908497539d90a33/4%20INTRODUCTION%20TO%20DATABASES.%20DATA%20DEFINITION%20AND%20DATATYPES%20-%20EXERCISE/homework.sql#L529">20 Basic Select Some Fields</a>
    - ------------------------------------------
    -- 20. Basic Select Some Fields
    -- ------------------------------------------
    
    SELECT 
        towns.name
    FROM
        towns
    ORDER BY towns.name ASC;
        
    SELECT 
        departments.name
    FROM
        departments
    ORDER BY departments.name ASC;
    
    SELECT 
        employees.first_name,
        employees.last_name,
        employees.job_title,
        employees.salary
    FROM
        employees
    ORDER BY employees.salary DESC;
---
04.21 Increase Employees Salary
-------------------------------

Use **softuni** database and **increase the salary** of all employees by
**10%.** Select **only salary** column from the **employees** table. Submit your
query statements as **Prepare DB & Run queries.**

<br/>

### Solution: <a title="21 Increase Employees Salary" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/a3a7202f7659f5e3f3e6557be908497539d90a33/4%20INTRODUCTION%20TO%20DATABASES.%20DATA%20DEFINITION%20AND%20DATATYPES%20-%20EXERCISE/homework.sql#L554">21 Increase Employees Salary</a>
    - ------------------------------------------
    -- 21. Increase Employees Salary
    -- ------------------------------------------
    
    UPDATE employees 
    SET 
        salary = salary * 1.1;
    SELECT 
        employees.salary
    FROM
        employees;
---
04.22 Decrease Tax Rate
--------------------

Use **hotel** database and **decrease tax rate by 3%** to all payments. Select
**only tax_rate** column from the **payments** table. Submit your query
statements as **Prepare DB & Run queries.**

<br/>

### Solution: <a title="22 Decrease Tax Rate" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/a3a7202f7659f5e3f3e6557be908497539d90a33/4%20INTRODUCTION%20TO%20DATABASES.%20DATA%20DEFINITION%20AND%20DATATYPES%20-%20EXERCISE/homework.sql#L566">22 Decrease Tax Rate</a>
    - ------------------------------------------
    -- 22. Decrease Tax Rate 
    -- ------------------------------------------
    
    UPDATE payments
    SET 
        tax_rate = tax_rate * 0.97;
      
      SELECT tax_rate FROM payments;
---
04.23 Delete All Records
------------------------

Use **Hotel** database and **delete all records** from the **occupancies**
table. Use SQL query. Submit your query statements as **Run skeleton, run
queries & check DB.**

<br/>

### Solution: <a title="23 Delete All Records" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/a3a7202f7659f5e3f3e6557be908497539d90a33/4%20INTRODUCTION%20TO%20DATABASES.%20DATA%20DEFINITION%20AND%20DATATYPES%20-%20EXERCISE/homework.sql#L576">23 Delete All Records</a>
    -- ------------------------------------------
    -- 23. Delete All Records 
    -- ------------------------------------------
    
    DELETE FROM occupancies;
---