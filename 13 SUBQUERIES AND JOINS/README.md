13 Lab: Subqueries and JOINs
============================

---
---

This document defines the lab assignments for [“Databases Basics with MySQL
Course” at Software
University](https://softuni.bg/courses/databases-basics-mysql).

You will use the **soft_uni database** to write queries for the following
exercises.

---

13.01 Managers
--------------

Write a query to retrieve information about the **managers** – **id**,
**full_name**, **deparment_id** and **department_name**. Select the **first 5**
deparments ordered by **employee_id**. Submit your queries using the “**MySQL
prepare DB and Run Queries**” strategy.

### Example

| **employee_id** | **full_name**      | **department_id** | **deparment_name** |
|-----------------|--------------------|-------------------|--------------------|
| 3               | Roberto Tamburello | 10                | Finance            |
| 4               | Rob Walters        | 2                 | Tool Design        |
| …               | …                  | …                 | …                  |
<br/>

### Solution: <a title="01 Managers" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/4706f11deabb4a862432e031ab96821110be2b9a/13%20SUBQUERIES%20AND%20JOINS/lab_subqueries_and_joins.sql#L2">01 Managers</a>
    ######################################################
    ## 1. Managers
    ######################################################
    
    SELECT 
        `e`.`employee_id`,
        CONCAT_WS(' ', `e`.`first_name`, `e`.`last_name`) AS `full_name`,
        `d`.`department_id`,
        `d`.`name`
    FROM
        `employees` AS `e`
            RIGHT JOIN
        `departments` AS `d` ON `d`.`manager_id` = `e`.`employee_id`
    ORDER BY `e`.`employee_id`
    LIMIT 5;
---
13.02 Towns Adresses
--------------------

Write a query to get information about the **adresses** in the database, which
are in **San Francisco**, **Sofia** or **Carnation**. Retrieve **town_id**,
**town_name**, **address_text**. Order the result by **town_id**, then by
**address_id**. Submit your queries using the “**MySQL prepare DB and Run
Queries**” strategy.

### Example

| **town_id** | **town_name** | **address_text** |
|-------------|---------------|------------------|
| 9           | San Fransisco | 1234 Seaside Way |
| 9           | San Fransisco | 5725 Glaze Drive |
| 15          | Carnation     | 1411 Ranch Drive |
| …           | …             | …                |
<br/>

### Solution: <a title="02 Towns Adresses" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/4706f11deabb4a862432e031ab96821110be2b9a/13%20SUBQUERIES%20AND%20JOINS/lab_subqueries_and_joins.sql#L18">02 Towns Adresses</a>
    ######################################################
    ## 2. Towns and Addresses
    ######################################################
    
    SELECT 
        `t`.`town_id`, `t`.`name`, `a`.`address_text`
    FROM
        `addresses` AS `a`
            INNER JOIN
        `towns` AS `t` ON `a`.`town_id` = `t`.`town_id`
    WHERE
        `t`.name IN ('San Francisco' , 'Sofia', 'Carnation')
    ORDER BY `t`.`town_id` , `a`.`address_id`;
---
13.03 Employees Without Managers
--------------------------------

Write a query to get information about **employee_id**, **first_name**,
**last_name**, **department_id** and **salary** for all employees who **don’t
have** a manager. Submit your queries using the “**MySQL prepare DB and Run
Queries**” strategy.

### Example

| **employee_id** | **first_name** | **last_name** | **department_id** | **salary** |
|-----------------|----------------|---------------|-------------------|------------|
| 109             | Ken            | Sanchez       | 16                | 125 500    |
| 291             | Svetlin        | Nakov         | 6                 | 48 000     |
| 292             | Martin         | Kulov         | 6                 | 48 000     |
| 293             | George         | Denchev       | 6                 | 48 000     |
<br/>

### Solution: <a title="03 Employees Without Managers" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/4706f11deabb4a862432e031ab96821110be2b9a/13%20SUBQUERIES%20AND%20JOINS/lab_subqueries_and_joins.sql#L32">03 Employees Without Managers</a>
    ######################################################
    ## 3. Employees Without Managers
    ######################################################
    
    SELECT 
        `e`.`employee_id`,
        `e`.`first_name`,
        `e`.`last_name`,
        `e`.`department_id`,
        `e`.`salary`
    FROM
        `employees` AS `e`
    WHERE
        `e`.`manager_id` IS NULL
    ORDER BY `e`.`employee_id`;
---
13.04 Higher Salary
-------------------

Write a query to count the number of employees who receive **salary** higher
than the **average**. Submit your queries using the “**MySQL prepare DB and Run
Queries**” strategy.

### Example

| **count** |
|-----------|
| 88        |
<br/>

### Solution: <a title="04 Higher Salary" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/4706f11deabb4a862432e031ab96821110be2b9a/13%20SUBQUERIES%20AND%20JOINS/lab_subqueries_and_joins.sql#L48">04 Higher Salary</a>
    ######################################################
    ## 4. High Salary
    ######################################################
    
    SELECT 
        COUNT(`e`.`employee_id`) AS `count`
    FROM
        `employees` AS `e`
    WHERE
        `e`.`salary` > (SELECT 
                AVG(`salary`) AS `average_salary`
            FROM
                `employees`);
---