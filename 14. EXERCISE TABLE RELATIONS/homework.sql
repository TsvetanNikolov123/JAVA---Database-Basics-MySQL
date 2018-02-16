-- ---------------------------------
-- 1.	One-To-One Relationship
-- ---------------------------------

CREATE TABLE `persons` (
    `person_id` INT,
    `first_name` VARCHAR(255),
    `salary` DECIMAL(20 , 2 ),
    `passport_id` INT,
    CONSTRAINT `pk_person` PRIMARY KEY (`person_id`)
);

CREATE TABLE `passports` (
    `passport_id` INT,
    `passport_number` VARCHAR(255)
);

ALTER TABLE `passports` ADD 
CONSTRAINT `pk_passports` PRIMARY KEY (`passport_id`);

ALTER TABLE `persons` 
MODIFY `passport_id` INT UNIQUE;

ALTER TABLE `persons`
ADD CONSTRAINT `fk_person_passports` 
FOREIGN KEY(`passport_id`) 
REFERENCES `passports`(`passport_id`);
    
INSERT INTO `passports` 
VALUES 	(101, 'N34FG21B'), 
		(102, 'K65LO4R7'),
		(103, 'ZE657QP2');
    
INSERT INTO `persons` 
VALUES 	(1, 'Roberto', 43300.00,102),
		(2, 'Tom', 56100.00,103),
		(3, 'Yana', 60200.00,101);

        
-- ---------------------------------
-- 2.	One-To-Many Relationship
-- ---------------------------------

CREATE TABLE `manufacturers` (
    `manufacturer_id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50),
    `established_on` DATE
);

CREATE TABLE `models` (
    `model_id` INT,
    `name` VARCHAR(50),
    `manufacturer_id` INT
);

INSERT INTO `manufacturers`
VALUES 	(1, 'BMW', '1916-03-01'),
		(2, 'Tesla', '2003-01-01'),
		(3, 'Lada', '1966-05-01');
        
INSERT INTO `models`
VALUES 	(101, 'X1', 1),
		(102, 'i6', 1),
		(103, 'Model S', 2),
		(104, 'Model X', 2),
		(105, 'Model 3', 2),
		(106, 'Nova', 3);

ALTER TABLE `models` ADD
CONSTRAINT `pk_models` PRIMARY KEY (`model_id`);

ALTER TABLE `models`
ADD CONSTRAINT `fk_models_manufacturers`
FOREIGN KEY(`manufacturer_id`)
REFERENCES `manufacturers`(`manufacturer_id`);

-- --------------------------------------------
-- --------------------------------------------

CREATE TABLE `manufacturers` (
	`manufacturer_id` INT UNSIGNED UNIQUE NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(30) UNIQUE NOT NULL,
    `established_on` DATE NOT NULL
);

CREATE TABLE `models` (
	`model_id` INT UNSIGNED UNIQUE NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(30) NOT NULL,
    `manufacturer_id` INT UNSIGNED NOT NULL
) AUTO_INCREMENT=101;

-- Data should be inserted here, but if we do so the data test in 
-- Judge fails because entries are not order as expected there so
-- first we have to complete tables setup.

ALTER TABLE `manufacturers` 
	ADD CONSTRAINT `pk_manufacturers` 
		PRIMARY KEY (`manufacturer_id`);

ALTER TABLE `models` 
	ADD CONSTRAINT `pk_models` 
		PRIMARY KEY (`model_id`),
    ADD CONSTRAINT `fk_models_manufacturers` 
		FOREIGN KEY (`manufacturer_id`)
        REFERENCES `manufacturers` (`manufacturer_id`);

INSERT 
	INTO `manufacturers` (`name`, `established_on`)
	VALUES 
		('BMW', '1916-03-01'),
		('Tesla', '2003-01-01'),
		('Lada', '1966-05-01');

INSERT
	INTO `models` (`name`, `manufacturer_id`)
    VALUES
		('X1', 1),
		('i6', 1),
		('Model S', 2),
		('Model X', 2),
		('Model 3', 2),
		('Nova', 3);


-- ---------------------------------
-- 3.	Many-To-Many Relationship
-- ---------------------------------

CREATE TABLE `students` (
    `student_id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50)
);

CREATE TABLE `exams` (
    `exam_id` INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50)
)  AUTO_INCREMENT=101;

CREATE TABLE `students_exams` (
    `student_id` INT,
    `exam_id` INT,
    CONSTRAINT `pk_students_exams` PRIMARY KEY (`student_id` , `exam_id`)
);

SET FOREIGN_KEY_CHECKS = 0;
INSERT
	INTO `students` (`name`)
	VALUES 	('Mila'),
			('Toni'),
			('Ron');

INSERT
	INTO `exams` (`name`)
	VALUES 	('Spring MVC'),
			('Neo4j'),
			('Oracle 11g');

INSERT 
	INTO `students_exams`
    VALUES  
		(1, 101),
		(1, 102),
		(2, 101),
		(3, 103),
		(2, 102),
		(2, 103);
SET FOREIGN_KEY_CHECKS = 1;


-- ---------------------------------
-- 4.	Self-Referencing
-- ---------------------------------

CREATE TABLE `teachers` (
    `teacher_id` INT PRIMARY KEY,
    `name` VARCHAR(255),
    `manager_id` INT
);

INSERT INTO `teachers`
VALUES 	(101, 'John', NULL),
		(102, 'Maya', 106),
        (103, 'Silvia', 106),
        (104, 'Ted', 105),
        (105, 'Mark', 101),
        (106, 'Greta', 101);

ALTER TABLE `teachers` 
ADD CONSTRAINT `fk_teacher_teachers`
FOREIGN KEY (`manager_id`) 
REFERENCES `teachers`(`teacher_id`); 
