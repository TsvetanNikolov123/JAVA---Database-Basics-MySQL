-- ---1---

SELECT 
    COUNT(`w`.`id`) AS 'count'
FROM
    `wizzard_deposits` AS `w`;

-- ---2---

SELECT 
    MAX(`w`.`magic_wand_size`) AS 'longest_magic_wand'
FROM
    `wizzard_deposits` AS `w`;
    
-- ---3---

SELECT 
    `w`.`deposit_group`,
    MAX(`w`.`magic_wand_size`) AS 'longest_magic_wand'
FROM
    `wizzard_deposits` AS `w`
GROUP BY `w`.`deposit_group`
ORDER BY `longest_magic_wand` ASC , `w`.`deposit_group` ASC;

-- ---4---

SELECT 
    `w`.`deposit_group`
FROM
    `wizzard_deposits` AS `w`
GROUP BY `w`.`deposit_group`
ORDER BY AVG(`w`.`magic_wand_size`)
LIMIT 1;

-- ---5---

SELECT 
    `w`.`deposit_group`,
    SUM(`w`.`deposit_amount`) AS 'total_sum'
FROM
    `wizzard_deposits` AS `w`
GROUP BY `w`.`deposit_group`
ORDER BY `total_sum`;

-- ---6---

SELECT 
    `w`.`deposit_group`,
    SUM(`w`.`deposit_amount`) AS 'total_sum'
FROM
    `wizzard_deposits` AS `w`
WHERE
    `w`.`magic_wand_creator` = 'Ollivander family'
GROUP BY `w`.`deposit_group`;

-- ---7---

SELECT 
    `w`.`deposit_group`,
    SUM(`w`.`deposit_amount`) AS 'total_sum'
FROM
    `wizzard_deposits` AS `w`
WHERE
    `w`.`magic_wand_creator` = 'Ollivander family'
GROUP BY `w`.`deposit_group`
HAVING `total_sum` < 150000
ORDER BY `total_sum` DESC;

-- ---8---

SELECT 
    `w`.`deposit_group`,
    `w`.`magic_wand_creator`,
    MIN(`w`.`deposit_charge`)
FROM
    `wizzard_deposits` AS `w`
GROUP BY `w`.`deposit_group` , `w`.`magic_wand_creator`
ORDER BY `w`.`magic_wand_creator` ASC , `w`.`deposit_group` ASC;

-- --9---

 SELECT 
    CASE
        WHEN `age` <= 10 THEN '[0-10]'
        WHEN `age` <= 20 THEN '[11-20]'
        WHEN `age` <= 30 THEN '[21-30]'
        WHEN `age` <= 40 THEN '[31-40]'
        WHEN `age` <= 50 THEN '[41-50]'
        WHEN `age` <= 60 THEN '[51-60]'
        ELSE '[61+]'
    END AS `age_group`,
    COUNT(*) AS `wizzard_count`
FROM
    `wizzard_deposits`
GROUP BY `age_group`;

-- ---10---

SELECT 
    SUBSTRING(`first_name`, 1, 1) AS `first_letter`
FROM
    `wizzard_deposits`
WHERE
    `deposit_group` = 'Troll Chest'
GROUP BY `first_letter`
ORDER BY `first_letter`;

-- ---11---

SELECT 
    `w`.`deposit_group`,
    `w`.`is_deposit_expired`,
    AVG(`w`.`deposit_interest`) AS `average_interest`
FROM
    `wizzard_deposits` AS `w`
WHERE
    `w`.`deposit_start_date` > '1985-01-01'
GROUP BY `w`.`deposit_group` , `w`.`is_deposit_expired`
ORDER BY `w`.`deposit_group` DESC , `w`.`is_deposit_expired` ASC;

-- ---12---

SELECT 
    SUM(`diff`.`next`) AS `sum_difference`
FROM
    (SELECT 
        `deposit_amount` - (SELECT 
                    `deposit_amount`
                FROM
                    `wizzard_deposits`
                WHERE
                    `id` = `wd`.`id` + 1) AS next
    FROM
        `wizzard_deposits` AS `wd`) AS `diff`;

-- ---13---

SELECT 
    `e`.`department_id`, MIN(`e`.`salary`) AS `minimum_salary`
FROM
    `employees` AS `e`
WHERE
    (`e`.`department_id` = 2
        OR `e`.`department_id` = 5
        OR `e`.`department_id` = 7)
        AND `e`.`hire_date` > 2000 - 01 - 01
GROUP BY `e`.`department_id`
ORDER BY `e`.`department_id` ASC;

-- ---14---

CREATE TEMPORARY TABLE IF NOT EXISTS `emp` AS (SELECT * FROM
    `employees` AS `e`
WHERE
    `e`.`salary` > 30000);
    
DELETE FROM `emp` 
WHERE
    `emp`.`manager_id` = 42;
    
UPDATE `emp` 
SET 
    `emp`.`salary` = `emp`.`salary` + 5000
WHERE
    `emp`.`department_id` = 1; 
    
SELECT 
    `emp`.`department_id`, AVG(`emp`.`salary`) AS `avg_salary`
FROM
    `emp`
GROUP BY `emp`.`department_id`
ORDER BY `emp`.`department_id` ASC;

-- ---15---

SELECT 
    `e`.`department_id`, MAX(`e`.`salary`) AS `max_salary`
FROM
    `employees` AS `e`
GROUP BY `e`.`department_id`
HAVING `max_salary` < 30000
    OR `max_salary` > 70000
ORDER BY `e`.`department_id`;

-- ---16---

SELECT 
    COUNT(`e`.`salary`)
FROM
    `employees` AS `e`
WHERE
    `manager_id` IS NULL;

-- ---17---

SELECT 
    emp.department_id, MAX(emp.salary) AS third_highest_salary
FROM
    employees AS emp
        JOIN
    (SELECT 
        e.department_id AS department_id,
            MAX(e.salary) AS max_salary
    FROM
        employees AS e
    JOIN (SELECT 
        e.department_id AS department_id,
            MAX(e.salary) AS max_salary
    FROM
        employees AS e
    GROUP BY e.department_id) AS first_max_salary ON e.department_id = first_max_salary.department_id
    WHERE
        e.salary < first_max_salary.max_salary
    GROUP BY e.department_id) AS second_max_salary ON emp.department_id = second_max_salary.department_id
WHERE
    emp.salary < second_max_salary.max_salary
GROUP BY emp.department_id
ORDER BY emp.department_id;

-- ---18---

SELECT 
    e.first_name, e.last_name, e.department_id
FROM
    employees AS e,
    (SELECT 
        e.department_id, AVG(e.salary) AS avg_salary
    FROM
        employees AS e
    GROUP BY e.department_id) AS avg_salary_by_dep
WHERE
    e.department_id = avg_salary_by_dep.department_id
        AND e.salary > avg_salary_by_dep.avg_salary
ORDER BY e.department_id ASC
LIMIT 10;

-- ---19---

SELECT 
    `e`.`department_id`, SUM(`e`.`salary`)
FROM
    `employees` AS `e`
GROUP BY `e`.`department_id`
ORDER BY `e`.`department_id`;
