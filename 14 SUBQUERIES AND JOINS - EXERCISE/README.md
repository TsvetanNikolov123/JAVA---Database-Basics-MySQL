14 Exercises: Subqueries and JOINs
==================================

---
---

This document defines the **exercise assignments** for the ["Databases Basics -
MySQL" course \@ Software
University.](https://softuni.bg/trainings/2132/database-basics-mysql-september-2018/internal)

For problems from 1 to 11 (inclusively) use "**soft_uni**" database and for the
others – "**geography**".

---

14.01 Employee Address
----------------------

Write a query that selects:

-   employee_id

-   job_title

-   address_id

-   address_text

Return the first 5 rows sorted by **address_id in ascending order.**

### Example:

| **employee_id** | **job_title**           | **address_id** | **address_text**   |
|-----------------|-------------------------|----------------|--------------------|
| 142             | Production Technician   | 1              | 108 Lakeside Court |
| 30              | Human Resources Manager | 2              | 1341 Prospect St   |
| …               | …                       | …              | …                  |
<br/>

### Solution: <a title="01 Employee Address" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/98705bfc0fcf41733469f9186f55e6c5fdab5818/14%20SUBQUERIES%20AND%20JOINS%20-%20EXERCISE/homework_subqueries_and_joins.sql#L2">01 Employee Address</a>
    ######################################################
    ## 01.	Employee Address 
    ######################################################
    
    SELECT 
        `e`.`employee_id`,
        `e`.`job_title`,
        `e`.`address_id`,
        `a`.`address_text`
    FROM
        `employees` AS `e`
            JOIN
        `addresses` AS `a` ON `e`.`address_id` = `a`.`address_id`
    ORDER BY `a`.`address_id` ASC
    LIMIT 5;
---
14.02 Addresses with Towns
--------------------------

Write a query that selects:

-   first_name

-   last_name

-   town

-   address_text

Sort the result by **first_name in ascending order** then by **last_name**.
Select first 5 employees.

### Example:

| **first_name** | **last_name** | **town**      | **address_text**   |
|----------------|---------------|---------------|--------------------|
| A.Scott        | Wright        | Newport Hills | 1400 Gate Drive    |
| Alan           | Brewer        | Kenmore       | 8192 Seagull Court |
| …              | …             | …             | …                  |
<br/>

### Solution: <a title="02 Addresses with Towns" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/98705bfc0fcf41733469f9186f55e6c5fdab5818/14%20SUBQUERIES%20AND%20JOINS%20-%20EXERCISE/homework_subqueries_and_joins.sql#L18">02 Addresses with Towns</a>
    ######################################################
    ## 02.	Addresses with Towns
    ######################################################
    
    SELECT 
        `e`.`first_name`,
        `e`.`last_name`,
        `t`.`name`,
        `a`.`address_text`
    FROM
        `employees` AS `e`
            INNER JOIN
        `addresses` AS `a` ON `e`.`address_id` = `a`.`address_id`
            INNER JOIN
        `towns` AS `t` ON `a`.`town_id` = `t`.`town_id`
    ORDER BY `e`.`first_name` , `e`.`last_name`
    LIMIT 5;
---
14.03 Sales Employee
--------------------

Write a query that selects:

-   employee_id

-   first_name

-   last_name

-   department_name

Sort the result by **employee_id in descending order**. Select only
**employees** from the “**Sales**” department.

### Example:

| **employee_id** | **first_name** | **last_name** | **department_name** |
|-----------------|----------------|---------------|---------------------|
| 290             | Lynn           | Tsoflias      | Sales               |
| 289             | Rachel         | Valdez        | Sales               |
| …               | …              | …             | …                   |
<br/>

### Solution: <a title="03 Sales Employee" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/98705bfc0fcf41733469f9186f55e6c5fdab5818/14%20SUBQUERIES%20AND%20JOINS%20-%20EXERCISE/homework_subqueries_and_joins.sql#L36">03 Sales Employee</a>
    ######################################################
    ## 03.	Sales Employee 
    ######################################################
    
    SELECT 
        `e`.`employee_id`,
        `e`.`first_name`,
        `e`.`last_name`,
        `d`.`name`
    FROM
        `employees` AS `e`
            INNER JOIN
        `departments` AS `d` ON `e`.`department_id` = `d`.`department_id`
    WHERE
        `d`.`name` LIKE ('Sales')
    ORDER BY `e`.`employee_id` DESC;
---
14.04 Employee Departments
--------------------------

Write a query that selects:

-   employee_id

-   first_name

-   salary

-   department_name

Filter only **employees** with **salary** higher than 15000. Return the first 5
rows sorted by **department_id in descending order.**

### Example:

| **employee_id** | **first_name** | **salary** | **department_name** |
|-----------------|----------------|------------|---------------------|
| 109             | Ken            | 125500.00  | Executive           |
| 140             | Laura          | 60100.00   | Executive           |
| …               | …              | …          | …                   |
<br/>

### Solution: <a title="04 Employee Departments" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/98705bfc0fcf41733469f9186f55e6c5fdab5818/14%20SUBQUERIES%20AND%20JOINS%20-%20EXERCISE/homework_subqueries_and_joins.sql#L54">04 Employee Departments</a>
    ######################################################
    ## 04.	Employee Departments 
    ######################################################
    
    SELECT 
        `e`.`employee_id`,
        `e`.`first_name`,
        `e`.`salary`,
        `d`.`name`
    FROM
        `employees` AS `e`
            RIGHT JOIN
        `departments` AS `d` ON `e`.`department_id` = `d`.`department_id`
    WHERE
        `e`.`salary` > 15000
    ORDER BY `d`.`department_id` DESC
    LIMIT 5;
---
14.05 Employees Without Project
-------------------------------

Write a query that selects:

-   employee_id

-   first_name

Filter only **employees** without a project. Return the first 3 rows sorted by
**employee_id in descending order.**

### Example:

| **employee_id** | **first_name** |
|-----------------|----------------|
| 293             | George         |
| 292             | Martin         |
| …               | …              |
<br/>

### Solution: <a title="05 Employees Without Project" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/98705bfc0fcf41733469f9186f55e6c5fdab5818/14%20SUBQUERIES%20AND%20JOINS%20-%20EXERCISE/homework_subqueries_and_joins.sql#L72">05 Employees Without Project</a>
    ######################################################
    ## 05.	Employees Without Project 
    ######################################################
    
    SELECT 
        `e`.`employee_id`, `e`.`first_name`
    FROM
        `employees` AS `e`
            LEFT JOIN
        `employees_projects` AS `ep` ON `ep`.`employee_id` = `e`.`employee_id`
    WHERE
        `ep`.`employee_id` IS NULL
    ORDER BY `e`.`employee_id` DESC
    LIMIT 3;
---
14.06 Employees Hired After
---------------------------

Write a query that selects:

-   first_name

-   last_name

-   hire_date

-   dept_name

Filter only **employees** hired after 1/1/1999 and from either the **"Sales"**
or the **"Finance" departments**. Sort the result by **hire_date (ascending).**

### Example:

| **first_name** | **last_name** | **hire_date**       | **dept_name** |
|----------------|---------------|---------------------|---------------|
| Debora         | Poe           | 2001-01-19 00:00:00 | Finance       |
| Wendy          | Kahn          | 2001-01-26 00:00:00 | Finance       |
| …              | …             | …                   | …             |
<br/>

### Solution: <a title="06 Employees Hired After" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/98705bfc0fcf41733469f9186f55e6c5fdab5818/14%20SUBQUERIES%20AND%20JOINS%20-%20EXERCISE/homework_subqueries_and_joins.sql#L87">06 Employees Hired After</a>
    ######################################################
    ## 06.	Employees Hired After 
    ######################################################
    
    SELECT 
        `e`.`first_name`,
        `e`.`last_name`,
        `e`.`hire_date`,
        `d`.`name` AS `dept_name`
    FROM
        `employees` AS `e`
            JOIN
        `departments` AS `d` ON `e`.`department_id` = `d`.`department_id`
    WHERE
        DATE(`e`.`hire_date`) > '1999-01-01'
            AND `d`.`name` IN ('Sales' , 'Finance')
    ORDER BY `e`.`hire_date` ASC;
---
14.07 Employees with Project
--------------------------

Write a query that selects:

-   employee_id

-   first_name

-   project_name

Filter only **employees** with a project, which has started after **13.08.2002**
and it is still **ongoing** (no end date). Return the first 5 rows sorted by
**first_name then by project_name both in ascending order.**

### Example

| **employee_id** | **first_name** | **project_name**      |
|-----------------|----------------|-----------------------|
| 44              | A. Scott       | Hitch Rack - 4-Bike   |
| 170             | Alan           | LL Touring Handlebars |
| …               | …              | …                     |
<br/>

### Solution: <a title="07 Employees with Project" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/98705bfc0fcf41733469f9186f55e6c5fdab5818/14%20SUBQUERIES%20AND%20JOINS%20-%20EXERCISE/homework_subqueries_and_joins.sql#L105">07 Employees with Project</a>
    ######################################################
    ## 07.	Employees with Project 
    ######################################################
    
    SELECT 
        `e`.`employee_id`, `e`.`first_name`, `p`.`name`
    FROM
        `employees` AS `e`
            JOIN
        `employees_projects` AS `ep` ON `ep`.`employee_id` = `e`.`employee_id`
            JOIN
        `projects` AS `p` ON `ep`.`project_id` = `p`.`project_id`
    WHERE
        DATE(`p`.`start_date`) > '2002-08-13'
            AND DATE(`p`.`end_date`) IS NULL
    ORDER BY `e`.`first_name` ASC , `p`.`name` ASC
    LIMIT 5;
---
14.08 Employee 24
-----------------

Write a query that selects:

-   employee_id

-   first_name

-   project_name

Filter all the **projects** of employees with **id 24**. If the project has
started after **2005 inclusively** the return value should be **NULL**. Sort the
result by **project_name alphabetically.**

### Example

| **employee_id** | **first_name** | **project_name** |
|-----------------|----------------|------------------|
| 24              | David          | NULL             |
| 24              | David          | NULL             |
| …               | …              | …                |
<br/>

### Solution: <a title="08 Employee 24" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/98705bfc0fcf41733469f9186f55e6c5fdab5818/14%20SUBQUERIES%20AND%20JOINS%20-%20EXERCISE/homework_subqueries_and_joins.sql#L123">08 Employee 24</a>
    ######################################################
    ## 08.	Employee 24 
    ######################################################
    
    UPDATE `projects` AS `p` 
    SET 
        `p`.name = ''
    WHERE
        YEAR(`p`.`start_date`) >= 2005;
    
    
    SELECT 
        `e`.`employee_id`, `e`.`first_name`, `p`.`name`
    FROM
        `employees` AS `e`
            JOIN
        `employees_projects` AS `ep` ON `ep`.`employee_id` = `e`.`employee_id`
            JOIN
        `projects` AS `p` ON `ep`.`project_id` = `p`.`project_id`
    WHERE
        `e`.`employee_id` = 24
    ORDER BY `p`.`name`;
---
14.09 Employee Manager
----------------------

Write a query that selects:

-   employee_id

-   first_name

-   manager_id

-   manager_name

Filter all **employees** with a manager who has **id equal to 3 or 7**. Return
all rows sorted by **employee first_name in ascending order.**

### Example

| **employee_id** | **first_name** | **manager_id** | **manager_name** |
|-----------------|----------------|----------------|------------------|
| 122             | Bryan          | 7              | JoLynn           |
| 158             | Dylan          | 3              | Roberto          |
| …               | …              | …              | …                |
<br/>

### Solution: <a title="09 Employee Manager" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/98705bfc0fcf41733469f9186f55e6c5fdab5818/14%20SUBQUERIES%20AND%20JOINS%20-%20EXERCISE/homework_subqueries_and_joins.sql#L146">09 Employee Manager</a>
    ######################################################
    ## 09.	Employee Manager 
    ######################################################
    
    SELECT 
        `e1`.`employee_id`,
        `e1`.`first_name`,
        `e2`.`employee_id`,
        `e2`.`first_name` AS `manager_name`
    FROM
        `employees` AS `e1`
            JOIN
        `employees` AS `e2` ON `e1`.`manager_id` = `e2`.`employee_id`
    WHERE
        `e1`.`manager_id` IN (3 , 7)
    ORDER BY `e1`.`first_name` ASC;
---
14.10 Employee Summary
----------------------

Write a query that selects:

-   employee_id

-   employee_name

-   manager_name

-   department_name

Show the first 5 **employees** (only for employees who have a manager) with
their **managers** and the **departments** they are in (show the departments of
the **employees**). Order by **employee_id.**

### Example

| **employee_id** | **employee_name** | **manager_name** | **department_name** |
|-----------------|-------------------|------------------|---------------------|
| 1               | Guy Gilbert       | Jo Brown         | Production          |
| 2               | Kevin Brown       | David Bradley    | Marketing           |
| …               | …                 | …                | …                   |
<br/>

### Solution: <a title="10 Employee Summary" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/98705bfc0fcf41733469f9186f55e6c5fdab5818/14%20SUBQUERIES%20AND%20JOINS%20-%20EXERCISE/homework_subqueries_and_joins.sql#L163">10 Employee Summary</a>
    ######################################################
    ## 10.	Employee Summary  
    ######################################################
    
    SELECT 
        `e1`.`employee_id`,
        CONCAT(`e1`.`first_name`, ' ', `e1`.`last_name`) AS `employee_name`,
        CONCAT(`e2`.`first_name`, ' ', `e2`.`last_name`) AS `manager_name`,
        `d`.`name` AS `department_name`
    FROM
        `employees` AS `e1`
            JOIN
        `employees` AS `e2` ON `e1`.`manager_id` = `e2`.`employee_id`
            JOIN
        `departments` AS `d` ON `e1`.`department_id` = `d`.`department_id`
    ORDER BY `e1`.`employee_id`
    LIMIT 5;
---
14.11 Min Average Salary
------------------------

Write a query that returns the value of the **lowest average salary** of all
**departments**.

### Example:

| **min_average_salary** |
|------------------------|
| 10866.6666             |
<br/>

### Solution: <a title="11 Min Average Salary" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/98705bfc0fcf41733469f9186f55e6c5fdab5818/14%20SUBQUERIES%20AND%20JOINS%20-%20EXERCISE/homework_subqueries_and_joins.sql#L181">11 Min Average Salary</a>
    ######################################################
    ## 11.	Min Average Salary  
    ######################################################
    
    SELECT 
        AVG(`e`.`salary`)
    FROM
        `employees` AS `e`
    GROUP BY `e`.`department_id`
    ORDER BY AVG(`e`.`salary`)
    LIMIT 1;
---
14.12 Highest Peaks in Bulgaria
-------------------------------

Write a query that selects:

-   country_code

-   mountain_range

-   peak_name

-   elevation

Filter all **peaks** in **Bulgaria** with **elevation** over **2835**. Return
all rows sorted by **elevation in descending order.**

### Example

| **country_code** | **mountain_range** | **peak_name** | **elevation** |
|------------------|--------------------|---------------|---------------|
| BG               | Rila               | Musala        | 2925          |
| BG               | Pirin              | Vihren        | 2914          |
| …                | …                  | …             | …             |
<br/>

### Solution: <a title="12 Highest Peaks in Bulgaria" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/98705bfc0fcf41733469f9186f55e6c5fdab5818/14%20SUBQUERIES%20AND%20JOINS%20-%20EXERCISE/homework_subqueries_and_joins.sql#L193">12 Highest Peaks in Bulgaria</a>
    ######################################################
    ## 12.	Highest Peaks in Bulgaria  
    ######################################################
    
    SELECT 
        `c`.`country_code`,
        `m`.`mountain_range`,
        `p`.`peak_name`,
        `p`.`elevation`
    FROM
        `countries` AS `c`
            JOIN
        `mountains_countries` AS `mc` ON `c`.`country_code` = `mc`.`country_code`
            JOIN
        `mountains` AS `m` ON `mc`.`mountain_id` = `m`.`id`
            JOIN
        `peaks` AS `p` ON `m`.`id` = `p`.`mountain_id`
    WHERE
        `c`.`country_name` LIKE 'Bulgaria'
            AND `p`.`elevation` > 2835
    ORDER BY `p`.`elevation` DESC;
---
14.13 Count Mountain Ranges
---------------------------

Write a query that selects:

-   country_code

-   mountain_range

Filter the **count** of the **mountain ranges** in the **United States, Russia
and Bulgaria.** Sort result by **mountain_range count** in **decreasing order**.

### Example

| **country_code** | **mountain_range** |
|------------------|--------------------|
| BG               | 6                  |
| RU               | 1                  |
| …                | …                  |
<br/>

### Solution: <a title="13 Count Mountain Ranges" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/98705bfc0fcf41733469f9186f55e6c5fdab5818/14%20SUBQUERIES%20AND%20JOINS%20-%20EXERCISE/homework_subqueries_and_joins.sql#L215">13 Count Mountain Ranges</a>
    ######################################################
    ## 13.	Count Mountain Ranges 
    ######################################################
    
    SELECT 
        `c`.`country_code`,
        COUNT(`m`.`mountain_range`) AS `mountain_range`
    FROM
        `countries` AS `c`
            JOIN
        `mountains_countries` AS `mc` ON `c`.`country_code` = `mc`.`country_code`
            JOIN
        `mountains` AS `m` ON `mc`.`mountain_id` = `m`.`id`
    WHERE
        `c`.`country_name` IN ('United States' , 'Russia', 'Bulgaria')
    GROUP BY `c`.`country_code`
    ORDER BY `mountain_range` DESC;
---
14.14 Countries with Rivers
---------------------------

Write a query that selects:

-   country_name

-   river_name

Find the first 5 **countries** with or without **rivers** in **Africa**. Sort
them by **country_name in ascending order.**

### Example

| **country_name** | **river_name** |
|------------------|----------------|
| Algeria          | Niger          |
| Angola           | Congo          |
| Benin            | Niger          |
| Botswana         | NULL           |
| Burkina Faso     | Niger          |
<br/>

### Solution: <a title="14 Countries with Rivers" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/98705bfc0fcf41733469f9186f55e6c5fdab5818/14%20SUBQUERIES%20AND%20JOINS%20-%20EXERCISE/homework_subqueries_and_joins.sql#L233">14 Countries with Rivers</a>
    ######################################################
    ## 14.	Countries with Rivers 
    ######################################################
    
    SELECT 
        `country_name`, `river_name`
    FROM
        `countries` AS `c`
            LEFT JOIN
        `countries_rivers` AS `cr` ON `c`.`country_code` = `cr`.`country_code`
            LEFT JOIN
        `rivers` AS `r` ON `cr`.`river_id` = `r`.`id`
            LEFT JOIN
        `continents` AS `con` ON `c`.`continent_code` = `con`.`continent_code`
    WHERE
        `con`.`continent_name` LIKE ('Africa')
    ORDER BY `c`.`country_name`
    LIMIT 5;
---
14.15 \*Continents and Currencies
---------------------------------

Write a query that selects:

-   **continent_code**

-   **currency_code**

-   **currency_usage**

Find all **continents** and their most used **currency**. Filter any
**currency** that is used in only one **country**. Sort the result by
**continent_code and currency_code.**

### Example

| **continent_code** | **currency_code** | **currency_usage** |
|--------------------|-------------------|--------------------|
| AF                 | XOF               | 8                  |
| AS                 | AUD               | 2                  |
| AS                 | ILS               | 2                  |
| EU                 | EUR               | 26                 |
| NA                 | XCD               | 8                  |
| OC                 | USD               | 8                  |
<br/>

### Solution: <a title="15 \*Continents and Currencies" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/98705bfc0fcf41733469f9186f55e6c5fdab5818/14%20SUBQUERIES%20AND%20JOINS%20-%20EXERCISE/homework_subqueries_and_joins.sql#L252">15 \*Continents and Currencies</a>
    ######################################################
    ## 15.	*Continents and Currencies 
    ######################################################
    
    SELECT 
        `c`.`continent_code`,
        `c`.`currency_code`,
        COUNT(*) AS `currency_usage`
    FROM
        `countries` AS `c`
    GROUP BY `c`.`continent_code` , `c`.`currency_code`
    HAVING `currency_usage` > 1
        AND `currency_usage` = (SELECT 
            COUNT(*) AS `cn`
        FROM
            `countries` AS `c2`
        WHERE
            `c2`.`continent_code` = `c`.`continent_code`
        GROUP BY `c2`.`currency_code`
        ORDER BY `cn` DESC
        LIMIT 1)
    ORDER BY `c`.`continent_code` , `c`.`continent_code`;

---
14.16 Countries without any Mountains
-------------------------------------

Find the count of all **countries** which don’t have a **mountain**.

### Example

| **country_count** |
|-------------------|
| 231               |
<br/>

### Solution: <a title="16 Countries without any Mountains" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/98705bfc0fcf41733469f9186f55e6c5fdab5818/14%20SUBQUERIES%20AND%20JOINS%20-%20EXERCISE/homework_subqueries_and_joins.sql#L275">16 Countries without any Mountains</a>
    ######################################################
    ## 16.	Countries without any Mountains
    ######################################################
    
    SELECT 
        COUNT(*) AS `country_count`
    FROM
        `countries` AS `c`
            LEFT JOIN
        `mountains_countries` AS `mc` ON `c`.`country_code` = `mc`.`country_code`
    WHERE
        `mc`.`mountain_id` IS NULL;
        
---
14.17 Highest Peak and Longest River by Country
-----------------------------------------------

For each **country**, find the **elevation** of **the highest peak** and **the
length of the longest river**, sorted by the highest **peak_elevation (from
highest to lowest),** then by the **longest river_length (from longest to
smallest),** then by **country_name (alphabetically).** Display **NULL** when no
data is available in some of the columns. Limit only the **first 5 rows**.

### Example

| **country_name** | **highest_peak_elevation** | **longest_river_length** |
|------------------|----------------------------|--------------------------|
| China            | 8848                       | 6300                     |
| India            | 8848                       | 3180                     |
| Nepal            | 8848                       | 2948                     |
| Pakistan         | 8611                       | 3180                     |
| Argentina        | 6962                       | 4880                     |
<br/>

### Solution: <a title="17 Highest Peak and Longest River by Country" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/98705bfc0fcf41733469f9186f55e6c5fdab5818/14%20SUBQUERIES%20AND%20JOINS%20-%20EXERCISE/homework_subqueries_and_joins.sql#L288">17 Highest Peak and Longest River by Country</a>
    ######################################################
    ## 17.	Highest Peak and Longest River by Country
    ######################################################
    
    SELECT 
        `c`.`country_name`,
        MAX(`p`.`elevation`) AS `highest_peak_elevation`,
        MAX(`r`.`length`) AS `longest_river_length`
    FROM
        `countries` AS `c`
            LEFT JOIN
        `countries_rivers` AS `cr` ON `c`.`country_code` = `cr`.`country_code`
            LEFT JOIN
        `rivers` AS `r` ON `cr`.`river_id` = `r`.`id`
            LEFT JOIN
        `mountains_countries` AS `mc` ON `c`.`country_code` = `mc`.`country_code`
            LEFT JOIN
        `mountains` AS `m` ON `mc`.`mountain_id` = `m`.`id`
            LEFT JOIN
        `peaks` AS `p` ON `m`.`id` = `p`.`mountain_id`
    GROUP BY `c`.`country_name`
    ORDER BY `p`.`elevation` DESC , `r`.`length` DESC , `c`.`country_name` ASC
    LIMIT 5;
---