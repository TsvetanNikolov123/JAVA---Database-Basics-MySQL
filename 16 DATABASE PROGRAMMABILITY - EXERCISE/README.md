16 Exercises: Functions, Triggers and Transactions
==================================================

---
---

This document defines the **exercise assignments** for the ["Databases Basics -
MySQL" course \@ Software
University.](https://softuni.bg/courses/databases-basics-mysql)

---

Part I – Queries for SoftUni Database
=====================================

16.01 Employees with Salary Above 35000
---------------------------------------

Create stored procedure **usp_get_employees_salary_above_35000** that returns
all employees’ first and last names for whose **salary** is above 35000. The
result should be sorted by **first_name** then by **last_name** alphabetically,
and **id ascending**. Submit your query statement as Run skeleton, run queries &
check DB in Judge.

### Example

| **first_name** | **last_name** |
|----------------|---------------|
| Amy            | Alberts       |
| Brian          | Welcker       |
| Dan            | Wilson        |
| …              | …             |
<br/>

### Solution: <a title="01 Employees with Salary Above 35000" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/10aa108d31eabc7b4aca28bfd4035f6db11256fe/16%20DATABASE%20PROGRAMMABILITY%20-%20EXERCISE/16%20database_programmability_homework.sql#L2">01 Employees with Salary Above 35000</a>
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
---
16.02 Employees with Salary Above Number
----------------------------------------

Create stored procedure **usp_get_employees_salary_above** that **accept a
number** as parameter and return **all employees’ first and last names** whose
salary is **above or equal** to the given number. The result should be sorted by
**first_name** then by **last_name alphabetically** and **id ascending**. Submit
your query statement as **Run skeleton, run queries & check DB in Judge.**

### Example

Supplied number for that example is **48100**.

| **first_name** | **last_name** |
|----------------|---------------|
| Amy            | Alberts       |
| Brian          | Welcker       |
| Dylan          | Miller        |
| …              | …             |
<br/>

### Solution: <a title="02 Employees with Salary Above Number" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/10aa108d31eabc7b4aca28bfd4035f6db11256fe/16%20DATABASE%20PROGRAMMABILITY%20-%20EXERCISE/16%20database_programmability_homework.sql#L27">02 Employees with Salary Above Number</a>
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
---
16.03 Town Names Starting With
------------------------------

Write a stored procedure **usp_get_towns_starting_with** that **accept string as
parameter** and returns **all town names starting with that string.** The result
should be sorted by **town_name** alphabetically. Submit your query statement as
**Run skeleton, run queries & check DB in Judge.**

### Example

Here is the list of all towns **starting with “b”.**

| **town_name** |
|---------------|
| Bellevue      |
| Berlin        |
| Bordeaux      |
| Bothell       |
<br/>

### Solution: <a title="03 Town Names Starting With" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/10aa108d31eabc7b4aca28bfd4035f6db11256fe/16%20DATABASE%20PROGRAMMABILITY%20-%20EXERCISE/16%20database_programmability_homework.sql#L51">03 Town Names Starting With</a>
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
---
16.04 Employees from Town
-------------------------

Write a stored procedure **usp_get_employees_from_town** that accepts
**town_name** as parameter and return the **employees’ first and last name that
live in the given town.** The result should be sorted by **first_name** then by
**last_name** alphabetically and **id ascending**. Submit your query statement
as **Run skeleton, run queries & check DB in Judge.**

### Example

Here it is a list of employees **living in Sofia.**

| **first_name** | **last_name** |
|----------------|---------------|
| George         | Denchev       |
| Martin         | Kulov         |
| Svetlin        | Nakov         |
<br/>

### Solution: <a title="04 Employees from Town" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/10aa108d31eabc7b4aca28bfd4035f6db11256fe/16%20DATABASE%20PROGRAMMABILITY%20-%20EXERCISE/16%20database_programmability_homework.sql#L99">04 Employees from Town</a>
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

---
16.05 Salary Level Function
---------------------------

Write a function **ufn_get_salary_level** that receives **salary of an
employee** and returns the **level of the salary**.

-   If salary is **\< 30000** return **“Low”**

-   If salary is **between 30000 and 50000 (inclusive)** return **“Average”**

-   If salary is **\> 50000** return **“High”**

Submit your query statement as **Run skeleton, run queries & check DB in
Judge.**

### Example

| **salary** | **salary_Level** |
|------------|------------------|
| 13500.00   | Low              |
| 43300.00   | Average          |
| 125500.00  | High             |
<br/>

### Solution: <a title="05 Salary Level Function" href="">05 Salary Level Function</a>
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
---
16.06 Employees by Salary Level
-------------------------------

Write a stored procedure **usp_get_employees_by_salary_level** that receive as
**parameter level of salary** (low, average or high) and print the **names of
all employees** that have given level of salary. The result should be sorted by
**first_name** then by **last_name** both in **descending order**.

Submit your query statement as **Run skeleton, run queries & check DB in
Judge.**

### Example

Here is the list of all employees with **high salary**.

| **first_name** | **last_name** |
|----------------|---------------|
| Terri          | Duffy         |
| Laura          | Norman        |
| Ken            | Sanchez       |
| …              | …             |
<br/>

### Solution: <a title="06 Employees by Salary Level" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/10aa108d31eabc7b4aca28bfd4035f6db11256fe/16%20DATABASE%20PROGRAMMABILITY%20-%20EXERCISE/16%20database_programmability_homework.sql#L154">06 Employees by Salary Level</a>
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
---
16.07 Define Function
---------------------

Define a function **ufn_is_word_comprised(set_of_letters varchar(50), word
varchar(50))** that returns **true** or **false** depending on that if the word
is a comprised of the given set of letters.

Submit your query statement as **Run skeleton, run queries & check DB in
Judge.**

### Example

| **set_of_letters** | **word** | **result** |
|--------------------|----------|------------|
| oistmiahf          | Sofia    | 1          |
| oistmiahf          | halves   | 0          |
| bobr               | Rob      | 1          |
| pppp               | Guy      | 0          |
<br/>

### Solution: <a title="07 Define Function" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/10aa108d31eabc7b4aca28bfd4035f6db11256fe/16%20DATABASE%20PROGRAMMABILITY%20-%20EXERCISE/16%20database_programmability_homework.sql#L183">07 Define Function</a>
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
---
PART II – Queries for Bank Database
===================================

16.08 Find Full Name
--------------------

You are given a database schema with tables:

-   account_holders(id (PK), first_name, last_name, ssn)

>   and

-   accounts(id (PK), account_holder_id (FK), balance).

Write a stored procedure **usp_get_holders_full_name** that selects the full
names of all people. **.** The result should be sorted by **full_name**
alphabetically and **id ascending**. Submit your query statement as **Run
skeleton, run queries & check DB in Judge.**

### Example

| **full_name**   |
|-----------------|
| Bjorn Sweden    |
| Jimmy Henderson |
| Kim Novac       |
| …               |
<br/>

### Solution: <a title="08 Find Full Name" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/10aa108d31eabc7b4aca28bfd4035f6db11256fe/16%20DATABASE%20PROGRAMMABILITY%20-%20EXERCISE/16%20database_programmability_homework.sql#L238">08 Find Full Name</a>
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
---
16.09 People with Balance Higher Than
-------------------------------------

Your task is to create a stored procedure
**usp_get_holders_with_balance_higher_than** that accepts a **number as a
parameter** and returns all **people who have more money in total of all their
accounts than the supplied number**.

The result should be sorted by **first_name** then by **last_name**
alphabetically and **account id** ascending.

Submit your query statement as **Run skeleton, run queries & check DB in
Judge.**

### Example

Supplied number for that example is 7000.

| **first_name** | **last_name** |
|----------------|---------------|
| Monika         | Miteva        |
| Petar          | Kirilov       |
| …              | …             |
<br/>

### Solution: <a title="09 People with Balance Higher Than" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/10aa108d31eabc7b4aca28bfd4035f6db11256fe/16%20DATABASE%20PROGRAMMABILITY%20-%20EXERCISE/16%20database_programmability_homework.sql#L257">09 People with Balance Higher Than</a>
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

---
16.10 Future Value Function
---------------------------

Your task is to create a function **ufn_calculate_future_value** that accepts as
parameters – **sum**, **yearly interest rate** and **number of years**. It
should calculate and return the **future value of the initial sum**. Using the
following formula:

$$
FV = I \times ({(1 + R)}^{T})
$$

-   **I** – Initial sum

-   **R** – Yearly interest rate

-   **T** – Number of years

Submit your query statement as **Run skeleton, run queries & check DB in
Judge.**

### Example

| **Input**                                                                                                 | **Output** |
|-----------------------------------------------------------------------------------------------------------|------------|
| **Initial sum:** 1000 **Yearly Interest rate:** 10% **years:** 5 ufn_calculate_future_value(1000, 0.1, 5) | 1610.51    |
<br/>

### Solution: <a title="10 Future Value Function" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/10aa108d31eabc7b4aca28bfd4035f6db11256fe/16%20DATABASE%20PROGRAMMABILITY%20-%20EXERCISE/16%20database_programmability_homework.sql#L281">10 Future Value Function</a>
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
---
16.11 Calculating Interest
--------------------------

Your task is to create a stored procedure
**usp_calculate_future_value_for_account** that uses the function from the
previous problem to give an interest to a person's account **for 5 years**,
along with information about his/her **account id, first name, last name and
current balance** as it is shown in the example below. It should take the
**account_id** and the **interest_rate** as parameters. Interest rate should
have precision up to 0.0001, same as the calculated balance after 5 years. **Be
extremely careful to achieve the desired precision!**

Submit your query statement as **Run skeleton, run queries & check DB in
Judge.**

### Example

Here is the result for **account_id = 1** and **interest_rate = 0.1.**

| **account_id** | **fist_name** | **last_name** | **current_balance** | **balance_in_5_years** |
|----------------|---------------|---------------|---------------------|------------------------|
| 1              | Susan         | Cane          | 123.1200            | 198.2860               |
<br/>

### Solution: <a title="11 Calculating Interest" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/10aa108d31eabc7b4aca28bfd4035f6db11256fe/16%20DATABASE%20PROGRAMMABILITY%20-%20EXERCISE/16%20database_programmability_homework.sql#L301">11 Calculating Interest</a>
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
---
16.12 Deposit Money
-------------------

Add stored procedure **usp_deposit_money(account_id, money_amount)** that
operate in transactions.

Make sure to guarantee valid positive **money_amount** with precision up to
**fourth sign after decimal point**. The procedure should produce exact results
working with the specified precision.

Submit your query statement as **Run skeleton, run queries & check DB in
Judge.**

### Example

Here is the result for **account_id = 1** and **money_amount = 10.**

| **account_id** | **account_holder_id** | **balance** |
|----------------|-----------------------|-------------|
| 1              | 1                     | 133.1200    |
<br/>

### Solution: <a title="12 Deposit Money" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/10aa108d31eabc7b4aca28bfd4035f6db11256fe/16%20DATABASE%20PROGRAMMABILITY%20-%20EXERCISE/16%20database_programmability_homework.sql#L349">12 Deposit Money</a>
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
---
16.13 Withdraw Money
--------------------

Add stored procedures **usp_withdraw_money(account_id, money_amount)** that
operate in transactions.

Make sure to guarantee withdraw is done only when balance is enough and
**money_amount** is valid positive number. **Work with precision up to fourth
sign after decimal point**. The procedure should produce exact results working
with the specified precision.

Submit your query statement as **Run skeleton, run queries & check DB in
Judge.**

### Example

Here is the result for **account_id = 1** and **money_amount = 10.**

| **account_id** | **account_holder_id** | **balance** |
|----------------|-----------------------|-------------|
| 1              | 1                     | 113.1200    |
<br/>

### Solution: <a title="13 Withdraw Money" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/10aa108d31eabc7b4aca28bfd4035f6db11256fe/16%20DATABASE%20PROGRAMMABILITY%20-%20EXERCISE/16%20database_programmability_homework.sql#L381">13 Withdraw Money</a>
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
---
16.14 Money Transfer
--------------------

Write stored procedure **usp_transfer_money(from_account_id, to_account_id,
amount)** that **transfers money from one account to another**. Consider cases
when one of the **account_ids** is not valid, the amount of **money is negative
number, outgoing balance** is enough or transferring **from/to one and the same
account.** Make sure that the whole procedure **passes without errors** and **if
error occurs make no change in the database.**

Make sure to guarantee exact results working with precision up to fourth sign
after decimal point.

Submit your query statement as **Run skeleton, run queries & check DB in
Judge.**

### Example

Here is the result for **from_account_id = 1, to_account_id = 2** and
**money_amount = 10.**

| **account_id** | **account_holder_id** | **balance** |
|----------------|-----------------------|-------------|
| 1              | 1                     | 113.1200    |
| 2              | 3                     | 4364.2300   |
<br/>

### Solution: <a title="14 Money Transfer" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/10aa108d31eabc7b4aca28bfd4035f6db11256fe/16%20DATABASE%20PROGRAMMABILITY%20-%20EXERCISE/16%20database_programmability_homework.sql#L412">14 Money Transfer</a>
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
---
16.15 Log Accounts Trigger
--------------------------

Create another table – **logs(log_id, account_id, old_sum, new_sum).** Add a
**trigger** to the **accounts** table that enters a new entry into the **logs**
table every time the sum on an **account** changes.

Submit your query statement as **Run skeleton, run queries & check DB in
Judge.**

### Example

The following data in logs table is inserted after updating balance of account
with **account_id = 1** with 10.

| **log_id** | **account_id** | **old_sum** | **new_sum** |
|------------|----------------|-------------|-------------|
| 1          | 1              | 123.12      | 113.12      |
| 2          | 1              | 145.43      | 155.43      |
<br/>

### Solution: <a title="15 Log Accounts Trigger" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/10aa108d31eabc7b4aca28bfd4035f6db11256fe/16%20DATABASE%20PROGRAMMABILITY%20-%20EXERCISE/16%20database_programmability_homework.sql#L461">15 Log Accounts Trigger</a>
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

---
16.16 Emails Trigger
--------------------

Create another table – **notification_emails(id, recipient, subject, body)**.
Add a trigger to logs table to **create new email whenever new record is
inserted in logs table.** The following data is required to be filled for each
email:

-   **recipient** – **account_id**

-   **subject** – “Balance change for account: **{account_id}**”

-   **body** - “On **{date (current date)}** your balance was changed from
    **{old}** to **{new}.**”

Submit your query statement as **Run skeleton, run queries & check DB in
Judge.**

### Example 

| **id** | **recipient** | **subject**                   | **body**                                                                |
|--------|---------------|-------------------------------|-------------------------------------------------------------------------|
| 1      | 1             | Balance change for account: 1 | On Sep 15 2016 at 11:44:06 AM your balance was changed from 133 to 143. |
| …      | …             | …                             | …                                                                       |
<br/>

### Solution: <a title="16 Emails Trigger" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/10aa108d31eabc7b4aca28bfd4035f6db11256fe/16%20DATABASE%20PROGRAMMABILITY%20-%20EXERCISE/16%20database_programmability_homework.sql#L486">16 Emails Trigger</a>
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
---