use hr;

-- 1. 
CREATE VIEW department_addresses AS
SELECT
    d.DEPARTMENT_NAME,
    l.LOCATION_ID,
    l.STREET_ADDRESS,
    l.CITY,
    l.STATE_PROVINCE,
    c.COUNTRY_NAME
FROM
    departments d
    JOIN locations l ON d.LOCATION_ID = l.LOCATION_ID
    JOIN countries c ON l.COUNTRY_ID = c.COUNTRY_ID;

select * from department_addresses;

-- 2. 
CREATE VIEW employee_country_names AS
SELECT
    CONCAT(e.FIRST_NAME, ' ', e.LAST_NAME) AS full_name,
    c.COUNTRY_NAME
FROM
    employees e
    JOIN departments d ON e.DEPARTMENT_ID= d.DEPARTMENT_ID
    JOIN locations l ON d.LOCATION_ID = l.LOCATION_ID
    JOIN countries c ON l.COUNTRY_ID = c.COUNTRY_ID;
    
select * from employee_country_names;

-- 3. 
CREATE VIEW high_salary_employees AS
SELECT
    FIRST_NAME,
   LAST_NAME,
    SALARY
FROM
    employees
WHERE
  SALARY > (SELECT AVG(SALARY) FROM employees);
  
select * from high_salary_employees;

-- 4. 
CREATE VIEW high_salary_jobs AS
SELECT
    j.JOB_ID,
    j.JOB_TITLE,
    MAX(e.SALARY) AS max_SALARY
FROM
    employees e
    JOIN jobs j ON e.JOB_ID = j.JOB_ID
GROUP BY
    j.JOB_ID, j.JOB_TITLE
HAVING
    MAX(e.SALARY) >= 4000;
select * from high_salary_jobs;

-- 5.
CREATE VIEW manager_names AS
SELECT
    e.FIRST_NAME,
    e.LAST_NAME
FROM
    employees e
WHERE
    e.EMPLOYEE_ID IN (SELECT DISTINCT MANAGER_ID FROM employees);
select * from manager_names ;

-- 6.
CREATE VIEW departments_with_no_employees AS
SELECT
    d.DEPARTMENT_ID,
    d.DEPARTMENT_NAME,
    l.CITY
FROM
    departments d
    JOIN locations l ON d.LOCATION_ID = l.LOCATION_ID
LEFT JOIN
    employees e ON d.DEPARTMENT_ID = e.DEPARTMENT_ID
WHERE
    e.EMPLOYEE_ID IS NULL;
select * from departments_with_no_employees;

-- 7. 
CREATE VIEW employees_hired_before_susan AS
SELECT
    CONCAT(FIRST_NAME, ' ', LAST_NAME) AS full_name,HIRE_DATE
FROM
    employees
WHERE
    HIRE_DATE < (SELECT HIRE_DATE FROM employees WHERE FIRST_NAME = 'Susan' AND LAST_NAME = 'Mavris');
select * from employees_hired_before_susan;

-- 8.
CREATE VIEW job_duration_view AS
SELECT
    e.EMPLOYEE_ID,
    j.JOB_TITLE,
    DATEDIFF(jh.END_DATE, jh.START_DATE) AS duration_days
FROM
    employees e
    JOIN job_history jh ON e.EMPLOYEE_ID = jh.EMPLOYEE_ID
    JOIN jobs j ON jh.JOB_ID = j.JOB_ID
WHERE
    e.DEPARTMENT_ID IN (80, 90);
select * from job_duration_view;

-- 9. 
CREATE VIEW departments_salary_difference AS
SELECT
    d.DEPARTMENT_NAME
FROM
    departments d
    JOIN employees e ON d.DEPARTMENT_ID = e.DEPARTMENT_ID
GROUP BY
    d.DEPARTMENT_NAME
HAVING
    MAX(e.SALARY) - MIN(e.SALARY) > 4000;
select * from departments_salary_difference;

-- 10. 
UPDATE high_salary_employees SET SALARY = SALARY + 1000 WHERE FIRST_NAME = 'John' AND LAST_NAME = 'Doe';
