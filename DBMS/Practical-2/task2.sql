use cs_22162171038;

select Name from client_master;

select Name,Ciy from client_master;

select Description from product_master;

select * from client_master where Ciy='Bombay';

select s_name from salesman_master where Sal_amt=3000;

select distinct ciy from client_master;

select * from product_master order by Sell_price;

select * from product_master order by Sell_price,Cost_price;

select *  from product_master order by Sell_price DESC;

SET SQL_SAFE_UPDATES=0;

update client_master set Ciy='Bombay' where client_no='C002';

select * from client_master;

update client_master set Bal_due=1000 where client_no='C001';

select * from client_master;

update product_master set Cost_price=950 where description='Floppies';

select * from product_master;

update salesman_master set City='Bombay';

select * from salesman_master;

delete from salesman_master where Sal_amt=3500;

select * from salesman_master;

delete from product_master where Qty_on_hand=100;

select * from product_master;

delete from client_master where State='Tamil nadu';

select * from salesman_master;

alter table client_master add telephone numeric(10);

select * from client_master;

alter table product_master modify Sell_price numeric(10,2);

desc product_master; 

alter table client_master rename column telephone to Contact;

select * from client_master;

alter table client_master drop column Contact;

select * from client_master;

create table employee(name varchar(20), city varchar(20), phone_no numeric(10), salary numeric(10));

desc employee;

drop table employee;

show tables;

rename table salesman_master to sman_mast;

show tables; 