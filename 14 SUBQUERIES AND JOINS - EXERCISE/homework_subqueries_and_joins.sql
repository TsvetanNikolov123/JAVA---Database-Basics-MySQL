######################################################
## 01.	Employee Address 
######################################################

SELECT 
    `e`.`employee_id`,
    `e`.`job_title`,
    `e`.`address_id`,
    `a`.`address_text`
FROM
    `employees` AS `e`
        JOIN
    `addresses` AS `a` ON `e`.`address_id` = `a`.`address_id`
ORDER BY `a`.`address_id` ASC
LIMIT 5;

######################################################
## 02.	Addresses with Towns
######################################################

SELECT 
    `e`.`first_name`,
    `e`.`last_name`,
    `t`.`name`,
    `a`.`address_text`
FROM
    `employees` AS `e`
        INNER JOIN
    `addresses` AS `a` ON `e`.`address_id` = `a`.`address_id`
        INNER JOIN
    `towns` AS `t` ON `a`.`town_id` = `t`.`town_id`
ORDER BY `e`.`first_name` , `e`.`last_name`
LIMIT 5;

######################################################
## 03.	Sales Employee 
######################################################

SELECT 
    `e`.`employee_id`,
    `e`.`first_name`,
    `e`.`last_name`,
    `d`.`name`
FROM
    `employees` AS `e`
        INNER JOIN
    `departments` AS `d` ON `e`.`department_id` = `d`.`department_id`
WHERE
    `d`.`name` LIKE ('Sales')
ORDER BY `e`.`employee_id` DESC;


######################################################
## 04.	Employee Departments 
######################################################

SELECT 
    `e`.`employee_id`,
    `e`.`first_name`,
    `e`.`salary`,
    `d`.`name`
FROM
    `employees` AS `e`
        RIGHT JOIN
    `departments` AS `d` ON `e`.`department_id` = `d`.`department_id`
WHERE
    `e`.`salary` > 15000
ORDER BY `d`.`department_id` DESC
LIMIT 5;

######################################################
## 05.	Employees Without Project 
######################################################

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

######################################################
## 06.	Employees Hired After 
######################################################

SELECT 
    `e`.`first_name`,
    `e`.`last_name`,
    `e`.`hire_date`,
    `d`.`name` AS `dept_name`
FROM
    `employees` AS `e`
        JOIN
    `departments` AS `d` ON `e`.`department_id` = `d`.`department_id`
WHERE
    DATE(`e`.`hire_date`) > '1999-01-01'
        AND `d`.`name` IN ('Sales' , 'Finance')
ORDER BY `e`.`hire_date` ASC;

######################################################
## 07.	Employees with Project 
######################################################

SELECT 
    `e`.`employee_id`, `e`.`first_name`, `p`.`name`
FROM
    `employees` AS `e`
        JOIN
    `employees_projects` AS `ep` ON `ep`.`employee_id` = `e`.`employee_id`
        JOIN
    `projects` AS `p` ON `ep`.`project_id` = `p`.`project_id`
WHERE
    DATE(`p`.`start_date`) > '2002-08-13'
        AND DATE(`p`.`end_date`) IS NULL
ORDER BY `e`.`first_name` ASC , `p`.`name` ASC
LIMIT 5;

######################################################
## 08.	Employee 24 
######################################################

UPDATE `projects` AS `p` 
SET 
    `p`.name = ''
WHERE
    YEAR(`p`.`start_date`) >= 2005;


SELECT 
    `e`.`employee_id`, `e`.`first_name`, `p`.`name`
FROM
    `employees` AS `e`
        JOIN
    `employees_projects` AS `ep` ON `ep`.`employee_id` = `e`.`employee_id`
        JOIN
    `projects` AS `p` ON `ep`.`project_id` = `p`.`project_id`
WHERE
    `e`.`employee_id` = 24
ORDER BY `p`.`name`;

######################################################
## 09.	Employee Manager 
######################################################

SELECT 
    `e1`.`employee_id`,
    `e1`.`first_name`,
    `e2`.`employee_id`,
    `e2`.`first_name` AS `manager_name`
FROM
    `employees` AS `e1`
        JOIN
    `employees` AS `e2` ON `e1`.`manager_id` = `e2`.`employee_id`
WHERE
    `e1`.`manager_id` IN (3 , 7)
ORDER BY `e1`.`first_name` ASC;

######################################################
## 10.	Employee Summary  
######################################################

SELECT 
    `e1`.`employee_id`,
    CONCAT(`e1`.`first_name`, ' ', `e1`.`last_name`) AS `employee_name`,
    CONCAT(`e2`.`first_name`, ' ', `e2`.`last_name`) AS `manager_name`,
    `d`.`name` AS `department_name`
FROM
    `employees` AS `e1`
        JOIN
    `employees` AS `e2` ON `e1`.`manager_id` = `e2`.`employee_id`
        JOIN
    `departments` AS `d` ON `e1`.`department_id` = `d`.`department_id`
ORDER BY `e1`.`employee_id`
LIMIT 5;

######################################################
## 11.	Min Average Salary  
######################################################

SELECT 
    AVG(`e`.`salary`)
FROM
    `employees` AS `e`
GROUP BY `e`.`department_id`
ORDER BY AVG(`e`.`salary`)
LIMIT 1;

######################################################
## 12.	Highest Peaks in Bulgaria  
######################################################

SELECT 
    `c`.`country_code`,
    `m`.`mountain_range`,
    `p`.`peak_name`,
    `p`.`elevation`
FROM
    `countries` AS `c`
        JOIN
    `mountains_countries` AS `mc` ON `c`.`country_code` = `mc`.`country_code`
        JOIN
    `mountains` AS `m` ON `mc`.`mountain_id` = `m`.`id`
        JOIN
    `peaks` AS `p` ON `m`.`id` = `p`.`mountain_id`
WHERE
    `c`.`country_name` LIKE 'Bulgaria'
        AND `p`.`elevation` > 2835
ORDER BY `p`.`elevation` DESC;
    
######################################################
## 13.	Count Mountain Ranges 
######################################################

SELECT 
    `c`.`country_code`,
    COUNT(`m`.`mountain_range`) AS `mountain_range`
FROM
    `countries` AS `c`
        JOIN
    `mountains_countries` AS `mc` ON `c`.`country_code` = `mc`.`country_code`
        JOIN
    `mountains` AS `m` ON `mc`.`mountain_id` = `m`.`id`
WHERE
    `c`.`country_name` IN ('United States' , 'Russia', 'Bulgaria')
GROUP BY `c`.`country_code`
ORDER BY `mountain_range` DESC;

######################################################
## 14.	Countries with Rivers 
######################################################

SELECT 
    `country_name`, `river_name`
FROM
    `countries` AS `c`
        LEFT JOIN
    `countries_rivers` AS `cr` ON `c`.`country_code` = `cr`.`country_code`
        LEFT JOIN
    `rivers` AS `r` ON `cr`.`river_id` = `r`.`id`
        LEFT JOIN
    `continents` AS `con` ON `c`.`continent_code` = `con`.`continent_code`
WHERE
    `con`.`continent_name` LIKE ('Africa')
ORDER BY `c`.`country_name`
LIMIT 5;
    
######################################################
## 15.	*Continents and Currencies 
######################################################

SELECT 
    `c`.`continent_code`,
    `c`.`currency_code`,
    COUNT(*) AS `currency_usage`
FROM
    `countries` AS `c`
GROUP BY `c`.`continent_code` , `c`.`currency_code`
HAVING `currency_usage` > 1
    AND `currency_usage` = (SELECT 
        COUNT(*) AS `cn`
    FROM
        `countries` AS `c2`
    WHERE
        `c2`.`continent_code` = `c`.`continent_code`
    GROUP BY `c2`.`currency_code`
    ORDER BY `cn` DESC
    LIMIT 1)
ORDER BY `c`.`continent_code` , `c`.`continent_code`;

######################################################
## 16.	Countries without any Mountains
######################################################

SELECT 
    COUNT(*) AS `country_count`
FROM
    `countries` AS `c`
        LEFT JOIN
    `mountains_countries` AS `mc` ON `c`.`country_code` = `mc`.`country_code`
WHERE
    `mc`.`mountain_id` IS NULL;
    
######################################################
## 17.	Highest Peak and Longest River by Country
######################################################

SELECT 
    `c`.`country_name`,
    MAX(`p`.`elevation`) AS `highest_peak_elevation`,
    MAX(`r`.`length`) AS `longest_river_length`
FROM
    `countries` AS `c`
        LEFT JOIN
    `countries_rivers` AS `cr` ON `c`.`country_code` = `cr`.`country_code`
        LEFT JOIN
    `rivers` AS `r` ON `cr`.`river_id` = `r`.`id`
        LEFT JOIN
    `mountains_countries` AS `mc` ON `c`.`country_code` = `mc`.`country_code`
        LEFT JOIN
    `mountains` AS `m` ON `mc`.`mountain_id` = `m`.`id`
        LEFT JOIN
    `peaks` AS `p` ON `m`.`id` = `p`.`mountain_id`
GROUP BY `c`.`country_name`
ORDER BY `p`.`elevation` DESC , `r`.`length` DESC , `c`.`country_name` ASC
LIMIT 5;
    
    