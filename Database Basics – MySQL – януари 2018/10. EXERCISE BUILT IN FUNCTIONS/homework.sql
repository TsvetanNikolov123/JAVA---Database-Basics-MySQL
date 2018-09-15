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
SELECT 
    `e`.`first_name`, `e`.`last_name`
FROM
    `employees` AS `e`
WHERE
    CHAR_LENGTH(`e`.`last_name`) = 5;
    
-- ---10---
SELECT 
    `c`.`country_name`, `c`.`iso_code`
FROM
    `countries` AS `c`
WHERE
    `c`.`country_name` LIKE '%a%a%a%'
ORDER BY `c`.`iso_code` ASC;

-- ---11---
SELECT 
    `p`.`peak_name`,
    `r`.`river_name`,
    LOWER(CONCAT(`p`.`peak_name`,
                    SUBSTRING(`r`.`river_name`, 2))) AS `mix`
FROM
    `peaks` AS `p`,
    `rivers` AS `r`
WHERE
    RIGHT(`p`.`peak_name`, 1) = LEFT(`r`.`river_name`, 1)
ORDER BY `mix`;

-- ---12---
SELECT 
    `g`.`name`, DATE_FORMAT(`g`.`start`, '%Y-%m-%d') AS `start`
FROM
    `games` AS `g`
WHERE
    YEAR(`g`.`start`) BETWEEN 2011 AND 2012
ORDER BY `g`.`start`
LIMIT 50;

-- ---13---
SELECT 
    `s`.`user_name`,
    SUBSTRING_INDEX(`s`.`email`, '@', - 1) AS `Email Provider`
FROM
    `users` AS `s`
ORDER BY `Email Provider` , `s`.`user_name`;

-- ---14---
SELECT 
    `u`.`user_name`, `u`.`ip_address`
FROM
    `users` AS `u`
WHERE
    `u`.`ip_address` LIKE '___.1%.%.___'
ORDER BY `u`.`user_name` ASC;

-- ---15---
SELECT 
    `name` AS `Game`,
    CASE
        WHEN HOUR(`start`) BETWEEN 0 AND 11 THEN 'Morning'
        WHEN HOUR(`start`) BETWEEN 12 AND 17 THEN 'Afternoon'
        WHEN HOUR(`start`) BETWEEN 18 AND 23 THEN 'Evening'
    END AS 'Part of the day',
    CASE
        WHEN `duration` <= 3 THEN 'Extra Short'
        WHEN `duration` BETWEEN 4 AND 6 THEN 'Short'
        WHEN `duration` BETWEEN 7 AND 10 THEN 'Long'
        ELSE 'Extra Long'
    END AS 'Duration'
FROM
    `games`;
    
-- ---16---
SELECT 
    `o`.`product_name`,
    `o`.`order_date`,
    DATE_ADD(`o`.`order_date`, INTERVAL 3 DAY) AS `pay_due`,
    DATE_ADD(`o`.`order_date`, INTERVAL 1 MONTH) AS `deliver_due`
FROM
    `orders` AS `o`;