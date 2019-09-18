09 Lab: Data Aggregation
========================

---
---

This document defines the **lab exercise assignments** for the ["Databases
Basics - MySQL" course \@ Software
University.](https://softuni.bg/courses/databases-basics-mysql)

Download and get familiar with the **restaurant** database. You will use it in
the assignments bellow.

---

09.01 Departments Info
----------------------

Write a query to **count** the number of employees **in each department by id**.
Order the information by **deparment_id**, then by **employees count**. Submit
your queries with the **MySQL prepare DB & run queries** strategy.

### Example

| **department_id** | **Number of employees** |
|-------------------|-------------------------|
| **1**             | **2**                   |
| **2**             | **4**                   |
| **3**             | **3**                   |
| **…**             | **…**                   |
<br/>

### Solution: <a title="01 Departments Info" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/42331070ebbeb8b34e7bea4630f64e3575da9a6a/9%20DATA%20AGGREGATION/lab.sql#L2">01 Departments Info</a>
    ################################################################
    ## 1. Departments Info 
    ################################################################
    
    SELECT DISTINCT
        e.department_id,
        COUNT(e.department_id) AS 'Number of employees'
    FROM
        employees AS e
    GROUP BY e.department_id
    ORDER BY e.department_id , `Number of employees`;
---
09.02 Average Salary
--------------------

Write a query to calculate the **average salary** in each department. Order the
information by **department_id**. **Round** the salary result to **two digits
after the decimal point**. Submit your queries with the **MySQL prepare DB & run
queries** strategy.

### Example

| **department_id** | **Average Salary** |
|-------------------|--------------------|
| **1**             | **2050**           |
| **2**             | **1090**           |
| **3**             | **736.67**         |
<br/>

### Solution: <a title="02 Average Salary" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/42331070ebbeb8b34e7bea4630f64e3575da9a6a/9%20DATA%20AGGREGATION/lab.sql#L14">02 Average Salary</a>
    ################################################################
    ## 2. Average Salary
    ################################################################
    
    SELECT 
        e.department_id, ROUND(AVG(salary), 2)
    FROM
        employees AS e
    GROUP BY e.department_id;
---
09.03 Min Salary
----------------

Write a query to retrieve information about the departments grouped by
**department_id** with **minumum salary higher than 800**. **Round** the salary
result to **two digits after the decimal point**. Submit your queries with the
**MySQL prepare DB & run queries** strategy.

### Example

| **department_id** | **Min Salary** |
|-------------------|----------------|
| **1**             | **1700**       |
<br/>

### Solution: <a title="03 Min Salary" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/42331070ebbeb8b34e7bea4630f64e3575da9a6a/9%20DATA%20AGGREGATION/lab.sql#L24">03 Min Salary</a>
    ################################################################
    ## 3. Minimum Salary
    ################################################################
    
    SELECT 
        e.department_id, ROUND(MIN(e.salary)) AS 'Min Salary'
    FROM
        employees AS e
    GROUP BY e.department_id
    HAVING `Min Salary` > 800;
---
09.04 Appetizers Count
----------------------

Write a query to retrieve the count of all **appetizers** (**category id = 2**)
with price **higher than 8**. Submit your queries with the **MySQL prepare DB &
run queries** strategy.
<br/>

### Solution: <a title="04 Appetizers Count" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/42331070ebbeb8b34e7bea4630f64e3575da9a6a/9%20DATA%20AGGREGATION/lab.sql#L35">04 Appetizers Count</a>
    ################################################################
    ## 4. Appetizers Count
    ################################################################
    
    SELECT 
        COUNT(id)
    FROM
        products AS p
    WHERE
        p.price > 8 AND p.category_id = 2
    GROUP BY p.category_id;
---
09.05 Menu Prices
-----------------

Write a query to retrieve information about the prices of each category. The
output should consist of:

-   **Category_id**

-   **Average Price**

-   **Cheapest Product**

-   **Most Expensive Product**

See the **examples** for more information. **Round** the results to **2 digits
after the decimal point**. Submit your queries with the **MySQL prepare DB & run
queries** strategy.

### Example

| **category_id** | **Average Price** | **Cheapest Product** | **Most Expensive Product** |
|-----------------|-------------------|----------------------|----------------------------|
| **1**           | **7.49**          | **6.79**             | **8.79**                   |
| **2**           | **10.93**         | **7.99**             | **14.89**                  |
| **3**           | **7.90**          | **6.90**             | **8.89**                   |
| **4**           | **12.79**         | **11.69**            | **13.69**                  |
| **5**           | **5.37**          | **4.90**             | **5.60**                   |
<br/>

### Solution: <a title="05 Menu Prices" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/42331070ebbeb8b34e7bea4630f64e3575da9a6a/9%20DATA%20AGGREGATION/lab.sql#L48">05 Menu Prices</a>
    ################################################################
    ## 5. Menu Prices 
    ################################################################
    
    SELECT 
        p.category_id,
        ROUND(AVG(p.price), 2) AS 'Average Price',
        ROUND(MIN(p.price), 2) AS 'Cheapest Product',
        ROUND(MAX(p.price), 2) AS 'Most Expensive Product'
    FROM
        products AS p
    GROUP BY p.category_id;
---