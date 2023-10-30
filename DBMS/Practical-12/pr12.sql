
-- 1
DELIMITER //
create procedure enrolmentnumber_q1(in employee_id int, out grade char(1))
begin
	declare earings decimal (10,2);
    select salary into earings from employees
    where employee_id = employee_id
    limit 1;
    if earings > 8000 then 
		set grade = 'A';
	elseif earings >= 5000 and earings <= 8000 then 
		set grade = 'B';
	else 
		set grade = 'C';
        end if ;
end;
//
delimiter ;

set @grade = '';
call enrolmentnumber_q1(100, @grade);
select @grade;


-- 2.

delimiter // 

create procedure enrol_q2(in location_id int)
begin
	declare country_name varchar(255);
    
    set country_name = (
		case location_id
        when 1000   then 'ITALY'
		when 1001   then 'ARGENTINA'
        when 1002   then 'AUSTRALIA'
        when 1003   then 'BELGIUM'
        when 1004   then 'BRAZIL'
        when 1005   then 'CANADA'
        when 1006   then 'SWITZERLAND'
        when 1007   then 'CHINA'
        when 1008   then 'GERMANY'
        when 1009   then 'DENMARK'
        when 1010   then 'EGYPT'
        when 1011   then 'FRANCE'
        when 1012   then 'HONGKONG'
        when 1013   then 'ISRAEL'
        when 1014   then 'INDIA'
        when 1015   then 'ITALY'
        when 1016   then 'JAPAN'
        when 1017   then 'KUWAIT'
        when 1018   then 'MEXICO'
        when 1019   then 'NIGERIA'
        when 1020   then 'NETHERLAND'
        when 1021   then 'SINGAPORE'
        when 1022   then 'UNITED KINGDOM'
        when 1023   then 'UNITED STATES OF AMERICA'
        when 1024   then 'ZAMBIA'
        when 1025   then 'ZIMBAVE'
		ELSE 'UNKNOWN'
        end
    );
    SELECT country_name;
end;
//

delimiter ; 

call enrol_q2(1000);

-- 3

delimiter //

create procedure enrol_q3(in region_id int )
begin 
	declare region_name varchar(255);
    
    set region_name = (
		case region_id
			when 1 then 'You are from Europe Region '
            when 2 then 'You are from Asia Region'
            when 3 then 'You are from North America '
            when 4 then 'You are from South America'
            when 5 then 'You are from Africa Region'
			else 'Region does not exit'
         end
       );
       select region_name;
       end;
       //
       delimiter ;
call enrol_q3(1);


-- 4.

delimiter //

create procedure enrol_q4()
begin 
	declare counter int default 1;
    
    while counter <= 10 do 
		select counter ;
        set counter = counter + 1 ;
        end while;
end;
//

delimiter ;

call enrol_q4();


-- 5 

delimiter // 

create procedure enrol_q5()
begin 
	declare counter int default 1;
    
    repeat 
		select counter;
        set counter = counter + 1;
	until counter > 10 end repeat;
end;
//
delimiter ;

call enrol_q5();

-- 6 
delimiter //
create procedure enrol_q6()
begin 
	declare counter int default 2;
    while counter <= 20 do 
		select counter;
        set counter = counter + 2;
	end while ;
end;
// 

delimiter ;

call enrol_q6();




