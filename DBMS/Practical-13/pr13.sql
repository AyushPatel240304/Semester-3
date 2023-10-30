use pr13;
-- 1
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
 END IF ;
 RETURN max_num;
END;
//
DELIMITER ;

SET @result1 = findmax_and_store(10, 20);
SELECT @result1;

-- 2 

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

-- 3 

delimiter // 
create function getStudentPercebtage(roll_no int)
returns decimal (5,2)
deterministic 
reads sql data 
begin
	declare percentage decimal(5,2);
    select marks_obtained / total_marks * 100
    into percentage 
    from student
    where student_rollno = roll_no;
    return percentage;
    
end;
//
delimiter ;

set @result = getStudentPercentage(3);
select @result3;








