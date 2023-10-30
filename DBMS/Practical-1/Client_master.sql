create database CS_35_22162171038;
create table Client_master(
Client_no Varchar(6),
Naam Varchar(20),
City Varchar(15),
Pincode Numeric(8),
State Varchar(15),
Bal_due Numeric(10,2)
);

insert into Client_master values
('C001','Ivan','Bombay',400054,'Maharashtra',15000);
insert into Client_master values 
('C002','Vandana','Madras','780001','Tamil Nadu', 0);
insert into Client_master values
('C003','Pramada','Bombay', 400057, 'Maharashtra', 5000);
insert into Client_master values
('C004', 'Basu', 'Bombay', 400056, 'Maharashtra', 0);
insert into Client_master values
('C005', 'Ravi', 'Delhi', 100001, 'Gujarat', 2000);
insert into Client_master values
('C006', 'Rukmani', 'Bombay', 400050, 'Maharashtra', 0);
select *from Client_master;

create table Product_master(
Product_no Varchar(6),
Description Varchar(15),
P_percent Numeric(4,2),
U_measure Varchar(10),
Qty_on_hand Numeric(8),
Reorder_lvl Numeric(8),
Sell_price Numeric(8,2),
Cost_price Numeric(8,2)
);
select *from Product_master;

insert into Product_master values 
('P001', 'Floppies', 5, 'Piece', 100, 20, 525, 500);
insert into Product_master values 
('P002', 'Monitor', 6, 'Piece', 10, 3, 12000, 11280);
insert into Product_master values 
('P003', 'Mouse', 5, 'Piece', 20, 5, 1050, 1000);
insert into Product_master values 
('P004', 'Floppies', 5, 'Piece', 100, 20, 525, 500);
insert into Product_master values 
('P005', 'Keyboards', 2, 'Piece', 10, 3, 3150, 3050);
insert into Product_master values 
('P006', 'Cd Drive', 2.5, 'Piece', 10, 3, 5250, 5100);
insert into Product_master values 
('P007', '1.44 Drive', 4,'Piece', 10, 3, 8400, 8000);
 select *from Product_master;
 select product_no, sell_price, cost_price from product_master;
 
 create table Salesman_master(
S_no Varchar(6),
S_name Varchar(20),
City Varchar(20),
Pincode Numeric(8),
State Varchar(20),
Sal_amt Numeric(8,2),
Tgt_to_get Numeric(6,2),
Ytd_sales Numeric(6,2),
remarks Varchar(12)
 );
 
insert into Salesman_master values
('S001', 'Kiran', 'Bombay', 400002, 'Maharashtar', 3000, 100, 50, 'Excellent');
insert into Salesman_master values
('S002', 'Manish', 'Bombay', 400001, 'Maharashta', 3000, 200, 100, 'Good');
insert into Salesman_master values
('S003', 'Ravi', 'Bombay', 400032, 'Maharashta', 3000, 200, 100, 'Average');
insert into Salesman_master values
('S004', 'Ashish', 'Bombay', 400044, 'Maharashta', 3500, 200, 150, 'Good');

select *from Salesman_master;
select s_no, s_name, remarks , sal_amt  from salesman_master;

create database Practical_3;
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
insert into sales_order values
('O1901','2015-06-12','C001','S001','F','N','2015-06-20','InProcess'),
    ('O1902','2015-01-25','C002','S002','P','N','2015-06-27','Cancelled'),
    ('O4665','2015-02-18','C003','S003','F','Y','2015-02-20','Fullfilled'),
    ('O1903','2015-04-03','C001','S001','F','Y','2015-04-07','Fullfilled'),
    ('O4666','2015-05-20','C004','S002','P','N','2015-05-22','Cancelled'),
    ('O1908','2015-05-24','C005','S003','F','N','2015-05-26','InProcess');

select * from sales_order;
select date_format(Order_date,'%m/%d/%Y') from sales_order;


show tables;
 