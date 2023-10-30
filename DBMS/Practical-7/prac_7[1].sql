create database practical7;
use practical7;

CREATE TABLE employee(
	eid int(2),
    PRIMARY KEY(eid),
    ename varchar(10),
    address varchar(10),
    dept varchar(10),
    salary int(8)
);

select * from employee;

CREATE TABLE Project(
	Eid int(2),
    FOREIGN KEY(Eid) references employee(eid),
    Pid varchar(5),
    Pname varchar(10),
    Location varchar(20)
);
drop table Project;
insert into employee values(1,' Ram' ,'chd',' HR' ,10000);
insert into employee values(2, 'Amit',' delhi','MRKT' ,20000);
insert into employee values(3, 'Ravi' ,'pune',' HR', 30000);
insert into employee values(4,' Nitin ','bang ','MRKT', 40000);
insert into employee values(5,' Varun', 'chd',' IT', 50000);

INSERT INTO Project VALUES (1, 'P1', 'IOT', 'bang');
INSERT INTO Project VALUES(5, 'P2', 'BIG Data', 'delhi');
INSERT INTO Project VALUES(3, 'P3', 'Retail', 'mumbai');
INSERT INTO Project VALUES (4, 'P4', 'Android', 'hyp');

-- Q.1) Write an SQL query to display maximum salary from employee table.
select max(salary) as maximum_salary from employee;

-- Q.2) Write an SQL query to display employee name who is taking maximum salary.
select ename from employee where salary=(select max(salary) from employee);

-- Q.3) Write an SQL query to display second highest salary from employee table?
SELECT MAX(Salary) AS SecondHighestSalary
FROM Employee
WHERE Salary < (SELECT MAX(Salary) FROM Employee);

-- Q.4) Write an SQL query to display employee name who is taking second highest
-- salary.
SELECT ename
FROM Employee
WHERE Salary = (
    SELECT MAX(Salary)
    FROM Employee
    WHERE Salary < (SELECT MAX(Salary) FROM Employee)
);

-- Q.5) Write an SQL query to display all the dept names along with no of employees
-- working in it.
SELECT dept, COUNT(*) AS NumberOfEmployees
FROM Employee
GROUP BY dept;

-- Q.6) Write an sql query to display all the employee names where no. of employees are
-- less than 2.
SELECT Ename
FROM Employee
GROUP BY Ename
HAVING COUNT(*) < 2;

-- Q.7) Display the name of employee who works in department having count of employee
-- less than 2.
SELECT ename
FROM Employee
WHERE dept IN (
    SELECT dept
    FROM Employee
    GROUP BY dept
    HAVING COUNT(*) < 2
);

-- Q.8) Write a query display highest salary department wise and name of employee who
-- is taking that salary.
SELECT dept, Salary, ename
FROM Employee
WHERE salary in (select max(salary) from employee group by dept);

-- Q.9) Find the name of employees who are working on a project?
SELECT Employee.ename
FROM Employee
INNER JOIN Project ON Employee.eid = Project.Eid;

-- Q.10) Find the details of employee who is working on at least one project?
SELECT *
FROM Employee
WHERE eid IN (
    SELECT DISTINCT eid
    FROM Project
);
