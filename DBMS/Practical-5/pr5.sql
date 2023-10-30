create database cs_p5_38;
use cs_p5_38;

select dep_id,count(emp_name)"No. of emps" from emp_mstr group by dep_id order by dep_id asc; 

select dep_id,count(job_name)"No. of Jobs roles" from emp_mstr group by dep_id order by dep_id asc; 

select distinct emp_name,salary from emp_mstr where salary > 2000; 

select distinct emp_name,hire_date from emp_mstr where date(hire_date) > '1991-04-03';

select job_name,count(emp_name) as no_of_emps from emp_mstr group by job_name order by no_of_emps;

select dep_id,count(emp_name) as no_of_emps from emp_mstr group by dep_id having no_of_emps>3 order by dep_id;

select dep_id,sum(salary) from emp_mstr group by dep_id;

SELECT dep_id,count(emp_id) FROM emp_mstr WHERE emp_name LIKE ("%n")group by dep_id; 

SELECT dep_id,count(emp_id) FROM emp_mstr WHERE emp_name LIKE ("%a%")group by dep_id;

SELECT dep_id, COUNT(*) AS employee_count
FROM emp_mstr e1
WHERE salary > (SELECT AVG(salary) FROM emp_mstr e2 WHERE e1.dep_id = e2.dep_id) GROUP BY dep_id;

select dep_id,count(emp_name) as no_of_emps from emp_mstr group by dep_id having no_of_emps>2 order by dep_id desc;

SELECT dep_id,AVG(salary) AS avg_salary FROM emp_mstr GROUP BY dep_id;  

SELECT dep_id,MAX(salary) FROM emp_mstr GROUP BY dep_id; 

SELECT dep_id,MIN(salary) FROM emp_mstr GROUP BY dep_id;