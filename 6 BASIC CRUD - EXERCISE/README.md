06 Exercises: Basic CRUD
========================

---
---

This document defines the **exercise assignments** for the ["Databases Basics -
MySQL" course \@ Software
University.](https://softuni.bg/courses/databases-basics-mysql)

Download and get familiar with the **soft_uni**, **diablo** and **geography**
database schemas and tables. You will use them in this and the following
exercises to write queries.

---

Part I – Queries for SoftUni Database
=====================================

06.01 Find All Information About Departments
--------------------------------------------

Write a SQL query to find **all available information about the departments.
Sort the information by id.** Submit your query statements as **Prepare DB & run
queries.**

### Example

| **department_id** | **name**    | **manager_id** |
|-------------------|-------------|----------------|
| 1                 | Engineering | 12             |
| 2                 | Tool Design | 4              |
| 3                 | Sales       | 273            |
| …                 | …           | …              |
<br/>

### Solution: <a title="01 Find All Information About Departments" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/20ce267fee00611ae2b78a924b58f2c1c85d888e/6%20BASIC%20CRUD%20-%20EXERCISE/homework.sql#L2">01 Find All Information About Departments</a>
    -- --------------------------------------------
    -- 01. Find All Information About Departments   
    -- --------------------------------------------
    
    SELECT 
        *
    FROM
        departments
    ORDER BY department_id ASC;
---
06.02 Find all Department Names
-------------------------------

Write SQL query to find **all department names**. **Sort the information by
id.** Submit your query statements as **Prepare DB & run queries.**

### Example

| **name**    |
|-------------|
| Engineering |
| Tool Design |
| Sales       |
| …           |
<br/>

### Solution: <a title="02 Find all Department Names" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/20ce267fee00611ae2b78a924b58f2c1c85d888e/6%20BASIC%20CRUD%20-%20EXERCISE/homework.sql#L12">02 Find all Department Names</a>
    -- --------------------------------------------
    --  02. Find all Department Names 
    -- --------------------------------------------
    
    SELECT 
        d.name
    FROM
        departments AS d
    ORDER BY d.department_id ASC;
---
06.03 Find salary of Each Employee
----------------------------------

Write SQL query to find the **first name**, **last name** and **salary** of each
employee. **Sort the information by id.** Submit your query statements as
**Prepare DB & run queries.**

### Example

| **first_name** | **last_name** | **salary** |
|----------------|---------------|------------|
| Guy            | Gilbert       | 12500.00   |
| Kevin          | Brown         | 13500.00   |
| Roberto        | Tamburello    | 43300.00   |
| …              | …             | …          |
<br/>

### Solution: <a title="03 Find salary of Each Employee" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/20ce267fee00611ae2b78a924b58f2c1c85d888e/6%20BASIC%20CRUD%20-%20EXERCISE/homework.sql#L22">03 Find salary of Each Employee</a>
    -- --------------------------------------------
    --  03. Find Salary of Each Employee 
    -- --------------------------------------------
    
    SELECT 
        first_name, last_name, salary
    FROM
        employees
    ORDER BY employee_id;
---
06.04 Find Full Name of Each Employee
-------------------------------------

Write SQL query to find the **first**, **middle** and **last name** of each
employee. **Sort the information by id.** Submit your query statements as
**Prepare DB & run queries.**

### Example

| **first_name** | **middle_name** | **last_name** |
|----------------|-----------------|---------------|
| Guy            | R               | Gilbert       |
| Kevin          | F               | Brown         |
| Roberto        | NULL            | Tamburello    |
| …              | …               | …             |
<br/>

### Solution: <a title="04 Find Full Name of Each Employee" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/20ce267fee00611ae2b78a924b58f2c1c85d888e/6%20BASIC%20CRUD%20-%20EXERCISE/homework.sql#L32">04 Find Full Name of Each Employee</a>
    -- --------------------------------------------
    --  04. Find Full Name of Each Employee 
    -- --------------------------------------------
    
    SELECT 
        first_name, middle_name, last_name
    FROM
        employees
    ORDER BY employee_id;
---
06.05 Find Email Address of Each Employee
-----------------------------------------

Write a SQL query to find the **email address** of each employee. (by his
**first and last name**). Consider that the email domain is **softuni.bg**.
Emails should look like “John.Doe\@softuni.bg". The **produced column** should
be named **"full\_ email_address"**. Submit your query statements as **Prepare
DB & run queries**.

### Example

| **full_email_address**         |
|--------------------------------|
| Guy.Gilbert\@softuni.bg        |
| Kevin.Brown\@softuni.bg        |
| Roberto.Tamburello\@softuni.bg |
| …                              |
<br/>

### Solution: <a title="05 Find Email Address of Each Employee" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/20ce267fee00611ae2b78a924b58f2c1c85d888e/6%20BASIC%20CRUD%20-%20EXERCISE/homework.sql#L42">05 Find Email Address of Each Employee</a>
    -- --------------------------------------------
    --  05. Find Email Address of Each Employee 
    -- --------------------------------------------
    
    SELECT 
        CONCAT(first_name,
                '.',
                last_name,
                '@softuni.bg') AS 'full_email_address'
    FROM
        employees;
---
06.06 Find All Different Employee’s Salaries
--------------------------------------------

Write a SQL query to find **all different employee’s salaries**. Show only the
salaries. **Sort the information by id.** Submit your query statements as
**Prepare DB & run queries**.

### Example

| **Salary** |
|------------|
| 12500.00   |
| 13500.00   |
| 43300.00   |
| …          |
<br/>

### Solution: <a title="06 Find All Different Employee’s Salaries" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/20ce267fee00611ae2b78a924b58f2c1c85d888e/6%20BASIC%20CRUD%20-%20EXERCISE/homework.sql#L54">06 Find All Different Employee’s Salaries</a>
    -- --------------------------------------------
    --  06. Find All Different Employee’s Salaries 
    -- --------------------------------------------
    
    SELECT DISTINCT
        salary
    FROM
        employees
    ORDER BY salary;
---
06.07 Find all Information About Employees
------------------------------------------

Write a SQL query to find **all information** about the employees whose **job
title** is **“Sales Representative”. Sort the information by id.** Submit your
query statements as **Prepare DB & run queries**.

### Example

| **id** | **First Name** | **Last Name** | **Middle Name** | **Job Title**        | **DeptID** | **Mngr ID** | **HireDate** | **salary** | **address_id** |
|--------|----------------|---------------|-----------------|----------------------|------------|-------------|--------------|------------|----------------|
| 275    | Michael        | Blythe        | G               | Sales Representative | 3          | 268         | …            | 23100.00   | 60             |
| 276    | Linda          | Mitchell      | C               | Sales Representative | 3          | 268         | …            | 23100.00   | 170            |
| 277    | Jillian        | Carson        | NULL            | Sales Representative | 3          | 268         | …            | 23100.00   | 61             |
| …      | …              | …             | …               | …                    | …          | …           | …            | …          | …              |
<br/>

### Solution: <a title="07 Find all Information About Employees" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/20ce267fee00611ae2b78a924b58f2c1c85d888e/6%20BASIC%20CRUD%20-%20EXERCISE/homework.sql#L64">07 Find all Information About Employees</a>
    -- --------------------------------------------
    --  07. Find all Information About Employees 
    -- --------------------------------------------
    
    SELECT 
        *
    FROM
        employees
    WHERE
        job_title IN ('Sales Representative');
---
06.08 Find Names of All Employees by salary in Range
----------------------------------------------------

Write a SQL query to find the **first name**, **last name** and **job title** of
all employees whose **salary is in the range [20000, 30000]. Sort the
information by id.** Submit your query statements as **Prepare DB & run
queries**.

### Example

| **first_name** | **last_name** | **JobTitle**          |
|----------------|---------------|-----------------------|
| Rob            | Walters       | Senior Tool Designer  |
| Thierry        | D'Hers        | Tool Designer         |
| JoLynn         | Dobney        | Production Supervisor |
| …              | …             | …                     |
<br/>

### Solution: <a title="08 Find Names of All Employees by salary in Range" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/20ce267fee00611ae2b78a924b58f2c1c85d888e/6%20BASIC%20CRUD%20-%20EXERCISE/homework.sql#L75">08 Find Names of All Employees by salary in Range</a>
    -- --------------------------------------------
    --  08. Find Names of All Employees by Salary in Range
    -- --------------------------------------------
    
    SELECT 
        first_name, last_name, job_title
    FROM
        employees
    WHERE
        salary BETWEEN 20000 AND 30000
    ORDER BY employee_id;
---
 06.09 Find Names of All Employees 
----------------------------------

Write a SQL query to find the **full name** of all employees whose **salary** is
**25000, 14000, 12500 or 23600**. Full Name is combination of **first**,
**middle** and **last** name (separated with **single space**) and they should
be **in one column** called **“Full Name”.** Submit your query statements as
**Prepare DB & run queries**.

### Example

| **Full Name**    |
|------------------|
| Guy R Gilbert    |
| Thierry B D'Hers |
| JoLynn M Dobney  |
<br/>

### Solution: <a title="09 Find Names of All Employees" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/20ce267fee00611ae2b78a924b58f2c1c85d888e/6%20BASIC%20CRUD%20-%20EXERCISE/homework.sql#L87">09 Find Names of All Employees</a>
    -- --------------------------------------------
    --  9. Find Names of All Employees
    -- --------------------------------------------
    
    SELECT 
        CONCAT_WS(' ', first_name, middle_name, last_name) AS 'full_name'
    FROM
        employees
    WHERE
        salary = 25000 OR salary = 14000
            OR salary = 12500
            OR salary = 23600;
---
06.10 Find All Employees Without Manager
----------------------------------------

Write a SQL query to find **first and last names** about those employees that
**does not have a manager**. Submit your query statements as **Prepare DB & run
queries**.

### Example

| **first_name** | **last_name** |
|----------------|---------------|
| Ken            | Sanchez       |
| Svetlin        | Nakov         |
| …              | …             |
<br/>

### Solution: <a title="10 Find All Employees Without Manager" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/20ce267fee00611ae2b78a924b58f2c1c85d888e/6%20BASIC%20CRUD%20-%20EXERCISE/homework.sql#L100">10 Find All Employees Without Manager</a>
    -- --------------------------------------------
    --  10. Find All Employees Without Manager 
    -- --------------------------------------------
    
    SELECT 
        first_name, last_name
    FROM
        employees
    WHERE
        manager_id IS NULL;

---
06.11 Find All Employees with salary More Than 50000
----------------------------------------------------

Write a SQL query to find **first name**, **last name** and **salary** of those
employees who has salary more than 50000. Order them in decreasing order by
salary. Submit your query statements as **Prepare DB & run queries**.

### Example

| **first_name** | **last_name** | **salary** |
|----------------|---------------|------------|
| Ken            | Sanchez       | 125500.00  |
| James          | Hamilton      | 84100.00   |
| …              | …             | …          |
<br/>

### Solution: <a title="11 Find All Employees with salary More Than 50000" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/20ce267fee00611ae2b78a924b58f2c1c85d888e/6%20BASIC%20CRUD%20-%20EXERCISE/homework.sql#L111">11 Find All Employees with salary More Than 50000</a>
    -- --------------------------------------------
    --  11. Find All Employees with Salary More Than 
    -- --------------------------------------------
    
    SELECT 
        first_name, last_name, salary
    FROM
        employees
    WHERE
        salary > 50000
    ORDER BY salary DESC;
---
06.12 Find 5 Best Paid Employees
--------------------------------

Write SQL query to find **first and last names** about **5 best paid Employees**
ordered **descending by their salary.** Submit your query statements as
**Prepare DB & run queries**.

### Example

| **first_name** | **last_name** |
|----------------|---------------|
| Ken            | Sanchez       |
| James          | Hamilton      |
| …              | …             |
<br/>

### Solution: <a title="12 Find 5 Best Paid Employees" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/20ce267fee00611ae2b78a924b58f2c1c85d888e/6%20BASIC%20CRUD%20-%20EXERCISE/homework.sql#L123">12 Find 5 Best Paid Employees</a>
    -- --------------------------------------------
    --  12. Find 5 Best Paid Employees 
    -- --------------------------------------------
    
    SELECT 
        first_name, last_name
    FROM
        employees
    ORDER BY salary DESC
    LIMIT 5;
---
03.13 Find All Employees Except Marketing
-----------------------------------------

Write a SQL query to find the **first** and **last names** of all employees
whose **department ID is different from 4.** Submit your query statements as
**Prepare DB & run queries.**

### Example

| **first_name** | **last_name** |
|----------------|---------------|
| Guy            | Gilbert       |
| Roberto        | Tamburello    |
| Rob            | Walters       |
<br/>

### Solution: <a title="13 Find All Employees Except Marketing" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/20ce267fee00611ae2b78a924b58f2c1c85d888e/6%20BASIC%20CRUD%20-%20EXERCISE/homework.sql#L134">13 Find All Employees Except Marketing</a>
    -- --------------------------------------------
    --  13. Find All Employees Except Marketing 
    -- --------------------------------------------
    
    SELECT 
        first_name, last_name
    FROM
        employees
    WHERE
        NOT department_id = 4;
---
06.14 Sort Employees Table
--------------------------

Write a SQL query to sort all records in the **еmployees** table by the
following criteria:

-   First by **salary** in **decreasing** order

-   Then by **first name alphabetically**

-   Then by **last name descending**

-   Then by **middle name alphabetically**

**Sort the information by id.** Submit your query statements as **Prepare DB &
run queries.**

### Example

| **id** | **First Name** | **Last Name** | **Middle Name** | **job_title**                | **DeptID** | **Mngr ID** | **HireDate** | **salary** | **address_id** |
|--------|----------------|---------------|-----------------|------------------------------|------------|-------------|--------------|------------|----------------|
| 109    | Ken            | Sanchez       | J               | Chief Executive Officer      | 16         | NULL        | …            | 125500.00  | 177            |
| 148    | James          | Hamilton      | R               | Vice President of Production | 7          | 109         | …            | 84100.00   | 158            |
| 273    | Brian          | Welcker       | S               | Vice President of Sales      | 3          | 109         | …            | 72100.00   | 134            |
| …      | …              | …             | …               | …                            | …          | …           | …            | …          | …              |
<br/>

### Solution: <a title="14 Sort Employees Table" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/20ce267fee00611ae2b78a924b58f2c1c85d888e/6%20BASIC%20CRUD%20-%20EXERCISE/homework.sql#L145">14 Sort Employees Table</a>
    -- --------------------------------------------
    --  14. Sort Employees Table 
    -- --------------------------------------------
    
    SELECT 
        *
    FROM
        employees
    ORDER BY salary DESC , first_name ASC , last_name DESC , middle_name ASC;
---
06.15 Create View Employees with Salaries
-----------------------------------------

Write a SQL query to create a view **v_employees_salaries** with **first name**,
**last name** and **salary** for each employee. Submit your query statements as
**Run skeleton, run queries & check DB.**

### Example

| **first_name** | **last_name** | **salary** |
|----------------|---------------|------------|
| Guy            | Gilbert       | 12500.00   |
| Kevin          | Brown         | 13500.00   |
| …              | …             | …          |
<br/>

### Solution: <a title="15 Create View Employees with Salaries" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/20ce267fee00611ae2b78a924b58f2c1c85d888e/6%20BASIC%20CRUD%20-%20EXERCISE/homework.sql#L155">15 Create View Employees with Salaries</a>
    -- --------------------------------------------
    --  15. Create View Employees with Salaries
    -- --------------------------------------------
    
    CREATE VIEW v_employees_salaries AS
        SELECT 
            first_name, last_name, salary
        FROM
            employees;
    
    SELECT * FROM v_employees_salaries;
---
06.16 Create View Employees with Job Titles
-------------------------------------------

Write a SQL query to create view **v_employees_job_titles** with **full employee
name** and **job title**. When middle name is **NULL** replace it with **empty
string (‘’)**. Submit your query statements as **Run skeleton, run queries &
check DB.**

### Example

| **full_name**      | **job_title**         |
|--------------------|-----------------------|
| Guy R Gilbert      | Production Technician |
| Kevin F Brown      | Marketing Assistant   |
| Roberto Tamburello | Engineering Manager   |
| …                  | …                     |
<br/>

### Solution: <a title="16 Create View Employees with Job Titles" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/20ce267fee00611ae2b78a924b58f2c1c85d888e/6%20BASIC%20CRUD%20-%20EXERCISE/homework.sql#L167">16 Create View Employees with Job Titles</a>
    -- --------------------------------------------
    --  16. Create View Employees with Job Titles
    -- --------------------------------------------
    
    CREATE VIEW v_employees_job_titles AS
        SELECT 
            CONCAT_WS(' ',
                    first_name,
                    IF(middle_name IS NULL,
                        '',
                        middle_name),
                    last_name) AS 'full_name',
            job_title
        FROM
            employees;
    
    SELECT * FROM v_employees_job_titles;
---
06.17 Distinct Job Titles
-------------------------

Write a SQL query to find **all distinct job titles**. **Sort the result by job
title alphabetically.** Submit your query statements as **Prepare DB & run
queries.**

### Example

| **Job_title**               |
|-----------------------------|
| Accountant                  |
| Accounts Manager            |
| Accounts Payable Specialist |
| …                           |
<br/>

### Solution: <a title="17 Distinct Job Titles" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/20ce267fee00611ae2b78a924b58f2c1c85d888e/6%20BASIC%20CRUD%20-%20EXERCISE/homework.sql#L185">17 Distinct Job Titles</a>
    -- --------------------------------------------
    --  17. Distinct Job Titles
    -- --------------------------------------------
    
    SELECT DISTINCT
        job_title
    FROM
        employees
    ORDER BY job_title ASC;
---
06.18 Find First 10 Started Projects
------------------------------------

Write a SQL query to find **first 10 started projects**. Select **all
information about them** and **sort** them **by start date**, **then by name**.
**Sort the information by id.** Submit your query statements as **Prepare DB &
run queries.**

### Example

| **id** | **Name**          | **Description**                               | **start_date**      | **end_date**        |
|--------|-------------------|-----------------------------------------------|---------------------|---------------------|
| 6      | HL Road Frame     | Research, design and development of HL Road … | 1998-05-02 00:00:00 | 2003-06-01 00:00:00 |
| 2      | Cycling Cap       | Research, design and development of C…        | 2001-06-01 00:00:00 | 2003-06-01 00:00:00 |
| 5      | HL Mountain Frame | Research, design and development of HL M…     | 2001-06-01 00:00:00 | 2003-06-01 00:00:00 |
| …      | …                 | …                                             | …                   | …                   |
<br/>

### Solution: <a title="18 Find First 10 Started Projects" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/20ce267fee00611ae2b78a924b58f2c1c85d888e/6%20BASIC%20CRUD%20-%20EXERCISE/homework.sql#L195">18 Find First 10 Started Projects</a>
    -- --------------------------------------------
    --  18. Find First 10 Started Projects
    -- --------------------------------------------
    
    SELECT 
        *
    FROM
        projects
    ORDER BY start_date ASC , name ASC , project_id ASC
    LIMIT 10;
---
06.19 Last 7 Hired Employees
----------------------------

Write a SQL query to find **last 7 hired employees**. Select **their first, last
name and their hire date.** Submit your query statements as **Prepare DB & run
queries.**

### Example

| **first_name** | **last_name** | **hire_date**       |
|----------------|---------------|---------------------|
| Rachel         | Valdez        | 2005-07-01 00:00:00 |
| Lynn           | Tsoflias      | 2005-07-01 00:00:00 |
| Syed           | Abbas         | 2005-04-15 00:00:00 |
| …              | …             | …                   |
<br/>

### Solution: <a title="19 Last 7 Hired Employees" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/20ce267fee00611ae2b78a924b58f2c1c85d888e/6%20BASIC%20CRUD%20-%20EXERCISE/homework.sql#L206">19 Last 7 Hired Employees</a>
    -- --------------------------------------------
    --  19. Last 7 Hired Employees	
    -- --------------------------------------------
    
    SELECT 
        first_name, last_name, hire_date
    FROM
        employees
    ORDER BY hire_date DESC
    LIMIT 7;

---
06.20 Increase Salaries
-----------------------

Write a SQL query to increase salaries of all employees that are in the
**Engineering**, **Tool Design**, **Marketing** or **Information Services**
department by **12%**. Then **select Salaries column** from the **Employees**
table. Submit your query statements as **Prepare DB & run queries.**

### Example

| **Salary** |
|------------|
| 12500.00   |
| 15120.00   |
| 48496.00   |
| 33376.00   |
| …          |
<br/>

### Solution: <a title="20 Increase Salaries" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/20ce267fee00611ae2b78a924b58f2c1c85d888e/6%20BASIC%20CRUD%20-%20EXERCISE/homework.sql#L217">20 Increase Salaries</a>
    -- --------------------------------------------
    --  20. Increase Salaries 
    -- --------------------------------------------
    
    UPDATE employees 
    SET 
        salary = salary * 1.12
    WHERE
        department_id = 1 OR department_id = 2
            OR department_id = 4
            OR department_id = 11;
            
    SELECT 
        salary
    FROM
        employees;
---
Part II – Queries for Geography Database
========================================

06.21 All Mountain Peaks
------------------------

Display all **mountain peaks** in alphabetical order. Submit your query
statements as **Prepare DB & run queries.**

### Example

| **peak_name**     |
|-------------------|
| Aconcagua         |
| Banski Suhodol    |
| Batashki Snezhnik |
| …                 |
<br/>

### Solution: <a title="21 All Mountain Peaks" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/20ce267fee00611ae2b78a924b58f2c1c85d888e/6%20BASIC%20CRUD%20-%20EXERCISE/homework.sql#L234">21 All Mountain Peaks</a>
    -- --------------------------------------------
    --  21. All Mountain Peaks
    -- --------------------------------------------
    
    SELECT 
        peak_name
    FROM
        peaks
    ORDER BY peak_name ASC;
---
06.22 Biggest Countries by Population
-------------------------------------

Find the **30 biggest countries** by **population** from **Europe**. Display the
**country name** and **population**. Sort the results by **population (from
biggest to smallest),** then by **country alphabetically**. Submit your query
statements as **Prepare DB & run queries.**

### Example

| **country_name** | **population** |
|------------------|----------------|
| Russia           | 140702000      |
| Germany          | 81802257       |
| France           | 64768389       |
| …                | …              |
<br/>

### Solution: <a title="22 Biggest Countries by Population" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/20ce267fee00611ae2b78a924b58f2c1c85d888e/6%20BASIC%20CRUD%20-%20EXERCISE/homework.sql#L244">22 Biggest Countries by Population</a>
    -- --------------------------------------------
    --  22. Biggest Countries by Population 
    -- --------------------------------------------
    
    SELECT 
        country_name, population
    FROM
        countries
    WHERE
        continent_code IN ('EU')
    ORDER BY population DESC , country_name ASC
    LIMIT 30;

---
06.23 Countries and Currency (Euro / Not Euro)
----------------------------------------------

Find all countries along with information about their *currency*. Display the
**country name**, **country code** and information about its **currency**:
either "**Euro**" or "**Not Euro**". Sort the results by **country name
alphabetically**. Submit your query statements as **Prepare DB & run queries.**

### Example

| **country_name** | **country_code** | **currency** |
|------------------|------------------|--------------|
| Afghanistan      | AF               | Not Euro     |
| Åland            | AX               | Euro         |
| Albania          | AL               | Not Euro     |
| …                | …                | …            |
<br/>

### Solution: <a title="23 Countries and Currency (Euro / Not Euro)" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/20ce267fee00611ae2b78a924b58f2c1c85d888e/6%20BASIC%20CRUD%20-%20EXERCISE/homework.sql#L257">23 Countries and Currency (Euro / Not Euro)</a>
    -- --------------------------------------------
    --  23. Countries and Currency (Euro / Not Euro
    -- --------------------------------------------
    
    SELECT 
        country_name,
        country_code,
        IF(currency_code = 'EUR',
            'Euro',
            'Not Euro') AS currency
    FROM
        countries
    ORDER BY country_name ASC;

---
Part III – Queries for Diablo Database
======================================

06.24 All Diablo Characters
---------------------------

Display the **name** of all **characters** in **alphabetical order.** Submit
your query statements as **Prepare DB & run queries.**

### Example

| **name**  |
|-----------|
| Amazon    |
| Assassin  |
| Barbarian |
| …         |
<br/>

### Solution: <a title="24 All Diablo Characters" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/20ce267fee00611ae2b78a924b58f2c1c85d888e/6%20BASIC%20CRUD%20-%20EXERCISE/homework.sql#L271">24 All Diablo Characters</a>
    -- --------------------------------------------
    --  24. All Diablo Characters
    -- --------------------------------------------
    
    SELECT 
        name
    FROM
        characters
    ORDER BY name ASC;
---