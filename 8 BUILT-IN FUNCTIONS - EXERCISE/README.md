08 Exercises: Built-in Functions
================================

---
---

This document defines the **exercise assignments** for the ["Databases Basics -
MySQL" course \@ Software
University.](https://softuni.bg/courses/databases-basics-mysql)

---

Part I – Queries for SoftUni Database
=====================================

08.01 Find Names of All Employees by First Name
-----------------------------------------------

Write a SQL query to find **first** and **last names** of all employees whose
**first name starts with “Sa” (case insensitively). Order the information by
id.** Submit your query statements as **Prepare DB & run queries.**

### Example

| **first_name** | **last_name**     |
|----------------|-------------------|
| Sariya         | Harnpadoungsataya |
| Sandra         | Reategui Alayo    |
| …              | …                 |
<br/>

### Solution: <a title="01 Find Names of All Employees by First Name" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/2154de797375c61537f92c5b1e63d5404b25b51c/8%20BUILT-IN%20FUNCTIONS%20-%20EXERCISE/homework.sql#L2">01 Find Names of All Employees by First Name</a>
    -- -----------------------------------------------
    -- 01. Find Names of All Employees by First Name
    -- -----------------------------------------------
    
    SELECT 
        first_name, last_name
    FROM
        employees
    WHERE
        first_name LIKE 'Sa%'
    ORDER BY employee_id;

---
08.02 Find Names of All employees by Last Name 
----------------------------------------------

Write a SQL query to find **first** and **last names** of all employees whose
**last name contains “ei” (case insensitively). Order the information by id**.
Submit your query statements as **Prepare DB & run queries.**

### Example

| **first_name** | **last_name** |
|----------------|---------------|
| Kendall        | Keil          |
| Christian      | Kleinerman    |
| …              | …             |
<br/>

### Solution: <a title="02 Find Names of All employees by Last Name" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/2154de797375c61537f92c5b1e63d5404b25b51c/8%20BUILT-IN%20FUNCTIONS%20-%20EXERCISE/homework.sql#L14">02 Find Names of All employees by Last Name</a>
    -- -----------------------------------------------
    -- 02. Find Names of All Employees by Last Name 
    -- -----------------------------------------------
    
    SELECT 
        first_name, last_name
    FROM
        employees
    WHERE
        last_name LIKE '%ei%'
    ORDER BY employee_id;
---
08.03 Find First Names of All Employees
---------------------------------------

Write a SQL query to find the **first names** of all employees in the
**departments** with **ID 3 or 10** and whose **hire year** is **between 1995
and 2005 inclusively**. **Order the information by id**. Submit your query
statements as **Prepare DB & run queries.**

### Example

| **first_name** |
|----------------|
| Deborah        |
| Wendey         |
| Candy          |
| …              |
<br/>

### Solution: <a title="03 Find First Names of All Employees" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/2154de797375c61537f92c5b1e63d5404b25b51c/8%20BUILT-IN%20FUNCTIONS%20-%20EXERCISE/homework.sql#L26">03 Find First Names of All Employees</a>
    -- -----------------------------------------------
    -- 03. Find First Names of All Employess 
    -- -----------------------------------------------
    
    SELECT 
        first_name
    FROM
        employees
    WHERE
        (department_id = 3 OR department_id = 10)
            AND YEAR(hire_date) BETWEEN 1995 AND 2005
    ORDER BY employee_id; 
---
08.04 Find All Employees Except Engineers
-----------------------------------------

Write a SQL query to find the **first** and **last names** of all employees
whose **job titles does not contain** “**engineer**”. **Order the information by
id**. Submit your query statements as **Prepare DB & run queries.**

### Example

| **first_name** | **last_name** |
|----------------|---------------|
| Guy            | Gilbert       |
| Kevin          | Brown         |
| Rob            | Walters       |
| …              | …             |
<br/>

### Solution: <a title="04 Find All Employees Except Engineers" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/2154de797375c61537f92c5b1e63d5404b25b51c/8%20BUILT-IN%20FUNCTIONS%20-%20EXERCISE/homework.sql#L39">04 Find All Employees Except Engineers</a>
    -- -----------------------------------------------
    -- 04. Find All Employees Except Engineers 
    -- -----------------------------------------------
    
    SELECT 
        e.first_name, e.last_name
    FROM
        employees AS e
    WHERE
        job_title NOT LIKE '%engineer%'
    ORDER BY employee_id;
---
08.05 Find Towns with Name Length
---------------------------------

Write a SQL query to find **town names** that are **5** or **6 symbols long**
and **order** them **alphabetically by town name**. Submit your query statements
as **Prepare DB & run queries.**

### Example

| **name** |
|----------|
| Berlin   |
| Duluth   |
| Duvall   |
| …        |
<br/>

### Solution: <a title="05 Find Towns with Name Length" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/2154de797375c61537f92c5b1e63d5404b25b51c/8%20BUILT-IN%20FUNCTIONS%20-%20EXERCISE/homework.sql#L51">05 Find Towns with Name Length</a>
    -- -----------------------------------------------
    -- 05. Find Towns with Name Length 
    -- -----------------------------------------------
    
    SELECT 
        name
    FROM
        towns
    WHERE
        CHAR_LENGTH(name) = 5
            OR CHAR_LENGTH(name) = 6
    ORDER BY name ASC;
---
08.06 Find Towns Starting With
------------------------------

Write a SQL query to find all towns that **start with** letters **M**, **K**,
**B** or **E (case insensitively).** Order them **alphabetically** by **town
name**. Submit your query statements as **Prepare DB & run queries.**

### Example

| **town_id** | **name** |
|-------------|----------|
| 5           | Bellevue |
| 31          | Berlin   |
| 30          | Bordeaux |
| …           | …        |
<br/>

### Solution: <a title="06 Find Towns Starting With" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/2154de797375c61537f92c5b1e63d5404b25b51c/8%20BUILT-IN%20FUNCTIONS%20-%20EXERCISE/homework.sql#L64">06 Find Towns Starting With</a>
    -- -----------------------------------------------
    -- 06. Find Towns Starting With 
    -- -----------------------------------------------
    
    SELECT 
        town_id, name
    FROM
        towns
    WHERE
        name LIKE 'M%' OR name LIKE 'K%'
            OR name LIKE 'B%'
            OR name LIKE 'E%'
    ORDER BY name ASC;
---
08.07 Find Towns Not Starting With
----------------------------------

Write a SQL query to find all towns that **do not start with** letters **R**,
**B** or **D (case insensitively).** Order them **alphabetically** by name.
Submit your query statements as **Prepare DB & run queries.**

### Example

| **town_id** | **name**  |
|-------------|-----------|
| 2           | Calgary   |
| 23          | Cambridge |
| 15          | Carnation |
| …           | …         |
<br/>

### Solution: <a title="07 Find Towns Not Starting With" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/2154de797375c61537f92c5b1e63d5404b25b51c/8%20BUILT-IN%20FUNCTIONS%20-%20EXERCISE/homework.sql#L78">07 Find Towns Not Starting With</a>
    -- -----------------------------------------------
    -- 07. Find Towns Not Starting With
    -- -----------------------------------------------
    
    SELECT 
        town_id, name
    FROM
        towns
    WHERE
        name NOT LIKE 'R%'
            AND name NOT LIKE 'B%'
            AND name NOT LIKE 'D%'
    ORDER BY name ASC;
---
08.08 Create View Employees Hired After 2000 Year
-------------------------------------------------

Write a SQL query to create view **v_employees_hired_after_2000** with **the
first and the last name** of all employees **hired after 2000 year.** Submit
your query statements as **Run skeleton, run queries & check DB.**

### Example

| **first_name** | **last_name** |
|----------------|---------------|
| Steven         | Selikoff      |
| Peter          | Krebs         |
| Stuart         | Munson        |
| ...            | ...           |
<br/>

### Solution: <a title="08 Create View Employees Hired After 2000 Year" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/2154de797375c61537f92c5b1e63d5404b25b51c/8%20BUILT-IN%20FUNCTIONS%20-%20EXERCISE/homework.sql#L92">08 Create View Employees Hired After 2000 Year</a>
    -- -----------------------------------------------
    -- 08. Create View Employees Hired After
    -- -----------------------------------------------
    
    CREATE VIEW  v_employees_hired_after_2000 AS
        SELECT 
            first_name, last_name
        FROM
            employees
        WHERE
            YEAR(hire_date) > 2000;
            
    SELECT * FROM  v_employees_hired_after_2000;
---
08.09 Length of Last Name
-------------------------

Write a SQL query to find the names of all employees whose last name is
**exactly 5 characters long.**

### Example

| **first_name** | **last_name** |
|----------------|---------------|
| Kevin          | Brown         |
| Terri          | Duffy         |
| Jo             | Brown         |
| Diane          | Glimp         |
| …              | …             |
<br/>

### Solution: <a title="09 Length of Last Name" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/2154de797375c61537f92c5b1e63d5404b25b51c/8%20BUILT-IN%20FUNCTIONS%20-%20EXERCISE/homework.sql#L106">09 Length of Last Name</a>
    -- -----------------------------------------------
    -- 09. Length of Last Name
    -- -----------------------------------------------
    
    SELECT 
        first_name, last_name
    FROM
        employees
    WHERE
        CHAR_LENGTH(last_name) = 5;
---
Part II – Queries for Geography Database 
=========================================

08.10 Countries Holding ‘A’ 3 or More Times
-------------------------------------------

Find all countries that hold the **letter 'A'** in their name **at least 3 times
(case insensitively), sorted by ISO code**. **Display** the **country name** and
the **ISO code**. Submit your query statements as **Prepare DB & run queries.**

### Example

| **country_name** | **iso_code** |
|------------------|--------------|
| Afghanistan      | AFG          |
| Albania          | ALB          |
| …                | …            |
<br/>

### Solution: <a title="10 Countries Holding ‘A’ 3 or More Times" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/2154de797375c61537f92c5b1e63d5404b25b51c/8%20BUILT-IN%20FUNCTIONS%20-%20EXERCISE/homework.sql#L117">10 Countries Holding ‘A’ 3 or More Times</a>
    -- -----------------------------------------------
    -- 10. Countries Holding 'A' 
    -- -----------------------------------------------
    
    SELECT 
        country_name, iso_code
    FROM
        countries
    WHERE
        country_name LIKE '%a%a%a%'
    ORDER BY iso_code ASC; 
---
08.11 Mix of Peak and River Names
---------------------------------

**Combine all peak names with all river names**, so that the last letter of each
peak name is the same as the first letter of its corresponding river name**.
Display** the **peak name**, the **river name**, and the **obtained mix**.
**Sort the results by the obtained mix alphabetically**. Submit your query
statements as **Prepare DB & run queries.**

### Example

| **peak_name**  | **river_name** | **mix**           |
|----------------|----------------|-------------------|
| Aconcagua      | Amazon         | aconcaguamazon    |
| Aconcagua      | Amur           | aconcaguamur      |
| Banski Suhodol | Lena           | banski suhodolena |
| …              | …              | …                 |
<br/>

### Solution: <a title="11 Mix of Peak and River Names" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/2154de797375c61537f92c5b1e63d5404b25b51c/8%20BUILT-IN%20FUNCTIONS%20-%20EXERCISE/homework.sql#L129">11 Mix of Peak and River Names</a>
    -- -----------------------------------------------
    -- 11. Mix of Peak and River Names
    -- -----------------------------------------------
    /*
    SELECT 
        peak_name,
        river_name,
        LOWER(CONCAT(peak_name, SUBSTRING(river_name, 2))) AS 'mix'
    FROM
        peaks,
        rivers
    WHERE
        SUBSTRING(peak_name, 1, 1) = SUBSTRING(river_name, 1, 1)
    ORDER BY mix;
    */
    
    SELECT 
        p.peak_name,
        r.river_name,
        LOWER(CONCAT(p.peak_name, SUBSTRING(r.river_name, 2))) AS mix
    FROM
        peaks AS p,
        rivers AS r
    WHERE
        RIGHT(p.peak_name, 1) = LEFT(r.river_name, 1)
    ORDER BY mix;
---
Part III – Queries for Diablo Database
======================================

08.12 Games from 2011 and 2012 year
-----------------------------------

Find the **top 50 games ordered by start date**, then **by name**. Display only
the **games from the years 2011 and 2012**. Display the start date in the format
“**YYYY-MM-DD**”. Submit your query statements as **Prepare DB & run queries.**

### Example

| **name**     | **start**  |
|--------------|------------|
| Rose Royalty | 2011-01-05 |
| London       | 2011-01-13 |
| Broadway     | 2011-01-16 |
| …            | …          |
<br/>

### Solution: <a title="12 Games from 2011 and 2012 year" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/2154de797375c61537f92c5b1e63d5404b25b51c/8%20BUILT-IN%20FUNCTIONS%20-%20EXERCISE/homework.sql#L156">12 Games from 2011 and 2012 year</a>
    -- -----------------------------------------------
    -- 12. Games From 2011 and 2012 Year
    -- -----------------------------------------------
    
    SELECT 
        name, DATE_FORMAT(start, '%Y-%m-%d') AS 'start'
    FROM
        games
    WHERE
        YEAR(start) = 2011 OR YEAR(start) = 2012
    ORDER BY start
    LIMIT 50;
---
08.13 User Email Providers
--------------------------

Find information about the email providers of all users. Display the
**user_name** and the **email provider**. Sort the results by **email provider
alphabetically**, then by **username**. Submit your query statements **as
Prepare DB & run queries.**

### Example

| **user_name** | **Email Provider** |
|---------------|--------------------|
| Pesho         | abv.bg             |
| monoxidecos   | astonrasuna.com    |
| bashsassafras | balibless          |
| …             | …                  |
<br/>

### Solution: <a title="13 User Email Providers" href="">13 User Email Providers</a>
    -- -----------------------------------------------
    -- 13. User Email Providers
    -- -----------------------------------------------
    
    SELECT 
        user_name,
        SUBSTRING_INDEX(email, '@', - 1) AS 'Email Provider'
    FROM
        users
    ORDER BY `Email Provider` ASC , user_name ASC;
---
08.14 Get Users with IP Address Like Pattern
--------------------------------------------

Find the **user_name** and the **ip_address** for each user, sorted by
**user_name alphabetically**. Display only the rows, where the **ip_address**
matches the pattern: “**\___.1%.%.__\_**”. Submit your query statements as
**Prepare DB & run queries.**

### Example

| **user_name**     | **ip_address**  |
|-------------------|-----------------|
| bindbawdy         | 192.157.20.222  |
| evolvingimportant | 223.175.227.173 |
| inguinalself      | 255.111.250.207 |
| …                 | …               |
<br/>

### Solution: <a title="14 Get Users with IP Address Like Pattern" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/2154de797375c61537f92c5b1e63d5404b25b51c/8%20BUILT-IN%20FUNCTIONS%20-%20EXERCISE/homework.sql#L180">14 Get Users with IP Address Like Pattern</a>
    -- -----------------------------------------------
    -- 14. Get Users with IP Address Like Pattern 
    -- -----------------------------------------------
    
    SELECT 
        user_name, ip_address
    FROM
        users
    WHERE
        ip_address LIKE ('___.1%.%.___')
    ORDER BY user_name;
---
08.15 Show All Games with Duration and Part of the Day
------------------------------------------------------

Find all **games** with their corresponding **part of the day** and
**duration**. **Parts of the day** should be **Morning** (**start** time is \>=
0 and \< 12), **Afternoon** (**start** time is \>= 12 and \< 18), **Evening**
(**start** time is \>= 18 and \< 24). **Duration** should be **Extra Short**
(smaller or equal to 3), **Short** (between 3 and 6 including), **Long**
(between 6 and 10 including) and **Extra Long** in any other cases or without
**duration**. Submit your query statements as **Prepare DB & run queries.**

### Example

| **game**         | **Part of the Day** | **Duration** |
|------------------|---------------------|--------------|
| Aithusa          | Evening             | Short        |
| Acid green       | Morning             | Long         |
| Apple            | Morning             | Short        |
| Broadway         | Morning             | Short        |
| Ancalagon        | Morning             | Short        |
| Allium drumstick | Morning             | Extra Long   |
| …                | …                   | …            |
<br/>

### Solution: <a title="15 Show All Games with Duration and Part of the Day" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/2154de797375c61537f92c5b1e63d5404b25b51c/8%20BUILT-IN%20FUNCTIONS%20-%20EXERCISE/homework.sql#L192">15 Show All Games with Duration and Part of the Day</a>
    -- -----------------------------------------------
    -- 15. Show All Games with Duration
    -- -----------------------------------------------
    
    SELECT 
        name AS 'Game',
        CASE
            WHEN HOUR(start) BETWEEN 0 AND 11 THEN 'Morning'
            WHEN HOUR(start) BETWEEN 12 AND 17 THEN 'Afternoon'
            WHEN HOUR(start) BETWEEN 18 AND 23 THEN 'Evening'
        END AS 'Part of the day',
        CASE
            WHEN duration <= 3 THEN 'Extra Short'
            WHEN duration BETWEEN 4 AND 6 THEN 'Short'
            WHEN duration BETWEEN 7 AND 10 THEN 'Long'
            ELSE 'Extra Long'
        END AS 'Duration'
    FROM
        games;
        
---
Part IV – Date Functions Queries
================================

08.16 Orders Table
------------------

You are given a table **orders(id, product_name, order_date)** filled with data.
Consider that the **payment** for an order must be accomplished **within 3 days
after the order date**. Also the **delivery date is up to 1 month**. Write a
query to show each product’s **name**, **order date**, **pay and deliver due
dates**. Submit your query statements as **Prepare DB & run queries.**

### Original Table

| **id** | **product_name** | **order_date**      |
|--------|------------------|---------------------|
| 1      | Butter           | 2016-09-19 00:00:00 |
| 2      | Milk             | 2016-09-30 00:00:00 |
| 3      | Cheese           | 2016-09-04 00:00:00 |
| 4      | Bread            | 2015-12-20 00:00:00 |
| 5      | Tomatoes         | 2015-12-30 00:00:00 |
| …      | …                | …                   |

### Output

| **product_name** | **order_date**      | **pay_due**         | **deliver_due**     |
|------------------|---------------------|---------------------|---------------------|
| Butter           | 2016-09-19 00:00:00 | 2016-09-22 00:00:00 | 2016-10-19 00:00:00 |
| Milk             | 2016-09-30 00:00:00 | 2016-10-03 00:00:00 | 2016-10-30 00:00:00 |
| Cheese           | 2016-09-04 00:00:00 | 2016-09-07 00:00:00 | 2016-10-04 00:00:00 |
| Bread            | 2015-12-20 00:00:00 | 2015-12-23 00:00:00 | 2016-01-20 00:00:00 |
| Tomatoes         | 2015-12-30 00:00:00 | 2016-01-02 00:00:00 | 2016-01-30 00:00:00 |
| …                | …                   | …                   | …                   |
<br/>

### Solution: <a title="16 Orders Table" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/2154de797375c61537f92c5b1e63d5404b25b51c/8%20BUILT-IN%20FUNCTIONS%20-%20EXERCISE/homework.sql#L213">16 Orders Table</a>
    -- -----------------------------------------------
    -- 16. Orders Table
    -- -----------------------------------------------
    
    SELECT 
        product_name,
        order_date,
        DATE_ADD(order_date, INTERVAL 3 DAY) AS `pay_due`,
        DATE_ADD(order_date, INTERVAL 1 MONTH) AS `deliver_due`
    FROM
        orders;
---