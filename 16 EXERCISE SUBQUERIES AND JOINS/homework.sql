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
SELECT 
    `e`.`employee_id`, `e`.`first_name`
FROM
    `employees` AS `e`
        LEFT JOIN
    `employees_projects` AS `ep` ON `ep`.`employee_id` = `e`.`employee_id`
WHERE
    `ep`.`employee_id` IS NULL
ORDER BY `e`.`employee_id` DESC
LIMIT 3;

-- ---------------------------------------------------------
-- 06.	Employees Hired After
-- ---------------------------------------------------------
/*
	Write a query that selects:
	•	first_name
	•	last_name
	•	hire_date
	•	dept_name
	Filter only employees with hired after 1/1/1999 and are from
    either "Sales" or "Finance" departments. Sorted by hire_date (ascending).
*/
-- ---------------------------------------------------------
SELECT 
    `e`.`first_name`,
    `e`.`last_name`,
    `e`.`hire_date`,
    `d`.`name`
FROM
    `employees` AS `e`
        JOIN
    `departments` AS `d` ON `d`.`department_id` = `e`.`department_id`
WHERE
    DATE(`e`.`hire_date`) > '1999/1/1'
        AND (`d`.`name` = 'Sales'
        OR `d`.`name` = 'Finance')
ORDER BY `e`.`hire_date` ASC;

-- ---------------------------------------------------------
-- 07.	Employees with Project
-- ---------------------------------------------------------
/*
	Write a query that selects:
	•	employee_id
	•	first_name
	•	project_name
	Filter only employees with a project which has started after 13.08.2002
    and it is still ongoing (no end date). Return the first 5 rows sorted by
    first_name then by project_name both  in ascending order.
*/
-- ---------------------------------------------------------
SELECT 
    `e`.`employee_id`,
    `e`.`first_name`,
    `p`.`name` AS `project_name`
FROM
    `employees` AS `e`
        JOIN
    `employees_projects` AS `ep` ON `e`.`employee_id` = `ep`.`employee_id`
        JOIN
    `projects` AS `p` ON `ep`.`project_id` = `p`.`project_id`
WHERE
    DATE(`p`.`start_date`) > '2002/08/13'
        AND `p`.`end_date` IS NULL
ORDER BY `e`.`first_name` ASC , `p`.name ASC
LIMIT 5;

-- ---------------------------------------------------------
-- 08.	Employee 24
-- ---------------------------------------------------------
/*
	Write a query that selects:
	•	employee_id
	•	first_name
	•	project_name
	Filter all the projects of employees with id 24. If the project 
    has started after 2005 inclusively the return value should be NULL.
    Sort result by project_name alphabetically.
*/
-- ---------------------------------------------------------
update `projects` as `p`
set `p`.name = ''
where year(`p`.`start_date`)>=2005;

SELECT 
    `e`.`employee_id`,
    `e`.`first_name`,
    `p`.name AS `project_name`
FROM
    `employees` AS `e`
        JOIN
    `employees_projects` AS `ep` ON `e`.`employee_id` = `ep`.`employee_id`
        JOIN
    `projects` AS `p` ON `ep`.`project_id` = `p`.`project_id`
WHERE
    `e`.`employee_id` = 24
ORDER BY `p`.`name` ASC;

-- ---------------------------------------------------------
-- 09.	Employee Manager
-- ---------------------------------------------------------
/*
	Write a query that selects:
	•	employee_id
	•	first_name
	•	manager_id
	•	manager_name
	Filter all employees with a manager who has id equals to 3 or 7. 
    Return the all rows sorted by employee first_name in ascending order.
*/
-- ---------------------------------------------------------
SELECT 
    `e`.`employee_id`,
    `e`.`first_name`,
    `e2`.`employee_id`,
    `e2`.`first_name` AS `manager_name`
FROM
    `employees` AS `e`
        JOIN
    `employees` AS `e2` ON `e`.`manager_id` = `e2`.`employee_id`
WHERE
    `e`.`manager_id` = 3
        OR `e`.`manager_id` = 7
ORDER BY `e`.`first_name` ASC;

-- ---------------------------------------------------------
-- 10.	Employee Summary
-- ---------------------------------------------------------
/*
	Write a query that selects:
	•	employee_id
	•	employee_name
	•	manager_name
	•	department_name
	Show first 5 employees (only for employees who has a manager) 
    with their managers and the departments which they are in 
    (show the departments of the employees). Order by employee_id.
*/
-- ---------------------------------------------------------
SELECT 
    `e`.`employee_id`,
    CONCAT(`e`.`first_name`, ' ', `e`.`last_name`) AS `employee_name`,
    CONCAT(`e2`.`first_name`, ' ', `e2`.`last_name`) AS `manager_name`,
    `d`.name AS `department_name`
FROM
    `employees` AS `e`
        JOIN
    `employees` AS `e2` ON `e`.`manager_id` = `e2`.`employee_id`
        JOIN
    `departments` AS `d` ON `d`.`department_id` = `e`.`department_id`
ORDER BY `e`.`employee_id` ASC
LIMIT 5;

-- ---------------------------------------------------------
-- 11.	Min Average Salary
-- ---------------------------------------------------------
/*
	Write a query that return the value of the lowest average salary of all departments.
*/
-- ---------------------------------------------------------
SELECT 
    AVG(`e`.`salary`) AS `min_average_salary`
FROM
    `employees` AS `e`
GROUP BY `e`.`department_id`
ORDER BY `min_average_salary`
LIMIT 1;


-- ---------------------------------------------------------
-- 12.	Highest Peaks in Bulgaria
-- ---------------------------------------------------------
/*
	Write a query that selects:
	•	country_code	
	•	mountain_range
	•	peak_name
	•	elevation
	Filter all peaks in Bulgaria with elevation over 2835. Return the 
    all rows sorted by elevation in descending order.

*/
-- ---------------------------------------------------------
SELECT 
    `c`.`country_code`,
    `m`.`mountain_range`,
    `p`.`peak_name`,
    `p`.`elevation`
FROM
    `countries` AS c
        JOIN
    `mountains_countries` AS `mc` ON `c`.`country_code` = `mc`.`country_code`
        JOIN
    `mountains` AS `m` ON `m`.`id` = `mc`.`mountain_id`
        JOIN
    `peaks` AS `p` ON `p`.`mountain_id` = `mc`.`mountain_id`
WHERE
    `c`.`country_name` = 'Bulgaria'
        AND `p`.`elevation` > 2835
ORDER BY `p`.`elevation` DESC;

-- ---------------------------------------------------------
-- 13.	Count Mountain Ranges
-- ---------------------------------------------------------
/*
	Write a query that selects:
	•	country_code
	•	mountain_range
	Filter the count of the mountain ranges in the United States,
    Russia and Bulgaria. Sort result by mountain_range count  in
    decreasing order.
*/
-- ---------------------------------------------------------
SELECT 
    `c`.`country_code`,
    COUNT(`mc`.`mountain_id`) AS 'mountain_range'
FROM
    `countries` AS `c`
        JOIN
    `mountains_countries` AS `mc` ON `c`.`country_code` = `mc`.`country_code`
WHERE
    `c`.`country_name` IN ('United States' , 'Russia', 'Bulgaria')
GROUP BY `c`.`country_code`
ORDER BY `mountain_range` DESC;

-- ---------------------------------------------------------
-- 14.	Countries with Rivers
-- ---------------------------------------------------------
/*
	Write a query that selects:
	•	country_name
	•	river_name
	Find the first 5 countries with or without rivers in Africa. 
    Sort them by country_name in ascending order.
*/
-- ---------------------------------------------------------
SELECT 
    `c`.`country_name`, `r`.`river_name`
FROM
    `countries` AS `c`
        LEFT JOIN
    `countries_rivers` AS `cr` ON `c`.`country_code` = `cr`.`country_code`
        LEFT JOIN
    `rivers` AS `r` ON `r`.`id` = `cr`.`river_id`
        JOIN
    `continents` AS `cn` ON `cn`.`continent_code` = `c`.`continent_code`
WHERE
    `cn`.`continent_name` = 'Africa'
ORDER BY `c`.`country_name`
LIMIT 5;

-- ---------------------------------------------------------
-- 14.	Countries with Rivers
-- ---------------------------------------------------------
/*
	Write a query that selects:
	•	country_name
	•	river_name
	Find the first 5 countries with or without rivers in Africa. 
    Sort them by country_name in ascending order.
*/
-- ---------------------------------------------------------