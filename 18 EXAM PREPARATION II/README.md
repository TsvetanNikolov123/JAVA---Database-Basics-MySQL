18 Exam Preparation II - Instagraph
===================================

---
---

You’ve most likely heard of Instagram. Well … There is a side project called
“Instagraph” which is the back-up data of Instagram. You are one of the few
selected to work in the multi-billion company, as one of the back-up database
managers. You’ll need to prove your skills by designing and manipulating data in
the Instagraph prototype.

---

Section 0: Database Overview
----------------------------

You have been given an Entity / Relationship Diagram of the Instagraph Database:

<kbd><img src="https://user-images.githubusercontent.com/32310938/65253511-68bb4900-db03-11e9-9d41-e0e5f09bbe39.png" alt="alt text" width="800" height=""></kbd>

The Instagraph Database needs to hold information about pictures, users, posts
and comments.

Your task is to create a database called **instagraph_db**. Then you will have
to create several **tables**.

-   **pictures** – contains information about the **pictures**.

-   **users** – contains information about the **users**.

    -   Each **user** may have a **profile picture**.

-   **posts** – contains information about the **posts**.

    -   Each **post** has a **user**.

    -   Each **post** has a **picture**.

-   **comments** – contains information about the **comments**.

    -   Each **comment** has a **user**.

    -   Each **comment** has a **post**.

-   **users_followers** – a **many** to **many** table connected to the
    **users**.

Section 1: Data Definition Language (DDL) – 40 pts
--------------------------------------------------

Make sure you implement the whole database correctly on your local machine, so
that you could work with it.

The instructions you’ll be given will be the minimal needed for you to implement
the database.

18.01 Table Design
------------------

You have been tasked to create the tables in the database by the following
models:

<img src="https://user-images.githubusercontent.com/32310938/65255186-221b1e00-db06-11e9-96bf-e33feb111b75.png" alt="alt text" width="900" height="">

<img src="https://user-images.githubusercontent.com/32310938/65255218-2f380d00-db06-11e9-9dce-6d3778130375.png" alt="alt text" width="900" height="">

<img src="https://user-images.githubusercontent.com/32310938/65255284-4971eb00-db06-11e9-9440-3b7fe442e6ca.png" alt="alt text" width="900" height="">

<img src="https://user-images.githubusercontent.com/32310938/65255319-58589d80-db06-11e9-84d1-9b25d50b28a3.png" alt="alt text" width="900" height="">

<img src="https://user-images.githubusercontent.com/32310938/65255351-63133280-db06-11e9-82f3-7542a5a6c4fb.png" alt="alt text" width="900" height="">

Submit your solutions in Judge on the first task. Submit **all** SQL table
creation statements.
<br/>

### Solution: <a title="01 Table Design" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/f73ac05253be1041bba8374f5ef8025b58845d1f/18%20EXAM%20PREPARATION%20II/18%20EXAM%20PREPARATION%20II.sql#L10">01 Table Design</a>
    DROP DATABASE IF EXISTS exam_prep_2;
    CREATE DATABASE exam_prep_2;
    USE exam_prep_2;
    
    
    ####################################################
    # Section 1: Data Definition Language (DDL) – 40 pts
    ####################################################
    
    # 01. Table Design
    
    CREATE TABLE pictures(
    id INT(11) PRIMARY KEY AUTO_INCREMENT,
    path VARCHAR(255) NOT NULL,
    size DECIMAL(10, 2) NOT NULL
    );
    
    CREATE TABLE users(
    id INT(11) PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(30) NOT NULL UNIQUE,
    password VARCHAR(30) NOT NULL,
    profile_picture_id INT(11)
    );
    
    CREATE TABLE posts(
    id INT(11) PRIMARY KEY AUTO_INCREMENT,
    caption VARCHAR(255) NOT NULL,
    user_id INT(11) NOT NULL,
    picture_id INT(11) NOT NULL
    );
    
    CREATE TABLE comments(
    id INT(11) PRIMARY KEY AUTO_INCREMENT,
    content VARCHAR(255) NOT NULL,
    user_id INT(11) NOT NULL,
    post_id INT(11) NOT NULL
    );
    
    CREATE TABLE users_followers(
    user_id INT(11),
    follower_id INT(11)
    );
    
    ALTER TABLE users
    ADD CONSTRAINT fk_users_pictures FOREIGN KEY(profile_picture_id)
    REFERENCES pictures(id);
    
    ALTER TABLE posts
    ADD CONSTRAINT fk_posts_users FOREIGN KEY(user_id)
    REFERENCES users(id);
    
    ALTER TABLE posts
    ADD CONSTRAINT fk_posts_pictures FOREIGN KEY(picture_id)
    REFERENCES pictures(id);
    
    ALTER TABLE comments
    ADD CONSTRAINT fk_comments_users FOREIGN KEY(user_id)
    REFERENCES users(id);
    
    ALTER TABLE comments
    ADD CONSTRAINT fk_comments_posts FOREIGN KEY(post_id)
    REFERENCES posts(id);
    
    
    ALTER TABLE users_followers
    ADD CONSTRAINT fk_users_followers_users FOREIGN KEY(user_id)
    REFERENCES users(id);
    
    ALTER TABLE users_followers
    ADD CONSTRAINT fk_users_followers_followers FOREIGN KEY(follower_id)
    REFERENCES users(id);
---
You will also be given a **data.sql** file. It will contain a **dataset** with
random data which you will need to **store** in your **local database**. This
data will be given to you so you will not have to think of data and lose
essential time in the process. The data is in the form of **INSERT** statement
queries.

Section 2: Data Manipulation Language (DML) – 30 pts
----------------------------------------------------

Here we need to do several manipulations in the database, like changing data,
adding data etc.

18.02 Data Insertion
--------------------

You will have to **INSERT** records of data into the **comments** table, based
on the **posts** table. For **posts** with **id** between **1** and **10**,
insert data in the **comments** table with the following values:

-   **content** – set it to **“Omg!{name}!This is so cool!”.** Where the
    **name** is the **username** of the **user** that **posted** the **post**.

-   **user_id** – **MULTIPLY** the **id** of the **post** by **3** and
    **DIVIDE** it by **2**.

    -   **ROUND** the resulting value **UP**.

-   **post_id** – the **post**’s id**.**
<br/>

### Solution: <a title="02 Data Insertion" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/f73ac05253be1041bba8374f5ef8025b58845d1f/18%20EXAM%20PREPARATION%20II/18%20EXAM%20PREPARATION%20II.sql#L77">02 Data Insertion</a>
    # 02. Data Insertion
    
    INSERT INTO comments (content, user_id, post_id)
    SELECT 
    	concat('Omg!', u.username ,'!This is so cool!'),
    	ceil(p.id*3/2),
    	p.id
     FROM users AS u
     JOIN posts AS p
     ON u.id = p.user_id
     WHERE p.id BETWEEN 1 AND 10;
---
18.03 Data Update
-----------------

**UPDATE** all **users** which do **NOT** have a **profile picture. Set** their
**profile picture id** to the **count** of **followers** they have. If they have
**0**, set it to the **user’s id**.
<br/>

### Solution: <a title="03 Data Update" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/f73ac05253be1041bba8374f5ef8025b58845d1f/18%20EXAM%20PREPARATION%20II/18%20EXAM%20PREPARATION%20II.sql#L89">03 Data Update</a>
    # 03. Data Update
    UPDATE users AS u
    JOIN  users_followers AS uf
    ON u.id = uf.user_id
    	JOIN 
    		(SELECT uf.user_id, count(uf.follower_id) AS `folowers_count` FROM  users_followers AS uf
    		GROUP BY uf.user_id
    		ORDER BY uf.user_id) AS `folowers`
    		ON u.id = `folowers`.user_id
    	SET u.profile_picture_id = CASE WHEN `folowers`.`folowers_count`= 0 THEN u.id
    	ELSE `folowers`.`folowers_count`
    	END
    WHERE u.profile_picture_id IS NULL;
---
18.04 Data Deletion
-------------------

Naturally, unpopular profiles are being treated as abandoned. **DELETE** all
**users** which do **NOT follow** anyone and **no one follows** them.
<br/>

### Solution: <a title="04 Data Deletion" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/f73ac05253be1041bba8374f5ef8025b58845d1f/18%20EXAM%20PREPARATION%20II/18%20EXAM%20PREPARATION%20II.sql#L103">04 Data Deletion</a>
    # 04. Data Deletion
    DELETE FROM users
    USING 
    	users
        LEFT JOIN users_followers
        ON users.id = users_followers.user_id
        WHERE users_followers.follower_id IS NULL;
---
Section 3: Querying – 100 pts
-----------------------------

And now we need to do some data extraction. **Note** that the **example
results** from **this section** use a **fresh database**. It is **highly
recommended** that you **clear** the **database** that has been **manipulated**
by the **previous problems** from the **DML section** and **insert again** the
**dataset** you’ve been given, to ensure **maximum consistency** with the
**examples** given in this section.

18.05 Users
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

### Solution: <a title="05 Users" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/f73ac05253be1041bba8374f5ef8025b58845d1f/18%20EXAM%20PREPARATION%20II/18%20EXAM%20PREPARATION%20II.sql#L115">05 Users</a>
    # 05. Users
    SELECT u.id, u.username FROM users AS u
    ORDER BY u.id ASC;
---
18.06 Cheaters
--------------

Apparently, there was a bug that allowed users to follow themselves. You need to
track them.

Extract from the database, all of the **users**, which follow themselves.

**ORDER** the results **ascending** by **user id**.

#### Required Columns

-   id (users)

-   username

#### Example

| **id** | **username** |
|--------|--------------|
| 2      | BlaAntigadsa |
| ...    | ...          |
<br/>

### Solution: <a title="06 Cheaters" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/f73ac05253be1041bba8374f5ef8025b58845d1f/18%20EXAM%20PREPARATION%20II/18%20EXAM%20PREPARATION%20II.sql#L119">06 Cheaters</a>
    # 06. Cheaters
    SELECT u.id, u.username FROM users_followers AS uf
    JOIN users AS u
    ON uf.user_id = u.id
    WHERE uf.user_id = uf.follower_id
    ORDER BY user_id;
---
18.07 High Quality Pictures
---------------------------

High quality pictures have bigger size, naturally. Extract from the database,
all of the **pictures**, which have **size**, **GREATER** than **50000**, and
their **path** contains “**jpeg**” or “**png**”.

**ORDER** the results **descending** by **picture size**.

#### Required Columns

-   id (pictures)

-   path

-   size

#### Example

| **id** | **path**                                                        | **size** |
|--------|-----------------------------------------------------------------|----------|
| 44     | src/folders/resources/images/profile/browsed/png/841p0J24Oa.png | 73543.36 |
| ...    | ...                                                             | ...      |
<br/>

### Solution: <a title="07 High Quality Pictures" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/f73ac05253be1041bba8374f5ef8025b58845d1f/18%20EXAM%20PREPARATION%20II/18%20EXAM%20PREPARATION%20II.sql#L126">07 High Quality Pictures</a>
    # 07. High Quality Pictures
    SELECT * FROM pictures AS pic
    WHERE pic.size > 50000 AND  (LOCATE('jpeg', pic.path) > 0 OR LOCATE('png', pic.path) > 0)
    ORDER BY pic.size DESC;
---
18.08 Comments and Users
------------------------

Extract from the database, all of the **comments**, and the users that posted
them, so that they end up in the following format:

{username} : {commentContent}

**ORDER** the results **descending** by **comment id**.

#### Required Columns

-   id (comments)

-   full_comment

#### Example

| **id** | **full_comment**                                          |
|--------|-----------------------------------------------------------|
| 50     | BlaSinduxrein : I cannot beleive this Simply amazing! Lol |
| ...    | ...                                                       |
<br/>

### Solution: <a title="08 Comments and Users" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/f73ac05253be1041bba8374f5ef8025b58845d1f/18%20EXAM%20PREPARATION%20II/18%20EXAM%20PREPARATION%20II.sql#L131">08 Comments and Users</a>
    # 08. Comments and Users
    SELECT c.id, concat(u.username,' : ',c.content) AS `full_comment`  FROM comments AS c
    JOIN users AS u
    ON c.user_id = u.id
    ORDER BY c.id DESC;
---
18.09 Profile Pictures
----------------------

Extract from the database, all of the **users**, which have the same **profile
picture**.

Extract the **size** of the **picture** and add “**KB**” to the **end** of it.

**ORDER** the results **ascending** by **user id**.

#### Required Columns

-   id (users)

-   username

-   size (pictures)

#### Example

| **id** | **username**  | **size**   |
|--------|---------------|------------|
| 7      | WhatTerrorBel | 44273.27KB |
| ...    | ...           | ...        |
<br/>

### Solution: <a title="09 Profile Pictures" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/f73ac05253be1041bba8374f5ef8025b58845d1f/18%20EXAM%20PREPARATION%20II/18%20EXAM%20PREPARATION%20II.sql#L137">09 Profile Pictures</a>
    # 09. Profile Pictures
    SELECT u.id, u.username, CONCAT(p.size,'KB')
    	FROM users AS u
        JOIN
    	(
    		SELECT u.profile_picture_id AS `pic_id`,  count(u.id) AS `count` FROM users AS u
    		GROUP BY u.profile_picture_id
    		HAVING `count` > 1
    	) AS `pics_count`
        ON u.profile_picture_id = `pics_count`.`pic_id`
        JOIN pictures AS p
        ON u.profile_picture_id = p.id
        ORDER BY u.id ASC;
---
18.10 Spam Posts
----------------

Extract from the database, the **top 5 posts**, in terms of **count** of
**comments** on them.

**ORDER** the results **descending** by **comments (count of comments)**, and
**ascending** by **post id**.

#### Required Columns

-   id (posts)

-   caption (posts)

-   comments (count of comments)

#### Example

| **id** | **caption**                                                          | **comments** |
|--------|----------------------------------------------------------------------|--------------|
| 36     | \#feminist \#happy \#ring \#my \#swag \#gerynikol \#sleepless \#yolo | 4            |
| ...    | ...                                                                  | ...          |
<br/>

### Solution: <a title="10 Spam Posts" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/f73ac05253be1041bba8374f5ef8025b58845d1f/18%20EXAM%20PREPARATION%20II/18%20EXAM%20PREPARATION%20II.sql#L152">10 Spam Posts</a>
    # 10. Spam Posts
    SELECT p.id, p.caption AS `caption`, count(c.id) AS `comments` FROM posts AS p
    LEFT JOIN comments AS c
    ON p.id = c.post_id
    GROUP BY p.id
    ORDER BY `comments` DESC, p.id
    LIMIT 5;
---
18.11 Most Popular User
-----------------------

Extract from the database, the **most popular user** – the **1st** in terms of
**count** of **followers**.

#### Required Columns

-   id (users)

-   username

-   posts (count of posts)

-   followers (count of followers)

#### Example

| **id** | **username** | **posts** | **followers** |
|--------|--------------|-----------|---------------|
| 19     | ZendArmyhow  | 3         | 9             |
<br/>

### Solution: <a title="11 Most Popular User" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/f73ac05253be1041bba8374f5ef8025b58845d1f/18%20EXAM%20PREPARATION%20II/18%20EXAM%20PREPARATION%20II.sql#L160">11 Most Popular User</a>
    # 11. Most Popular User
    SELECT 
    	`followers_count`.`user_id` AS `id`, 
        `followers_count`.username AS `username`,
        `posts_count`.`posts` AS `posts`,
        `followers_count`.`followers` AS `folowers` 
        FROM 
    (SELECT u.id AS `user_id`, u.username, COUNT(uf.follower_id) AS `followers` FROM users AS u
    JOIN users_followers AS uf
    ON u.id = uf.user_id
    GROUP BY u.id) AS `followers_count` 
    JOIN
    (SELECT u.id AS `user_id`, count(p.id) AS `posts` FROM posts AS p
    JOIN users AS u
    ON p.user_id = u.id
    GROUP BY u.id) AS `posts_count` 
    ON `followers_count`.`user_id` = `posts_count`.`user_id`
    ORDER BY `followers` DESC
    LIMIT 1; 
---
18.12 Commenting Myself
-----------------------

Extract from the database, for every **user** – the **count** of **comments** he
has on his **posts** by **himself**.

In other words, **extract** for each **user**, the **count** of **comments** he
has **placed** on his own **posts**.

**ORDER** the results **descending** by **my_comments (count of comments)**, and
**ascending** by **user id**.

#### Required Columns

-   id (users)

-   username

-   my_comments (count of comments)

#### Example

| **id** | **username**    | **my_comments** |
|--------|-----------------|-----------------|
| 10     | ScoreSinduxIana | 2               |
| ...    | ...             | ...             |
<br/>

### Solution: <a title="12 Commenting Myself" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/f73ac05253be1041bba8374f5ef8025b58845d1f/18%20EXAM%20PREPARATION%20II/18%20EXAM%20PREPARATION%20II.sql#L180">12 Commenting Myself</a>
    # 12. Commenting Myself
    SELECT u.id, u.username, count(`cq`.id) AS `my_comments` FROM users AS u
    LEFT JOIN 
    	(SELECT p.user_id, c.id FROM posts AS p
    	 LEFT JOIN comments AS c
    	 ON p.id = c.post_id
    	 WHERE c.user_id = p.user_id
    	 ORDER BY  p.user_id) AS `cq`
    ON u.id = `cq`.user_id
    GROUP BY u.id
    ORDER BY `my_comments` DESC, u.id;
        
    # Solution 2 with CASE
    SELECT 
    	u.id, 
        u.username, 
        (CASE WHEN  tb.my_comments IS NULL THEN 0 ELSE tb.my_comments END) as my_comments
    FROM users u
    LEFT JOIN
    	(SELECT p.id, p.user_id, count(p.id) as my_comments
    	FROM posts p
    	JOIN comments c
    	ON p.id = c.post_id
    	WHERE p.user_id = c.user_id
    	GROUP BY c.user_id) as tb
    ON u.id = tb.user_id
    ORDER BY tb.my_comments DESC, u.id;
---
18.13 User Top Posts
--------------------

Extract from the database, the for every **user** – the **post** with the
**HIGHEST count** of **comments** on it.

If the **user** has **NO posts**, **IGNORE** him.

If there are **2 posts** at the **top** with the **same count** of **comments**,
**pick** the **one** with the **LOWER id**.

**ORDER** the results **ascending** by **user id**.

#### Required Columns

-   id (users)

-   username

-   post (top post caption)

#### Example

| **id** | **username**    | **post**                                                 |
|--------|-----------------|----------------------------------------------------------|
| 1      | UnderSinduxrein | \#gerynikol \#happy \#sky \#epic \#everything \#suzanita |
| ...    | ...             | ...                                                      |
<br/>

### Solution: <a title="13 User Top Posts" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/f73ac05253be1041bba8374f5ef8025b58845d1f/18%20EXAM%20PREPARATION%20II/18%20EXAM%20PREPARATION%20II.sql#L208">13 User Top Posts</a>
    # 13. User Top Posts
    SELECT u.id, u.username,`cq2`.`caption` 
    FROM users AS u
    JOIN 
    	(SELECT `cq`.user_id,`cq`.`caption` ,  max(`cq`.`count`) FROM
    		(SELECT p.caption AS `caption`, p.id, p.user_id, count(c.id) AS `count` 
    			FROM posts AS p
    			LEFT JOIN comments AS c
    			ON p.id = c.post_id
    			GROUP BY p.id
    			ORDER BY `count` DESC, p.id) AS `cq`
    	GROUP BY `cq`.user_id) AS `cq2`
    ON u.id = `cq2`.user_id;
---
18.14 Posts and Commentators
----------------------------

Extract from the database, the for every **post** – the **count** of **users**
that have comments on it.

**NOTE**: **1 user** may have **more** than **1 comment** on the **post**.

**ORDER** the results **descending** by **users** (**count of users**), and
**ascending** by **post id**.

#### Required Columns

-   id (posts)

-   caption

-   users (count of users)

#### Example

| **id** | **caption**                                                          | **users** |
|--------|----------------------------------------------------------------------|-----------|
| 36     | \#feminist \#happy \#ring \#my \#swag \#gerynikol \#sleepless \#yolo | 4         |
| ...    | ...                                                                  | ...       |
<br/>

### Solution: <a title="14 Posts and Commentators" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/f73ac05253be1041bba8374f5ef8025b58845d1f/18%20EXAM%20PREPARATION%20II/18%20EXAM%20PREPARATION%20II.sql#L222">14 Posts and Commentators</a>
    # 14. Posts and Commentators
    SELECT 
    	p.id, 
        p.caption, 
        COUNT(DISTINCT c.user_id) AS `users` 
    FROM posts As p
    LEFT JOIN comments AS c
    ON p.id = c.post_id
    GROUP BY p.id
    ORDER BY `users` DESC, p.id;
---
Section 4: Programmability – 30 pts
-----------------------------------

The time has come for you to prove that you can be a little more dynamic on the
database. So you will have to write several procedures.

18.15 Post
----------

Create a stored procedure **udp_post** which accepts the following parameters:

-   username

-   password

-   caption

-   path

And checks the following things:

If the **password** does **NOT** match the **username** in the **users** table:

Throw an exception with error code ‘**45000**’ and message ‘**Password is
incorrect!**’.

If there is no **picture** with the given **path** in the **pictures** table:

Throw an exception with error code ‘**45000**’ and message ‘**The picture does
not exist!**’.

If **all checks pass**, extract the **id** of the corresponding **user**, from
the **users** table, then the **picture id** from the **pictures** table and
**INSERT** a new **post** into the **posts** table with the extracted data.

<kbd><img src="https://user-images.githubusercontent.com/32310938/65253515-6a850c80-db03-11e9-9506-f751e72d8277.png" alt="alt text" width="600" height=""></kbd>

#### Result

| **id** | **caption**       | **user_id** | **picture_id** |
|--------|-------------------|-------------|----------------|
| ...    | ...               |             | ...            |
| 41     | \#new \#procedure | 1           | 45             |
<br/>

### Solution: <a title="15 Post" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/f73ac05253be1041bba8374f5ef8025b58845d1f/18%20EXAM%20PREPARATION%20II/18%20EXAM%20PREPARATION%20II.sql#L237">15 Post</a>
    DROP PROCEDURE IF EXISTS udp_post; 
    # 15. Post
    
    DELIMITER $$
    CREATE PROCEDURE udp_post(username VARCHAR(30),password VARCHAR(30), caption VARCHAR(255), path VARCHAR(255))
    BEGIN
    	DECLARE user_id INT(11);
        DECLARE picture_id INT(11);
    	SET user_id := (SELECT u.id FROM users AS u WHERE u.username = username);
        SET picture_id := (SELECT p.id FROM users AS u
    					JOIN pictures AS p
    					ON u.profile_picture_id = p.id
                        WHERE p.path = path);
    
    	IF (SELECT COUNT(*) FROM users AS u WHERE u.id = user_id AND u.password = password) <> 1 
        THEN
    		SIGNAL SQLSTATE '45000'
    		SET MESSAGE_TEXT = 'Password is incorrect!' ;
        END IF;
    
    	IF (SELECT count(p.id) FROM users AS u
    		JOIN pictures AS p
    		ON u.profile_picture_id = p.id
    		WHERE p.path = path)<> 1 
    	THEN
    		SIGNAL SQLSTATE '45000'
    		SET MESSAGE_TEXT = 'The picture does not exist!' ;
    	END IF;
        
        INSERT INTO posts(caption, user_id, picture_id)
        VALUES(caption,user_id, picture_id);
    
    END$$
    
    DELIMITER ;
    
    CALL udp_post(
    	'UnderSinduxrein',
        '4l8nYGTKMW',
    	'#new #procedure',
        'src/folders/resources/images/story/reformatted/img/hRI3TW31rC.img'
    );
    
    SELECT p.id FROM users AS u
    		JOIN pictures AS p
    		ON u.profile_picture_id = p.id
    		WHERE p.path = 'src/folders/resources/images/profile/blocked/bmp/kjOJjKpKh4.bmp';

---
18.16 Filter
------------

Create a stored procedure **udp_filter** which accepts the following parameters:

-   hashtag

And extracts all **posts** that **CONTAIN** the **given hashtag** in their
**caption**.

The procedure should **extract** the **user’s username**.

The **hashtag** will be given **WITHOUT** the ‘**\#**’ sign.

The **posts** should be ordered **ascending** by **post id**.

<kbd><img src="https://user-images.githubusercontent.com/32310938/65253516-6bb63980-db03-11e9-9b4c-dcba7a6fadf6.png" alt="alt text" width="200" height=""></kbd>

#### Result

| **id** | **caption**                                                                       | **user**    |
|--------|-----------------------------------------------------------------------------------|-------------|
| 2      | \#cool \#justdoit \#sky \#ocean \#reason \#feminist \#gram \#faith \#hope \#insta | HighAsmahow |
| 7      | \#cool \#suzanita \#the \#dawn \#my                                               | HighAsmahow |
| ...    | ...                                                                               |             |
<br/>

### Solution: <a title="16 Filter" href="https://github.com/TsvetanNikolov123/JAVA---Database-Basics-MySQL/blob/f73ac05253be1041bba8374f5ef8025b58845d1f/18%20EXAM%20PREPARATION%20II/18%20EXAM%20PREPARATION%20II.sql#L284">16 Filter</a>
    # 16. Filter
    DROP PROCEDURE IF EXISTS udp_filter;
    
    DELIMITER $$
    CREATE PROCEDURE udp_filter(hashtag VARCHAR(50))
    BEGIN
    	SELECT p.id, p.caption, u.username FROM posts AS p
    	JOIN users AS u
    	ON p.user_id = u.id
    	WHERE locate(concat('#',hashtag),p.caption) > 0
    	ORDER BY p.id;
    END $$
    
    DELIMITER ;
    
    CALL udp_filter('cool');
    
    SELECT p.id, p.caption, u.username FROM posts AS p
    JOIN users AS u
    ON p.user_id = u.id
    WHERE locate(concat('#','cool'),p.caption) > 0
    ORDER BY p.id;
---