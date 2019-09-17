-- ------------------------------------------
-- 1. Create new database				
-- ------------------------------------------

CREATE DATABASE gamebar;

USE gamebar;

-- ------------------------------------------
-- 2. Create Tables				
-- ------------------------------------------

CREATE TABLE employees (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
);

CREATE TABLE categories (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE products(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL, 
    category_id INT
--    FOREIGN KEY (category_id) REFERENCES categories (id)
);

-- ------------------------------------------
-- 3. Insert Data in Tables				
-- ------------------------------------------

INSERT INTO employees(first_name, last_name)
VALUES 	('Angel', 'Nasko'),
		('Ranel', 'Rangelov'),
		('Stefan', 'Xristov');

-- ------------------------------------------
-- 4. Alter Table				
-- ------------------------------------------

ALTER TABLE employees
ADD middle_name VARCHAR(50);

-- ------------------------------------------
-- 5. Adding Constraints 				
-- ------------------------------------------

ALTER TABLE products
	ADD CONSTRAINT FOREIGN KEY (category_id) 
    REFERENCES categories(id);

-- ------------------------------------------
-- 6. Modifying Columns				
-- ------------------------------------------
    
ALTER TABLE employees
	MODIFY COLUMN middle_name VARCHAR(100);
    
DROP DATABASE gamebar;