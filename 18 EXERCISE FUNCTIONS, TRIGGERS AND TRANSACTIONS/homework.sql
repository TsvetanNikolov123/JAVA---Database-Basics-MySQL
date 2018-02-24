-- -------------------------------------------------------------------
-- Exercises: Functions, Triggers and Transactions
-- -------------------------------------------------------------------

-- -------------------------------------------------------------------
-- 1.	Employees with Salary Above 35000
-- -------------------------------------------------------------------
/*
	Create stored procedure usp_get_employees_salary_above_35000 that 
    returns all employees’ first and last names for whose salary is
    above 35000. The result should be sorted by first_name then by 
    last_name alphabetically, and id ascending. Submit your query 
    statement as Run skeleton, run queries & check DB in Judge.
*/
DELIMITER $$
CREATE PROCEDURE usp_get_employees_salary_above_35000()
BEGIN
	SELECT 
    e.first_name AS fisrt_name, e.last_name AS last_name
FROM
    employees AS e
WHERE
    salary > 35000
ORDER BY e.first_name ASC , e.last_name ASC , e.employee_id ASC;
END $$
DELIMITER ;

-- -------------------------------------------------------------------
-- 2.	Employees with Salary Above Number
-- -------------------------------------------------------------------
/*
	Create stored procedure usp_get_employees_salary_above that accept 
    a number as parameter and return all employees’ first and last 
    names whose salary is above or equal to the given number. The result 
    should be sorted by first_name then by last_name alphabetically and
    id ascending. Submit your query statement as Run skeleton, run 
    queries & check DB in Judge.
*/

DELIMITER $$
CREATE PROCEDURE usp_get_employees_salary_above(`number` DECIMAL(19,4))
BEGIN
	SELECT 
    e.first_name AS fisrt_name, e.last_name AS last_name
FROM
    employees AS e
WHERE
    salary >= number
ORDER BY e.first_name ASC , e.last_name ASC , e.employee_id ASC;
END $$
DELIMITER ;

-- -------------------------------------------------------------------
-- 3.	Town Names Starting With
-- -------------------------------------------------------------------
/*
	Write a stored procedure usp_get_towns_starting_with that accept 
    string as parameter and returns all town names starting with that 
    string. The result should be sorted by town_name alphabetically. 
    Submit your query statement as Run skeleton, run queries & check DB 
    in Judge.
*/
DELIMITER $$
CREATE PROCEDURE usp_get_towns_starting_with(some_string VARCHAR(255))
BEGIN
	SELECT 
    t.name AS town_name
FROM
    towns AS t
WHERE
    t.name LIKE CONCAT(some_string, '%')
ORDER BY town_name ASC;
END $$
DELIMITER ;

-- -------------------------------------------------------------------
-- 4.	Employees from Town
-- -------------------------------------------------------------------
/*
	Write a stored procedure usp_get_employees_from_town that accepts
    town_name as parameter and return the employees’ first and last 
    name that live in the given town. The result should be sorted by 
    first_name then by last_name alphabetically and id ascending. 
    Submit your query statement as Run skeleton, run queries & check 
    DB in Judge.
*/

DELIMITER $$
CREATE PROCEDURE usp_get_employees_from_town(town_name VARCHAR(255))
BEGIN
	SELECT 
    e.first_name AS fist_name, e.last_name AS last_name
FROM
    employees AS e
        JOIN
    addresses AS a ON e.address_id = a.address_id
        JOIN
    towns AS t ON a.town_id = t.town_id
WHERE
    t.name = town_name
ORDER BY e.first_name ASC , e.last_name ASC , e.employee_id ASC;
END $$
DELIMITER ;

-- -------------------------------------------------------------------
-- 5.	Salary Level Function
-- -------------------------------------------------------------------
/*
	Write a function ufn_get_salary_level that receives salary of an
    employee and returns the level of the salary.
		•	If salary is < 30000 return “Low”
		•	If salary is between 30000 and 50000 (inclusive) return 
			“Average”
		•	If salary is > 50000 return “High”
*/

DELIMITER $$
CREATE FUNCTION ufn_get_salary_level (salary DECIMAL (19,4))
RETURNS VARCHAR(50)
BEGIN
	DECLARE result VARCHAR(50);
    
    IF(salary < 30000) THEN
    SET result := 'Low';
    ELSEIF (salary <= 50000) THEN
    SET result := 'Average';
    ELSE 
    SET result := 'High';
    END IF;
    
    RETURN result;
END $$
DELIMITER ;

-- -------------------------------------------------------------------
-- 6.	Employees by Salary Level
-- -------------------------------------------------------------------
/*
	Write a stored procedure usp_get_employees_by_salary_level that 
    receive as parameter level of salary (low, average or high) and 
    print the names of all employees that have given level of salary. 
    The result should be sorted by first_name then by last_name both 
    in descending order.
*/

DELIMITER $$
CREATE PROCEDURE usp_get_employees_by_salary_level(salary_level VARCHAR(50))
BEGIN
	SELECT 
		e.first_name, e.last_name
	FROM
		`employees` AS e
	WHERE
		e.salary < 30000
			AND salary_level = 'low'
			OR e.salary >= 30000 AND e.salary <= 50000
			AND salary_level = 'average'
			OR e.salary > 50000
			AND salary_level = 'high'
	ORDER BY e.first_name DESC , e.last_name DESC;
END $$
DELIMITER ;

-- -------------------------------------------------------------------
-- 7.	Define Function
-- -------------------------------------------------------------------
/*
	Define a function ufn_is_word_comprised(set_of_letters varchar(50),
    word varchar(50))  that returns true or false depending on that if 
    the word is a comprised of the given set of letters. 
*/

DELIMITER $$
CREATE FUNCTION ufn_is_word_comprised(set_of_letters varchar(50), word varchar(50))
RETURNS BIT
BEGIN
	RETURN word REGEXP (concat('^[', set_of_letters, ']+$'));
END $$
DELIMITER ;

-- -------------------------------------------------------------------
-- 8.	* Delete Employees and Departments
-- -------------------------------------------------------------------
/*
	Write a SQL query to delete all employees from the Production and
	Production Control departments. Also delete these departments from
	the departments table.
	After that exercise restore your database to revert those changes.
*/

ALTER TABLE `departments` DROP FOREIGN KEY `fk_departments_employees`;
ALTER TABLE `departments` DROP INDEX `fk_departments_employees` ;
ALTER TABLE `employees_projects` DROP FOREIGN KEY `fk_employees_projects_employees`;
ALTER TABLE `employees` DROP FOREIGN KEY `fk_employees_employees`;

DELETE FROM `employees` 
WHERE
    `department_id` IN (SELECT 
        d.department_id
    FROM
        `departments` AS d
    WHERE
        d.name IN ('Production' , 'Production Control'));
        
DELETE FROM `departments` 
WHERE
    `name` IN ('Production' , 'Production Control');
    
-- -----------------------------------------------------------------------
-- 9. Find Full Name
-- -----------------------------------------------------------------------
/*
	You are given a database schema with tables:
		•	account_holders(id (PK), first_name, last_name, ssn) 
			and 
		•	accounts(id (PK), account_holder_id (FK), balance).
		
        Write a stored procedure usp_get_holders_full_name that selects the 
        full names of all people. . The result should be sorted by full_name 
        alphabetically and id ascending. 
*/
DELIMITER $$
CREATE PROCEDURE usp_get_holders_full_name()
BEGIN
SELECT 
    CONCAT_WS(' ', a.first_name, a.last_name) AS 'full_name'
FROM
    account_holders AS a
ORDER BY full_name , a.id;
	
END $$
DELIMITER ;

-- -------------------------------------------------------------------
-- 10.	People with Balance Higher Than
-- -------------------------------------------------------------------
/*
	Your task is to create a stored procedure 
    usp_get_holders_with_balance_higher_than that accepts a number as 
    a parameter and returns all people who have more money in total of 
    all their accounts than the supplied number. 
	The result should be sorted by first_name then by last_name 
    alphabetically and account id ascending. 
*/

DELIMITER $$

CREATE PROCEDURE usp_get_holders_with_balance_higher_than (balance DECIMAL(19,4))
BEGIN
	SELECT 
		ah.first_name, 
		ah.last_name
	FROM
		account_holders AS ah
			INNER JOIN
		accounts AS a ON ah.id = a.account_holder_id
	GROUP BY ah.id
	HAVING SUM(a.balance) > balance
	ORDER BY a.id , ah.first_name;
END $$
DELIMITER ;

-- -------------------------------------------------------------------
-- 11. Future Value Function
-- -------------------------------------------------------------------
/*
	Your task is to create a function ufn_calculate_future_value that 
    accepts as parameters – sum, yearly interest rate and number of 
    years. It should calculate and return the future value of the initial 
    sum. Using the following formula:
    
    FV=I*((1+R)^T)
    
    •	I – Initial sum
    •	R – Yearly interest rate
    •	T – Number of years
*/
DELIMITER $$
CREATE FUNCTION ufn_calculate_future_value(
    initial_sum DECIMAL(19, 4), interest_rate DECIMAL(19, 4), years INT)
-- RETURNS DECIMAL(19, 4)
RETURNS DOUBLE(19, 2) 
BEGIN
    RETURN initial_sum * POW((1 + interest_rate), years);
END $$
DELIMITER $$
				
-- -------------------------------------------------------------------
-- 12.	Calculating Interest
-- -------------------------------------------------------------------
/* 
	Your task is to create a stored procedure 
    usp_calculate_future_value_for_account that uses the function from
    the previous problem to give an interest to a person's account for 5 
    years, along with information about his/her account id, first name,
    last name and current balance as it is shown in the example below. 
    It should take the account_id and the interest_rate as parameters.
    Interest rate should have precision up to 0.0001, same as the 
    calculated balance after 5 years. Be extremely careful to achieve the
    desired precision!
*/







