######################################################
## 1. Managers
######################################################

SELECT 
    `e`.`employee_id`,
    CONCAT_WS(' ', `e`.`first_name`, `e`.`last_name`) AS `full_name`,
    `d`.`department_id`,
    `d`.`name`
FROM
    `employees` AS `e`
        RIGHT JOIN
    `departments` AS `d` ON `d`.`manager_id` = `e`.`employee_id`
ORDER BY `e`.`employee_id`
LIMIT 5;

######################################################
## 2. Towns and Addresses
######################################################

SELECT 
    `t`.`town_id`, `t`.`name`, `a`.`address_text`
FROM
    `addresses` AS `a`
        INNER JOIN
    `towns` AS `t` ON `a`.`town_id` = `t`.`town_id`
WHERE
    `t`.name IN ('San Francisco' , 'Sofia', 'Carnation')
ORDER BY `t`.`town_id` , `a`.`address_id`;

######################################################
## 3. Employees Without Managers
######################################################

SELECT 
    `e`.`employee_id`,
    `e`.`first_name`,
    `e`.`last_name`,
    `e`.`department_id`,
    `e`.`salary`
FROM
    `employees` AS `e`
WHERE
    `e`.`manager_id` IS NULL
ORDER BY `e`.`employee_id`;

######################################################
## 4. High Salary
######################################################

SELECT 
    COUNT(`e`.`employee_id`) AS `count`
FROM
    `employees` AS `e`
WHERE
    `e`.`salary` > (SELECT 
            AVG(`salary`) AS `average_salary`
        FROM
            `employees`);