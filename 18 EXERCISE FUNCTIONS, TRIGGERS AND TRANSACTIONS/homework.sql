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
DELIMITER $$

-- -------------------------------------------------------------------
-- 3.	Town Names Starting With
-- -------------------------------------------------------------------