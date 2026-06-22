-- Data Cleaning and Insertion

-- customers

create table customers_master(
customer_id int primary key,
customer_name text not null,
age int not null,
gender text not null,
city text not null,
signup_date text not null);

insert into customers_master 
select customer_id ,customer_name, age,gender, city, signup_date from customers;

-- customer_behave

create table customer_behave(
customer_id int primary key, 
total_orders int not null default 0,
total_spending double not null default 0.00,
avg_order_value double not null default 0.0,
 last_order_days int not null default 0,
 churn_flag tinyint check(churn_flag in(0,1)),
 
 foreign key(customer_id) references customers_master(customer_id)
 );
 
 insert into customer_behave 
select customer_id ,total_orders, total_spending,avg_order_value, last_order_days, churn_flag from customer_behavior;

-- restaurants

create table restaurant_info(
restaurant_id int primary key,
restaurant_name text not null,
cuisine_type text not null,
city text not null,
rating double not null);

insert into restaurant_info 
select  restaurant_id,restaurant_name,cuisine_type,city,rating from restaurants;

-- delivery _partners

create table del_par(
partner_id int primary key,
partner_name text not null,
vehicle_type text not null,
joining_date text not null);

insert into del_par
select partner_id,partner_name,vehicle_type,joining_date from delivery_partners;

-- orders

update orders set  delivered_time = null where delivered_time = '';
SELECT *
FROM orders
WHERE delivered_time = '';

 create table order_details(
order_id int primary key,
customer_id int not null ,
restaurant_id int not null ,
partner_id int not null ,
order_time timestamp  ,
delivered_time timestamp  ,
order_amount double not null,
delivery_fee double not null,
status text not null,
foreign key(customer_id) references customers_master(customer_id),
foreign key(restaurant_id) references restaurant_info(restaurant_id),
foreign key(partner_id) references del_par(partner_id));


insert into order_details
select order_id,customer_id,restaurant_id,partner_id,order_time,delivered_time,order_amount,delivery_fee,status from orders;

-- payments

create table pay(
payment_id int primary key,
order_id int not null,
payment_mode text not null,
amount double not null,
foreign key(order_id) references order_details(order_id)
);

insert into pay
select payment_id,order_id,payment_mode,amount from payments;

-- rating

create table rat(
rating_id int primary key,
order_id int not null,
customer_rating double not null,
feedback text not null,
foreign key(order_id) references order_details(order_id)
);

insert into rat
select rating_id,order_id,customer_rating,feedback from ratings;

