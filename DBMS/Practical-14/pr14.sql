-- 1 

delimiter //
create procedure cursor_proc2()
begin 
	declare eno int;
    declare name text;
    declare city text;
    declare salary int;
    declare exit_loop boolean;
    declare done int default 0;
    declare c1 cursor for select eno , name, city, salary from employes;
    declare continue handler for not found set done = 1;
    open c1;
    L1: loop 
		fetch c1 into eno, name,city, salary;
        if done = 1 then 
			leave L1;
		end if;
        select eno,name,city,salary;
	end loop;
    close c1;
end;
// 
delimiter ;

call cursor_proc2();

-- 2
drop procedure copydata;
drop table EmployeeInfo;

create table EmployeeInfo(
	empno int ,
    name1 varchar(255),
    city1 varchar(255),
    salary1 int
);


delimiter //
create procedure copydata()
begin 
	declare eno int;
    declare name1 text;
    declare city1 text;
    declare salary1 int;
    declare done int default 0;
    declare c1 cursor for select eno , name1, city1, salary1 from employes;
    declare continue handler for not found set done = 1;
    open c1;
    L1: loop 
		fetch c1 into eno, name1,city1, salary1;
        if done = 1 then
			leave L1;
		end if;
        insert into EmployeeInfo (empno, name1 , city1 , salary1) values (eno,name1,city1,salary1);
	end loop;
    
    close c1;
end;
//
delimiter ;

call copydata();
select * from EmployeeInfo;




-- last quetion 

-- Create the Result table
CREATE TABLE Result (
    roll_number INT,
    name VARCHAR(255),
    percentage INT
);

-- Insert sample data into the Result table
INSERT INTO Result (roll_number, name, percentage) VALUES
(1, 'Rudra', 90),
(2, 'Saniya', 65),
(3, 'Veer', 42),
(4,'Khush',33);
-- Create the Result1 table
CREATE TABLE Result1 (
    roll_number INT,
    name VARCHAR(255),
    percentage INT,
    class VARCHAR(50)
);

DELIMITER //
CREATE PROCEDURE pr14()
BEGIN
    DECLARE done INT DEFAULT 0; -- Variable to track end of cursor

    DECLARE roll_number_val INT;
    DECLARE name_val VARCHAR(255);
    DECLARE percentage_val INT;
    DECLARE class_val VARCHAR(50);

    -- Declare cursor to fetch rows from Result table
    DECLARE cursor_result CURSOR FOR
        SELECT roll_number, name, percentage FROM Result;

    -- Declare handler for NOT FOUND condition
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    -- Open the cursor
    OPEN cursor_result;

    -- Loop through the cursor
    read_loop: LOOP
        -- Fetch row from cursor into variables
        FETCH cursor_result INTO roll_number_val, name_val, percentage_val;

        -- Check if cursor fetch was successful
        IF done = 1 THEN
            LEAVE read_loop;
        END IF;

        -- Determine class based on percentage
        IF percentage_val >= 70 THEN
            SET class_val = 'Distinction';
        ELSEIF percentage_val >= 60 THEN
            SET class_val = 'First Class';
        ELSEIF percentage_val >= 40 THEN
            SET class_val = 'Second Class';
        ELSE
            SET class_val = 'Fail';
        END IF;

        -- Insert row into Result1 table
        INSERT INTO Result1 (roll_number, name, percentage, class)
        VALUES (roll_number_val, name_val, percentage_val, class_val);
    END LOOP;

    -- Close the cursor
    CLOSE cursor_result;
END;
//
DELIMITER ;


call pr14();
SELECT * FROM Result1;
