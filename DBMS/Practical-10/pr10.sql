use sakila;

/*1*/
DELIMITER //
create procedure PrintStudentInfo (in your_name varchar(255), in enrolment_number bigint )
begin
    select CONCAT('hi, your name is ', your_name, ' and your enrolment number is ', enrolment_number) as Statement;
end//
DELIMITER ;

call PrintStudentInfo('Ayush', 22162171038);

/*2*/

DELIMITER //

CREATE PROCEDURE GetFirst10ActorNames()
BEGIN
    SELECT CONCAT(first_name, ' ', last_name) AS full_name
    FROM actor
    LIMIT 10;
    -- WHERE actor_id BETWEEN 1 AND 10;
END //

DELIMITER ;

drop procedure  GetFirst10ActorNames;
CALL  GetFirst10ActorNames();

/*3*/

DELIMITER //

CREATE PROCEDURE GetFilmDetailsByTitle(IN film_title VARCHAR(255))
BEGIN
    SELECT * 
    FROM sakila.film
    WHERE title = film_title;
END//

DELIMITER ;

select * from film;
CALL GetFilmDetailsByTitle('BABY HALL');

/*4*/
delimiter $$
CREATE procedure Q4(IN A VARCHAR(20))
BEGIN 
SELECT * FROM film WHERE title LIKE (CONCAT('%',A,'%')); 
END;
$$
call Q4("AC");


/*5*/

delimiter $$

create procedure Q5(IN A numeric)
BEGIN
SELECT * FROM film where film_id IN (select film_id from film_category where category_id = A);
END;
$$

call Q5('1');


/*6*/

delimiter $$
CREATE procedure Q6(IN A VARCHAR(15))
BEGIN 
SELECT * FROM film where film_id IN (select film_id from film_category where category_id IN (SELECT category_id FROM category WHERE name = A));
END;
$$

call Q6("Action");

/*7*/

delimiter $$
create procedure Q7(IN A numeric(10,2),IN B numeric(10,2))
BEGIN
SELECT * FROM film WHERE rental_rate > A AND rental_rate < B;
END;
$$ 

call Q7(1.99,3.99);

/*8*/

delimiter $$
create procedure Q8 (IN A numeric)
BEGIN
SELECT CONCAT(first_name, " " , last_name) AS a FROM actor WHERE actor_id = A;
END;
$$

call Q8(3);

/*9*/

delimiter $$
CREATE procedure Q9(IN A VARCHAR(15))
BEGIN 
SELECT COUNT(*) FROM film where film_id IN (select film_id from film_category where category_id IN (SELECT category_id FROM category WHERE name = A));
END;
$$

call Q9("Action");

/*10*/

delimiter $$
CREATE procedure Q10(IN A numeric)
BEGIN
select country_id,count(city) from city group by country_id HAVING count(city)>A;
END;
$$

CALL Q10(5);


/*11*/

delimiter $$
CREATE procedure Q11(IN A numeric)
BEGIN
SELECT * FROM customer WHERE active=A;
END;
$$

call Q11(0);

/*12*/

delimiter $$
CREATE procedure Q12(IN A NUMERIC,IN B VARCHAR(15))
BEGIN
update actor set first_name = B where actor_id = A;
SELECT * FROM actor WHERE actor_id = A;
END;
$$

call Q12(12,"abc");

/*13*/

delimiter $$
create procedure Q13(INOUT A NUMERIC)
BEGIN
SELECT rental_duration into A FROM film where film_id = A;
END;
$$
drop procedure Q13;
set @film = 11;
call Q13(@film);
select @film;
