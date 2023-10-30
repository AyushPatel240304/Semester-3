use cs_22162171038;

create table sales_order(
Order_no Varchar(6),
Order_date Date,
Client_no Varchar(6),
S_no Varchar(6),
Dely_type Char(1),
Billed_yn Char(1),
Dely_date Date,
Order_status Varchar(10)
);

desc Sales_order;

insert into sales_order
values
('O1901' ,'2015-06-12','C001', 'S001 ','F','N' ,'2015-06-20' ,'InProcess'),
('O1902 ','2015-01-25','C002 ','S002 ','P','N', '2015-06-27','Cancelled'),
('O4665' ,'2015-02-18','C003 ','S003' ,'F','Y', '2015-02-20','Fullfilled'),
('O1903' ,'2015-04-03','C001' ,'S001','F','Y', '2015-04-07' ,'Fullfilled'),
('O4666' ,'2015-05-20','C004',' S002', 'P','N' ,'2015-05-22','Cancelled'),
('O1908' ,'2015-05-20', 'C005', 'S003' ,'F','N', '2015-05-02' ,'InProcess');

select  * from client_master where name like '_a%';

select  * from client_master where name like '_a%'and length(name)=4;

select  * from client_master where City like '%a_';

select  * from client_master where Bal_due>=10000; 

select  * from client_master;

use cs_22162171038 ;

select  * from Sales_order where month(Order_date)=01;

truncate sales_order;

select * from client_master where Client_no='C003' OR Client_no='C001';

select description,sell_price, sell_price*0.15 as new_price from product_master where  Sell_price>2000 AND Sell_price<+5000;

select * from product_master;         

select description, sell_price, sell_price * 0.15 as new_price from product_master where Sell_price>5000;
select * from client_master where not State='Maharashtra';

select count(Order_no) from sales_order;

select avg(sell_price),avg(Cost_price) from product_master;

select max(sell_price),min(sell_price),max(sell_price) as max_price,min(sell_price) as min_price from product_master;

select count(Product_no) from product_master where Sell_price>=1500; 

select * from product_master where Qty_on_hand < Reorder_lvl;

insert into Product_master

values
('P008','Floppies',5,'Piece',100,202,525,500);

create table cmaster like client_master;

truncate cmaster;

drop table cmaster;

create table cmaster select * from  client_master where City='bombay';

select * from cmaster;

create table sales as select  order_no,client_no from sales_order;

select * from sales;

select order_no,date_format(order_date,'%a') from sales_order;

select order_no,dayname(order_date) from sales_order;

select order_no,date_format(order_date,'%M-%d-%y') from sales_order where Order_status='Fullfilled';
