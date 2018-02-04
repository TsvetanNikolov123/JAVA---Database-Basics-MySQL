-- ---1---
SELECT * FROM `departments`;

-- ---2---
SELECT 
    `name`
FROM
    `departments`;

-- ---3---
SELECT 
    `first_name`, `last_name`, `salary`
FROM
    `employees`;
    
-- ---4---
SELECT 
    `first_name`, `middle_name`, `last_name`
FROM
    `employees`;

-- ---5---
SELECT 
    CONCAT(`first_name`,
            '.',
            `last_name`,
            '@softuni.bg') AS 'full_ email_address'
FROM
    `employees`;

-- ---6---
SELECT DISTINCT
    `salary`
FROM
    `employees`
ORDER BY `salary` ASC;

-- ---7---
SELECT 
    *
FROM
    `employees`
WHERE
    `job_title` = 'Sales Representative';
    
-- ---8---
SELECT 
    `first_name`, `last_name`, `job_title`
FROM
    `employees`
WHERE
    `salary` BETWEEN 20000 AND 30000;

-- ---9---
SELECT 
    CONCAT_WS(' ', `first_name`, `middle_name`, `last_name`) AS 'full_name'
FROM
    `employees`
WHERE
    `salary` = 25000 OR `salary` = 14000 OR `salary` = 12500 OR `salary` = 23600;

-- ---10---
SELECT 
    `first_name`, `last_name`
FROM
    `employees`
WHERE
    `manager_id` IS NULL;
    
-- ---11---
SELECT 
    `first_name`, `last_name`, `salary`
FROM
    `employees`
WHERE
    `salary` > 50000
ORDER BY `salary` DESC;

-- ---12---
SELECT 
    `first_name`, `last_name`
FROM
    `employees`
ORDER BY `salary` DESC LIMIT 5;

-- ---13---
SELECT 
    `first_name`, `last_name`
FROM
    `employees`
WHERE
    NOT `department_id` = 4;
    
-- ---14---

	


