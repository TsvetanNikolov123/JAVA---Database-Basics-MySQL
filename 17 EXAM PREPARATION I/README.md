17 Exam Preparation I - Buhtig Source Control
=============================================

---
---

You’ve most likely heard of Github. Well … There is a side project called
“Buhtig” which is the back-up data of Github. You are one of the few selected to
work in the multi-billion company, as one of the back-up database managers.
You’ll need to prove your skills by designing and manipulating data in the
Instagraph prototype.

---

Section 0: Database Overview
============================

You have been given an Entity / Relationship Diagram of the Buhtig Database:

<kbd><img src="https://user-images.githubusercontent.com/32310938/65248462-e0d14100-dafa-11e9-9426-7f9498917e77.png" alt="alt text" width="900" height=""></kbd>

The **Buhtig Database** needs to hold information about **users**,
**repositories**, **issues**, **commits** & **files**.

Your task is to create a database called **buhtig**. Then you will have to
create several **tables**.

-   **users** – contains information about the **users**.

-   **repositories** – contains information about the **repositories**.

-   **repositories_contributors** – a **many** to **many mapping** table between
    the **repositories** and the **users**.

-   **issues** – contains information about the **issues**.

    -   Each **issue** has a **repository**.

    -   Each **issue** has an **assignee** (**user**).

-   **commits** – contains information about the **commits**.

    -   Each **commit MAY** have an **issue**.

    -   Each **commit** has a **repository**.

    -   Each **commit** has a **contributor** (**user**)**.**

-   **files** – contains information about the **files**.

    -   Each **file MAY** have a **parent** (**file**).

    -   Each **file** has a **commit**.

Section 1: Data Definition Language (DDL) – 40 pts
==================================================

Make sure you implement the whole database correctly on your local machine, so
that you could work with it.

The instructions you’ll be given will be the minimal needed for you to implement
the database.

17.01 Table Design
------------------

You have been tasked to create the tables in the database by the following
models:

<img src="https://user-images.githubusercontent.com/32310938/65251055-50492f80-daff-11e9-91e4-1c903384e780.png" alt="alt text" width="800" height="">

<img src="https://user-images.githubusercontent.com/32310938/65251085-5f2fe200-daff-11e9-95bc-63793147edee.png" alt="alt text" width="800" height="">

<img src="https://user-images.githubusercontent.com/32310938/65251107-6c4cd100-daff-11e9-82fa-fae14b8d8aa6.png" alt="alt text" width="800" height="">

<img src="https://user-images.githubusercontent.com/32310938/65251145-7a9aed00-daff-11e9-9a3f-89e437065f9d.png" alt="alt text" width="800" height="">

<img src="https://user-images.githubusercontent.com/32310938/65251173-871f4580-daff-11e9-96d9-3a0546ad262d.png" alt="alt text" width="800" height="">

<img src="https://user-images.githubusercontent.com/32310938/65251195-91414400-daff-11e9-8205-52753c78ba39.png" alt="alt text" width="800" height="">

Submit your solutions in Judge on the first task. Submit **all** SQL table
creation statements.
<br/>

### Solution: <a title="01 Table Design" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/f54e7e37e26278ae28ac6408cd9bf4a85ed5aaf7/17%20EXAM%20PREPARATION%20I/EXAM%20PREPARATION%20I.sql#L2">01 Table Design</a>
    ####################################################################
    ## 01. Table Design
    ####################################################################
    
    CREATE DATABASE IF NOT EXISTS buhtig;
    use buhtig;
    
    CREATE TABLE users (
        id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        username VARCHAR(30) NOT NULL UNIQUE,
        `password` VARCHAR(30) NOT NULL,
        email VARCHAR(50) NOT NULL
    );
    
    CREATE TABLE repositories (
        id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        `name` VARCHAR(50) NOT NULL
    );
    
    CREATE TABLE repositories_contributors (
        repository_id INT(11),
        contributor_id INT(11),
        #CONSTRAINT pk_repositories_contributors PRIMARY KEY (repository_id , contributor_id),
        CONSTRAINT fk_repositories_contributors_repositories FOREIGN KEY (repository_id)
            REFERENCES repositories (id),
        CONSTRAINT fk_repositories_contributors_users FOREIGN KEY (contributor_id)
            REFERENCES users (id)
    );
    
    CREATE TABLE issues (
        id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
        title VARCHAR(255) NOT NULL,
        issue_status VARCHAR(6) NOT NULL,
        repository_id INT(11) NOT NULL,
        assignee_id INT(11) NOT NULL,
        CONSTRAINT fk_issues_repositories FOREIGN KEY (repository_id)
            REFERENCES repositories (id),
        CONSTRAINT fk_issues_users FOREIGN KEY (assignee_id)
            REFERENCES users (id)
    );
    
    CREATE TABLE commits (
        id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
        message VARCHAR(255) NOT NULL,
        issue_id INT(11),
        repository_id INT(11) NOT NULL,
        contributor_id INT(11) NOT NULL,
        CONSTRAINT fk_commits_issues FOREIGN KEY (issue_id)
            REFERENCES issues (id),
        CONSTRAINT fk_commits_repositories FOREIGN KEY (repository_id)
            REFERENCES repositories (id),
        CONSTRAINT fk_commits_users FOREIGN KEY (contributor_id)
            REFERENCES users (id)
    );
    
    CREATE TABLE files (
        `id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        `name` VARCHAR(100) NOT NULL,
        size DECIMAL(10 , 2 ) NOT NULL,
        parent_id INT,
        commit_id INT NOT NULL,
        CONSTRAINT fk_files_files FOREIGN KEY (parent_id)
            REFERENCES files (id),
        CONSTRAINT fk_files_commits FOREIGN KEY (commit_id)
            REFERENCES commits (id)
    );
---
You will also be given a **data.sql** file. It will contain a **dataset** with
random data which you will need to **store** in your **local database**. This
data will be given to you so you will not have to think of data and lose
essential time in the process. The data is in the form of **INSERT** statement
queries.

Section 2: Data Manipulation Language (DML) – 30 pts
====================================================

Here we need to do several manipulations in the database, like changing data,
adding data etc.

17.02 Data Insertion
--------------------

You will have to **INSERT** records of data into the **issues** table, based on
the **files** table. For **files** with **id** between **46** and **50**
(**inclusive**), **insert data** in the **issues** table with the **following
values**:

-   **title** – set it to **“Critical Problem With {fileName}!”.** Where the
    **fileName** is the **name** of the **file**.

-   **issue_status** – set it to “**open**”.

-   **repository_id** – **MULTIPLY** the **id** of the **file** by **2** and
    **DIVIDE** it by **3**.

    -   **ROUND** the resulting value **UP**.

-   **assignee_id** – the **file**’s **commit**’s **contributor**’s **id.**
<br/>

### Solution: <a title="02 Data Insertion" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/f54e7e37e26278ae28ac6408cd9bf4a85ed5aaf7/17%20EXAM%20PREPARATION%20I/EXAM%20PREPARATION%20I.sql#L69">02 Data Insertion</a>
    ###########################################################################
    ## 02. Insert 
    ###########################################################################
    
    INSERT INTO issues (title, issue_status, repository_id, assignee_id)
    SELECT
    	concat('Critical Problem With ', f.name, '!'),
        'open' AS issue_status,
        ceil(f.id * 2 / 3) AS repository_id,
        c.contributor_id AS assignee_id
    FROM files AS f
        JOIN commits AS c
        ON f.commit_id = c.id
    WHERE f.id BETWEEN 46 AND 50;
---
17.03 Data Update
-----------------

**UPDATE** all **contributors** to **repositories** which have the **same id**
(**value**) as the **repository** they **contribute** to.

**SET** them as a **contributor** to the **repository** with the **lowest id**
(by **value**) which has **no contributors**.

If there aren’t any **repositories** with no **contributors** do nothing.
<br/>

### Solution: <a title="03 Data Update" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/f54e7e37e26278ae28ac6408cd9bf4a85ed5aaf7/17%20EXAM%20PREPARATION%20I/EXAM%20PREPARATION%20I.sql#L84">03 Data Update</a>
    ###########################################################################
    ## 03. Update 
    ###########################################################################
    
    INSERT INTO repositories_contributors(contributor_id, repository_id)
    SELECT *
    FROM (
    	SELECT contributor_id
        FROM repositories_contributors
        WHERE contributor_id = repository_id) AS t1
    CROSS JOIN (
    	SELECT MIN(r.id)
        FROM repositories AS r
        LEFT JOIN repositories_contributors AS rc
        ON r.id = rc.repository_id
        WHERE rc.repository_id IS NULL) AS t2;
    

---
17.04 Data Deletion
-------------------

**Buhtig** is all about activity, and activity is expressed in issues. Issues
indicate the constant process of development. Naturally, inactive repositories
are being treated as abandoned. **DELETE** all **repositories** which do **NOT
have any issues**.
<br/>

### Solution: <a title="04 Data Deletion" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/f54e7e37e26278ae28ac6408cd9bf4a85ed5aaf7/17%20EXAM%20PREPARATION%20I/EXAM%20PREPARATION%20I.sql#L102">04 Data Deletion</a>
    ###########################################################################
    ## 04. Delete  
    ###########################################################################
    
    DELETE FROM repositories
    WHERE id NOT IN (
    	SELECT repository_id
        FROM issues
    );
    
    ###########################################################################
    ###########################################################################
    
    DELETE FROM repositories USING repositories
            LEFT JOIN
        issues ON issues.repository_id = repositories.id 
    WHERE
        issues.id IS NULL;

---

Section 3: Querying – 100 pts
=============================

And now we need to do some data extraction. **Note** that the **example
results** from **this section** use a **fresh database**. It is **highly
recommended** that you **clear** the **database** that has been **manipulated**
by the **previous problems** from the **DML section** and **insert again** the
**dataset** you’ve been given, to ensure **maximum consistency** with the
**examples** given in this section.

17.05 Users
-----------

Extract from the database, all of the **users**.

**ORDER** the results **ascending** by **user id**.

#### Required Columns

-   id (users)

-   username

#### Example

| **id** | **username**    |
|--------|-----------------|
| 1      | UnderSinduxrein |
| ...    | ...             |
<br/>

### Solution: <a title="05 Users" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/f54e7e37e26278ae28ac6408cd9bf4a85ed5aaf7/17%20EXAM%20PREPARATION%20I/EXAM%20PREPARATION%20I.sql#L121">05 Users</a>
    ###########################################################################
    ## 05. Users  
    ###########################################################################
    
    SELECT 
        u.id, u.username
    FROM
        users AS u
    ORDER BY u.id ASC;
---
17.06 Lucky Numbers
-------------------

When a contributor has the same id as the repository he contributes to, it’s a
lucky number.

**Extract** from the database, all of the **repositories**, which have the
**same id** as their **contributor**.

**ORDER** the results **ascending** by **repository id**.

#### Required Columns

-   repository_id

-   contributor_id

#### Example

| **repository_id** | **contributor_id** |
|-------------------|--------------------|
| 1                 | 1                  |
| 3                 | 3                  |
| ...               | ...                |
<br/>

### Solution: <a title="06 Lucky Numbers" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/f54e7e37e26278ae28ac6408cd9bf4a85ed5aaf7/17%20EXAM%20PREPARATION%20I/EXAM%20PREPARATION%20I.sql#L131">06 Lucky Numbers</a>
    ###########################################################################
    ## 06. Lucky Numbers   
    ###########################################################################
    
    SELECT 
        repository_id, contributor_id
    FROM
        repositories_contributors
    WHERE
        repository_id = contributor_id
    ORDER BY repository_id ASC;
---
17.07 Heavy HTML
----------------

There are some pretty big HTML files in the Buhtig database… Unnaturally big.
Extract from the database all of the **files**, which have **size**, **GREATER**
than **1000**, and their **name** contains “**html**”.

**ORDER** the results **descending** by **size**.

#### Required Columns

-   id (files)

-   name

-   size

#### Example

| **id** | **name**     | **size** |
|--------|--------------|----------|
| 49     | compile.html | 27402.59 |
| ...    | ...          | ...      |
<br/>

### Solution: <a title="07 Heavy HTML" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/f54e7e37e26278ae28ac6408cd9bf4a85ed5aaf7/17%20EXAM%20PREPARATION%20I/EXAM%20PREPARATION%20I.sql#L143">07 Heavy HTML</a>
    ###########################################################################
    ## 07. Heavy HTML
    ###########################################################################
    
    SELECT 
        f.id, f.name, f.size
    FROM
        files AS f
    WHERE
        (f.size > 1000 AND f.name LIKE '%html%')
    ORDER BY f.size DESC;
---
17.08 Issues and Users
----------------------

Extract from the database, all of the **issues**, and the **users** that are
**assigned** to them, so that they end up in the following format:

{username} : {issueTitle}

**ORDER** the results **descending** by **issue id**.

#### Required Columns

-   id (issues)

-   issue_assignee

#### Example

| **id** | **issue_assignee**                                                            |
|--------|-------------------------------------------------------------------------------|
| 75     | TheDivineBel : Critical bug in Controller.php ruins application when executed |
| ...    | ...                                                                           |
<br/>

### Solution: <a title="08 Issues and Users" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/f54e7e37e26278ae28ac6408cd9bf4a85ed5aaf7/17%20EXAM%20PREPARATION%20I/EXAM%20PREPARATION%20I.sql#L155">08 Issues and Users</a>
    ###########################################################################
    ## 08. IssuesAndUsers
    ###########################################################################
    
    SELECT 
        i.id, CONCAT(u.username, ' : ', i.title)
    FROM
        issues AS i
            JOIN
        users AS u ON i.assignee_id = u.id
    ORDER BY i.id DESC;
---
17.09 Non-Directory Files
-------------------------

Some of the files are **Directories**, because they are a **parent** to **some
file**. Try to find those, which aren’t.

Extract from the database all of the **files**, which are **NOT** a **parent**
to **any other file**.

Extract the **size** of the **file** and add “**KB**” to the **end** of it.

**ORDER** the results **ascending** by **file id**.

#### Required Columns

-   id (files)

-   name

-   size

#### Example

| **id** | **Name**        | **size**   |
|--------|-----------------|------------|
| 6      | Controller.json | 14034.87KB |
| ...    | ...             | ...        |
<br/>

### Solution: <a title="09 Non-Directory Files" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/f54e7e37e26278ae28ac6408cd9bf4a85ed5aaf7/17%20EXAM%20PREPARATION%20I/EXAM%20PREPARATION%20I.sql#L167">09 Non-Directory Files</a>
    ###########################################################################
    ## 09. NonDirectoryFiles 
    ###########################################################################
    
    SELECT 
        f.id, f.name, CONCAT(f.size, 'KB')
    FROM
        files AS f
            LEFT JOIN
        files AS d ON f.id = d.parent_id
    WHERE
        d.parent_id IS NULL
    ORDER BY f.id ASC;
---
17.10 Active Repositories
-------------------------

Extract from the database, the **top 5 repositories**, in terms of **count** of
**issues** on them.

**ORDER** the results **descending** by **issues (count of issues)**, and
**ascending** by **repository id**.

#### Required Columns

-   id (repositories)

-   name (repositories)

-   issues (count of issues)

#### Example

| **id** | **name**  | **issues** |
|--------|-----------|------------|
| 11     | KartinaJS | 5          |
| ...    | ...       | ...        |
<br/>

### Solution: <a title="10 Active Repositories" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/f54e7e37e26278ae28ac6408cd9bf4a85ed5aaf7/17%20EXAM%20PREPARATION%20I/EXAM%20PREPARATION%20I.sql#L181">10 Active Repositories</a>
    ###########################################################################
    ## 10. ActiveRepositories 
    ###########################################################################
    
    SELECT 
        r.id, r.name, COUNT(i.repository_id) AS count_of_issues
    FROM
        issues AS i
            JOIN
        repositories AS r ON i.repository_id = r.id
    GROUP BY i.repository_id
    ORDER BY count_of_issues DESC , i.repository_id ASC
    LIMIT 5;
---
17.11 Most Contributed Repository
---------------------------------

Extract from the database, the **top 1 repository** in terms of **count** of
**contributors**.

If there are **2 repositories** have the **same count** of **contributors**,
**order** them **ascending**, by **id**.

#### Required Columns

-   id (repositories)

-   name (repositories)

-   commits (count of commits)

-   contributors (count of contributors)

#### Example

| **id** | **name** | **commits** | **contributors** |
|--------|----------|-------------|------------------|
| 22     | Maxima   | 1           | 6                |
<br/>

### Solution: <a title="11 Most Contributed Repository" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/f54e7e37e26278ae28ac6408cd9bf4a85ed5aaf7/17%20EXAM%20PREPARATION%20I/EXAM%20PREPARATION%20I.sql#L195">11 Most Contributed Repository</a>
    ###########################################################################
    ## 11. MostContributedRepository
    ###########################################################################
    
    SELECT 
        r.id,
        r.name,
        (	SELECT 
                COUNT(*)
            FROM
                commits
            WHERE
                commits.repository_id = r.id) AS commits_count,
        COUNT(u.id) AS count_of_contributors
    FROM
        repositories AS r
            JOIN
        repositories_contributors AS rc ON r.id = rc.repository_id
            JOIN
        users AS u ON u.id = rc.contributor_id
    GROUP BY r.id
    ORDER BY count_of_contributors DESC , r.id ASC
    LIMIT 1;
---
17.12 Fixing My Own Problems
----------------------------

Extract from the database, for every **user** – the **count** of **commits** he
has on **issues** that were **assigned** to **him**.

**ORDER** the results **descending** by **commits (count of commits)**, and
**ascending** by **user id**.

#### Required Columns

-   id (users)

-   username

-   commits (count of commits)

#### Example

| **id** | **username**    | **commits** |
|--------|-----------------|-------------|
| 1      | UnderSinduxrein | 1           |
| ...    | ...             | ...         |
<br/>

### Solution: <a title="12 Fixing My Own Problems" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/f54e7e37e26278ae28ac6408cd9bf4a85ed5aaf7/17%20EXAM%20PREPARATION%20I/EXAM%20PREPARATION%20I.sql#L219">12 Fixing My Own Problems</a>
    ###########################################################################
    ## 12. FixingMyOwnProblems 
    ###########################################################################
    
    SELECT 
        u.id, u.username, COUNT(c.id) AS `commits`
    FROM
        users AS u
            LEFT JOIN
        issues AS i ON u.id = i.assignee_id
            LEFT JOIN
        commits AS c ON c.issue_id = i.id
            AND c.contributor_id = i.assignee_id
    GROUP BY i.assignee_id
    ORDER BY `commits` DESC , u.id;
---
17.13 Recursive Commits
-----------------------

**Extract** from the **database** all **files** which **are a parent** to
**their parent**.

In other words, **file** “**a**” is a **parent** to **file** “**b**” and
**file** “**b**” is a **parent** to **file** “**a**”.

Extract the **file name** (but only the **name**, without the **extension**). If
its “**index.html**” you have to extract “**index**”, as “**file**”.

Extract the **count** of **commits** which **hold** the **full file name** (with
**extension**) in their **messages** as “**recursive_count**”.

**ORDER** the results **ascending** by **file (file name)**.

#### Required Columns

-   file (fileName)

-   recursive_count

#### Example

| **file** | **recursive_count** |
|----------|---------------------|
| Find     | 2                   |
| ...      | ...                 |
<br/>

### Solution: <a title="13 Recursive Commits" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/f54e7e37e26278ae28ac6408cd9bf4a85ed5aaf7/17%20EXAM%20PREPARATION%20I/EXAM%20PREPARATION%20I.sql#L235">13 Recursive Commits</a>
    ###########################################################################
    ## 13. RecursiveCommits 
    ###########################################################################
    
    SELECT 
        LEFT(f1.name, LOCATE('.', f1.name) - 1) AS `file`,
        COUNT(c.id) AS `recursive_count`
    FROM
        files AS f1
            JOIN
        files AS f2 ON f1.id = f2.parent_id
            AND f1.parent_id = f2.id
            AND f1.id != f2.id
            LEFT JOIN
        commits AS c ON c.message LIKE CONCAT('%', f1.name, '%')
    GROUP BY f1.id
    ORDER BY f1.name;
    
    ##########################################################################
    ##########################################################################
    
    SELECT 
        LEFT(f.name, LOCATE('.', f.name)-1) AS `file`,
        (SELECT count(*) FROM commits AS c
    		WHERE locate(f.name, c.message) > 0 ) AS `recursive_count` 
        FROM files AS f
    JOIN files AS pf
    ON f.id = pf.parent_id AND f.parent_id = pf.id AND f.id != pf.id
    JOIN commits AS c
    ON f.commit_id = c.id
    ORDER BY  f.name;
    
---
17.14 Repositories and Commits
------------------------------

Extract from the database, for every **repository** – the **count** of **users**
that have **committed** to it.

**NOTE**: **1 user** may have **more** than **1 commit** on the **repository**.

**ORDER** the results **descending** by **users** (**count of users**), and
**ascending** by **repository id**.

#### Required Columns

-   id (repositories)

-   name

-   users (count of users)

#### Example

| **id** | **name** | **users** |
|--------|----------|-----------|
| 1      | WorkWork | 4         |
| ...    | ...      | ...       |
<br/>

### Solution: <a title="14 Repositories and Commits" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/f54e7e37e26278ae28ac6408cd9bf4a85ed5aaf7/17%20EXAM%20PREPARATION%20I/EXAM%20PREPARATION%20I.sql#L267">14 Repositories and Commits</a>
    ###########################################################################
    ## 14. RepositoriesAndCommits
    ###########################################################################
    
    SELECT 
        r.id, r.name, COUNT(DISTINCT c.contributor_id) AS users
    FROM
        repositories AS r
            LEFT JOIN
        commits AS c ON r.id = c.repository_id
    GROUP BY r.id
    ORDER BY users DESC , r.id;
---
Section 4: Programmability – 30 pts
-----------------------------------

The time has come for you to prove that you can be a little more dynamic on the
database. So, you will have to write several procedures.

17.15 Commit
------------

Create a stored procedure **udp_commit** which accepts the following parameters:

-   username

-   password

-   message

-   issue_id

And checks the following things:

If the **username** does **NOT exist** in the **users** table:

Throw an exception with error code ‘**45000**’ and message ‘**No such user!**’.

If the **password** does **NOT** match the **username** in the **users** table:

Throw an exception with error code ‘**45000**’ and message ‘**Password is
incorrect!**’.

If there is no **issue** with the given **id** in the **issues** table:

Throw an exception with error code ‘**45000**’ and message ‘**The issue does not
exist!**’.

If **all checks pass**, extract the **id** of the corresponding **user**, from
the **users** table, then the **repository_id** of the **issue**, from the
**issues** table, and **INSERT** a new **commit** into the **commits** table
with the **extracted data**.

The **procedure** should also **update** the **issue**’s **status** to
‘**closed**’.

<kbd><img src="https://user-images.githubusercontent.com/32310938/65248469-e3339b00-dafa-11e9-9d40-2d11c3749bb0.png" alt="alt text" width="800" height=""></kbd>

#### Result

| **id** | **message**                                         | **issue_id** | **repository_id** | **contributor_id** |
|--------|-----------------------------------------------------|--------------|-------------------|--------------------|
| ...    | ...                                                 | ...          | ...               | ...                |
| 51     | Fixed Issue: Invalid welcoming message in READ.html | 2            | 34                | 6                  |
<br/>

### Solution: <a title="15 Commit" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/f54e7e37e26278ae28ac6408cd9bf4a85ed5aaf7/17%20EXAM%20PREPARATION%20I/EXAM%20PREPARATION%20I.sql#L280">15 Commit</a>
    ###########################################################################
    ## 15. Commit
    ###########################################################################
     DROP PROCEDURE IF EXISTS udp_commit;
    
    DELIMITER $$
    CREATE PROCEDURE udp_commit(username VARCHAR(30), password VARCHAR(30), message VARCHAR(255), issue_id int(11))
    BEGIN
    	DECLARE user_id INT(11);
        DECLARE repo_id INT(11);
    
    	SET user_id := (SELECT u.id FROM users AS u WHERE u.username = username);
        SET repo_id := (SELECT i.repository_id FROM issues AS i WHERE  i.id = 2);
        
        IF 1 != (SELECT COUNT(*) FROM users WHERE users.id = user_id) THEN
         SIGNAL SQLSTATE '45000'
    	 SET MESSAGE_TEXT = 'No such user!';
        END IF;
        
         IF 1 != (SELECT COUNT(*) FROM users WHERE users.id = user_id AND users.password = password) THEN
         SIGNAL SQLSTATE '45000'
    	 SET MESSAGE_TEXT = 'Password is incorrect!';
        END IF;
        
    	IF 1 != (SELECT COUNT(*) FROM issues WHERE issues.id = issue_id) THEN
    	SIGNAL SQLSTATE '45000'
    	SET MESSAGE_TEXT = 'The issue does not exist!';
        END IF;
        
        INSERT INTO commits(message, issue_id, repository_id, contributor_id)
        VALUES(message, issue_id, repo_id, user_id);
        
        UPDATE issues
        SET issue_status = 'closed'
        WHERE id = issue_id;
    
    END $$
    
    DELIMITER ;
    
    CALL udp_commit(
    'WhoDenoteBel',
     'ajmISQi*',
     'Fixed issue: Invalid welcoming message in Read.html',
     2 
     );
---
17.16 Filter Extensions
-----------------------

Create a stored procedure **udp_findbyextension** which accepts the following
parameters:

-   extension

And extracts all **files** that **have** the **given extension**. (like
**index.html** for example)

The procedure should **extract** the **file**’s **id**, **name** and **size**.

The **file**’s **size** should have “**KB**” attached to it as a **suffix**.

The **files** should be ordered **ascending** by **file id**.

<kbd><img src="https://user-images.githubusercontent.com/32310938/65248477-e4fd5e80-dafa-11e9-9b52-dba3d7b01629.png" alt="alt text" width="400" height=""></kbd>

#### Result

| **id** | **caption** | **user**  |
|--------|-------------|-----------|
| 13     | Beat.html   | 907.30KB  |
| 17     | Login.html  | 2863.23KB |
| ...    | ...         |           |
<br/>

### Solution: <a title="16 Filter Extensions" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/f54e7e37e26278ae28ac6408cd9bf4a85ed5aaf7/17%20EXAM%20PREPARATION%20I/EXAM%20PREPARATION%20I.sql#L327">16 Filter Extensions</a>
    ###########################################################################
    ## 16. Filter Extensions
    ###########################################################################
    
    DROP PROCEDURE IF EXISTS udp_findbyextension;
    
    DELIMITER $$
    CREATE PROCEDURE udp_findbyextension(extension VARCHAR(50))
    BEGIN
    	SELECT f.id, f.name AS `caption`, concat(f.size, 'KB')  FROM files AS f
    	WHERE f.name LIKE concat('%.', extension)
    	ORDER BY f.id;
    END$$
    
    DELIMITER ;
    
    CALL udp_findbyextension('html');
---