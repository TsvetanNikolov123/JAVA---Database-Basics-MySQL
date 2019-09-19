15 Lab: Functions, Triggers and Transactions
============================================

---
---

This document defines the **exercise assignments** for the ["Databases Basics -
MySQL" course \@ Software
University.](https://softuni.bg/courses/databases-basics-mysql)

You are provided with the “soft_uni” database. Use it in the following
assignments.

---

15.01 Count Employees by Town
-----------------------------

Write a function **ufn_count_employees_by_town(town_name)** that accepts
**town_name** as parameter and returns the count of employees who live in that
town. Submit your queries using the “**MySQL Run Skeleton, run queries and check
DB**” strategy.

### Example

The following example is given with employees living in **Sofia**.

| **count** |
|-----------|
| 3         |
<br/>

### Solution: <a title="01 Count Employees by Town" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/93ef26734740c77b17bfa242dbd8f41952259621/15%20DATABASE%20PROGRAMMABILITY/15%20LAB_DATABASE_PROGRAMMABILITY.sql#L2">01 Count Employees by Town</a>
    ##############################################################
    ## 1. Count Employees by Town 
    ##############################################################
    DELIMITER $$
    
    CREATE FUNCTION `ufn_count_employees_by_town`(`town_name` VARCHAR(20))
    RETURNS DOUBLE 
    BEGIN
    	DECLARE `e_count` DOUBLE;
    	SET `e_count` := (SELECT COUNT(`employee_id`) FROM `employees` AS `e`
    	INNER JOIN `addresses` AS `a` ON `a`.`address_id` = `e`.`address_id`
    	INNER JOIN `towns` AS `t` ON `t`.`town_id` = `a`.`town_id`
    	WHERE `t`.`name` = `town_name`);
    	RETURN `e_count`;
    END $$
     
    DELIMITER ;
    
    SELECT UFN_COUNT_EMPLOYEES_BY_TOWN('Sofia');
    SELECT ufn_count_employees_by_town('Berlin');
    SELECT ufn_count_employees_by_town(NULL);
---
15.02 Employees Promotion
-------------------------

Write a stored procedure **usp_raise_salaries(department_name)** to raise the
**salary** of all employees in given department as parameter by 5%. Submit your
queries using the “**MySQL Run Skeleton, run queries and check DB**” strategy.

### Example

The following example is given with employees in the “**Finance**” department
ordered by **first_name**, then by **salary**.

| **first_name** | **salary** |
|----------------|------------|
| Barbara        | 27 720.00  |
| Bryan          | 19 950.00  |
| Candy          | 19 950.00  |
| …              | …          |
<br/>

### Solution: <a title="02 Employees Promotion" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/93ef26734740c77b17bfa242dbd8f41952259621/15%20DATABASE%20PROGRAMMABILITY/15%20LAB_DATABASE_PROGRAMMABILITY.sql#L24">02 Employees Promotion</a>
    ##############################################################
    ## 2. Employees Promotion 
    ##############################################################
    
    DELiMITER $$
    
    CREATE PROCEDURE `usp_raise_salaries`(`department_name` VARCHAR(50))
    BEGIN
    	UPDATE `employees` AS `e`
        INNER JOIN `departments` AS `d`
    	ON `e`.`department_id` = `d`.`department_id`
        SET `salary` = `salary` * 1.05
        WHERE d.name = `department_name`;
    END $$
    
    DELIMITER ;
    
    CALL usp_raise_salaries('Sales');
---
15.03 Employees Promotion By ID
-------------------------------

Write a stored procedure **usp_raise_salary_by_id(id)** that raises a given
employee’s **salary** (by **id** as parameter) by **5%**. Consider that you
cannot promote an employee that **doesn’t exist** – if that happens, no changes
to the database should be made. Submit your queries using the “**MySQL Run
Skeleton, run queries and check DB**” strategy.

### Example

The following example is given with **employee_id** = **178**.

| **salary**  |
|-------------|
| 27 720.0000 |
<br/>

### Solution: <a title="03 Employees Promotion By ID" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/93ef26734740c77b17bfa242dbd8f41952259621/15%20DATABASE%20PROGRAMMABILITY/15%20LAB_DATABASE_PROGRAMMABILITY.sql#L43">03 Employees Promotion By ID</a>
    ##############################################################
    ## 3.	Employees Promotion By ID
    ##############################################################
    
    DELIMITER $$
    
    CREATE PROCEDURE usp_raise_salary_by_id(id INT) 
    BEGIN
    	START TRANSACTION;
        
        IF ((SELECT count(employee_id) FROM employees WHERE employee_id LIKE id)<>1) THEN
    		ROLLBACK;
    	ELSE
    		UPDATE employees AS e SET salary = salary + salary * 0.05
            WHERE e.employee_id = id;
    	END IF;
        
    END $$
    
    DELIMITER ;
---
15.04 Triggered
---------------

Create a table **deleted_employees(employee_id PK,
first_name,last_name,middle_name,job_title,deparment_id,salary)** that will hold
information about fired(deleted) employees from the employees table. Add a
trigger to employees table that inserts the corresponding information in
**deleted_employees**. Submit your queries using the “**MySQL Run Skeleton, run
queries and check DB**” strategy.
<br/>

### Solution: <a title="04 Triggered" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/93ef26734740c77b17bfa242dbd8f41952259621/15%20DATABASE%20PROGRAMMABILITY/15%20LAB_DATABASE_PROGRAMMABILITY.sql#L64">04 Triggered</a>
    ##############################################################
    ## 4. Triggered 
    ##############################################################
    
    CREATE TABLE deleted_employees(
    	employee_id INT PRIMARY KEY AUTO_INCREMENT,
    	first_name VARCHAR(20),
    	last_name VARCHAR(20),
    	middle_name VARCHAR(20),
    	job_title VARCHAR(50),
    	department_id INT,
    	salary DOUBLE 
    );
    
    DELIMITER $$
    
    CREATE TRIGGER tr_deleted_employees
    AFTER DELETE
    ON employees
    FOR EACH ROW
    BEGIN
    	INSERT INTO deleted_employees     
        (first_name,last_name,middle_name,job_title,department_id,salary)
    	VALUES(OLD.first_name,OLD.last_name,OLD.middle_name,OLD.job_title,OLD.department_id,OLD.salary);
    END $$
    
    DELIMITER ;
    
    DELETE FROM employees WHERE employee_id IN (1);
---