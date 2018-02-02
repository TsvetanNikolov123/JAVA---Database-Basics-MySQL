-- ---1---
CREATE DATABASE `minions`;

-- ---2---
USE `minions`;
CREATE TABLE `minions`(
	`id` INT PRIMARY KEY,
	`name` VARCHAR(50),
    `age` INT
);

CREATE TABLE `towns`(
	`id` INT PRIMARY KEY,
	`name` VARCHAR(50)
);

-- ---3---
ALTER TABLE `minions` ADD COLUMN `town_id` INT;
ALTER TABLE `minions`
ADD CONSTRAINT `fk_minions_towns` FOREIGN KEY(`town_id`)
REFERENCES `towns`(id);

-- ---4---
INSERT INTO `towns`(`id`, `name`)
	VALUES 	(1, 'Sofia'),
			(2, 'Plovdiv'),
			(3, 'Varna');

INSERT INTO `minions`(`id`, `name`, `age`, `town_id`)
	VALUES	(1,'Kevin', 22, 1),
			(2,'Bob', 15, 3),
			(3,'Steward', NULL, 2);

-- ---5---
TRUNCATE TABLE `minions`;

-- ---6---
DROP TABLE `minions`;
DROP TABLE `towns`;

-- ---7---
CREATE TABLE `people`(
	`id` INT AUTO_INCREMENT,
    `name` VARCHAR(200) NOT NULL,
    `picture` MEDIUMBLOB,
    `height` FLOAT(6,2),
    `weight` FLOAT(6,2),
    `gender` ENUM('m', 'f') NOT NULL,
    `birthdate` DATETIME NOT NULL,
    `biography` TEXT,
    CONSTRAINT pk_people PRIMARY KEY(`id`)
);

INSERT INTO `people`(`id`, `name`, `gender`, `birthdate`, `biography`)
	VALUES	(1, 'Petar', 'm', '1990-08-22', 'A good one!'),
			(2, 'Ivan', 'm', '1988-05-16', 'Large one'),
			(3, 'Aleksis', 'f', '1992-05-05', 'Not so good'),
			(4, 'Tsvetan', 'm', '1999-01-13', 'A lot of stories'),
			(5, 'Victor', 'm', '1956-01-22', 'A lot of alcohol in his biography');

-- ---8---
CREATE TABLE `users`(
	`id` BIGINT UNIQUE AUTO_INCREMENT,
    `username` VARCHAR(30) UNIQUE NOT NULL,
    `password` VARCHAR(26) NOT NULL,
    `profile_picture` BLOB,
    `last_login_time` DATE, 
    `is_deleted` BOOL
);

ALTER TABLE `users`
ADD CONSTRAINT pk_users PRIMARY KEY(`id`);

INSERT INTO `users`(`username`, `password`, `last_login_time`, `is_deleted`)
	VALUES	('Rangel', '12345', '2015-02-25', TRUE),
			('Bojo','Bojkata123', '2017-07-02', FALSE),
			('Ivan','VankoKalpazanko', '2018-01-02', TRUE),
			('George','Bojkata123', '2016-12-25', FALSE),
			('Teodor','Bojkata123', '2012-09-01', FALSE);
            
-- ---9---
ALTER TABLE `users`
DROP PRIMARY KEY,
ADD CONSTRAINT `pk_users` PRIMARY KEY(`id`,`username`);

-- ---10---   
ALTER TABLE `users`
MODIFY COLUMN `last_login_time`
TIMESTAMP
NOT NULL DEFAULT CURRENT_TIMESTAMP;

-- ---11---
ALTER TABLE `users` MODIFY `id` BIGINT NOT NULL;
ALTER TABLE `users` DROP PRIMARY KEY;
ALTER TABLE `users` ADD CONSTRAINT `pk_users` PRIMARY KEY(`id`);
ALTER TABLE `users` ADD CONSTRAINT `uq_username` UNIQUE (`username`);

-- ---12---
CREATE TABLE `directors`(
	`id` INT AUTO_INCREMENT PRIMARY KEY,
    `director_name` VARCHAR(30) NOT NULL,
    `notes` BLOB
);
INSERT INTO `directors`(`id`,`director_name`)
	VALUES
		(1,'firstName'),
        (2,'secondName'),
        (3,'thirdName'),
        (4,'fourthName'),
        (5,'fifthName');

CREATE TABLE `genres`(
	`id` INT AUTO_INCREMENT PRIMARY KEY,
    `genre_name` VARCHAR(30) NOT NULL,
    `notes` BLOB
);
INSERT INTO `genres`(`id`,`genre_name`)
	VALUES
		(1,'firstGenre'),
        (2,'secondGenre'),
        (3,'thirdGenre'),
        (4,'fourthGenre'),
        (5,'fifthGenre');

CREATE TABLE `categories`(
	`id` INT AUTO_INCREMENT PRIMARY KEY,
    `category_name` VARCHAR(30) NOT NULL,
    `notes` BLOB
);
INSERT INTO `categories`(`id`,`category_name`)
	VALUES
		(1,'firstCategory'),
        (2,'secondCategory'),
        (3,'thirdCategory'),
        (4,'fourthCategory'),
        (5,'fifthCategory');
        
CREATE TABLE `movies`(
	`id` INT AUTO_INCREMENT PRIMARY KEY,
    `title` VARCHAR(30) NOT NULL,
    `director_id` INT,
    `copyright_year` DATETIME NOT NULL,
    `length` INT NOT NULL,
    `genre_id` INT NOT NULL,
    `category_id` INT NOT NULL,
    `rating` INT,
    `notes` BLOB
);
INSERT INTO `movies`(`id`, `title`,`copyright_year`,`length`,`genre_id`, `category_id`)
	VALUES
		(5,'firstTitle', '1988-02-22',123,2,4),
		(6,'secondTitle', '2012-02-02',134,2,2),
		(7,'thirdTitle', '2000-12-18',125,2,9),
		(8,'fourthTitle', '2013-05-22',143,5,8),
		(9,'fifthTitle', '1999-07-07',163,5,5);

-- ---13---
CREATE TABLE `categories`(
	`id` INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    `category` VARCHAR(50) NOT NULL,
    `daily_rate` DECIMAL(5,2),
    `weekly_rate` DECIMAL(5,2),
    `monthly_rate` DECIMAL(5,2),
    `weekend_rate` DECIMAL(5,2)
);
INSERT INTO `categories`(`category`)
	VALUES
		('firstCategory'),
        ('secondCategory'),
        ('thirdCategory');

CREATE TABLE `cars`(
	`id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `plate_number` INT NOT NULL,
    `make` VARCHAR(10) NOT NULL,
    `model` VARCHAR(30),
    `car_year` DATETIME,
    `category_id` INT,
    `doors` INT,
    `picture` BLOB,
    `car_condition` VARCHAR(20),
    `available` BOOL
);
INSERT INTO `cars`(`plate_number`, `make`)
	VALUES
		(2345,'first'),
		(4563,'second'),
		(9081,'third');
        
CREATE TABLE `employees`(
	`id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `first_name` VARCHAR(50) NOT NULL,
    `last_name` VARCHAR(50),
    `title` VARCHAR(50),
    `notes` TEXT
);
INSERT INTO `employees`(`first_name`)
	VALUES
		('firstPersonName'),
        ('secondPersonName'),
        ('thirdPersonName');
        
CREATE TABLE `customers`(
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `driver_licence_number` VARCHAR(20),
  `full_name` VARCHAR(50) NOT NULL,
  `address` VARCHAR(50),
  `city` VARCHAR(50) NOT NULL,
  `zip_code` VARCHAR(50),
  `notes` TEXT
);
INSERT INTO `customers`(`full_name`,`city`)
	VALUES
		('Rangel Rangelov','Sofia'),
        ('Petar Petrov','Varna'),
        ('Todor Toshev','Burgas');

CREATE TABLE `rental_orders`(
   `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
   `employee_id` INT,
   `customer_id` INT,
   `car_id` INT,
   `car_condition` VARCHAR(50), 
   `tank_level` DECIMAL(20,2),
   `kilometrage_start` INT,
   `kilometrage_end` INT,
   `total_kilometrage` INT,
   `start_date` DATETIME,
   `end_date` DATETIME,
   `total_days` INT,
   `rate_applied` VARCHAR(50),
   `tax_rate` INT,
   `order_status` VARCHAR(30),
   `notes`TEXT
);
INSERT INTO `rental_orders`(`employee_id`, `customer_id`,`car_id`)
	VALUES
		(1,2,3),
		(2,5,2),
		(7,10,11);

-- ---14----
CREATE TABLE `employees`(
	`id` INT,
	`first_name` VARCHAR(50) NOT NULL,
	`last_name` VARCHAR(50),
	`title` VARCHAR(50),
	`notes` BLOB,
  	PRIMARY KEY (`id`)
);
INSERT INTO `employees`(`id`,`first_name`)
	VALUES
		(1,'dasd'),
        (2,'dasd'),
        (3,'dasd');

CREATE TABLE `customers` (
	`account_number` INT NOT NULL,
	`first_name` VARCHAR(50) NOT NULL, 
	`last_name` VARCHAR(50),
	`phone_number` VARCHAR(10),
	`emergency_name` VARCHAR(50),
	`emergency_number` VARCHAR(10),
	`notes` BLOB,
	PRIMARY KEY(`account_number`)
);
INSERT INTO `customers`(`account_number`,`first_name`)
	VALUES
		(1,'dasd'),
        (2,'dasd'),
        (3,'dasd');
        
CREATE TABLE `room_status`(
	`room_status` INT NOT NULL,
	`notes` BLOB,
	PRIMARY KEY(`room_status`)
);
INSERT INTO `room_status`(`room_status`)
	values
		(1),
        (2),
        (3);

CREATE TABLE `room_types`(
	`room_type` INT NOT NULL,
	`notes` BLOB NOT NULL,
	PRIMARY KEY(`room_type`)
);
INSERT INTO `room_types`(`room_type`,`notes`)
	VALUES
		(1,'sasas'),
        (2,'sasas'),
        (3,'sasasa');

CREATE TABLE `bed_types`(
	`bed_type` INT NOT NULL,
	`notes` BLOB NOT NULL,
	PRIMARY KEY(`bed_type`)
);
INSERT INTO `bed_types`(`bed_type`,`notes`)
	VALUES
		(1,'sasas'),
        (2,'sasas'),
        (3,'sasasa');

CREATE TABLE `rooms`(
	`room_number` INT NOT NULL, 
	`room_type` VARCHAR(50),
	`bed_type` VARCHAR(50),
	`rate` VARCHAR(50), 
	`room_status` VARCHAR(50), 
	`notes` BLOB NOT NULL, 
	PRIMARY KEY(`room_number`)
);
INSERT INTO `rooms`(`room_number`,`notes`)
	VALUES
		(1,'sasas'),
        (2,'sasas'),
        (3,'sasasa');

CREATE TABLE `payments`(
	`id` INT NOT NULL,
	`employee_id` INT,
	`payment_date` DATETIME, 
	`account_number` VARCHAR(10), 
	`first_date_occupied` DATETIME, 
	`last_date_occupied` DATETIME, 
	`total_days` INT, 
	`amount_charged` DOUBLE(10,2), 
	`tax_rate` DOUBLE(10,2), 
	`tax_amount` DOUBLE(10,2), 
	`payment_total` DOUBLE(10,2), 
	`notes` BLOB NOT NULL, 
	PRIMARY KEY(`id`)
);
INSERT INTO `payments`(`id`,`notes`)
	VALUES
		(1,'sasas'),
        (2,'sasas'),
        (3,'sasasa');

CREATE TABLE `occupancies`(
	`id` INT, 
	`employee_id` INT,
	`date_occupied` DATETIME,
	`account_number` VARCHAR(10),
	`room_number` INT,
	`rate_applied` VARCHAR(10), 
	`phone_charge` VARCHAR(10), 
	`notes` BLOB NOT NULL, 
	PRIMARY KEY(`id`)
);
INSERT INTO `occupancies`(`id`,`notes`)
	VALUES
		(1,'sasas'),
        (2,'sasas'),
        (3,'sasasa');

-- ---15---
CREATE DATABASE `soft_uni`;

USE `soft_uni`;

CREATE TABLE `towns`(
   `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
   `name` VARCHAR(30)
);

CREATE TABLE `addresses`(
	`id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	`address_text` VARCHAR(50),
	`town_id` INT,
	CONSTRAINT `fk_addresses_towns` FOREIGN KEY (`town_id`)
	REFERENCES `towns`(`id`) 
);

CREATE TABLE `departments`(
	`id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(10)
);

CREATE TABLE `employees`(
	`id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	`first_name` VARCHAR(10),
	`middle_name` VARCHAR(10),
	`last_name` VARCHAR(10),
	`job_title` VARCHAR(10),
	`department_id` INT,
	`hire_date` DATETIME,
	`salary` DOUBLE(10,2),
	`address_id` INT,
	CONSTRAINT `FK_address_id` FOREIGN KEY (`address_id`)
	REFERENCES `addresses`(`id`),
	CONSTRAINT `FK_department_id` FOREIGN KEY (`department_id`)
	REFERENCES  `departments`(`id`)  
);

-- ---16---

-- ---17---
INSERT INTO `towns`(`name`)
	VALUES
		('Sofia'),
        ('Plovdiv'),
        ('Varna'),
        ('Burgas');

INSERT INTO `departments`(`name`)
	VALUES
		('Engineering'),
        ('Sales'),
        ('Marketing'),
        ('Software Development'),
        ('Quality Assurance');

INSERT INTO `employees`(`first_name`,`middle_name`,`last_name`,`job_title`,`department_id`,`hire_date`,`salary`)
	VALUES
		('Ivan','Ivanov','Ivanov','.NET Developer',4,'2013-02-01','3500.00'),
		('Petar','Petrov','Petrov','Senior Engineer',1,'2004-03-02','4000.00'),
		('Maria','Petrova','Ivanova','Intern',5,'2016-08-28','525.25'),
		('Georgi','Terziev','Ivanov','CEO',2,'2007-12-09','3000.00'),
		('Peter','Pan','Pan','Intern',3,'2016-08-28','599.88');
        
-- ---18---
SELECT * FROM `towns`;
SELECT * FROM `departments`;
SELECT * FROM `employees`;

-- ---19---
SELECT * FROM `towns` AS `t` ORDER BY `t`.`name`;
SELECT * FROM `departments` AS `d` ORDER BY `d`.`name`;
SELECT * FROM `employees` ORDER BY `salary` DESC; 

-- ---20---
SELECT `name` FROM `towns` ORDER BY `name`;
SELECT `name` FROM `departments` ORDER BY `name`;
SELECT `first_name`, `last_name`, `job_title`, `salary` FROM `employees` ORDER BY `salary` DESC;

-- ---21---
UPDATE `employees`
SET `salary`=`salary` * 1.1;
SELECT `salary` FROM `employees`;

-- ---22---
SELECT `tax_rate` * 0.97 FROM `payments`;

-- ---23---
DELETE FROM `occupancies`;