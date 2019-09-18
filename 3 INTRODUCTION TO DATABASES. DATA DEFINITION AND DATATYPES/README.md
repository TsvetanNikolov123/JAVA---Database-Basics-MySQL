03 Lab: Data Definition and Data Types
======================================

---
---

This document defines the **lab exercise assignments** for the **"Databases
Basics - MySQL"**
[course](https://softuni.bg/trainings/2132/database-basics-mysql-september-2018/internal)
**\@ Software University**.

---

Part 1. Simple Database Operations Using MySQL Workbench
--------------------------------------------------------

### 1. Create New Database

First, create an empty database gamebar.
New “**Create Database**” window will appear. In the “**Name**” field type
the name of your new database – “**gamebar**”.

<img src="https://user-images.githubusercontent.com/32310938/65079384-b28f1c80-d9a7-11e9-8db0-1afa89763d03.jpg" alt="alt text" width="700" height=""><br/><br/>

After clicking "Apply" you can see new window with the query that is about to be
executed.

<img src="https://user-images.githubusercontent.com/32310938/65079402-c044a200-d9a7-11e9-94ba-e05951d698cd.jpg" alt="alt text" width="600" height="">

### 2. Create New Table

Right click the "**Tables**" and select "**Create Table**".

<img src="https://user-images.githubusercontent.com/32310938/65079408-c470bf80-d9a7-11e9-9c40-bfb6690be08d.jpg" alt="alt text" width="300" height=""><br/><br/>

Table creation tab will appear. In the “**Name**” field type the name of
your new table – “**employees**”. From the “**Columns**” tab you can start
creating your table fields.
First create an "**id**" field. It will be set to **INT** and
**AUTO_INCREMENT**. Select **Auto Increment (AI)**.

Make the “**id**” field to be **Primary Key (PK).**

<img src="https://user-images.githubusercontent.com/32310938/65079753-8627d000-d9a8-11e9-85d4-be2909918f9b.jpg" alt="alt text" width="600" height="">

Create 2 more fields – “**first_name**” and “**last_name**”.

<img src="https://user-images.githubusercontent.com/32310938/65079773-8cb64780-d9a8-11e9-9fc2-121cf753e277.jpg" alt="alt text" width="600" height=""><br/><br/>

Similar to “**employees**” create 2 more tables.

Table “**categories**”:

• id – **INT**, **primary key**, **AUTO_INCREMENT**;

• name – **VARCHAR**, **NOT NULL**;

Table “**products**”:

• id – **INT**, **primary key**, **AUTO_INCREMENT**;

• name – **VARCHAR**, **NOT NULL**;

• category_id – **INT**, **foreign key** referenced to the “**categories**”
table (**id**)

**Foreign keys** are created in the “**Foreign keys**” tab:

• **Reference table** – select the table from which you will choose a column
to link your foreign key – “**categories**”;

•   **Columns** – select the column you want to be set as foreign key –
    “**category_id**”;

• **Referenced columns** – select the column set to primary to link the foreign
key – “**id**”;

<img src="https://user-images.githubusercontent.com/32310938/65079792-917afb80-d9a8-11e9-8dfe-a9c4b9f3cf72.jpg" alt="alt text" width="600" height="">

###  3. Insert Data in Tables

Now we can start adding some records to our newly created tables. First
select the “**employees**” table:

<img src="https://user-images.githubusercontent.com/32310938/65079807-963faf80-d9a8-11e9-94ec-fd57186b8a62.jpg" alt="alt text" width="600" height="">


Select the **Edit button** to add new record.

Fill in the fields with values. Create 3 records in each table.

<img src="https://user-images.githubusercontent.com/32310938/65079823-9b9cfa00-d9a8-11e9-8bd1-f4102942d684.jpg" alt="alt text" width="600" height="">

### 4. Editing Data 

Data in tables can easily be edited with the GUI. Now that we’ve populated
our tables with test records we can edit them by **clicking on the value
field**.

<img src="https://user-images.githubusercontent.com/32310938/65079830-9fc91780-d9a8-11e9-8e43-4d675430c940.jpg" alt="alt text" width="600" height="">


### 5. Deleting Data

Data deletion is easy too. We just right click the row we want to delete and
select “**Delete Row(s)**”.

<img src="https://user-images.githubusercontent.com/32310938/65079837-a48dcb80-d9a8-11e9-994d-e8b7d2d13c9f.jpg" alt="alt text" width="600" height="">

### 6. Dropping Tables

We can delete the whole table, by selecting the one we want to delete, right
click and choose “**Drop Table…**”. **You cannot undo this action.**

<img src="https://user-images.githubusercontent.com/32310938/65079851-ac4d7000-d9a8-11e9-84d3-131daead6b0f.jpg" alt="alt text" width="300" height="">

<img src="https://user-images.githubusercontent.com/32310938/65079856-aeafca00-d9a8-11e9-9a06-0d89459800c6.jpg" alt="alt text" width="300" height="">

### 7. Dropping the Database

As table dropping, we can drop the database too. **This action cannot be
undone too.**

Right click the database you want to drop and select “**Drop Schema…**”.

<img src="https://user-images.githubusercontent.com/32310938/65079866-b2435100-d9a8-11e9-97a0-2d39ec8aedfa.jpg" alt="alt text" width="300" height="">

Part 2. Simple Database Operations Using Queries
------------------------------------------------

Now we are going to do the same steps from Part 1 using simple MySQL queries.

Exercises from this section should be submit in JUDGE – From 1 to 5.

Queries are written in the “Query” tab.

<img src="https://user-images.githubusercontent.com/32310938/65079876-b7a09b80-d9a8-11e9-8df4-8573f3fa58df.jpg" alt="alt text" width="400" height="">

---

## 1. Create New Database

Write a query that will create the “**gamebar**” database.

<br/>

### Solution: <a title="1. Create new database" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/a3a7202f7659f5e3f3e6557be908497539d90a33/3%20INTRODUCTION%20TO%20DATABASES.%20DATA%20DEFINITION%20AND%20DATATYPES/sql%20queries.sql#L2">1. Create new database</a>

    -- ------------------------------------------
    -- 1. Create new database				
    -- ------------------------------------------
    
    CREATE DATABASE gamebar;
    
    USE gamebar;

---

## 2. Create Tables 

When we create tables, we specify the database we want to add them to. This is done by using the “**USE**” clause.

**Submit your solutions in JUDGE without the** “**USE {database name}**”
**row.**

Table “**employees**”:

• id – **INT**, **primary key**, **AUTO_INCREMENT**;

• first_name – **VARCHAR**, **NOT NULL**;

• last_name – **VARCHAR**, **NOT NULL**;

Create the “**categories**” and “**products**” tables analogically:

Table “**categories**”:

• id – **INT**, **primary key**, **AUTO_INCREMENT**;

• name – **VARCHAR**, **NOT NULL**;

Table “**products**”:

• id – **INT**, **primary key**, **AUTO_INCREMENT**;

• name – **VARCHAR**, **NOT NULL**;

• category_id – **INT**, **NOT NULL**;

<br/>

### Solution: <a title="2. Create Tables" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/a3a7202f7659f5e3f3e6557be908497539d90a33/3%20INTRODUCTION%20TO%20DATABASES.%20DATA%20DEFINITION%20AND%20DATATYPES/sql%20queries.sql#L10">2. Create Tables</a>

    -- ------------------------------------------
    -- 2. Create Tables		
    -- ------------------------------------------
    
    CREATE TABLE employees (
        id INT PRIMARY KEY AUTO_INCREMENT,
        first_name VARCHAR(50) NOT NULL,
        last_name VARCHAR(50) NOT NULL
    );
    
    CREATE TABLE categories (
        id INT PRIMARY KEY AUTO_INCREMENT,
        name VARCHAR(50) NOT NULL
    );
    
    CREATE TABLE products(
    	id INT PRIMARY KEY AUTO_INCREMENT,
        name VARCHAR(50) NOT NULL, 
        category_id INT
    --    FOREIGN KEY (category_id) REFERENCES categories (id)
    );

---

## 3. Insert Data in Tables

Inserting data can be done with a query too. To do that we use the
“**INSERT**” clause. Populate the “**employees**” table with 3 test values.

<br/>

### Solution: <a title="3. Insert Data in Tables" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/a3a7202f7659f5e3f3e6557be908497539d90a33/3%20INTRODUCTION%20TO%20DATABASES.%20DATA%20DEFINITION%20AND%20DATATYPES/sql%20queries.sql#L32">3. Insert Data in Tables</a>

    -- ------------------------------------------
    -- 3. Insert Data in Tables				
    -- ------------------------------------------
    
    INSERT INTO employees(first_name, last_name)
    VALUES 	('Angel', 'Nasko'),
    		('Ranel', 'Rangelov'),
    		('Stefan', 'Xristov');

---
## 4. Alter Tables

Altering the tables is done via the “**ALTER TABLE**” clause. Add a new
column – “**middle_name**” to the “**employees**” table.

<br/>

### Solution: <a title="4. Alter Tables" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/a3a7202f7659f5e3f3e6557be908497539d90a33/3%20INTRODUCTION%20TO%20DATABASES.%20DATA%20DEFINITION%20AND%20DATATYPES/sql%20queries.sql#L41">4. Alter Tables</a>
    -- ------------------------------------------
    -- 4. Alter Table				
    -- ------------------------------------------
    
    ALTER TABLE employees
    ADD middle_name VARCHAR(50);
---
## 5. Adding Constraints

Create the connection via foreign key between the “**products**” and
“**categories**” tables that you’ve created earlier. Make “**category_id**”
**foreign key linked to “id” in the “categories” table**.

<br/>

### Solution: <a title="5. Adding Constraints" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/a3a7202f7659f5e3f3e6557be908497539d90a33/3%20INTRODUCTION%20TO%20DATABASES.%20DATA%20DEFINITION%20AND%20DATATYPES/sql%20queries.sql#L48">5. Adding Constraints</a>
    -- ------------------------------------------
    -- 5. Adding Constraints 				
    -- ------------------------------------------
    
    ALTER TABLE products
    	ADD CONSTRAINT FOREIGN KEY (category_id) 
        REFERENCES categories(id);

---
## 6. Modifying Columns

Change the property “**VARCHAR(50)”** to “**VARCHAR(100)**” to the
“**middle_name**” column in “**employees**” table.

<br/>

### Solution: <a title="6. Modifying Columns" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/a3a7202f7659f5e3f3e6557be908497539d90a33/3%20INTRODUCTION%20TO%20DATABASES.%20DATA%20DEFINITION%20AND%20DATATYPES/sql%20queries.sql#L56">6. Modifying Columns</a>
    -- ------------------------------------------
    -- 6. Modifying Columns				
    -- ------------------------------------------
        
    ALTER TABLE employees
    	MODIFY COLUMN middle_name VARCHAR(100);

---
## 7. Drop Database

Drop the “**gamebar**” database.

<br/>

### Solution: <a title="7. Drop Database" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/a3a7202f7659f5e3f3e6557be908497539d90a33/3%20INTRODUCTION%20TO%20DATABASES.%20DATA%20DEFINITION%20AND%20DATATYPES/sql%20queries.sql#L63">7. Drop Database</a>
    -- ------------------------------------------
    -- 7. Drop Database
    -- ------------------------------------------
    
    DROP DATABASE gamebar;
---