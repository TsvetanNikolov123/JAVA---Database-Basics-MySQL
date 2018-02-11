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

