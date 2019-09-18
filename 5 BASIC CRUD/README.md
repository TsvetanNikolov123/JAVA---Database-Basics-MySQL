05 Lab: Basic CRUD
==================

---
---

This document defines the **lab assignments** for the ["Databases Basics -
MySQL" course \@ Software
University.](https://softuni.bg/courses/databases-basics-mysql)

Download and get familiar with the **hospital** database schemas and tables. You
will use it in the following exercises to write queries.

---
05.01 Select Employee Information
---------------------------------

Write a query to select all employees and retrieve information about their
**id**, **first_name, last_name** and **job_title ordered by id.**

### Example

| **id** | **first_name** | **last_name** | **job_title** |
|--------|----------------|---------------|---------------|
| 1      | John           | Smith         | Therapist     |
| 2      | John           | Johnson       | Acupuncturist |
| 3      | Smith          | Johnson       | Technician    |
| …      | …              | …             | …             |

<br/>

### Solution: <a title="01 Select Employee Information" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/a1216c188dcb3dc6b4b5b2b58fc3327ac1dcda82/5%20BASIC%20CRUD/lab.sql#L2">01 Select Employee Information</a>
    -- --------------------------------------------
    -- 1: Select Employee Information
    -- --------------------------------------------
    
    SELECT 
        e.id, e.first_name, e.last_name, e.job_title
    FROM
        employees AS e
    ORDER BY id ASC;
    
---
05.02 Select Employees with Filter
----------------------------------

Write a query to select all employees (**id, first_name, last_name, job_title,
salary**) whose salaries are **higher than 1000.00**, **ordered by id.**
Concatenate fields **first_name** and **last_name** into ‘**full_name**’.

### Example

| **id** | **full_name** | **job_title**  | **salary** |
|--------|---------------|----------------|------------|
| 3      | Smith Johnson | Technician     | 1100       |
| 4      | Peter Petrov  | Supervisor     | 1100       |
| 5      | Peter Ivanov  | Dentist        | 1500.23    |
| 7      | Jack Jackson  | Epidemiologist | 1800       |
| …      | …             | …              | …          |
<br/>

### Solution: <a title="02 Select Employees with Filter" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/a1216c188dcb3dc6b4b5b2b58fc3327ac1dcda82/5%20BASIC%20CRUD/lab.sql#L12">02 Select Employees with Filter</a>
    -- --------------------------------------------
    -- 02. Select Employees with Filter 
    -- --------------------------------------------
    
    SELECT 
        e.id,
        CONCAT(first_name, ' ', last_name) AS full_name,
        e.job_title,
        e.salary
    FROM
        employees AS e
    WHERE
        e.salary > 1000
    ORDER BY id ASC;  
---
05.03 Update Employees Salary
-----------------------------

Update all employees salaries whose **job_title** is “**Therapist**” by **10%**.
Retrieve information about **all salaries ordered ascending**.

### Example

| **salary** |
|------------|
| 880        |
| 990        |
| 1089       |
| 1100       |
| …          |
<br/>

### Solution: <a title="03 Update Employees Salary" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/a1216c188dcb3dc6b4b5b2b58fc3327ac1dcda82/5%20BASIC%20CRUD/lab.sql#L27">03 Update Employees Salary</a>
    -- --------------------------------------------
    -- 03. Update Salary and Select
    -- --------------------------------------------
    
    UPDATE employees 
    SET 
        salary = salary * 1.1
    WHERE
        job_title IN ('Therapist');
        
    SELECT 
        salary
    FROM
        employees
    ORDER BY salary ASC;
---
05.04 Top Paid Employee
-----------------------

Write a query to create a view that selects all information about the top paid
employee from the “**employees**” table in the **hospital** database.

### Example

| **id** | **first_name** | **last_name** | **job_title**    | **department_id** | **salary** |
|--------|----------------|---------------|------------------|-------------------|------------|
| 8      | Pedro          | Petrov        | Medical Director | 3                 | 2100       |
<br/>

### Solution: <a title="04 Top Paid Employee" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/a1216c188dcb3dc6b4b5b2b58fc3327ac1dcda82/5%20BASIC%20CRUD/lab.sql#L43">04 Top Paid Employee</a>
    -- --------------------------------------------
    -- 04. Top Paid Employee 
    -- --------------------------------------------
    
    CREATE VIEW v_top_paid_employee AS
        SELECT 
            id, first_name, last_name, job_title, department_id, salary
        FROM
            employees
        ORDER BY salary DESC
        LIMIT 1;
        
    SELECT * FROM v_top_paid_employee;
   
---
05.05 Select Employees by Multiple Filters
------------------------------------------

Write a query to retrieve information about employees, who are in **department
4** and have salary **higher or equal to 1600**. Order the information by
**id**.

### Example

| **id** | **first_name** | **last_name** | **job_title**        | **department_id** | **salary** |
|--------|----------------|---------------|----------------------|-------------------|------------|
| 7      | Jack           | Jackson       | Epidemiologist       | 4                 | 1800       |
| 9      | Nikolay        | Ivanov        | Nutrition Technician | 4                 | 1600       |
<br/>

### Solution: <a title="05 Select Employees by Multiple Filters" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/a1216c188dcb3dc6b4b5b2b58fc3327ac1dcda82/5%20BASIC%20CRUD/lab.sql#L57">05 Select Employees by Multiple Filters</a>
    -- --------------------------------------------
    -- 05. Select Employees by Multiple Filters 
    -- --------------------------------------------
    
    SELECT 
        *
    FROM
        employees
    WHERE
        department_id = 4 AND salary >= 1600
    ORDER BY id; 
---
05.06 Delete from Table
-----------------------

Write a query to delete all employees from the “**employees**” table who are in
department **2 or 1**. Order the information by id.

### Example

| **id** | **First_name** | **Last_name** | **Job_title**        | **Department_id** | **salary** |
|--------|----------------|---------------|----------------------|-------------------|------------|
| 4      | Peter          | Petrov        | Supervisor           | 3                 | 1100       |
| 5      | Peter          | Ivanov        | Dentist              | 4                 | 1500.23    |
| 7      | Jack           | Jackson       | Epidemiologist       | 4                 | 1800       |
| 8      | Pedro          | Petrov        | Medical Director     | 3                 | 2100       |
| 9      | Nikolay        | Ivanov        | Nutrition Technician | 4                 | 1600       |
<br/>

### Solution: <a title="06 Delete from Table" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/a1216c188dcb3dc6b4b5b2b58fc3327ac1dcda82/5%20BASIC%20CRUD/lab.sql#L69">06 Delete from Table</a>
    -- --------------------------------------------
    -- 06. Delete from Table  
    -- --------------------------------------------
    
    DELETE FROM employees 
    WHERE
        department_id IN (2 , 1);
    
    SELECT * FROM employees;  
---