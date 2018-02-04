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

