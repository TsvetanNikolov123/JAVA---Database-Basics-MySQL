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
            
-- --9---
            


    
