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

####################################################################################
## 04. Extract all travel cards  
####################################################################################

SELECT 
    card_number, job_during_journey
FROM
    travel_cards
ORDER BY card_number ASC;

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