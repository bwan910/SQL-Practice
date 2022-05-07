/*
Practice with: https://www.techbeamers.com/sql-query-questions-answers-for-practice/
*/

create database sql_practicing;  /*command to create a database*/
show databases;				/*to display all databases*/

use sql_practicing;  /*command to use this database of sql_practicing*/

show tables

CREATE TABLE Worker
(
	WORKER_ID INT(3) NOT NULL PRIMARY KEY,
    FIRST_NAME VARCHAR(20),
    LAST_NAME VARCHAR(20),
    SALARY INT(10),
    JOINING_DATE DATETIME,
    DEPARTMENT VARCHAR(20)
);

select * from Worker

INSERT INTO Worker (WORKER_ID,FIRST_NAME,LAST_NAME,SALARY,JOINING_DATE,DEPARTMENT)VALUES 
('001', 'Monika', 'Arora','100000','2014-02-20 09:00:00','HR'),
(002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
(003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
(004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
(005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
(006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
(007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
(008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');

select count(*) from Worker

CREATE TABLE Bonus
(
	WORKER_REF_ID INT(3) NOT NULL,
    BONUS_DATE DATETIME,
    BONUS_AMOUNT INT(10),
    FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
                ON DELETE CASCADE
);

INSERT INTO Bonus 
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(001, 5000, '16-02-20'),
		(002, 3000, '16-06-11'),
		(003, 4000, '16-02-20'),
		(001, 4500, '16-02-20'),
		(002, 3500, '16-06-11');

select * from Bonus

CREATE TABLE Title
(
	WORKER_REF_ID INT(3) NOT NULL,
    WORKER_TITLE VARCHAR(25),
    AFFECTED_FROM DATETIME,
    FOREIGN KEY(WORKER_REF_ID) REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Title 
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (001, 'Manager', '2016-02-20 00:00:00'),
 (002, 'Executive', '2016-06-11 00:00:00'),
 (008, 'Executive', '2016-06-11 00:00:00'),
 (005, 'Manager', '2016-06-11 00:00:00'),
 (004, 'Asst. Manager', '2016-06-11 00:00:00'),
 (007, 'Executive', '2016-06-11 00:00:00'),
 (006, 'Lead', '2016-06-11 00:00:00'),
 (003, 'Lead', '2016-06-11 00:00:00');

select * from Title

/*Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.*/
SELECT FIRST_NAME as WORKER_NAME from Worker;

/*Q-2. Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.*/
SELECT UPPER(FIRST_NAME) from Worker;

/*Q-3. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.*/
SELECT DISTINCT DEPARTMENT from Worker;

/*Q-4. Write an SQL query to print the first three characters of  FIRST_NAME from Worker table.*/
SELECT SUBSTRING(FIRST_NAME,1,3) 
     FROM Worker;
     
/*Q-5. Write an SQL query to find the position of the alphabet (‘a’) in the first name column ‘Amitabh’ from Worker table.*/
SELECT POSITION("a" IN "Amitabh") from Worker where FIRST_NAME = "Amitabh";

/*Q-6. Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side.*/
SELECT TRIM(FIRST_NAME) from Worker;

/*Q-7. Write an SQL query to print the DEPARTMENT from Worker table after removing white spaces from the left side.*/
SELECT LTRIM(DEPARTMENT) from Worker;

/*Q-8. Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.*/
SELECT DISTINCT LENGTH(DEPARTMENT) from Worker;

/*Q-9. Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with ‘A’.*/
SELECT REPLACE(FIRST_NAME,'a','A') from Worker;

/*Q-10. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME. A space char should separate them.*/
SELECT concat(FIRST_NAME,' ',LAST_NAME) as COMPLETE_NAME from Worker;

/*Q-11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.*/
SELECT * FROM Worker ORDER BY FIRST_NAME ASC;

/*Q-12. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.*/
SELECT * FROM Worker ORDER BY FIRST_NAME ASC, DEPARTMENT DESC;

/*Q-13. Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.
*/
SELECT * FROM Worker WHERE FIRST_NAME IN ("Vipul", "Satish");


