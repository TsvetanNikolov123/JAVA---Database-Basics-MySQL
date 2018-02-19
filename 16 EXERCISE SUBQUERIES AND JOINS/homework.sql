-- ---------------------------------------------------------
-- 01.	Employee Address
-- ---------------------------------------------------------
/* 
	Write a query that selects:
	•	employee_id
	•	job_title
	•	address_id
	•	address_text
	Return the first 5 rows sorted by address_id in ascending order.
*/
-- ---------------------------------------------------------
SELECT 
    `e`.`employee_id`,
    `e`.`job_title`,
    `e`.`address_id`,
    `a`.`address_text`
FROM
    `employees` AS `e`
        JOIN
    `addresses` AS `a` ON `e`.`address_id` = `a`.`address_id`
ORDER BY `e`.`address_id` ASC
LIMIT 5;

-- ---------------------------------------------------------
-- 02.	Addresses with Towns
-- ---------------------------------------------------------
/*	
	Write a query that selects:
	•	first_name
	•	last_name
	•	town
	•	address_text
	Sorted by first_name in ascending order then by last_name. Select first 5 employees.
*/
-- ---------------------------------------------------------
SELECT 
    `e`.`first_name`,
    `e`.`last_name`,
    `t`.`name` AS `town`,
    `a`.`address_text`
FROM
    `employees` AS `e`
        JOIN
    `addresses` AS `a` ON `a`.`address_id` = `e`.`address_id`
        JOIN
    `towns` AS `t` ON `t`.`town_id` = `a`.`town_id`
ORDER BY `e`.`first_name` ASC , `e`.`last_name`
LIMIT 5;

-- ---------------------------------------------------------
-- 03.	Sales Employee
-- ---------------------------------------------------------
/*
	Write a query that selects:
	•	employee_id
	•	first_name
	•	last_name
	•	department_name
	Sorted by employee_id in descending order. Select only employees from “Sales” department.
*/
-- ---------------------------------------------------------
SELECT 
    `e`.`employee_id`,
    `e`.`first_name`,
    `e`.`last_name`,
    `d`.`name` AS `department_name`
FROM
    `employees` AS `e`
        JOIN
    `departments` AS `d` ON `e`.`department_id` = `d`.`department_id`
WHERE
    `d`.`name` = 'Sales'
ORDER BY `e`.`employee_id` DESC;

-- ---------------------------------------------------------
-- 04.	Employee Departments
-- ---------------------------------------------------------
/*
	Write a query that selects:
	•	employee_id
	•	first_name
	•	salary
	•	department_name
	Filter only employees with salary higher than 15000. Return the first 5 rows
    sorted by department_id in descending order.
*/
-- ---------------------------------------------------------
SELECT 
    `e`.`employee_id`,
    `e`.`first_name`,
    `e`.`salary`,
    `d`.`name` AS `department_name`
FROM
    `employees` AS `e`
        RIGHT JOIN
    `departments` AS `d` ON `e`.`department_id` = `d`.`department_id`
WHERE
    `e`.`salary` > 15000
ORDER BY `e`.`department_id` DESC
LIMIT 5;

-- ---------------------------------------------------------
-- 05.	Employees Without Project
-- ---------------------------------------------------------
/*
	Write a query that selects:
	•	employee_id
	•	first_name
	Filter only employees without a project. Return the first 3 rows sorted
    by employee_id in descending order.
*/
-- ---------------------------------------------------------