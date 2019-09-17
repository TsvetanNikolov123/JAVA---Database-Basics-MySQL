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
