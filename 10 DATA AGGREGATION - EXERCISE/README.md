10 Exercises: Data Aggregation
==============================

---
---

This document defines the **exercise assignments** for the ["Databases Basics -
MySQL" course \@ Software
University](https://softuni.bg/courses/databases-basics-mysql).

Mr. Bodrog is a greedy small goblin. His most precious possession is a small
database of the deposits in the wizard’s world. Mr. Bodrog wants you to send him
some reports.

Get familiar with the **gringotts** database. You will use it in the assignments
below.

---

10.01 Records’ Count
----------------------

Import the database and send the **total count of records** to Mr. Bodrog. Make
sure nothing got lost.

### Example:

| **count** |
|-----------|
| **162**   |
<br/>

### Solution: <a title="01 Records’ Count" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/80690b28052c402d6e5b8205012ddbce3dc2b59c/10%20DATA%20AGGREGATION%20-%20EXERCISE/homework.sql#L2">01 Records’ Count</a>
    ############################################################
    ## 01. Records’ Count
    ############################################################
    
    SELECT 
        COUNT(`w`.`id`) AS `count`
    FROM
        `wizzard_deposits` AS `w`;
---
10.02 Longest Magic Wand
------------------------

Select the size of the **longest magic wand**. Rename the new column
appropriately.

### Example:

| **longest_magic_wand** |
|------------------------|
| **31**                 |
<br/>

### Solution: <a title="02 Longest Magic Wand" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/80690b28052c402d6e5b8205012ddbce3dc2b59c/10%20DATA%20AGGREGATION%20-%20EXERCISE/homework.sql#L11">02 Longest Magic Wand</a>
    ############################################################
    ## 02. Longest Magic Wand 
    ############################################################
    
    SELECT 
        MAX(`w`.`magic_wand_size`) AS `longest_magic_wand`
    FROM
        `wizzard_deposits` AS `w`;
---
10.03 Longest Magic Wand per Deposit Groups
-------------------------------------------

For wizards in each deposit group show the longest magic wand. **Sort result by
longest magic** wand for each deposit group **in increasing order**, then by
**deposit_group** alphabetically. Rename the new column appropriately.

### Example:

| **deposit_group** | **longest_magic_wand** |
|-------------------|------------------------|
| Human Pride       | 30                     |
| …                 | …                      |
<br/>

### Solution: <a title="03 Longest Magic Wand per Deposit Groups" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/80690b28052c402d6e5b8205012ddbce3dc2b59c/10%20DATA%20AGGREGATION%20-%20EXERCISE/homework.sql#L20">03 Longest Magic Wand per Deposit Groups</a>
    ###########################################################
    ## 03. Longest Magic Wand per Deposit Groups 
    ###########################################################
    
    SELECT 
        `w`.`deposit_group`,
        MAX(`w`.`magic_wand_size`) AS 'longest_magic_wand'
    FROM
        `wizzard_deposits` AS `w`
    GROUP BY `w`.`deposit_group`
    ORDER BY `longest_magic_wand` ASC , `w`.`deposit_group` ASC;
---
10.04 Smallest Deposit Group per Magic Wand Size\*
--------------------------------------------------

Select the deposit group with the **lowest** average wand size.

### Example:

| **deposit_group** |
|-------------------|
| Troll Chest       |
<br/>

### Solution: <a title="04 Smallest Deposit Group per Magic Wand Size\*" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/80690b28052c402d6e5b8205012ddbce3dc2b59c/10%20DATA%20AGGREGATION%20-%20EXERCISE/homework.sql#L32">04 Smallest Deposit Group per Magic Wand Size\*</a>
    ###########################################################
    ## 04. Smallest Deposit Group per Magic Wand Size
    ###########################################################
    
    SELECT 
        `w`.`deposit_group`
    FROM
        `wizzard_deposits` AS `w`
    GROUP BY `w`.`deposit_group`
    ORDER BY AVG(`w`.`magic_wand_size`)
    LIMIT 1;
---
10.05 Deposits Sum
------------------

Select all deposit groups and its **total deposit sum**. Sort result by
**total_sum** in **increasing order**.

### Example:

| **deposit_group** | **total_sum** |
|-------------------|---------------|
| Blue Phoenix      | 819598.73     |
| …                 | …             |
<br/>

### Solution: <a title="05 Deposits Sum" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/80690b28052c402d6e5b8205012ddbce3dc2b59c/10%20DATA%20AGGREGATION%20-%20EXERCISE/homework.sql#L44">05 Deposits Sum</a>
    ###########################################################
    ## 05. Deposits Sum 
    ###########################################################
    
    SELECT 
        `w`.`deposit_group`,
        SUM(`w`.`deposit_amount`) AS 'total_sum'
    FROM
        `wizzard_deposits` AS `w`
    GROUP BY `w`.`deposit_group`
    ORDER BY `total_sum`;
---
10.06 Deposits Sum for Ollivander family
----------------------------------------

Select all deposit groups and its total deposit sum but **only for the wizards
who has their magic wand crafted by Ollivander family**. Sort result by
**deposit_group alphabetically**.

### Example:

| **deposit_group** | **total_sum** |
|-------------------|---------------|
| Blue Phoenix      | 52968.96      |
| Human Pride       | 188366.86     |
| …                 | …             |
<br/>

### Solution: <a title="06 Deposits Sum for Ollivander family" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/80690b28052c402d6e5b8205012ddbce3dc2b59c/10%20DATA%20AGGREGATION%20-%20EXERCISE/homework.sql#L56">06 Deposits Sum for Ollivander family</a>
    ###########################################################
    ## 06. Deposits Sum for Ollivander Family 
    ###########################################################
    
    SELECT 
        `w`.`deposit_group`,
        SUM(`w`.`deposit_amount`) AS 'total_sum'
    FROM
        `wizzard_deposits` AS `w`
    WHERE
        `w`.`magic_wand_creator` = 'Ollivander family'
    GROUP BY `w`.`deposit_group`
    ORDER BY `w`.`deposit_group`;
---
10.07 Deposits Filter
---------------------

Select all deposit groups and its total deposit sum but **only for the wizards
who has their magic wand crafted by Ollivander family**. After this, **filter**
total deposit sums **lower than 150000**. Order by total deposit sum in
**descending order**.

### Example:

| **deposit_group** | **total_sum** |
|-------------------|---------------|
| Troll Chest       | 126585.18     |
| …                 | …             |
<br/>

### Solution: <a title="07 Deposits Filter" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/80690b28052c402d6e5b8205012ddbce3dc2b59c/10%20DATA%20AGGREGATION%20-%20EXERCISE/homework.sql#L70">07 Deposits Filter</a>
    ###########################################################
    ## 07. Deposits Filter
    ###########################################################
    
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
---
10.08 Deposit charge
--------------------

Create a query that selects:

• **Deposit group**

• **Magic wand creator**

• **Minimum deposit charge for each group**

Group by deposit_group and magic_wand_creator.

Select the data in **ascending** order by **magic_wand_creator** and
**deposit_group**.

### Example:

| **deposit_group** | **magic_wand_creator** | **min_deposit_charge** |
|-------------------|------------------------|------------------------|
| Blue Phoenix      | Antioch Peverell       | 30.00                  |
| …                 | …                      |                        |
<br/>

### Solution: <a title="08 Deposit charge" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/80690b28052c402d6e5b8205012ddbce3dc2b59c/10%20DATA%20AGGREGATION%20-%20EXERCISE/homework.sql#L85">08 Deposit charge</a>
    ###########################################################
    ## 08. Deposit Charge 
    ###########################################################
    
    SELECT 
        `w`.`deposit_group`,
        `w`.`magic_wand_creator`,
        MIN(`w`.`deposit_charge`) AS `min_deposit_charge`
    FROM
        `wizzard_deposits` AS `w`
    GROUP BY `w`.`deposit_group` , `w`.`magic_wand_creator`
    ORDER BY `w`.`magic_wand_creator` ASC , `w`.`deposit_group` ASC;
---
10.09 Age Groups
----------------

Write down a query that creates 7 different groups **based on their age**.

Age groups should be as follows:

• **[0-10]**

• **[11-20]**

• **[21-30]**

• **[31-40]**

• **[41-50]**

• **[51-60]**

• **[61+]**

The query should return:

• **Age groups**

• **Count of wizards in it**

Sort result by **increasing size** of age groups.

### Example:

| **age_group** | **wizard_count** |
|---------------|------------------|
| [11-20]       | 21               |
| …             | …                |
<br/>

### Solution: <a title="09 Age Groups" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/80690b28052c402d6e5b8205012ddbce3dc2b59c/10%20DATA%20AGGREGATION%20-%20EXERCISE/homework.sql#L98">09 Age Groups</a>
    ###########################################################
    ## 09. Age Groups  
    ###########################################################
    
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
        wizzard_deposits AS w
    GROUP BY `age_group`
    ORDER BY `age_group` ASC;
---
10.10 First Letter
------------------

Write a query that returns all **unique** wizard **first letters of their first
names only if they have deposit of type Troll Chest.** Order them
**alphabetically**. Use **GROUP BY** for uniqueness.

### Example:

| **first_letter** |
|------------------|
| A                |
| …                |
<br/>

### Solution: <a title="10 First Letter" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/80690b28052c402d6e5b8205012ddbce3dc2b59c/10%20DATA%20AGGREGATION%20-%20EXERCISE/homework.sql#L118">10 First Letter</a>
    ###########################################################
    ## 10. First Letter 
    ###########################################################
    
    SELECT 
        LEFT(`w`.`first_name`, 1) AS `first_letter`
    FROM
        `wizzard_deposits` AS `w`
    WHERE
        `w`.`deposit_group` = 'Troll Chest'
    GROUP BY `first_letter`
    ORDER BY `first_letter` ASC;
---
10.11 Average Interest 
----------------------

Mr. Bodrog is highly interested in profitability. He wants to know the average
interest of all deposits groups split by whether the deposit **has expired** or
**not**. But that’s not all. He wants you to select deposits with **start date
after 01/01/1985**. Order the data **descending** by Deposit Group and
**ascending** by Expiration Flag.

### Example:

| **deposit_group** | **is_deposit_expired** | **average_interest** |
|-------------------|------------------------|----------------------|
| Venomous Tongue   | 0                      | 16.698947            |
| …                 | …                      |                      |
<br/>

### Solution: <a title="11 Average Interest" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/80690b28052c402d6e5b8205012ddbce3dc2b59c/10%20DATA%20AGGREGATION%20-%20EXERCISE/homework.sql#L132">11 Average Interest</a>
    ###########################################################
    ## 11. Average Interest
    ###########################################################
    
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
---
10.12 Rich Wizard, Poor Wizard\*
--------------------------------

Give Mr. Bodrog some data to play his favorite game Rich Wizard, Poor Wizard.
The rules are simple: You compare the deposits of every wizard with the wizard
after him. If a wizard is the last one in the database, simply ignore it. At the
end you have to sum the difference between the deposits.

| host_wizard | host_wizard_deposit | guest_wizard | guest_wizard_deposit | difference |
|-------------|---------------------|--------------|----------------------|------------|
| Harry       | 10 000              | Tom          | 12 000               | \-2000     |
| Tom         | 12 000              | …            | …                    | …          |

At the end your query should return a single value: the **SUM** of all
differences.

### Example:

| **sum_difference** |
|--------------------|
| 44393.97           |
<br/>

### Solution: <a title="12 Rich Wizard, Poor Wizard\*" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/80690b28052c402d6e5b8205012ddbce3dc2b59c/10%20DATA%20AGGREGATION%20-%20EXERCISE/homework.sql#L148">12 Rich Wizard, Poor Wizard\*</a>
    ###########################################################
    ## 12. Rich Wizard, Poor Wizard *
    ###########################################################
    
    SELECT 
        SUM(`diff`.`next`) AS `sum_difference`
    FROM
        (SELECT 
            `deposit_amount` - (SELECT 
                        `deposit_amount`
                    FROM
                        `wizzard_deposits`
                    WHERE
                        `id` = `wd`.`id` + 1) AS `next`
        FROM
            `wizzard_deposits` AS `wd`) AS `diff`;
        
     -- -----------------------------------------------------
     -- other way to write it
     -- -----------------------------------------------------
     
     SELECT 
        SUM(asd.difference) AS `sum_difference`
    FROM
        (SELECT 
            wd1.first_name AS host_wizard,
                wd1.deposit_amount AS host_wizard_deposit,
                wd2.first_name AS guest_wizard,
                wd2.deposit_amount AS guest_wizard_deposit,
                (wd1.deposit_amount - wd2.deposit_amount) AS difference
        FROM
            wizzard_deposits AS wd1, wizzard_deposits AS wd2
        WHERE
            wd2.id - wd1.id = 1) AS asd;
---
10.13 Employees Minimum Salaries
--------------------------------

That’s it! You no longer work for Mr. Bodrog. You have decided to find a proper
job as an analyst in **SoftUni**.

It’s not a surprise that you will use the **soft_uni** database.

Select the minimum salary from the employees for departments with **ID (2,5,7)**
but only for those who are **hired after 01/01/2000**. Sort result by
**department_id** in **ascending** order.

Your query should return:

• **department_id**

### Example:

| **department_id** | **minimum_salary** |
|-------------------|--------------------|
| 2                 | 25000.00           |
| …                 | …                  |
<br/>

### Solution: <a title="13 Employees Minimum Salaries" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/80690b28052c402d6e5b8205012ddbce3dc2b59c/10%20DATA%20AGGREGATION%20-%20EXERCISE/homework.sql#L183">13 Employees Minimum Salaries</a>
    ###########################################################
    ## 13. Employees Minimum Salaries
    ###########################################################
    
    SELECT 
        `e`.`department_id`, MIN(`e`.`salary`) AS `minimum_salary`
    FROM
        `employees` AS `e`
    WHERE
        (`e`.`department_id` = 2
            OR `e`.`department_id` = 5
            OR `e`.`department_id` = 7)
            AND `hire_date` > '2000-01-01'
    GROUP BY `e`.`department_id`
    ORDER BY `e`.`department_id` ASC;
---
10.14 Employees Average Salaries
--------------------------------

Select all high paid employees who earn **more than 30000** into a new table.
Then **delete** all high paid employees who have **manager_id = 42** from the
new table; Then **increase** the salaries of all high paid employees with
**department_id =1 with 5000** in the new table. Finally, select the **average**
salaries in each department from the new table. Sort result by **department_id**
in **increasing** order.

### Example:

| **department_id** | **avg_salary** |
|-------------------|----------------|
| 1                 | 45166.6666     |
| …                 | …              |
<br/>

### Solution: <a title="14 Employees Average Salaries" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/80690b28052c402d6e5b8205012ddbce3dc2b59c/10%20DATA%20AGGREGATION%20-%20EXERCISE/homework.sql#L199">14 Employees Average Salaries</a>
    ###########################################################
    ## 14. Employees Average Salaries 
    ###########################################################
    
    ##SET SQL_SAFE_UPDATES=0;
    ##SET SQL_SAFE_UPDATES=1;
    
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
---
10.15 Employees Maximum Salaries
--------------------------------

Find the **max** salary for each department. Filter those which have max
salaries **not in the range 30000 and 70000**. Sort result by **department_id**
in **increasing** order.

### Example:

| **department_id** | **max_salary** |
|-------------------|----------------|
| 2                 | 29800.00       |
| …                 | …              |
<br/>

### Solution: <a title="15 Employees Maximum Salaries" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/80690b28052c402d6e5b8205012ddbce3dc2b59c/10%20DATA%20AGGREGATION%20-%20EXERCISE/homework.sql#L228">15 Employees Maximum Salaries</a>
    ###########################################################
    ## 15. Employees Maximum Salaries  
    ###########################################################
        
    SELECT 
        `e`.`department_id`, MAX(`e`.`salary`) AS `max_salary`
    FROM
        `employees` AS `e`
    GROUP BY `department_id`
    HAVING `max_salary` NOT BETWEEN 30000 AND 70000
    ORDER BY `department_id`; 
---
10.16 Employees Count Salaries
------------------------------

Count the salaries of all employees who **don’t have a manager**.
<br/>

### Solution: <a title="16 Employees Count Salaries" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/80690b28052c402d6e5b8205012ddbce3dc2b59c/10%20DATA%20AGGREGATION%20-%20EXERCISE/homework.sql#L240">16 Employees Count Salaries</a>
    ##########################################################
    ## 16. Employees Count Salaries
    ##########################################################
    
    SELECT 
        COUNT(`e`.`salary`) AS `count`
    FROM
        `employees` AS `e`
    WHERE
        `e`.`manager_id` IS NULL;
---
10.17 3rd Highest Salary\*
--------------------------

Find the **third highest salary** in each department if there is such. Sort
result by **department_id** in **increasing** order.

### Example:

| **department_id** | **third_highest_salary** |
|-------------------|--------------------------|
| 1                 | 36100.00                 |
| 2                 | 25000.00                 |
| …                 | …                        |
<br/>

### Solution: <a title="17 3rd Highest Salary\*" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/80690b28052c402d6e5b8205012ddbce3dc2b59c/10%20DATA%20AGGREGATION%20-%20EXERCISE/homework.sql#L251">17 3rd Highest Salary\*</a>
    ##########################################################
    ## 17. 3rd Highest Salary *
    ##########################################################
    
    SELECT 
        `emp`.`department_id`,
        MAX(`emp`.`salary`) AS `third_highest_salary`
    FROM
        `employees` AS `emp`
            JOIN
        (SELECT 
            `e`.`department_id` AS `department_id`,
                MAX(`e`.`salary`) AS `max_salary`
        FROM
            `employees` AS `e`
        JOIN (SELECT 
            `e`.`department_id` AS `department_id`,
                MAX(`e`.`salary`) AS `max_salary`
        FROM
            `employees` AS `e`
        GROUP BY `e`.`department_id`) AS `first_max_salary` ON `e`.`department_id` = `first_max_salary`.`department_id`
        WHERE
            `e`.`salary` < `first_max_salary`.`max_salary`
        GROUP BY `e`.`department_id`) AS `second_max_salary` ON `emp`.`department_id` = `second_max_salary`.`department_id`
    WHERE
        `emp`.`salary` < `second_max_salary`.`max_salary`
    GROUP BY `emp`.`department_id`
    ORDER BY `emp`.`department_id`;
---
10.18 Salary Challenge\*\*
--------------------------

Write a query that returns:

• **first_name**

• **last_name**

• **department_id**

for all employees who have salary **higher than the average salary** of their
respective departments. Select only the **first 10 rows**. Order by
**department_id**.

### Example:

| **first_name** | **last_name** | **department_id** |
|----------------|---------------|-------------------|
| Roberto        | Tamburello    | 1                 |
| Terri          | Duffy         | 1                 |
| Rob            | Walters       | 2                 |
| …              | …             | ...               |
<br/>

### Solution: <a title="18 Salary Challenge\*\*" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/80690b28052c402d6e5b8205012ddbce3dc2b59c/10%20DATA%20AGGREGATION%20-%20EXERCISE/homework.sql#L280">18 Salary Challenge\*\*</a>
    ##########################################################
    ## 18. Salary Challenge **
    ##########################################################
    
    SELECT 
        `e`.`first_name`, `e`.`last_name`, `e`.`department_id`
    FROM
        `employees` AS `e`,
        (SELECT 
            `e`.`department_id`, AVG(`e`.`salary`) AS `avg_salary`
        FROM
            `employees` AS `e`
        GROUP BY `e`.`department_id`) AS `avg_salary_by_dep`
    WHERE
        `e`.`department_id` = `avg_salary_by_dep`.`department_id`
            AND `e`.`salary` > `avg_salary_by_dep`.`avg_salary`
    ORDER BY `e`.`department_id` ASC
    LIMIT 10;

---
10.19 Departments Total Salaries
--------------------------------

Create a query which shows the **total sum of salaries** for each department.
Order by **department_id**.

Your query should return:

• **department_id**

### Example:

| **department_id** | **total_salary** |
|-------------------|------------------|
| 1                 | 241000.00        |
| …                 | …                |
<br/>

### Solution: <a title="19 Departments Total Salaries" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/80690b28052c402d6e5b8205012ddbce3dc2b59c/10%20DATA%20AGGREGATION%20-%20EXERCISE/homework.sql#L299">19 Departments Total Salaries</a>
    ###########################################################
    ## 19.	Departments Total Salaries  
    ###########################################################
    
    SELECT 
        `e`.`department_id`, SUM(`e`.`salary`)
    FROM
        `employees` AS `e`
    GROUP BY `e`.`department_id`
    ORDER BY `department_id`;
---