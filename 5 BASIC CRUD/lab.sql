-- --------------------------------------------
-- 1: Select Employee Information
-- --------------------------------------------

SELECT 
    e.id, e.first_name, e.last_name, e.job_title
FROM
    employees AS e
ORDER BY id ASC;

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

-- --------------------------------------------
-- 06. Delete from Table  
-- --------------------------------------------

DELETE FROM employees 
WHERE
    department_id IN (2 , 1);

SELECT * FROM employees;