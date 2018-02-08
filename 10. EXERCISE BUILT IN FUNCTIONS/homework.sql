-- ---1---
SELECT 
    `e`.`first_name`, `e`.`last_name`
FROM
    `employees` AS `e`
WHERE
    `e`.`first_name` LIKE 'Sa%';
    
-- ---2---
SELECT 
    `e`.`first_name`, `e`.`last_name`
FROM
    `employees` AS `e`
WHERE
    `e`.`last_name` LIKE '%ei%';

-- ---3---
SELECT 
    `e`.`first_name`
FROM
    `employees` AS `e`
WHERE
    (`e`.`department_id` = 3
        OR `e`.`department_id` = 10)
        AND YEAR(`e`.`hire_date`) BETWEEN 1995 AND 2005;
        
-- ---4---
SELECT 
    `e`.`first_name`, `e`.`last_name`
FROM
    `employees` AS `e`
WHERE
    `e`.`job_title` NOT LIKE '%engineer%';
    
-- ---5---
SELECT 
    `t`.`name`
FROM
    `towns` AS `t`
WHERE
    CHAR_LENGTH(`t`.`name`) BETWEEN 5 AND 6
ORDER BY `t`.`name` ASC;

-- ---6---
SELECT 
    `t`.`town_id`, `t`.`name`
FROM
    `towns` AS `t`
WHERE
    `t`.`name` LIKE 'M%'
        OR `t`.`name` LIKE 'K%'
        OR `t`.`name` LIKE 'B%'
        OR `t`.`name` LIKE 'E%'
ORDER BY `t`.`name` ASC;

-- ---7---
SELECT 
    `t`.`town_id`, `t`.`name`
FROM
    `towns` AS `t`
WHERE
    `t`.`name` NOT LIKE 'R%'
        AND `t`.`name` NOT LIKE 'B%'
        AND `t`.`name` NOT LIKE 'D%'
ORDER BY `t`.`name` ASC;

-- ---8---
CREATE VIEW `v_employees_hired_after_2000` AS
    SELECT 
        `first_name`, `last_name`
    FROM
        `employees`
    WHERE
        YEAR(`hire_date`) > 2000;

-- ---9---
