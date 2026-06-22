-- Tables importing

-- -->Go to create a new Schema in the connected server.
-- --> Name your new Schema or Data base('project') and press apply.
-- -->It will open a pop up tab as "Review the SQL script to be applied", press apply and then finish in the next page.
   /*Successfully you had created your Data base('project'), Now we need to load our CSV files into the Data base.*/
-- -->  Double click on the Data base ('project').Now we will be using this Data base.
-- --> Right click on the Data base ('project') and select "Table Data Import WIzard".
--                  It will open a pop up tab as "Select file to import"
--                  Broswe the files you need to import from the local data or other sources. Later press "NEXT" for the next 5 consecutive pop ups and later "Finish".
	/* Your CSV files had beed imported successfully into your MYSQL Data base server*/
    
    
show databases;
use project;
show tables;

--  Table columns checking & descriptions

select* from customer_behavior;
desc customer_behavior;

select* from customers;
desc customers;

select* from delivery_partners;
desc delivery_partners;

select* from orders;
desc orders;

select* from payments;
desc payments;

select* from ratings;
desc ratings;

select * from restaurants ;
desc restaurants;

-- creating table & adding constrains

-- customers

create table customers_master(
customer_id int primary key,
customer_name text not null,
age int not null,
gender text not null,
city text not null,
signup_date text not null);

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
 
 -- restaurants

create table restaurant_info(
restaurant_id int primary key,
restaurant_name text not null,
cuisine_type text not null,
city text not null,
rating double not null);

-- delivery _partners

create table del_par(
partner_id int primary key,
partner_name text not null,
vehicle_type text not null,
joining_date text not null);

-- orders

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

-- payments

create table pay(
payment_id int primary key,
order_id int not null,
payment_mode text not null,
amount double not null,
foreign key(order_id) references order_details(order_id)
);

-- rating

create table rat(
rating_id int primary key,
order_id int not null,
customer_rating double not null,
feedback text not null,
foreign key(order_id) references order_details(order_id)
);