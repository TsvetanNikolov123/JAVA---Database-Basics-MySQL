19 EXAM - Colonial Journey Management System
============================================

2000 years from now, the known space is colonized by the human race. However,
the four Citadel Council races are planning to populate new home worlds in the
SoftUnia Galaxy as part of a strategy called the SoftUnia Initiative. 20000
citizens are send aboard space transportation vessels. The Council has asked you
to create a Colonization Management system so they can keep track of the
colonists' journeys trough the stars.

Section: Database Overview
--------------------------

You have given an Entity / Relationship Diagram of the CJMS Database:

<kbd><img src="https://user-images.githubusercontent.com/32310938/65257615-277a6780-db0a-11e9-9175-977f47eca181.png" alt="alt text" width="900" height=""></kbd>

The CJMS Database holds information about colonists, their travel cards,
information about the journeys, types of space vessels and destination planets.
Your task is to create a database called
**colonial_journey_management_system_db**. Then you will have to create several
**tables**.

-   **planets** – contains information about **planets**.

-   **spaceports** – contains information about **space ports**.

-   **spaceships –** contains information about **space ships**.

-   **colonists –** contains information about **colonists**.

-   **journeys –** contains information about **journeys**.

-   **travel\_ cards –** contains information about **travel cards**.

Make sure you implement the whole database correctly on your local machine, so
that you could work with it.

The instructions you are given will be the minimal needed for you to implement
the database.

Section: Data Definition Language (DDL) – 40pts
-----------------------------------------------

You have been tasked to create the tables in the database by the following
models:

<img src="https://user-images.githubusercontent.com/32310938/65258028-e20a6a00-db0a-11e9-91a8-853c2ffed1e2.png" alt="alt text" width="900" height="">

<img src="https://user-images.githubusercontent.com/32310938/65258052-ecc4ff00-db0a-11e9-8f7c-8a89a73a2b64.png" alt="alt text" width="900" height="">

<img src="https://user-images.githubusercontent.com/32310938/65258083-f77f9400-db0a-11e9-81fa-3819f079f1c0.png" alt="alt text" width="900" height="">

<img src="https://user-images.githubusercontent.com/32310938/65258157-13833580-db0b-11e9-933b-c68ca293bcd7.png" alt="alt text" width="900" height="">

<img src="https://user-images.githubusercontent.com/32310938/65258185-1b42da00-db0b-11e9-8e37-8f0dd8561291.png" alt="alt text" width="900" height="">

<img src="https://user-images.githubusercontent.com/32310938/65258226-36154e80-db0b-11e9-9c33-4e65c0691e7e.png" alt="alt text" width="900" height="">

Submit your solutions in Judge for task 00. Table Design. Submit **all** SQL
table creation statements.

<br/>

### Solution: <a title="Create Database" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/4c431c094d8a636859087e21c6baa49c99559c1a/19%20EXAM/exam21.10.2018.sql#L1">Create Database</a>
    CREATE DATABASE IF NOT EXISTS colonial_journey_management_system_db;
    USE colonial_journey_management_system_db;
    
    CREATE TABLE planets (
        id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        name VARCHAR(30) NOT NULL
    );
    
    CREATE TABLE spaceports (
        id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        name VARCHAR(50) NOT NULL,
        planet_id INT NOT NULL,
        CONSTRAINT fk_spaceports_planets FOREIGN KEY (planet_id)
            REFERENCES planets (id)
    );
    
    CREATE TABLE spaceships (
        id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        name VARCHAR(50) NOT NULL,
        manufacturer VARCHAR(30) NOT NULL,
        light_speed_rate INT DEFAULT 0
    );
    
    CREATE TABLE colonists (
        id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        first_name VARCHAR(20) NOT NULL,
        last_name VARCHAR(20) NOT NULL,
        ucn CHAR(10) NOT NULL UNIQUE,
        birth_date DATE NOT NULL
    );
    
    CREATE TABLE journeys (
        id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        journey_start DATETIME NOT NULL,
        journey_end DATETIME NOT NULL,
        purpose ENUM('Medical', 'Technical', 'Educational', 'Military'),
        destination_spaceport_id INT,
        spaceship_id INT,
        CONSTRAINT fk_journeys_spaceports FOREIGN KEY (destination_spaceport_id)
            REFERENCES spaceports (id),
        CONSTRAINT fk_journeys_spaceships FOREIGN KEY (spaceship_id)
            REFERENCES spaceships (id)
    );
    
    CREATE TABLE travel_cards (
        id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        card_number CHAR(10) NOT NULL UNIQUE,
        job_during_journey ENUM('Pilot', 'Engineer', 'Trooper', 'Cleaner', 'Cook'),
        colonist_id INT,
        journey_id INT,
        CONSTRAINT fk_travel_cards_colonist FOREIGN KEY (colonist_id)
            REFERENCES colonists (id),
        CONSTRAINT fk_travel_card_colonists FOREIGN KEY (journey_id)
            REFERENCES journeys (id)
    );
---

You will also be given a **data.sql** file. It will contain a **dataset** with
random data which you will need to **store** in your **local database**. This
data will be given to you so you will not have to think of data and lose
essential time in the process. The data is in the form of **INSERT** statement
queries.

Section: Data Manipulation Language (DML) – 30 pts
--------------------------------------------------

Here we need to do several manipulations in the database, like changing data,
adding data etc.

19.01 Data Insertion
--------------------

You will have to **INSERT** records of data into the **travel_cards** table,
based on the **colonists** table.

For colonists with id between **96** and **100(inclusive)**, **insert data** in
the **travel_cards** table with the following values:

-   For **colonists** born after ‘**1980-01-01**’, the **card_number** must be
    combination between the **year of birth**, **day** and the **first 4
    digits** from the **ucn**. For the rest – **year of birth**, **month** and
    the **last 4 digits** from the **ucn**.

-   For **colonists** with **id** that can be divided by **2** without
    remainder, job must be **‘Pilot’,** for colonists with id that can be
    divided by **3** without remainder – ‘**Cook**’, and everyone else –
    ‘**Engineer**’.

-   **Journey id** is the **first digit** from the colonist’s **ucn**.
<br/>

### Solution: <a title="01 Data Insertion" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/4c431c094d8a636859087e21c6baa49c99559c1a/19%20EXAM/exam21.10.2018.sql#L58">01 Data Insertion</a>
    ####################################################################################
    ## 01. Insert ****
    ####################################################################################
    
    INSERT INTO travel_cards (card_number, job_during_journey, colonist_id, journey_id)
    SELECT
    	CASE
    		WHEN c.birth_date >= str_to_date('01/01/1980', '%m/%d/%Y')
    			THEN concat(year(c.birth_date), day(c.birth_date), substring(c.ucn FROM 1 FOR 4))
    		ELSE concat(year(c.birth_date), month(c.birth_date), SUBSTRING(c.ucn FROM -4 FOR 4))
    	END as card_number,
    	
        CASE
    		WHEN c.id mod 2 = 0 THEN 'Pilot'
    		WHEN c.id mod 3 = 0 THEN 'Cook'
    		ELSE 'Engineer'
    	END as job_during_journey_id,
        
        c.id as colonist_id,
        
        substr(c.ucn FROM 1 FOR 1) as journey_id
        
    FROM colonists as c
    WHERE c.id >= 96
    	AND c.id <= 100;
---
19.02 Data Update
-----------------

**UPDATE** those journeys’ purpose, which meet the following conditions:

-   If the journey’s **id** is dividable by **2** without remainder –
    **‘Medical’**.

-   If the journey’s **id** is dividable by **3** without remainder –
    **‘Technical’**.

-   If the journey’s **id** is dividable by **5** without remainder –
    **‘Educational’**.

-   If the journey’s **id** is dividable by **7** without remainder –
    **‘Military’**.
<br/>

### Solution: <a title="02 Data Update" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/4c431c094d8a636859087e21c6baa49c99559c1a/19%20EXAM/exam21.10.2018.sql#L84">02 Data Update</a>
    ####################################################################################
    ## 02. Update ****
    ####################################################################################
    
    UPDATE journeys AS j
    SET j.purpose = CASE
    					WHEN j.id % 2 = 0 THEN'Medical'
                        WHEN j.id % 3 = 0 THEN 'Technical'
                        WHEN j.id % 5 = 0 THEN 'Educational'
                        WHEN j.id % 7 = 0 THEN 'Military'
                        ELSE j.purpose
    				END;
---
19.03 Data Deletion
-------------------

**REMOVE** from **colonists**, those which **are not** assigned to any
**journey**.
<br/>

### Solution: <a title="03 Data Deletion" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/4c431c094d8a636859087e21c6baa49c99559c1a/19%20EXAM/exam21.10.2018.sql#L97">03 Data Deletion</a>
    ####################################################################################
    ## 03. Delete ****
    ####################################################################################   
    
    DELETE c 
    	FROM colonists AS c
            LEFT JOIN
        travel_cards AS tc ON c.id = tc.colonist_id
            LEFT JOIN
        journeys AS j ON tc.journey_id = j.id 
    WHERE
        j.id IS NULL;
---

Section: Querying – 100 pts
---------------------------

And now we need to do some data extraction. **Note** that the **example
results** from **this section** use a **fresh database**. It is **highly
recommended** that you **clear** the **database** that has been **manipulated**
by the **previous problems** from the **DML section** and **insert again** the
**dataset** you’ve been given, to ensure **maximum consistency** with the
**examples** given in this section.

19.04 Extract all travel cards
------------------------------

Extract from the database, all **travel cards.** Sort the results by **card
number ascending.**

#### Required Columns

-   **card_number**

-   **job_during_journey**

#### Example

| **card_number** | **job_during_journey** |
|-----------------|------------------------|
| **0032031181**  | Engineer               |
| 0037637193      | Engineer               |
| ...             | ...                    |
<br/>

### Solution: <a title="04 Extract all travel cards" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/4c431c094d8a636859087e21c6baa49c99559c1a/19%20EXAM/exam21.10.2018.sql#L110">04 Extract all travel cards</a>
    ####################################################################################
    ## 04. Extract all travel cards  
    ####################################################################################
    
    SELECT 
        card_number, job_during_journey
    FROM
        travel_cards
    ORDER BY card_number ASC;
---
19.05 Extract all colonists
---------------------------

Extract from the database, all **colonists.** Sort the results by **first
name**, them by **last name**, and finally by **id** in **ascending** order.

#### Required Columns

-   **id**

-   **full_name(**first_name + last_name separated by a single space**)**

-   **ucn**

#### Example

| **id** | **full_name**      | **ucn**    |
|--------|--------------------|------------|
| 35     | Aigneis McConville | 9225403496 |
| 92     | Althea Kelinge     | 9998159318 |
| ...    | ...                | ...        |
<br/>

### Solution: <a title="05 Extract all colonists" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/4c431c094d8a636859087e21c6baa49c99559c1a/19%20EXAM/exam21.10.2018.sql#L120">05 Extract all colonists</a>
    ####################################################################################
    ## 05. Extract all colonists   
    ####################################################################################
    
    SELECT 
        c.id,
        CONCAT(c.first_name, ' ', c.last_name) AS 'full_name',
        c.ucn
    FROM
        colonists AS c
    ORDER BY c.first_name ASC , c.last_name ASC , c.ucn ASC;  
---
19.06 Extract all military journeys
-----------------------------------

Extract from the database, all **Military** journeys. Sort the results
**ascending** by **journey start.**

#### Required Columns

-   **id**

-   **journey_start**

-   **journey_end**

#### Example

| **id** | **journey_start**   | **journey_end**     |
|--------|---------------------|---------------------|
| 7      | 2019-01-04 23:44:40 | 2049-12-09 04:00:54 |
| 3      | 2019-02-21 22:06:34 | 2049-01-03 11:00:22 |
| ...    | ...                 | ...                 |
<br/>

### Solution: <a title="06 Extract all military journeys" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/4c431c094d8a636859087e21c6baa49c99559c1a/19%20EXAM/exam21.10.2018.sql#L132">06 Extract all military journeys</a>
    ####################################################################################
    ## 06.	Extract all military journeys 
    ####################################################################################
    
    SELECT 
        j.id, j.journey_start, j.journey_end
    FROM
        journeys AS j
    WHERE
        j.purpose LIKE 'Military'
    ORDER BY j.journey_start ASC;
---
19.07 Extract all pilots
------------------------

Extract from the database all colonists, which have a **pilot job.** Sort the
result by **id, ascending.**

#### Required Columns

-   **id**

-   **full_name**

#### Example

| **id** | **full_name** |
|--------|---------------|
| 6      | Clark Cowan   |
| 18     | Wald Bim      |
| ...    | ...           |
<br/>

### Solution: <a title="07 Extract all pilots" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/4c431c094d8a636859087e21c6baa49c99559c1a/19%20EXAM/exam21.10.2018.sql#L144">07 Extract all pilots</a>
    ####################################################################################
    ## 07.	Extract all pilots
    ####################################################################################
    
    SELECT 
        c.id, CONCAT(c.first_name, ' ', c.last_name) AS 'full_name'
    FROM
        colonists AS c
            JOIN
        travel_cards AS tc ON c.id = tc.colonist_id
    WHERE
        tc.job_during_journey LIKE 'Pilot'
    ORDER BY c.id ASC;
---
19.08 Count all colonists that are on technical journey
-------------------------------------------------------

Count all colonists, that are on **technical journey.**

#### Required Columns

-   **Count**

#### Example

| **count** |
|-----------|
| 16        |
<br/>

### Solution: <a title="08 Count all colonists that are on technical journey" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/4c431c094d8a636859087e21c6baa49c99559c1a/19%20EXAM/exam21.10.2018.sql#L158">08 Count all colonists that are on technical journey</a>
    ####################################################################################
    ## 08.	Count all colonists ****
    ####################################################################################
    
    SELECT 
        COUNT(c.id) AS count
    FROM
        colonists AS c
            LEFT JOIN
        travel_cards tc ON c.id = tc.colonist_id
            LEFT JOIN
        journeys j ON tc.journey_id = j.id
    WHERE
        j.purpose = 'Technical';
    
    /*SELECT 
        COUNT(c.id) AS `count`
    FROM
        colonists AS c
            JOIN
        travel_cards AS tc ON c.id = tc.colonist_id
            JOIN
        journeys AS j ON tc.journey_id = j.id
    GROUP BY j.purpose
    HAVING j.purpose LIKE 'Technical';*/
---
19.09 Extract the fastest spaceship
-----------------------------------

Extract from the database the fastest **spaceship** and its destination
**spaceport name**. In other words, the ship with the **highest** light speed
rate.

#### Required Columns

-   **spaceship_name**

-   **spaceport_name**

#### Example

| **spaceship_name** | **spaceport_name** |
|--------------------|--------------------|
| SSE Priestess      | Yggdrasil Station  |
<br/>

### Solution: <a title="09 Extract the fastest spaceship" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/4c431c094d8a636859087e21c6baa49c99559c1a/19%20EXAM/exam21.10.2018.sql#L184">09 Extract the fastest spaceship</a>
    ####################################################################################
    ## 09.Extract the fastest spaceship
    ####################################################################################
    
    SELECT 
        s.name AS spaceship_name, sp.name AS spaceport_name
    FROM
        spaceships AS s
            JOIN
        journeys AS j ON s.id = j.spaceship_id
            JOIN
        spaceports AS sp ON j.destination_spaceport_id = sp.id
    ORDER BY s.light_speed_rate DESC
    LIMIT 1;
---
19.10 Extract spaceships with pilots younger than 30 years
----------------------------------------------------------

Extract from the database those **spaceships**, which have pilots, **younger**
than 30 years old. In other words, 30 years from 01/01/2019. Sort the results
**alphabetically** by spaceship **name**.

#### Required Columns

-   **name**

-   **manufacturer**

#### Example

| **name** | **manufacturer** |
|----------|------------------|
| Anarchy  | Fivebridge       |
| ...      | ...              |
<br/>

### Solution: <a title="10 Extract spaceships with pilots younger than 30 years" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/4c431c094d8a636859087e21c6baa49c99559c1a/19%20EXAM/exam21.10.2018.sql#L199">10 Extract spaceships with pilots younger than 30 years</a>
    ####################################################################################
    ## 10.	Extract - pilots younger than 30 years
    ####################################################################################
    
    SELECT 
        s.name,
        s.manufacturer
    FROM
        spaceships AS s
            JOIN
        journeys AS j ON s.id = j.spaceship_id
            JOIN
        travel_cards AS tc ON j.id = tc.journey_id
            JOIN
        colonists AS c ON tc.colonist_id = c.id
    WHERE
        YEAR('2019-01-01') - YEAR(c.birth_date) < 30
            AND tc.job_during_journey LIKE 'Pilot'
    ORDER BY s.name;
---
19.11 Extract all educational mission planets and spaceports
------------------------------------------------------------

Extract from the database names of all **planets** and their **spaceports**,
which have **educational** missions. Sort the results by **spaceport name** in
**descending** order.

#### Required Columns

-   **planet_name**

-   **spaceport_name**

#### Example

| **planet_name** | **spaceport_name** |
|-----------------|--------------------|
| Kascarth        | Yggdrasil Station  |
| Lescore         | Tartarus           |
| ...             | ...                |
<br/>

### Solution: <a title="11 Extract all educational mission planets and spaceports" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/4c431c094d8a636859087e21c6baa49c99559c1a/19%20EXAM/exam21.10.2018.sql#L219">11 Extract all educational mission planets and spaceports</a>
    ####################################################################################
    ## 11.	Extract all educational mission 
    ####################################################################################
    
    SELECT 
        p.name AS `planet_name`, s.name AS `spaceport_name`
    FROM
        planets AS p
            JOIN
        spaceports AS s ON s.planet_id = p.id
            JOIN
        journeys AS j ON j.destination_spaceport_id = s.id
        WHERE 
    		j.purpose LIKE 'Educational'
    	ORDER BY s.name DESC;
---
19.12 Extract all planets and their journey count
-------------------------------------------------

Extract from the database all **planets’ names** and their **journeys count**.
Order the results by journeys **count**, **descending** and by **planet name
ascending**.

#### Required Columns

-   **planet_name**

-   **journeys_count**

#### Example

| **planet_name** | **journeys_count** |
|-----------------|--------------------|
| Otroyphus       | 4                  |
| Eipra           | 2                  |
| ...             | ...                |
<br/>

### Solution: <a title="12 Extract all planets and their journey count" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/4c431c094d8a636859087e21c6baa49c99559c1a/19%20EXAM/exam21.10.2018.sql#L235">12 Extract all planets and their journey count</a>
    ####################################################################################
    ## 12.	Extract all planets and their journey count  ****
    ####################################################################################
    
    SELECT 
        p.name, COUNT(j.id)
    FROM
        planets AS p
            JOIN
        spaceports AS s ON p.id = s.planet_id
            JOIN
        journeys AS j ON s.id = j.destination_spaceport_id
    GROUP BY p.name
    ORDER BY COUNT(J.id) DESC , P.name;
    
    /*
    SELECT 
        p.name AS `planet_name`,
       ( s.asd * j.bsd) AS journeys_count
    FROM
       planets AS p
            JOIN
        spaceports AS s ON p.id = s.planet_id
        (SELECT 
                COUNT(s.planet_id)
            FROM
               spaceports
           GROUP BY s.planet_id) as asd
          JOIN
       journeys AS j ON j.destination_spaceport_id = s.id
       (SELECT 
               COUNT(j.destination_spaceport_id)
           FROM
               journeys AS j
           GROUP BY j.destination_spaceport_id) as bsd
    ORDER BY journeys_count DESC , p.name ASC;
    */

---
19.13 Extract the shortest journey
----------------------------------

Extract from the database the **shortest journey,** its destination **spaceport
name**, **planet name** and **purpose**.

#### Required Columns

-   **Id**

-   **planet_name**

-   **spaceport_name**

-   **journey_purpose**

#### Example

| **id** | **planet_name** | **spaceport_name** | **journey_purpose** |
|--------|-----------------|--------------------|---------------------|
| 3      | Casmadus        | Minerva Station    | Military            |
<br/>

### Solution: <a title="13 Extract the shortest journey" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/4c431c094d8a636859087e21c6baa49c99559c1a/19%20EXAM/exam21.10.2018.sql#L273">13 Extract the shortest journey</a>
    ####################################################################################
    ## 13. Extract the shortest journey  
    ####################################################################################
    
    SELECT 
        j.id AS `id`,
        p.name AS `planet_name`,
        s.name AS `spaceport_name`,
        j.purpose AS `journey_purpose`
    FROM
        journeys AS j
            JOIN
        spaceports AS s ON j.destination_spaceport_id = s.id
            JOIN
        planets AS p ON s.planet_id = p.id
    ORDER BY DATEDIFF(j.journey_end, j.journey_start) ASC
    LIMIT 1;
---
19.14 Extract the less popular job
----------------------------------

Extract from the database the **less popular job** in the **longest journey**.
In other words, the job with less assign colonists.

#### Required Columns

-   **job_name**

#### Example

| **job_name** |
|--------------|
| Engineer     |
<br/>

### Solution: <a title="14 Extract the less popular job" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/4c431c094d8a636859087e21c6baa49c99559c1a/19%20EXAM/exam21.10.2018.sql#L291">14 Extract the less popular job</a>
    ####################################################################################
    ## 14.	Extract the less popular job  ****
    ####################################################################################
    
    SELECT 
        (SELECT 
                tc.job_during_journey
            FROM
                travel_cards AS tc
            WHERE
                longest_journey.id = tc.journey_id
            GROUP BY tc.job_during_journey
            ORDER BY COUNT(tc.id) ASC
            LIMIT 1) AS job_name
    FROM
        (SELECT 
            *
        FROM
            journeys j
        ORDER BY DATEDIFF(j.journey_end, j.journey_start) DESC
        LIMIT 1) AS longest_journey;
    ;
    
    /*
    SELECT 
       count(tc.job_during_journey)
    FROM
        journeys AS j
            JOIN
        travel_cards AS tc
       GROUP BY tc.job_during_journey
    ORDER BY DATEDIFF(j.journey_end, j.journey_start) DESC
    LIMIT 1;
    SELECT 
        t.job_during_journey
    FROM
        travel_cards AS t
    GROUP BY colonist_id
    */    
---
Section: Programmability – 30 pts
---------------------------------

19.15 Get colonists count
-------------------------

Create a **user defined function** with the name
**udf_count_colonists_by_destination_planet (planet_name VARCHAR (30))** that
receives **planet name** and returns the count of all colonists sent to that
planet.

#### Example

<img src="https://user-images.githubusercontent.com/32310938/65259283-1aab4300-db0d-11e9-8b31-11fade9975be.png" alt="alt text" width="900" height="">
<br/>

### Solution: <a title="15 Get colonists count" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/4c431c094d8a636859087e21c6baa49c99559c1a/19%20EXAM/exam21.10.2018.sql#L332">15 Get colonists count</a>
    ####################################################################################
    ## 15. Get colonists count  ****
    ####################################################################################
    /*
    DELIMITER $$
    DROP FUNCTION IF EXISTS udf_count_colonists_by_destination_planet;
    CREATE FUNCTION udf_count_colonists_by_destination_planet (planet_name VARCHAR (30))
    RETURNS INT
    BEGIN
    	DECLARE result INT;
        
        set result := (
        SELECT 
    		COUNT(colonist_id)
    FROM
        planets AS p
            JOIN
        spaceports AS s ON p.id = s.planet_id
            JOIN
        journeys AS j ON j.destination_spaceport_id = s.id
            JOIN
        travel_cards AS tc ON j.id = tc.journey_id
        WHERE p.name = planet_name
    	GROUP BY s.planet_id);
        
        
    	RETURN result;
    END $$
    DELIMITER ;
    */
    
    delimiter $$
    create function udf_count_colonists_by_destination_planet(planet_name VARCHAR(30))
      RETURNS int DETERMINISTIC
      begin
        declare result int;
        select count(p.id) into result
        from planets p
               join spaceports s on p.id = s.planet_id
               join journeys j on s.id = j.destination_spaceport_id
               join travel_cards tc on j.id = tc.journey_id
               join colonists c on tc.colonist_id = c.id
        where p.name = planet_name;
        return result;
      end
    $$
    
    
    SELECT p.name, udf_count_colonists_by_destination_planet('Otroyphus') AS count
    FROM planets AS p
    WHERE p.name = 'Otroyphus';

---
19.16 Modify spaceship
----------------------

Create a **user defined stored procedure** with the name
**udp_modify_spaceship_light_speed_rate(spaceship_name VARCHAR(50),
light_speed_rate_increse INT(11))** that receives a **spaceship name** and
**light speed increase value** and increases spaceship light speed **only if**
the given spaceship **exists**. If the modifying is not successful **rollback**
any changes and throw an **exception** with **error code ‘45000’** and
**message**: “Spaceship you are trying to modify does not exists.”

#### Example

<img src="https://user-images.githubusercontent.com/32310938/65259159-e59ef080-db0c-11e9-95be-32af27cd26db.png" alt="alt text" width="900" height="">
<br/>

### Solution: <a title="16 Modify spaceship" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/4c431c094d8a636859087e21c6baa49c99559c1a/19%20EXAM/exam21.10.2018.sql#L385">16 Modify spaceship</a>
    ####################################################################################
    ## 16. Modify spaceship  ****
    ####################################################################################
    
    
    delimiter $$
    create procedure udp_modify_spaceship_light_speed_rate(spaceship_name VARCHAR(50), light_speed_rate_increse INT(11))
      begin
        IF ((SELECT COUNT(*) from spaceships WHERE name = spaceship_name)) <> 1
        THEN
          SIGNAL SQLSTATE '45000'
          SET MESSAGE_TEXT = 'Spaceship you are trying to modify does not exists.';
        END IF;
        update spaceships set light_speed_rate = light_speed_rate + light_speed_rate_increse where name = spaceship_name;
      end
    $$
    
    
    
    delimiter ;
    CALL udp_modify_spaceship_light_speed_rate('Na Pesho koraba', 1914);
    SELECT name, light_speed_rate
    FROM spaceships
    WHERE name = 'Na Pesho koraba';
    
    
    
    
    CALL udp_modify_spaceship_light_speed_rate('USS Templar', 5);
    SELECT name, light_speed_rate
    FROM spaceships
    WHERE name = 'USS Templar';
---