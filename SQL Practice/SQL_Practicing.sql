/*
Practice with: https://www.techbeamers.com/sql-query-questions-answers-for-practice/
*/

create database sql_practicing;  /*command to create a database*/
show databases;				/*to display all databases*/

use sql_practicing;  /*command to use this database of sql_practicing*/

show tables;

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

select count(*) from Worker;

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

select * from Bonus;

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

/*Q-14. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table.
*/
SELECT * FROM Worker WHERE FIRST_NAME != ("Vipul") AND FIRST_NAME !=("Satish");

/*Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”.*/
SELECT * FROM Worker WHERE DEPARTMENT="Admin";

/*Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.*/
SELECT * FROM Worker WHERE FIRST_NAME LIKE '%a%';

/*Q-17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.*/
SELECT * FROM Worker WHERE FIRST_NAME LIKE '%a';

/*Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.*/
SELECT * FROM Worker WHERE FIRST_NAME LIKE '%h' AND LENGTH(FIRST_NAME) = 6;

/*Q-19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.*/
SELECT * FROM Worker WHERE SALARY>=100000 AND SALARY<=500000;

/*Q-20. Write an SQL query to print details of the Workers who have joined in Feb’2014.*/
SELECT * FROM Worker WHERE year(JOINING_DATE) = 2014 and month(JOINING_DATE) = 2;

/*Q-21. Write an SQL query to fetch the count of employees working in the department ‘Admin’.*/
SELECT COUNT(*) FROM Worker WHERE DEPARTMENT='Admin';

/*Q-22. Write an SQL query to fetch worker names with salaries >= 50000 and <= 100000.*/
SELECT concat(FIRST_NAME,' ',LAST_NAME) as WORKER_NAME, SALARY from Worker WHERE SALARY>=50000 AND SALARY<=100000;

/*Q-23. Write an SQL query to fetch the no. of workers for each department in the descending order.*/
SELECT COUNT(WORKER_ID) No_Of_Workers, DEPARTMENT from Worker GROUP BY DEPARTMENT ORDER BY No_Of_Workers DESC;

/*Q-24. Write an SQL query to print details of the Workers who are also Managers.*/
SELECT DISTINCT *
FROM Worker 
INNER JOIN Title 
ON WORKER_ID = WORKER_REF_ID
WHERE WORKER_TITLE in ('Manager');

/*Q-25. Write an SQL query to fetch duplicate records having matching data in some fields of a table.*/
SELECT WORKER_TITLE,COUNT(*) As Duplicated
FROM Title
GROUP BY WORKER_TITLE
HAVING COUNT(*) > 1;

/*Q-26. Write an SQL query to show only odd rows from a table.*/
SELECT * from Worker WHERE WORKER_ID % 2 != 0;

/*Q-27. Write an SQL query to show only even rows from a table.*/
SELECT * from Worker WHERE WORKER_ID % 2 = 0;

/*Q-28. Write an SQL query to clone a new table from another table.*/
CREATE TABLE WorkerClone LIKE Worker;

/*Q-29. Write an SQL query to fetch intersecting records of two tables.*/


/*Q-30. Write an SQL query to show records from one table that another table does not have.
*/ # This shows all the Worker that are not in Bonus Table compared to Worker Table
SELECT WORKER_ID, CONCAT(FIRST_NAME,'',LAST_NAME) as FULLNAME FROM WORKER
WHERE WORKER_ID
NOT IN (SELECT WORKER_REF_ID FROM Bonus) 
ORDER BY WORKER_ID ASC;

/*Q-31. Write an SQL query to show the current date and time.*/
SELECT NOW();

/*Q-32. Write an SQL query to show the top n (say 5) records of a table.*/
SELECT * FROM Bonus ORDER BY WORKER_REF_ID ASC LIMIT 5;

/*Q-33. Write an SQL query to determine the nth (say n=5) highest salary from a table.*/
# Limit for selecting TOP 5
SELECT  FIRST_NAME, SALARY FROM WORKER ORDER BY SALARY DESC LIMIT 5;

/*Q-34. Write an SQL query to determine the 5th highest salary without using TOP or limit method.*/

 
/*Q-35. Write an SQL query to fetch the list of employees with the same salary.*/
SELECT DISTINCT W.WORKER_ID, W.FIRST_NAME, W.SALARY
FROM Worker W, Worker W1
WHERE W.SALARY = W1.SALARY
and W.WORKER_ID != W1.WORKER_ID
ORDER BY W.WORKER_ID;

/*Q-36. Write an SQL query to show the second highest salary from a table.*/
SELECT MAX(SALARY)
FROM Worker
WHERE SALARY < ( SELECT MAX(SALARY)
FROM Worker);

/*Q-37. Write an SQL query to show one row twice in results from a table.*/
SELECT FIRST_NAME, LAST_NAME, DEPARTMENT FROM WORKER WHERE FIRST_NAME='Monika'
UNION ALL
SELECT FIRST_NAME, LAST_NAME, DEPARTMENT FROM WORKER WHERE FIRST_NAME='Monika';

/*Q-39. Write an SQL query to fetch the first 50% records from a table.
*/
SET @v1 := (SELECT COUNT(*) / 2 FROM Worker);
SELECT * FROM WORKER LIMIT @v1;
SELECT @v1;

/*Q-40. Write an SQL query to fetch the departments that have less than five people in it.*/
SELECT DISTINCT DEPARTMENT,COUNT(WORKER_ID) as 'No Workers' FROM Worker GROUP BY DEPARTMENT HAVING COUNT(WORKER_ID) <= 5;

                 
/*Q-41. Write an SQL query to show all departments along with the number of people in there.*/
SELECT DEPARTMENT,COUNT(WORKER_ID) as 'No Workers' FROM Worker GROUP BY DEPARTMENT; 

/*Q-42. Write an SQL query to show the last record from a table.*/
SELECT * FROM Worker ORDER BY WORKER_ID DESC LIMIT 1;  

/*Q-43. Write an SQL query to fetch the first row of a table.*/
SELECT * FROM Worker ORDER BY WORKER_ID ASC LIMIT 1;  

/*Q-44. Write an SQL query to fetch the last five records from a table.*/
SELECT * FROM Worker ORDER BY WORKER_ID DESC LIMIT 5; 

/*Q-45. Write an SQL query to print the name of employees having the highest salary in each department.*/
SELECT t.DEPARTMENT,t.FIRST_NAME,t.Salary from(SELECT max(Salary) as TotalSalary,DEPARTMENT from Worker group by DEPARTMENT) as TempNew 
Inner Join Worker t on TempNew.DEPARTMENT=t.DEPARTMENT 
 and TempNew.TotalSalary=t.Salary;

/*Q-46. Write an SQL query to fetch three max salaries from a table.*/ 
SELECT DISTINCT SALARY FROM Worker ORDER BY SALARY DESC LIMIT 3;

/*Q-47. Write an SQL query to fetch three min salaries from a table.*/
SELECT DISTINCT SALARY FROM Worker ORDER BY SALARY ASC LIMIT 3;

/*Q-49. Write an SQL query to fetch departments along with the total salaries paid for each of them.*/
SELECT DEPARTMENT,SUM(SALARY) FROM Worker GROUP BY DEPARTMENT;

/*Q-50. Write an SQL query to fetch the names of workers who earn the highest salary.*/
SELECT CONCAT(FIRST_NAME,' ',LAST_NAME) as WORKER_NAME, SALARY
FROM Worker
WHERE SALARY = (SELECT MAX(SALARY) 
                FROM Worker)