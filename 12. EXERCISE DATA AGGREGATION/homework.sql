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