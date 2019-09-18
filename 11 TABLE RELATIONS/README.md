11 Lab: Table Relations
=======================

---
---

This document defines the lab assignments for [“Databases Basics with MySQL
Course” at Software
University](https://softuni.bg/courses/databases-basics-mysql).

Get familiar with the **camp database**. You will use it in the following
exercises.

---

11.01 Mountains and Peaks
-------------------------

Write a query to create two tables – **mountains** and **peaks** and **link
their fields** properly. Tables should have:

-   Mountains:

-   id

-   name

-   Peaks:

-   id

-   name

-   mountain_id

Check your solutions using the “**Run Queries and Check DB**” strategy.
<br/>

### Solution: <a title="01 Mountains and Peaks" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/37b2e82258cded1e8ea4a96280aea25f8a4ce3c9/11%20TABLE%20RELATIONS/lab.sql#L2">01 Mountains and Peaks</a>
    ################################################################
    ## 1. Mountains and Peaks 
    ################################################################
    
    CREATE TABLE `mountains` (
        `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(50) NOT NULL
    );
    
    CREATE TABLE `peaks` (
        `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(50) NOT NULL,
        `mountain_id` INT,
        CONSTRAINT `fk_peaks_mountains` FOREIGN KEY (`mountain_id`)
            REFERENCES `mountains` (`id`)
    );
---
11.02 Trip Organization
-----------------------

Write a query to retrieve information about SoftUni camp’s transportation
organization. Get information about the drivers (**name** and **id**) and their
**vehicle type**. Submit your queries using the “**MySQL prepare DB and Run
Queries**” strategy.

### Example

| **driver_id** | **vehicle_type** | **driver_name** |
|---------------|------------------|-----------------|
| 1             | bus              | Simo Sheytanov  |
| 1             | van              | Simo Sheytanov  |
| 2             | van              | Roli Dimitrova  |
| …             | …                | …               |
<br/>

### Solution: <a title="02 Trip Organization" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/37b2e82258cded1e8ea4a96280aea25f8a4ce3c9/11%20TABLE%20RELATIONS/lab.sql#L19">02 Trip Organization</a>
    ###############################################################
    ## 2. Trip Organization 
    ###############################################################
    
    SELECT 
        `driver_id`,
        `vehicle_type`,
        CONCAT_WS(' ', `first_name`, `last_name`) AS `driver_name`
    FROM
        `vehicles` AS `v`
            JOIN
        `campers` AS `c` ON `v`.`driver_id` = `c`.`id`;
---
11.03 SoftUni Hiking
--------------------

Get information about the hiking **routes** – **starting point** and **ending
point**, and their **leaders** – **name** and **id**. Submit your queries using
the “**MySQL prepare DB and Run Queries**” strategy.

### Example

| **route_starting_point** | **route_ending_point** | **leader_id** | **leader_name** |
|--------------------------|------------------------|---------------|-----------------|
| Hotel Malyovitsa         | Malyovitsa Peak        | 3             | RoYaL Yonkov    |
| Hotel Malyovitsa         | Malyovitsa Hut         | 3             | RoYaL Yonkov    |
| Ribni Ezera Hut          | Rila Monastery         | 3             | RoYaL Yonkov    |
| Borovets                 | Musala Peak            | 4             | Ivan Ivanov     |
<br/>

### Solution: <a title="03 SoftUni Hiking" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/37b2e82258cded1e8ea4a96280aea25f8a4ce3c9/11%20TABLE%20RELATIONS/lab.sql#L32">03 SoftUni Hiking</a>
    ###############################################################
    ## 3. SoftUni Hiking 
    ###############################################################
    
    SELECT 
        `r`.`starting_point` AS `route_starting_point`,
        `r`.`end_point` AS `route_ending_point`,
        `r`.`leader_id`,
        CONCAT_WS(' ', `c`.`first_name`, `c`.`last_name`) AS `leader_name`
    FROM
        `routes` AS `r`
            JOIN
        `campers` AS `c` ON `r`.`leader_id` = `c`.`id`;
---
11.04 Delete Mountains
----------------------

Drop tables from the task 1.

Write a query to create a one-to-many relationship between a table, holding
information about peaks (id, name) and other - about mountains (id, name,
mountain_id), so that when an mountains gets removed from the database, all of
his peaks are deleted too.

Submit your queries using the “**MySQL run queries & check DB**” strategy.
<br/>

### Solution: <a title="04 Delete Mountains" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/37b2e82258cded1e8ea4a96280aea25f8a4ce3c9/11%20TABLE%20RELATIONS/lab.sql#L46">04 Delete Mountains</a>
    ###############################################################
    ## 4. Delete Mountains
    ###############################################################
    
    CREATE TABLE `mountains` (
        `id` INT PRIMARY KEY AUTO_INCREMENT,
        `name` VARCHAR(20) NOT NULL
    );
    
    CREATE TABLE `peaks` (
        `id` INT PRIMARY KEY AUTO_INCREMENT,
        `name` VARCHAR(20) NOT NULL,
        `mountain_id` INT,
        CONSTRAINT `fk_mountain_id` FOREIGN KEY (`mountain_id`)
            REFERENCES `mountains` (`id`)
            ON DELETE CASCADE
    );
---
11.05 Project Management DB\*
-----------------------------

Write a query to create a project management db according to the following E/R
Diagram:

<kbd><img src="https://user-images.githubusercontent.com/32310938/65185846-0c0f4e00-da71-11e9-885e-8f6b51ab9563.png" alt="alt text" width="900" height=""></kbd>

Submit your queries using the “**MySQL Run Queries and Check DB**” strategy.
<br/>

### Solution: <a title="05 Project Management DB\*" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/37b2e82258cded1e8ea4a96280aea25f8a4ce3c9/11%20TABLE%20RELATIONS/lab.sql#L64">05 Project Management DB\*</a>
    ###############################################################
    ## 5. Project Management DB 
    ###############################################################
    
    CREATE TABLE `employees` (
        `id` INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
        `first_name` VARCHAR(30),
        `last_name` VARCHAR(30),
        `project_id` INT(11)
    );
    
    CREATE TABLE `clients` (
        `id` INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
        `client_name` VARCHAR(100),
        `project_id` INT(11)
    );
    
    CREATE TABLE `projects` (
        `id` INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
        `client_id` INT(11),
        `project_lead_id` INT(11)
    );
    
    ALTER TABLE `employees`
    ADD CONSTRAINT `fk_employees_projects` FOREIGN KEY(`project_id`)
    REFERENCES `projects`(`id`);
    
    ALTER TABLE `clients`
    ADD CONSTRAINT `fk_clients_projects` FOREIGN KEY(`project_id`)
    REFERENCES `projects`(`id`);
    
    ALTER TABLE `projects`
    ADD CONSTRAINT `fk_projects_clients` FOREIGN KEY(`project_lead_id`)
    REFERENCES `clients`(`id`),
    ADD CONSTRAINT `fk_project_employees` FOREIGN KEY(`client_id`)
    REFERENCES `employees`(`id`)
    ;
---