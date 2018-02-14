-- ---1---


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

        
-- ---2---


-- ---3---


-- ---4---


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
