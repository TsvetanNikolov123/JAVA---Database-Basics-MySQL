##############################################################
## 01. Employees with Salary Above 35000 
##############################################################

DROP PROCEDURE IF EXISTS `usp_get_employees_salary_above_35000`;

DELiMITER $$

CREATE PROCEDURE `usp_get_employees_salary_above_35000`()
BEGIN 
	SELECT 
		`e`.`first_name`, `e`.`last_name`
	FROM
        `employees` as `e`
	WHERE 
		`e`.`salary` > 35000
	ORDER BY 
		`e`.`first_name` ASC, `e`.`last_name` ASC,`e`.`employee_id` ASC; 
    
END $$

DELIMITER ;

CALL `usp_get_employees_salary_above_35000` ();

##############################################################
## 02. Employees with Salary Above Number
##############################################################

DROP PROCEDURE IF EXISTS `usp_get_employees_salary_above`;

DELIMITER $$

CREATE PROCEDURE `usp_get_employees_salary_above` (`accept_number` DECIMAL(19,4))
BEGIN
	SELECT 
		`e`.`first_name`, `e`.`last_name`
	FROM
		`employees` AS `e`
	WHERE 
		`salary` >= `accept_number`
	ORDER BY 
		`e`.`first_name` ASC, `e`.`last_name` ASC, `employee_id` ASC; 
END $$

DELIMITER ;

CALL `usp_get_employees_salary_above` (48100);

##############################################################
## 03. Town Names Starting With
##############################################################

DROP PROCEDURE IF EXISTS `usp_get_towns_starting_with`;

DELIMITER $$

CREATE PROCEDURE `usp_get_towns_starting_with`(`input_string` VARCHAR(255))
BEGIN
	SELECT
		`t`.`name`
	FROM
		`towns` AS `t`
	WHERE
		`t`.`name` LIKE concat(`input_string`, '%')
	ORDER BY 
		`t`.`name` ASC;
END $$

DELIMITER ;

CALL `usp_get_towns_starting_with` ('c');

##############################################################
##############################################################

DELIMITER $$
DROP PROCEDURE IF EXISTS `usp_get_towns_starting_with`;

CREATE PROCEDURE `usp_get_towns_starting_with`(`input_string` VARCHAR(50))
BEGIN
	DECLARE `town_wildcard` VARCHAR(50);
    SET `town_wildcard` := concat(`input_string`, '%');
    
SELECT 
    `t`.`name`
FROM
    `towns` AS `t`
WHERE
    LOWER(`t`.`name`) LIKE LOWER(`town_wildcard`)
ORDER BY `t`.`name`;
END $$

DELIMITER ;

CALL `usp_get_towns_starting_with` ('b');

##############################################################
## 04. Employees from Town 
##############################################################

DROP PROCEDURE IF EXISTS `usp_get_employees_from_town`;

DELIMITER $$

CREATE PROCEDURE `usp_get_employees_from_town` (`input_town` VARCHAR(255))

BEGIN
	SELECT 
		`e`.`first_name`, 
        `e`.`last_name`
	FROM 
		`employees` AS `e`
	JOIN 
		`addresses` AS `a` ON `e`.`address_id` = `a`.`address_id`
	JOIN
		`towns` AS `t` ON `a`.`town_id` = `t`.`town_id`
	WHERE 
		`t`.`name` LIKE `input_town`
	ORDER BY `e`.`first_name` ASC, `e`.`last_name` ASC, `e`.`employee_id` ASC;
        
END $$

DELIMITER ;

CALL `usp_get_employees_from_town`('Sofia');

##############################################################
## 05. Salary Level Function 
##############################################################

DROP FUNCTION IF EXISTS `ufn_get_salary_level`;

DELIMITER $$

CREATE FUNCTION `ufn_get_salary_level` (`salary` DECIMAL (19,4))
RETURNS VARCHAR(50)
BEGIN
	DECLARE `result` VARCHAR(50);
    
    IF(`salary` < 30000) THEN SET `result` := 'Low';
    ELSEIF (`salary` <= 50000) THEN SET `result` := 'Average';
    ELSE SET `result` := 'High';
    END IF;
    
    RETURN `result`;
END $$

DELIMITER ;

CALL `ufn_get_salary_level`(13500.00);

##############################################################
## 06.	Employees by Salary Level
##############################################################

DROP PROCEDURE IF EXISTS `usp_get_employees_by_salary_level`;

DELIMITER $$

CREATE PROCEDURE `usp_get_employees_by_salary_level`( `level_of_salary` VARCHAR(50))

BEGIN
	SELECT 
		`e`.`first_name`, 
        `e`.`last_name`
	FROM 
		`employees` AS `e`
	WHERE 
		`e`.`salary` < 30000 AND `level_of_salary` = 'low'
        OR
        `e`.`salary` >= 30000 AND `e`.`salary` <= 50000 AND `level_of_salary` = 'average'
        OR 
        `e`.`salary` > 50000 AND `level_of_salary`= 'high'
	ORDER BY `e`.`first_name` DESC, `e`.`last_name` DESC;
END $$

DELIMITER ;

CALL `usp_get_employees_by_salary_level`('high')

##############################################################
## 07. Define Function
##############################################################
DELIMITER $$

DROP FUNCTION IF EXISTS `ufn_is_word_comprised`;

CREATE FUNCTION `ufn_is_word_comprised`(`set_of_letters` varchar(50), `word` varchar(50))
RETURNS BIT
	RETURN `word` REGEXP(concat('^[' , `set_of_letters` , ']+$'));
$$

DELIMITER ;

SELECT `ufn_is_word_comprised`('oistmiahf', 'Sofia');
SELECT `ufn_is_word_comprised`('oistmiahf', 'halves');
SELECT `ufn_is_word_comprised`('bobr', 'Rob');
SELECT `ufn_is_word_comprised`('pppp', 'Guy');

##############################################################
##############################################################
SET GLOBAL log_bin_trust_function_creators = 1;
DELIMITER $$

DROP FUNCTION IF EXISTS `ufn_is_word_comprised`;
CREATE FUNCTION `ufn_is_word_comprised`(`set_of_letters` varchar(50), word varchar(50))
RETURNS BIT
BEGIN 
	DECLARE `result` BIT;
    DECLARE `word_length` INT(11);
    DECLARE `current_index` INT(11);
    
    SET `result` := 1;
    SET `word_length` := char_length(`word`);
    SET `current_index` := 1; 
    
    WHILE (`current_index` <= `word_length`) 
    DO 
		IF(`set_of_letters` NOT LIKE (concat('%', substr(`word`, `current_index`, 1), '%')))
		THEN SET `result` := 0;
		END IF;
        
        SET `current_index` := `current_index` + 1;
    END WHILE;
    
    RETURN `result`;
END $$

DELIMITER ;

SELECT `ufn_is_word_comprised`('oistmiahf', 'Sofia');
SELECT `ufn_is_word_comprised`('oistmiahf', 'halves');
SELECT `ufn_is_word_comprised`('bobr', 'Rob');
SELECT `ufn_is_word_comprised`('pppp', 'Guy');

##############################################################
## 08. Find Full Name 
##############################################################

DELIMITER $$
DROP PROCEDURE IF EXISTS `usp_get_holders_full_name`;
CREATE PROCEDURE `usp_get_holders_full_name` ()
BEGIN
	SELECT 
		concat(`ac`.`first_name`, ' ', `ac`.`last_name` ) AS `full_name`
    FROM
		`account_holders` AS `ac`
	ORDER BY 
		`full_name` ASC, `ac`.`id` ASC;
END $$
DELIMITER ;

CALL `usp_get_holders_full_name`;

##############################################################
## 9. People with Balance Higher Than
##############################################################

DELIMITER $$
DROP PROCEDURE IF EXISTS `usp_get_holders_with_balance_higher_than`;
CREATE PROCEDURE `usp_get_holders_with_balance_higher_than`(`supplied_number` DECIMAL(19,4))
BEGIN
	SELECT
		`ac`.`first_name`, 
        `ac`.`last_name`
	FROM
		`account_holders` AS `ac`
			JOIN 
        `accounts` AS `a` ON `ac`.`id` = `a`.`account_holder_id`
	GROUP BY `ac`.`id`
    HAVING SUM(`a`.`balance`) > `supplied_number`
	ORDER BY
		 `a`.`id` ASC,`ac`.`first_name` ASC, `ac`.`last_name` ASC;
END $$
DELIMITER ;

CALL `usp_get_holders_with_balance_higher_than`(7000);

##############################################################
## 10. Future Value Function
##############################################################

SET GLOBAL log_bin_trust_function_creators = 1;

DELIMITER $$
DROP FUNCTION IF EXISTS `ufn_calculate_future_value`;
CREATE FUNCTION `ufn_calculate_future_value`(`initial_sum` DECIMAL(19, 4), `interest_rate` DOUBLE, `years` INT)
RETURNS DOUBLE 
BEGIN
	DECLARE `result` DOUBLE;
    SET `result` := `initial_sum` * (POW((1 + `interest_rate`), `years`));
    RETURN `result`;
END $$

DELIMITER ;

SELECT `ufn_calculate_future_value`(1000, 0.1, 5);

##############################################################
## 11.	Calculating Interest 
##############################################################

DELIMITER $$
DROP PROCEDURE IF EXISTS `usp_calculate_future_value_for_account`;
CREATE PROCEDURE `usp_calculate_future_value_for_account`(
		`searched_account_id` INT(11), `searched_interest_rate` DECIMAL(19 ,4))
BEGIN
	SELECT
		`a`.`id` AS `account_id`, 
        `ah`.`first_name`,
        `ah`.`last_name`, 
        `a`.`balance` AS `current_balance`,
        ROUND(`ufn_calculate_future_value`(`a`.`balance`, `searched_interest_rate`, 5),4) AS `balance_in_5_years`
    FROM
		`account_holders` AS `ah`
			JOIN
		`accounts` AS `a` ON `ah`.`id` = `a`.`account_holder_id`
		WHERE `a`.`id` = `searched_account_id`;
END $$
DELIMITER ;

CALL `usp_calculate_future_value_for_account`(1, 0.1);

##############################################################
##############################################################
DELIMITER $$

CREATE PROCEDURE `usp_calculate_future_value_for_account` (`account_id` INT, `interest_rate` DECIMAL(19,4))
BEGIN
	SELECT 
		`a`.`id` AS `account_id`,
		`ah`.`first_name`,
		`ah`.`last_name`,
		`a`.`balance` AS `current_balance`,
		cast(`a`.`balance` * POW((1 + `interest_rate`), 5) AS DECIMAL(19,4)) AS `balance_in_5_years` 
        -- ufn_calculate_future_value(a.balance, interest_rate, 5) AS 'balance_in_5_years'
	FROM
		`account_holders` AS `ah`
			JOIN
		`accounts` AS `a` ON `ah`.`id` = `a`.`account_holder_id`
	WHERE
		`a`.`id` = `account_id`;
END $$

DELIMITER ;

##############################################################
## 12. Deposit Money 
##############################################################

DELIMITER $$
DROP PROCEDURE IF EXISTS `usp_deposit_money`;

CREATE PROCEDURE `usp_deposit_money`(`account_id` INT(11), `money_amount` DECIMAL)
BEGIN
	START TRANSACTION;
			
	UPDATE `accounts` AS `ac` 
	SET 
		`ac`.`balance` = `ac`.`balance` + `money_amount`
	WHERE
		`ac`.`id` = `account_id`;
		
	IF( SELECT 
			`a`.`balance`
		FROM
			`accounts` AS `a`
		WHERE 
			`a`.`id` = `account_id`) < 0
		THEN ROLLBACK;
	ELSE
		COMMIT;
	END IF;
END $$
DELIMITER ;

CALL `usp_deposit_money`(1,10);

##############################################################
## 13. Withdraw Money 
##############################################################

DELIMITER $$
CREATE PROCEDURE `usp_withdraw_money`(`account_id` INT, `money_amount` DECIMAL(19,4))
BEGIN
	IF `money_amount` > 0 THEN
        START TRANSACTION;
        
        UPDATE 
			`accounts` AS `ac` 
        SET 
            `ac`.`balance` = `ac`.`balance` - `money_amount`
        WHERE
            `ac`.`id` = `account_id`;
        
        IF (SELECT 
				`a`.`balance` 
            FROM 
				`accounts` AS `a` 
            WHERE 
				`a`.`id` = `account_id`) < 0
            THEN ROLLBACK;
        ELSE
            COMMIT;
        END IF;
    END IF;
END $$
DELIMITER ;

##############################################################
## 14.	Money Transfer
##############################################################

DELIMITER $$
DROP PROCEDURE IF EXISTS `usp_transfer_money`;
CREATE PROCEDURE `usp_transfer_money`(
    `from_account_id` INT, `to_account_id` INT, `money_amount` DECIMAL(19, 4))
BEGIN
    IF `money_amount` > 0 
        AND `from_account_id` <> `to_account_id` 
        AND (SELECT `a`.`id` 
            FROM `accounts` AS `a` 
            WHERE `a`.`id` = `to_account_id`) IS NOT NULL
        AND (SELECT `a`.`id` 
            FROM `accounts` AS `a` 
            WHERE `a`.`id` = `from_account_id`) IS NOT NULL
        AND (SELECT `a`.`balance` 
            FROM `accounts` AS `a` 
            WHERE `a`.`id` = `from_account_id`) >= `money_amount`
    THEN
        START TRANSACTION;
        
        UPDATE `accounts` AS `a` 
        SET 
            `a`.`balance` = `a`.`balance` + `money_amount`
        WHERE
            `a`.`id` = `to_account_id`;
            
        UPDATE `accounts` AS `a` 
        SET 
            `a`.`balance` = `a`.`balance` - `money_amount`
        WHERE
            `a`.`id` = `from_account_id`;
        
        IF (SELECT `a`.`balance` 
            FROM `accounts` AS `a` 
            WHERE `a`.`id` = `from_account_id`) < 0
            THEN ROLLBACK;
        ELSE
            COMMIT;
        END IF;
    END IF;
END $$

DELIMITER ;

CALL `usp_transfer_money`(1,2,10);

##############################################################
## 15.	Log Accounts Trigger 
##############################################################

CREATE TABLE `logs` (
    `log_id` INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `account_id` INT(11) NOT NULL,
    `old_sum` DECIMAL(19, 4) NOT NULL,
    `new_sum` DECIMAL(19, 4) NOT NULL
);

DELIMITER $$
CREATE TRIGGER `tr_balance_updated`
AFTER UPDATE ON `accounts`
FOR EACH ROW
BEGIN
    IF `OLD`.`balance` <> `NEW`.`balance` THEN
        INSERT INTO `logs` 
            (`account_id`, `old_sum`, `new_sum`)
        VALUES (`OLD`.`id`, `OLD`.`balance`, `NEW`.`balance`);
    END IF;
END $$

DELIMITER ;

##############################################################
## 16.	Emails Trigger
##############################################################

DROP TABLE IF EXISTS `logs`;
DROP TABLE IF EXISTS `notification_emails`;
DROP TRIGGER IF EXISTS `tr_emails`;

CREATE TABLE logs(
	`log_id` INT AUTO_INCREMENT PRIMARY KEY,
	`account_id` INT,
	`old_sum` DECIMAL(19, 4),
	`new_sum` DECIMAL(19, 4)
);
CREATE TABLE `notification_emails`(
	`id` INT AUTO_INCREMENT PRIMARY KEY,
	`recipient` INT,
	`subject` VARCHAR(50),
	`body` TEXT
);

DELIMITER $$
CREATE TRIGGER `tr_emails`
AFTER UPDATE
ON `accounts`
FOR EACH ROW 
BEGIN
	INSERT INTO logs(`account_id`, `old_sum`, `new_sum`)
	VALUES(`old`.`id`, `old`.`balance`, `new`.`balance`);
	INSERT INTO `notification_emails`(`recipient`, `subject`, `body`)
	VALUES(
		`old`.`id`,
		CONCAT_WS(': ', 'Balance change for account', `old`.`id`),
		CONCAT('On ', NOW(), ' your balance was changed from ', `old`.`balance`, ' to ', `new`.`balance`, '.' ));
END$$

DELIMITER ;
 
UPDATE `accounts`
SET `balance` = `balance` + 10
WHERE `id` = 1;

SELECT * FROM `logs`;
SELECT * FROM `notification_emails`;