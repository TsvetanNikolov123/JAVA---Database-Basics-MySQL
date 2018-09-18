-- ------------------------------------------
-- 1. Create Database				
-- ------------------------------------------

CREATE DATABASE minions;

USE minions;

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

-- ------------------------------------------
-- 3. Alter Minions Table				
-- ------------------------------------------

ALTER TABLE minions
ADD town_id INT;

ALTER TABLE minions
ADD CONSTRAINT FOREIGN KEY (town_id)
REFERENCES towns(id);

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
            
-- ------------------------------------------
-- 5. Truncate Table Minions				
-- ------------------------------------------

TRUNCATE TABLE minions;

-- ------------------------------------------
-- 6. Drop All Tables				
-- ------------------------------------------

DROP TABLE minions;
DROP TABLE towns;

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
            
-- ------------------------------------------
-- 8. Create Table Users						// 71/100 и незнам защо
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


-- ------------------------------------------
-- 9. Change Primary Keyusers
-- ------------------------------------------

ALTER TABLE users DROP PRIMARY KEY,
ADD CONSTRAINT pk_users PRIMARY KEY (id, username);

-- ------------------------------------------
-- 10. Set Default Value of a Field
-- ------------------------------------------

ALTER TABLE users
MODIFY COLUMN last_login_time
TIMESTAMP
NOT NULL DEFAULT CURRENT_TIMESTAMP; 

-- ------------------------------------------
-- 11. Set Unique Field 
-- ------------------------------------------

ALTER TABLE users
DROP PRIMARY KEY,
ADD CONSTRAINT pk_users PRIMARY KEY(id);

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
        
        
-- ------------------------------------------
-- 18. Basic Select All Fields
-- ------------------------------------------            

SELECT * FROM towns;
SELECT * FROM departments;
SELECT * FROM employees;

-- ------------------------------------------
-- 19. Basic Select All Fields and Order Them
-- ------------------------------------------

SELECT * FROM towns
ORDER BY towns.name ASC;

SELECT * FROM departments
ORDER BY departments.name ASC;

SELECT * FROM employees
ORDER BY employees.salary DESC;

-- ------------------------------------------
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

-- ------------------------------------------
-- 21. Increase Employees Salary
-- ------------------------------------------

UPDATE employees 
SET 
    salary = salary * 1.1;
SELECT 
    employees.salary
FROM
    employees;
    
-- ------------------------------------------
-- 22. Decrease Tax Rate 
-- ------------------------------------------

UPDATE payments
SET 
    tax_rate = tax_rate * 0.97;
  
  SELECT tax_rate FROM payments;

-- ------------------------------------------
-- 23. Delete All Records 
-- ------------------------------------------

DELETE FROM occupancies;
