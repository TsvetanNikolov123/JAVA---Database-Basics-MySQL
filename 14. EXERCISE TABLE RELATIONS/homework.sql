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