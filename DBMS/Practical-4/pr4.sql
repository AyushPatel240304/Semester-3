create database cs_38_p5;
use cs_38_p5;


create table Client_master (
    client_no varchar(6) primary key check (client_no like 'c%'),
    name varchar(15) not null,
    city varchar(15),
    pincode numeric(8),
    state varchar(15),
    bal_due numeric(10, 2)
);



insert into Client_master values ('C001','Ivan','Bombay',400054,'Maharashtra',15000 );
insert into Client_master values ('C002','Vandana','Madras',780001,'Tamil Nadu', 0 );
insert into Client_master values ('C003','Pramada','Bombay',400057,'Maharashtra',5000 );
insert into Client_master values ('C004','Basu','Bombay',400056,'Maharashtra',0 );
insert into Client_master values ('C005','Ravi','Delhi',100001,'Gujarat',2000 );
insert into Client_master values ('C006','Rukmani','Bombay',400050,'Maharashtra',0 );

select *from Client_master;


create table Product_master(
Product_no varchar(6),
 Description varchar(15) not null,
 P_percent numeric(4,2)  not null,
 U_measure varchar(10)   not null,
 Qty_on_hand numeric(8)  not null,
 Reorder_lvl numeric(8)  not null,
 Sell_price numeric(8,2) not null,
 Cost_price numeric(8,2) not null,
 primary key(Product_no),
 check (Product_no like 'P%'),
 check (Sell_price > 0),
 check (Cost_price > 0)
);


insert into product_master values('P001', 'Floppies', 5, 'Piece', 100, 20, 525, 500);
insert into product_master values('P002', 'Monitor', 6, 'Piece', 10, 3, 12000, 11280);
insert into product_master values('P003', 'Mouse', 5, 'Piece', 20, 5, 1050, 1000);
insert into product_master values('P004', 'Floppies', 5, 'Piece', 100, 20, 525, 500);
insert into product_master values('P005', 'Keyboards', 2, 'Piece', 10, 3, 3150, 3050);
insert into product_master values('P006', 'Cd Drive', '2.5', 'Piece', 10, 3 ,5250, 5100);
insert into product_master values('P007', '1.44 Drive', 4, 'Piece', 10, 3, 8400, 8000);


select * from product_master;


create table salesman_master (
    s_no varchar(6),
    s_name varchar(15) not null,
    city varchar(10),
    pincode numeric(8),
    state varchar(12),
    sal_amt numeric(8,2) not null,
    tgt_to_get numeric(6,2) not null,
    ytd_sales numeric(6,2) not null,
    remarks varchar(20),
    primary key (s_no),
    check (s_no like 's%'),
    check (sal_amt > 0),
    check (tgt_to_get > 0)
);

insert into salesman_master values('S001', 'Kiran', 'Bombay', 400002, 'Maharashtar', 3000, 100, 50, 'Excellent');
insert into salesman_master values('S002', 'Manish', 'Bombay', 400001, 'Maharashta', 3000, 200, 100, 'Good');
insert into salesman_master values('S003', 'Ravi', 'Bombay', 400032, 'Maharashta', 3000, 200, 100, 'Average');
insert into salesman_master values('S004', 'Ashish', 'Bombay', 400044, 'Maharashta', 3500, 200, 150, 'Good');
select * from salesman_master;



create table sales_order (
    order_no varchar(6),
    order_date date,
    client_no varchar(6),
    s_no varchar(6),
    dely_type char(1) default 'F',
    billed_yn char(1),
    dely_date date,
    order_status varchar(10),
    primary key(order_no),
    foreign key(client_no) references client_master(client_no),
    foreign key(s_no) references salesman_master(s_no),
    check (order_no like 'O%'),
    check (dely_type like 'F' or dely_type like 'P'),
    check (date(dely_date) > date(order_date)),
    check (order_status = 'inprocess' or order_status = 'fullfiled' or order_status = 'backorder' or order_status = 'cancelled')
);


insert into sales_order values('O1901', '2006-01-12', 'C001', 'S001', 'F', 'N', '2006-01-20', 'inprocess');
insert into sales_order values('O1902', '2006-01-25', 'C002', 'S002', 'P', 'N', '2006-01-27', 'cancelled');
insert into sales_order values('O4665', '2006-02-18', 'C003', 'S003', 'F', 'Y', '2006-02-20', 'fullfiled');
insert into sales_order values('O1903', '2006-04-03', 'C001', 'S001', 'F', 'Y', '2006-04-07', 'fullfiled');
insert into sales_order values('O4666', '2006-05-20', 'C004', 'S002', 'P', 'N', '2006-05-22', 'cancelled');
insert into sales_order values('O1908', '2006-05-24', 'C005', 'S003', 'F', 'N', '2006-05-26', 'inprocess');



select * from sales_order;



create table sales_order_details (
    order_no varchar(6),
    product_no varchar(6),
    qty_ordered numeric(8),
    qty_disp numeric(8),
    product_rate numeric(10, 2),
    primary key (order_no, product_no),
    foreign key (order_no) references sales_order(order_no),
    foreign key (product_no) references product_master(product_no)
);


insert into sales_order_details values('O1901', 'P001', '4', '4', '525');
insert into sales_order_details values('O1901', 'P002', '2', '1', '8400');
insert into sales_order_details values('O1901', 'P003', '2', '1', '5250');
insert into sales_order_details values('O1902', 'P001', '10', '0', '525');
insert into sales_order_details values('O4665', 'P002', '3', '3', '3150');
insert into sales_order_details values('O4665', 'P004', '3', '1', '5250');
insert into sales_order_details values('O4665', 'P005', '10', '10', '525');
insert into sales_order_details values('O4665', 'P003', '4', '4', '1050');
insert into sales_order_details values('O1903', 'P006', '2', '2', '1050');
insert into sales_order_details values('O1903', 'P004', '1', '1', '12000');
insert into sales_order_details values('O1908', 'P005', '1', '0', '8400');
insert into sales_order_details values('O1908', 'P007', '10', '0', '1050');

select * from sales_order_details;