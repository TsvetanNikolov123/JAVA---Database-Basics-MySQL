-- --------------------------------------------
-- 01. Find All Information About Departments   
-- --------------------------------------------

SELECT 
    *
FROM
    departments
ORDER BY department_id ASC;

-- --------------------------------------------
--  02. Find all Department Names 
-- --------------------------------------------

SELECT 
    d.name
FROM
    departments AS d
ORDER BY d.department_id ASC;

-- --------------------------------------------
--  03. Find Salary of Each Employee 
-- --------------------------------------------

SELECT 
    first_name, last_name, salary
FROM
    employees
ORDER BY employee_id;

-- --------------------------------------------
--  04. Find Full Name of Each Employee 
-- --------------------------------------------

SELECT 
    first_name, middle_name, last_name
FROM
    employees
ORDER BY employee_id;

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

-- --------------------------------------------
--  06. Find All Different Employee’s Salaries 
-- --------------------------------------------

SELECT DISTINCT
    salary
FROM
    employees
ORDER BY salary;

-- --------------------------------------------
--  07. Find all Information About Employees 
-- --------------------------------------------

SELECT 
    *
FROM
    employees
WHERE
    job_title IN ('Sales Representative');
    
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

-- --------------------------------------------
--  10. Find All Employees Without Manager 
-- --------------------------------------------

SELECT 
    first_name, last_name
FROM
    employees
WHERE
    manager_id IS NULL;

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

-- --------------------------------------------
--  12. Find 5 Best Paid Employees 
-- --------------------------------------------

SELECT 
    first_name, last_name
FROM
    employees
ORDER BY salary DESC
LIMIT 5;

-- --------------------------------------------
--  13. Find All Employees Except Marketing 
-- --------------------------------------------

SELECT 
    first_name, last_name
FROM
    employees
WHERE
    NOT department_id = 4;

-- --------------------------------------------
--  14. Sort Employees Table 
-- --------------------------------------------

SELECT 
    *
FROM
    employees
ORDER BY salary DESC , first_name ASC , last_name DESC , middle_name ASC;

-- --------------------------------------------
--  15. Create View Employees with Salaries
-- --------------------------------------------

CREATE VIEW v_employees_salaries AS
    SELECT 
        first_name, last_name, salary
    FROM
        employees;

SELECT * FROM v_employees_salaries;

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

-- --------------------------------------------
--  17. Distinct Job Titles
-- --------------------------------------------

SELECT DISTINCT
    job_title
FROM
    employees
ORDER BY job_title ASC;

-- --------------------------------------------
--  18. Find First 10 Started Projects
-- --------------------------------------------

SELECT 
    *
FROM
    projects
ORDER BY start_date ASC , name ASC , project_id ASC
LIMIT 10;

-- --------------------------------------------
--  19. Last 7 Hired Employees	
-- --------------------------------------------

SELECT 
    first_name, last_name, hire_date
FROM
    employees
ORDER BY hire_date DESC
LIMIT 7;

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

-- --------------------------------------------
--  21. All Mountain Peaks
-- --------------------------------------------

SELECT 
    peak_name
FROM
    peaks
ORDER BY peak_name ASC;

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

-- --------------------------------------------
--  24. All Diablo Characters
-- --------------------------------------------

SELECT 
    name
FROM
    characters
ORDER BY name ASC;