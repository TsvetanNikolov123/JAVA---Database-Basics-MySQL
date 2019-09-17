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

-- -----------------------------------------------
-- 09. Length of Last Name
-- -----------------------------------------------

SELECT 
    first_name, last_name
FROM
    employees
WHERE
    CHAR_LENGTH(last_name) = 5;

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

-- -----------------------------------------------
-- 13. User Email Providers
-- -----------------------------------------------

SELECT 
    user_name,
    SUBSTRING_INDEX(email, '@', - 1) AS 'Email Provider'
FROM
    users
ORDER BY `Email Provider` ASC , user_name ASC;

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

