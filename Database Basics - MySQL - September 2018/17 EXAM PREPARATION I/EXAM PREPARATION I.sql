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

###########################################################################
## 03. Update 
###########################################################################


###########################################################################
## 04. Delete  
###########################################################################


###########################################################################
## 05. Users  
###########################################################################

SELECT 
    u.id, u.username
FROM
    users AS u
ORDER BY u.id ASC;

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
    
###########################################################################
## 11. MostContributedRepository
###########################################################################

