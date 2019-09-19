12 Exercises: Table Relations
=============================

---
---

This document defines the **exercise assignments** for the ["Databases Basics -
MySQL" course \@ Software
University.](https://softuni.bg/courses/databases-basics-mysql)

---

12.01 One-To-One Relationship
-----------------------------

Create two tables as follows. Use appropriate data types.

| **persons**     |                     |            |                 |
|-----------------|---------------------|------------|-----------------|
| **person_id**   | **first_name**      | **salary** | **passport_id** |
| 1               | Roberto             | 43300.00   | 102             |
| 2               | Tom                 | 56100.00   | 103             |
| 3               | Yana                | 60200.00   | 101             |
| **passports**   |                     |            |                 |
| **passport_id** | **passport_number** |            |                 |
| 101             | N34FG21B            |            |                 |
| 102             | K65LO4R7            |            |                 |
| 103             | ZE657QP2            |            |                 |

**Insert the data from the example above.**

-   Alter table **persons** and make **person_id** a **primary key**.

-   Create a **foreign key** between **persons** and **passports** by using the
    **passport_id** column.

-   Think about which passport field should be **UNIQUE**.

Submit your queries by using “**MySQL run queries & check DB**” strategy**.**
<br/>

### Solution: <a title="01 One-To-One Relationship" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/406ddd67de60ade3db672f26baa3b2597a45a037/12%20TABLE%20RELATIONS%20-%20EXERCISE/homework.sql#L2">01 One-To-One Relationship</a>
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

---
12.02 One-To-Many Relationship
------------------------------

Create two tables as follows. Use appropriate data types.

| **manufacturers**   |          |                     |
|---------------------|----------|---------------------|
| **manufacturer_id** | **name** | **established_on**  |
| 1                   | BMW      | 01/03/1916          |
| 2                   | Tesla    | 01/01/2003          |
| 3                   | Lada     | 01/05/1966          |
| **models**          |          |                     |
| **model_id**        | **name** | **manufacturer_id** |
| 101                 | X1       | 1                   |
| 102                 | i6       | 1                   |
| 103                 | Model S  | 2                   |
| 104                 | Model X  | 2                   |
| 105                 | Model 3  | 2                   |
| 106                 | Nova     | 3                   |

**Insert the data from the example above.**

-   Add primary and foreign keys.

Submit your queries by using “**MySQL run queries & check DB”** strategy.
<br/>

### Solution: <a title="02 One-To-Many Relationship" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/406ddd67de60ade3db672f26baa3b2597a45a037/12%20TABLE%20RELATIONS%20-%20EXERCISE/homework.sql#L38">02 One-To-Many Relationship</a>
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
---
12.03 Many-To-Many Relationship
-------------------------------

Create three tables as follows. Use appropriate data types.

| **students**       |             |
|--------------------|-------------|
| **student_id**     | **name**    |
| 1                  | Mila        |
| 2                  | Toni        |
| 3                  | Ron         |
| **exams**          |             |
| **exam_id**        | **name**    |
| 101                | Spring MVC  |
| 102                | Neo4j       |
| 103                | Oracle 11g  |
| **students_exams** |             |
| **student_id**     | **exam_id** |
| 1                  | 101         |
| 1                  | 102         |
| 2                  | 101         |
| 3                  | 103         |
| 2                  | 102         |
| 2                  | 103         |

**Insert the data from the example above.**

-   Add primary and foreign keys.

-   Have in mind that the table **student_exams** should have a **composite**
    primary key.

Submit your queries by using “**MySQL run queries & check DB**” strategy**.**
<br/>

### Solution: <a title="03 Many-To-Many Relationship" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/406ddd67de60ade3db672f26baa3b2597a45a037/12%20TABLE%20RELATIONS%20-%20EXERCISE/homework.sql#L71">03 Many-To-Many Relationship</a>
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
---
12.04 Self-Referencing
----------------------

Create a single table as follows. Use appropriate data types.

| **teachers**   |          |                |
|----------------|----------|----------------|
| **teacher_id** | **name** | **manager_id** |
| 101            | John     |                |
| 102            | Maya     | 106            |
| 103            | Silvia   | 106            |
| 104            | Ted      | 105            |
| 105            | Mark     | 101            |
| 106            | Greta    | 101            |

**Insert the data from the example above.**

-   Add primary and foreign keys.

-   The foreign key should be between **manager_id** and **teacher_id**.

Submit your queries by using “ **MySQL run queries & check DB**” strategy**.**
<br/>

### Solution: <a title="04 Self-Referencing" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/406ddd67de60ade3db672f26baa3b2597a45a037/12%20TABLE%20RELATIONS%20-%20EXERCISE/homework.sql#L104">04 Self-Referencing</a>
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

---
12.05 Online Store Database
---------------------------

Create a new database and design the following structure:

<kbd><img src="https://user-images.githubusercontent.com/32310938/65221280-61754a80-dac5-11e9-9ae7-96ba5365c752.png" alt="alt text" width="900" height=""></kbd>

Submit your queries by using “**MySQL run queries & check DB”** strategy**.**
<br/>

### Solution: <a title="05 Online Store Database" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/406ddd67de60ade3db672f26baa3b2597a45a037/12%20TABLE%20RELATIONS%20-%20EXERCISE/homework.sql#L126">05 Online Store Database</a>
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
---
12.06 University Database
-------------------------

Create a new database and design the following structure:

<kbd><img src="https://user-images.githubusercontent.com/32310938/65221276-5fab8700-dac5-11e9-92a5-a8300d35d035.png" alt="alt text" width="900" height=""></kbd>

Submit your queries by using “**MySQL run queries & check DB**” strategy.
<br/>

### Solution: <a title="06 University Database" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/406ddd67de60ade3db672f26baa3b2597a45a037/12%20TABLE%20RELATIONS%20-%20EXERCISE/homework.sql#L178">06 University Database</a>
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
---
12.07 SoftUni Design
--------------------

Create an E/R Diagram of the SoftUni Database. There are some special relations
you should check out: **employees** are **self-referenced (manager_id)** and
**departments** have **One-to-One** with the **employees (manager_id)** while
the **employees** have **One-to-Many** (**department_id**). You might find it
interesting how it looks on а diagram.
<br/>

---
12.08 Geography Design
----------------------

Create an E/R Diagram of the Geography Database.
<br/>

---
12.09 Peaks in Rila
-------------------

Display all peaks for "**Rila**" **mountain_range**. Include:

-   mountain_range

-   peak_name

-   peak_elevation

Peaks should be sorted by **peak_elevation** descending.

### Example

| **mountain_range** | **peak_name** | **peak_elevation** |
|--------------------|---------------|--------------------|
| Rila               | Musala        | 2925               |
| …                  | …             | …                  |

Submit your queries by using “**MySQL prepare DB & run queries**” strategy.
<br/>

### Solution: <a title="09 Peaks in Rila" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/406ddd67de60ade3db672f26baa3b2597a45a037/12%20TABLE%20RELATIONS%20-%20EXERCISE/homework.sql#L220">09 Peaks in Rila</a>
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
---