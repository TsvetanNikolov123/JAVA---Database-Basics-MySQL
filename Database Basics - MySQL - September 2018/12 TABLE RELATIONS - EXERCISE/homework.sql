##################################################################
## 01. One-To-One Relationship 
##################################################################

CREATE TABLE `persons` (
    `person_id` INT(11),
    `first_name` VARCHAR(50),
    `salary` DECIMAL(19 , 2 ),
    `passport_id` INT
);

INSERT INTO `persons` (`person_id`, `first_name`, `salary`, `passport_id`)
VALUES (1,'Roberto', 43300.00, 102),
		(2, 'Tom', 56100.00, 103), 
        (3, 'Yana', 60200.00, 101);

CREATE TABLE `passports` (
    `passport_id` INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `passport_number` VARCHAR(50) UNIQUE
);

INSERT INTO `passports`(`passport_id`, `passport_number`)
VALUES (101, 'N34FG21B'), 
		(102, 'K65LO4R7'),
        (103, 'ZE657QP2');
        
ALTER TABLE `persons`
ADD PRIMARY KEY(`person_id`);

ALTER TABLE `persons` 
MODIFY `passport_id` INT UNIQUE;

ALTER TABLE `persons`
ADD CONSTRAINT `fk_person_passports` FOREIGN KEY (`passport_id`)
REFERENCES `passports`(`passport_id`); 

##################################################################
## 02.	One-To-Many Relationship 
##################################################################

CREATE TABLE `models` (
    `model_id` INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(255),
    `manufacturer_id` INT
)  AUTO_INCREMENT=101;

CREATE TABLE `manufacturers` (
    `manufacturer_id` INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(255),
    `established_on` DATE
);

ALTER TABLE `models`
ADD CONSTRAINT `fk_models_manufacturers` FOREIGN KEY(`manufacturer_id`)
REFERENCES `manufacturers` (`manufacturer_id`);

INSERT INTO `manufacturers` (`name`, `established_on`)
	VALUES 	('BMW', '1916-03-01'),
			('Tesla','2003-01-01'),
			('Lada', '1966-05-01');
        
INSERT INTO `models` (`name`, `manufacturer_id`)
	VALUES 	('X1', 1),
			('i6', 1),
            ('Model S', 2), 
            ('Model X', 2), 
            ('Model 3', 2),
            ('Nova', 3);
            
##################################################################
## 03. Many-To-Many Relationship 
##################################################################

CREATE TABLE `students` (
    `student_id` INT(11) UNIQUE NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(255)
);

INSERT INTO `students`(`student_id`, `name`) 
VALUES (1,'Mila'),(2,'Toni'),(3,'Ron');

CREATE TABLE `exams` (
    `exam_id` INT(11) UNIQUE NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(255)
)  AUTO_INCREMENT=101;

INSERT INTO `exams`(`exam_id`, `name`) 
VALUES (101,'Spring MVC'),(102,'Neo4j'),(103,'Oracle 11g');

CREATE TABLE `students_exams` (
    `student_id` INT(11),
    `exam_id` INT(11),
    CONSTRAINT `pk_students_exams` PRIMARY KEY (`student_id` , `exam_id`),
    CONSTRAINT `fk_students_exams_students` FOREIGN KEY (`student_id`)
        REFERENCES `students` (`student_id`),
    CONSTRAINT `fk_students_exams_exams` FOREIGN KEY (`exam_id`)
        REFERENCES `exams` (`exam_id`)
);

INSERT INTO `students_exams`
VALUES (1, 101),(1, 102),(2,101), (3, 103),(2, 102),(2,103);

##################################################################
## 04. Self-Referencing 
##################################################################

CREATE TABLE `teachers` (
    `teacher_id` INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    `manager_id` INT(11) NULL
)  AUTO_INCREMENT=101;

INSERT INTO `teachers`(`name`, `manager_id`)
VALUES 	('John',NULL),
		('Maya', 106), 
        ('Silvia', 106), 
        ('Ted', 105), 
        ('Mark', 101), 
        ('Greta', 101);
                
ALTER TABLE `teachers`
ADD FOREIGN KEY (`manager_id`)
REFERENCES `teachers`(`teacher_id`);

##################################################################
## 05. Online Store Database 
##################################################################

CREATE TABLE `item_types` (
	`item_type_id` INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50)
);

CREATE TABLE `items` (
    `item_id` INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50),
    `item_type_id` INT(11),
    CONSTRAINT `fk_items_item_type` FOREIGN KEY (`item_type_id`)
        REFERENCES `item_types` (`item_type_id`)
);

CREATE TABLE `orders` (
    `order_id` INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `customer_id` INT(11)
);

CREATE TABLE `order_items` (
    `order_id` INT(11),
    `item_id` INT(11),
    CONSTRAINT `pk_order_items` PRIMARY KEY (`order_id` , `item_id`),
    CONSTRAINT `fk_order_items_orders` FOREIGN KEY (`order_id`)
        REFERENCES `orders` (`order_id`),
    CONSTRAINT `fk_order_items_items` FOREIGN KEY (`item_id`)
        REFERENCES `items` (`item_id`)
);

CREATE TABLE `customers` (
    `customer_id` INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50),
    `birthday` DATE,
    `city_id` INT(11)
);

ALTER TABLE `orders`
ADD CONSTRAINT `fk_orders_customers` FOREIGN KEY (`customer_id`)
	REFERENCES `customers` (`customer_id`);
    
CREATE TABLE `cities` (
    `city_id` INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50)
);

ALTER TABLE `customers`
ADD CONSTRAINT `fk_customers_cities` FOREIGN KEY (`city_id`)
	REFERENCES `cities` (`city_id`);
    
##################################################################
## 06.	University Database
##################################################################

CREATE TABLE `majors` (
    `major_id` INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50)
);

CREATE TABLE `students` (
    `student_id` INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `student_number` VARCHAR(12),
    `student_name` VARCHAR(50),
    `major_id` INT(11),
    CONSTRAINT `fk_students_majors` FOREIGN KEY (`major_id`)
        REFERENCES `majors` (`major_id`)
);

CREATE TABLE `payments` (
    `payment_id` INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `payment_date` DATE,
    `payment_amount` DECIMAL(8 , 2 ),
    `student_id` INT(11),
    CONSTRAINT `fk_payments_students` FOREIGN KEY (`student_id`)
        REFERENCES `students` (`student_id`)
);

CREATE TABLE `subjects` (
    `subject_id` INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `subject_name` VARCHAR(50)
);

CREATE TABLE `agenda` (
    `student_id` INT(11),
    `subject_id` INT(11),
    CONSTRAINT `pk_agenda` PRIMARY KEY (`student_id` , `subject_id`),
    CONSTRAINT `fk_agenda_students` FOREIGN KEY (`student_id`)
        REFERENCES `students` (`student_id`),
    CONSTRAINT `fk_agenda_subjects` FOREIGN KEY (`subject_id`)
        REFERENCES `subjects` (`subject_id`)
);

##################################################################
## 09.	Peaks in Rila 
##################################################################

SELECT 
    `mountain_range`,
    `peak_name`,
    `elevation` AS `peak_elevation`
FROM
    `peaks` AS `p`
        JOIN
    `mountains` AS `m` ON `p`.`mountain_id` = `m`.`id`
WHERE
    `mountain_range` = 'Rila'
ORDER BY `peak_elevation` DESC;