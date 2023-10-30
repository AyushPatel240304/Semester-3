use sakila;


/*1*/create view actors_with_a_in_name as select * from actor where first_name like 'A%' and last_name like '%A%';
select * from actors_with_a_in_name;

/*2*/create view actor_ordered_by_last_name as select * from actor order by last_name desc;
select * from actor_ordered_by_last_name;

/*3*/drop view actor_ordered_by_last_name;

/*4*/create view lang as select * from language;
select * from lang;

/*5*/insert into lang(name,last_update) values ('HINDI','2013-07-05 12:23:05');
select * from lang;

/*6*/ UPDATE lang set name='SPANISH' WHERE name='HINDI';
SELECT * FROM lang WHERE name = 'SPANISH';

/*7*/delete from lang where name='SPANISH';
select * from lang;

/*8*/CREATE VIEW lang_2 AS SELECT * FROM language where last_update='2006-02-15 05:02:19' with check option;

/*9*/INSERT INTO lang_2(name,last_update) VALUES ('HINDI','2020-07-13 10:00:19');
select * from lang_2;

/*10*/INSERT INTO lang_2(name,last_update) VALUES ('HINDI','2006-02-15 05:02:19');
select * from lang_2;

/*11*/UPDATE lang_2 SET last_update='2020-07-13 10:00:19' WHERE name='HINDI';
select * from lang_2;