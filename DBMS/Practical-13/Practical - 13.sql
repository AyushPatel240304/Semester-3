create database Practical_13;
-- 1.
DELIMITER //
CREATE FUNCTION findmax_and_store(num1 INT, num2 INT)
RETURNS INT
DETERMINISTIC
NO SQL
BEGIN
 DECLARE max_num INT;
 IF num1 > num2 THEN
 SET max_num = num1;
ELSE
 SET max_num = num2;
 END IF;
 RETURN max_num;
END;
//
DELIMITER ;
SET @result1 = findmax_and_store(10, 20);
SELECT @result1;

-- 2.
DELIMITER //
CREATE FUNCTION findgrade(marks INT)
RETURNS VARCHAR(2)
DETERMINISTIC
NO SQL
BEGIN
 DECLARE grade VARCHAR(2);
 
 IF marks >= 90 THEN
 SET grade = 'A+';
 ELSEIF marks >= 80 THEN
 SET grade = 'A';
 ELSEIF marks >= 70 THEN
 SET grade = 'B+';
 ELSEIF marks >= 60 THEN
SET grade = 'B';
 ELSEIF marks >= 50 THEN
 SET grade = 'C+';
 ELSEIF marks >= 40 THEN
 SET grade = 'C';
 ELSE
 SET grade = 'F';
 END IF;
 
 RETURN grade;
END;
//
DELIMITER ;
SET @result2 = findgrade(90);
SELECT @result2;

-- 3.
DELIMITER //
CREATE FUNCTION getStudentPercentage(roll_no INT)
RETURNS DECIMAL(5,2)
DETERMINISTIC
READS SQL DATA
BEGIN
 DECLARE percentage DECIMAL(5,2);
 
 SELECT marks_obtained / total_marks * 100
 INTO percentage
 FROM student
 WHERE student_rollno = roll_no;
 
 RETURN percentage;
END;
//
DELIMITER ;
SET @result3 = getStudentPercentage(3);
SELECT @result3;

-- 4.
DELIMITER //
CREATE FUNCTION countStudentsByBranch(branch_name VARCHAR(50))
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
 DECLARE student_count INT;
 
 SELECT COUNT(*) INTO student_count
 FROM student
 WHERE branch = branch_name;
 
 RETURN student_count;
END;
//
DELIMITER ;
SET @result4 = countStudentsByBranch('Arts');
SELECT @result4;

-- 5.
DELIMITER //
CREATE FUNCTION getYesterdayDate()
RETURNS DATE
DETERMINISTIC
NO SQL
BEGIN
 RETURN DATE_SUB(CURDATE(), INTERVAL 1 DAY);
END;
//
DELIMITER ;
SET @result5 = getYesterdayDate();
SELECT @result5;


-- 6.
DELIMITER //
CREATE FUNCTION getTomorrowDate()
RETURNS DATE
DETERMINISTIC
NO SQL
BEGIN
 RETURN DATE_ADD(CURDATE(), INTERVAL 1 DAY);
END;
//
DELIMITER ;
SET @result6 = getTomorrowDate();
SELECT @result6;

-- 7.
DELIMITER //
CREATE FUNCTION calculateDaysBetweenDates(date1 DATE, date2 DATE)
RETURNS INT
DETERMINISTIC
NO SQL
BEGIN
 RETURN DATEDIFF(date1, date2);
END;
//
DELIMITER ;
SET @result7 =calculateDaysBetweenDates('2023-10-10', '2023-10-1');
SELECT @result7;

-- 8.
DELIMITER //
CREATE FUNCTION calculateDaysToBirthday(birthdate DATE)
RETURNS INT
DETERMINISTIC
NO SQL
BEGIN
 RETURN DATEDIFF(birthdate, CURDATE());
END;
//
DELIMITER ;
SET @result8 =calculateDaysToBirthday('2024-10-03');
SELECT @result8;

-- 9.
DELIMITER //
CREATE FUNCTION calculateAgeFromDateOfBirth(birthdate DATE)
RETURNS INT
DETERMINISTIC
NO SQL
BEGIN
 RETURN YEAR(CURDATE()) - YEAR(birthdate) - (DATE_FORMAT(CURDATE(), 
'%m%d') < DATE_FORMAT(birthdate, '%m%d'));
END;
//
DELIMITER ;
SET @result9 =calculateAgeFromDateOfBirth('2004-10-03');
SELECT @result9;
