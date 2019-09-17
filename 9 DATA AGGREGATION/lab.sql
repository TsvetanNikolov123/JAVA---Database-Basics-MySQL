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

################################################################
## 2. Average Salary
################################################################

SELECT 
    e.department_id, ROUND(AVG(salary), 2)
FROM
    employees AS e
GROUP BY e.department_id;

################################################################
## 3. Minimum Salary
################################################################

SELECT 
    e.department_id, ROUND(MIN(e.salary)) AS 'Min Salary'
FROM
    employees AS e
GROUP BY e.department_id
HAVING `Min Salary` > 800;

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







