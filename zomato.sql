create database zomato;
show databases;
use zomato;
create table User (user_id int, name varchar(30), email varchar(100), password varchar(30), phone varchar(20));
create table Restaurants (restaurent_id int, name varchar(30), address varchar(255), phone varchar(20));
create table Orders (order_id int, user_id int,restaurent_id int, order_total decimal(10,2), delivery_status varchar(20), delivery_id int);
create table Payment (payment_id int, order_id int, payment_method varchar(20),amount decimal(10,2),status varchar(20));
create table Drivers (driver_id int, name varchar(30),phone varchar(20), location varchar(20), email varchar(100));
create table Address (address_id int, user_id int, state varchar(30), city varchar(30), street varchar(255), pincode int);
create table Rating (rating_id int, user_id int, restaurent_id int, rating int);
create table Menu (menu_id int, rating_id int, item_name varchar(255), price decimal(10,2));
-- rename column name from rating_id to restaurant_id --
ALTER TABLE Menu RENAME COLUMN rating_id TO restaurant_id;
--
show tables;
-- ------------------------------------ -- select * from User;
insert into User values(1,'methil','methil@example.com','pass111',9441234);
insert into User values(2,'michael','michael@example.com','pass222',9441233);
insert into User values(3,'lijone','lijone@example.com','pass333',9441232);
insert into User values(4,'muthu','muthu@example.com','pass444',9441231);
insert into User values(5,'prabha','prabha@example.com','pass555',9441235);
-- ------------------------------------ -- 
select * from User;
-- ------------------------------------ -- select * from Restaurants;
insert into Restaurants values (1,'rahmath','tenkasi old bus-stand',180011);
insert into Restaurants values (2,'bilal','senkotai opp to rahmath',180022);
insert into Restaurants values (3,'saral','kodimaram old mosque',180033);
insert into Restaurants values (4,'rajmess','yanapalam old bus-stand',180044);
insert into Restaurants values (5,'srikrishna','tenkasi old bus-stand',180055);
-- ------------------------------------ -- 
select * from Restaurants;
-- ------------------------------------ -- select * from Orders;
insert into Orders values (1,1,1,100.50,'Delivered',1011);
insert into Orders values (2,2,2,152.50,'Delivered',1022);
insert into Orders values (3,3,3,163.50,'Not Delivered',1033);
insert into Orders values (4,4,4,182.50,'Not Delivered',1044);
insert into Orders values (5,5,5,210.50,'Delivered',1055);
-- ------------------------------------ -- 
select * from Orders;
-- ------------------------------------ -- select * from Payment;
insert into Payment values (1,1,'cash',100.50,'Paid');
insert into Payment values (2,2,'gpay',152.50,'Not Paid');
insert into Payment values (3,3,'paytm',163.50,'Paid');
insert into Payment values (4,4,'phonepay',182.50,'Not Paid');
insert into Payment values (5,5,'check',210.50,'Paid');
-- ------------------------------------ -- 
select * from Payment;
-- ------------------------------------ -- select * from Drivers;
insert into Drivers values (1,'mano','555123','tenkasi','mano@zomato.com');
insert into Drivers values (2,'sundar','555134','senkotai','sundar@zomato.com');
insert into Drivers values (3,'arul','555145','coutrallam','arul@zomato.com');
insert into Drivers values (4,'raj','555156','IT corner','raj@zomato.com');
insert into Drivers values (5,'kamal','555167','housing board','kamal@zomato.com');
-- ------------------------------------ -- 
select * from Drivers;
-- ------------------------------------ -- select * from Address;
insert into Address values (1,1,'tamilnadu','tenkasi','abc street',627001);
insert into Address values (2,2,'tamilnadu','tenkasi','def street',627002);
insert into Address values (3,3,'kerala','senkotai','ghi street',627003);
insert into Address values (4,4,'kerala','senkotai','jkl street',627004);
insert into Address values (5,5,'tamilnadu','tenkasi','mno street',627005);
-- ------------------------------------ -- 
select * from Address;
-- ------------------------------------ -- select * from Rating;
insert into Rating values (1,1,1,1);
insert into Rating values (2,2,2,2);
insert into Rating values (3,3,3,3);
insert into Rating values (4,4,4,4);
insert into Rating values (5,5,5,5);
-- ------------------------------------ -- 
select * from Rating;
-- ------------------------------------ -- select * from Menu;
insert into Menu values (1,1,'briyani',210.50);
insert into Menu values (2,2,'parota',100.50);
insert into Menu values (3,3,'kuska',152.50);
insert into Menu values (4,4,'grill',182.50);
insert into Menu values (5,5,'egg fry',163.50);
-- ------------------------------------ -- 
select * from Menu;
-- ------------------------------------ -- 
/* */
-- JOIN the Tables --
/* */
-- ------------------------------------ -- 
 -- SELECT * FROM table1 INNER JOIN table2 ON table1.key1 = table2.key1 -- Syntax
 /* User Restaurants Orders Payment Drivers Address Rating Menu
 --
create table User (user_id int, name varchar(30), email varchar(100), password varchar(30), phone varchar(20));
create table Restaurants (restaurent_id int, name varchar(30), address varchar(255), phone varchar(20));
create table Orders (order_id int, user_id int,restaurent_id int, order_total decimal(10,2), delivery_status varchar(20), delivery_id int);
create table Payment (payment_id int, order_id int, payment_method varchar(20),amount decimal(10,2),status varchar(20));
create table Drivers (driver_id int, name varchar(30),phone varchar(20), location varchar(20), email varchar(100));
create table Address (address_id int, user_id int, state varchar(30), city varchar(30), street varchar(255), pincode int);
create table Rating (rating_id int, user_id int, restaurent_id int, rating int);
create table Menu (menu_id int, rating_id int, item_name varchar(255), price decimal(10,2));
--
 */
 -- ------------------------------------ -- 
 -- 1st-join
 -- SELECT * FROM User  JOIN Address ON User.user_id = Address.address_id; || Error
 select * from User left join Address on User.user_id = Address.address_id;
 select * from User left join Rating on User.user_id = Rating.rating_id;
 -- 2nd-join
 select * from Restaurants left join Rating on Restaurants.restaurent_id = Rating.rating_id;
 select * from Restaurants left join Menu on Restaurants.restaurent_id = Menu.menu_id;
 -- 3rd-join
 select * from User right join Orders on User.user_id = Orders.order_id;
 select * from Restaurants right join Orders on Restaurants.restaurent_id = Orders.order_id;
 -- 4th-join
 select * from Orders left join Payment on Orders.order_id = Payment.payment_id;
 select * from Orders left join Drivers on Orders.order_id = Drivers.driver_id;
 -- ------------------------------------ -- 
/* 1 . To select the name and email of all users who have placed an order:*/
-- select * from User right join Orders on User.user_id = Orders.order_id;
select User.user_id, User.email
from Orders
right join 
User on Orders.order_id = User.user_id
where Orders.order_id in (1,2,3,4,5);
-- 
select User.user_id, User.email
from Orders
right join 
User on Orders.order_id = User.user_id
where Orders.delivery_status = 'Delivered';
-- 
/* 2 . To select the name and address of all restaurants that have received a rating of 4 or higher*/
 -- select * from Restaurants left join Rating on Restaurants.restaurent_id = Rating.rating_id;
 select Restaurants.name,Restaurants.address
 from Rating
 left join
 Restaurants on Restaurants.restaurent_id = Rating.rating_id
 where Rating.rating_id = 4;
 -- 
 /* 3 . select the order id, total, and status of all orders that have been placed by a user with the 
 email ‘johndoe@example.com’*/
 -- select * from User right join Orders on User.user_id = Orders.order_id;
 select User.email, Orders.order_id, Orders.order_total, Orders.delivery_status
 from Orders
 right join
 User on User.user_id = Orders.order_id;
 -- 
 select User.email, Orders.order_id, Orders.order_total, Orders.delivery_status
 from Orders
 right join
 User on User.user_id = Orders.order_id
 where User.email = 'michael@example.com';
 --  
 /* 4 . select the name, phone, and rating of all drivers who have delivered an order*/
 -- select * from Orders left join Drivers on Orders.order_id = Drivers.driver_id;
 select Drivers.name, Drivers.phone, Orders.delivery_status
 from Drivers
 left join
 Orders on Drivers.driver_id = Orders.order_id
 where Orders.delivery_status = 'Delivered';
 -- 
 select Drivers.name, Drivers.phone, Orders.delivery_status -- Doubt???
 from Drivers
 left join
 Orders on Drivers.driver_id = Orders.order_id
 where Orders.delivery_status = 'Not Delivered';
 -- --
SELECT * FROM Table1  /* SYNTAX TO JOIN 3 TABLE*/
JOIN Table2 ON Table1.id = Table2.id
JOIN Table3 ON Table2.id = Table3.id;
-- --
select Drivers.name, Drivers.phone, Orders.delivery_status, Rating.rating
from Drivers
join Orders on Drivers.driver_id = Orders.order_id
join Rating on Orders.order_id = Rating.rating_id
where Rating.rating_id in (4,5);
 --  
 /* 5 . select the name, price and status of the payment of all menu items on a particular restaurant*/
 -- select * from Restaurants left join Menu on Restaurants.restaurent_id = Menu.menu_id;
 select Menu.item_name, Menu.price, Payment.status,Payment.payment_method
 from Menu
 join Restaurants on Menu.menu_id = Restaurants.restaurent_id
 join Payment on Restaurants.restaurent_id = Payment.payment_id;
 -- 
select Menu.item_name, Menu.price, Payment.payment_method
from Menu
join Restaurants on Menu.menu_id = Restaurants.restaurent_id
join Payment on Restaurants.restaurent_id = Payment.payment_id
where Payment.status = 'Paid';
-- 
/* 6 . select all the addresses of the user who placed a particular order*/
-- select * from User left join Address on User.user_id = Address.address_id;
select Address.state, Address.city, Address.street, Address.pincode, Orders.delivery_status
from Address
left join Orders on Address.address_id = Orders.order_id
where Orders.delivery_status = 'Delivered';
-- 
select Address.state, Address.city, Address.street, Address.pincode, Orders.delivery_status
from Address
right join Orders on Address.address_id = Orders.order_id
where Orders.delivery_status = 'Delivered';
-- 
/* 7 . select the average rating for each restaurant, along with the number of ratings they have received*/
-- select * from Restaurants left join Rating on Restaurants.restaurent_id = Rating.rating_id;
select Rating.rating_id, Restaurants.name
from Rating
left join Restaurants on Rating.rating_id = Restaurants.restaurent_id;
--
select Rating.rating_id, Restaurants.name
from Rating
left join Restaurants on Rating.rating_id = Restaurants.restaurent_id
where Rating.rating_id > 3;
--
select Avg(rating_id), Restaurants.name
from Rating
left join Restaurants on Rating.rating_id = Restaurants.restaurent_id
where Rating.rating_id > 3
group by Restaurants.name;
--
/* 8 . select the most popular menu items, based on the number of times they have been ordered */
-- select * from Restaurants left join Menu on Restaurants.restaurent_id = Menu.menu_id;
select Menu.item_name, Orders.order_total
from Orders
left join Menu on Menu.menu_id = Orders.order_id
where Orders.order_id > 3;
-- 
select Menu.item_name, max(Orders.order_total)
from Menu
left join Orders on Menu.menu_id = Orders.order_id
where Orders.order_id > 3
group by Orders.order_total, Menu.item_name;
-- 
select Menu.item_name, max(Orders.order_total)
from Orders
left join Menu on Menu.menu_id = Orders.order_id
where Orders.order_id > 3
group by Menu.item_name; -- /* group by Menu.item_name, Orders.order_total; */
-- 
/* 9 . select the names and emails of users who have placed orders from a particular restaurant, 
along with the total cost of their orders*/
-- select * from User right join Orders on User.user_id = Orders.order_id;
select Users.name, Users.email, Restaurants.name
from Users
join Restaurants on User.user_id = Restaurants.restaurent_id;
-- /* ERROR */
select zomato.Users.name, zomato.Users.email
from zomato.Users;
-- /* ERROR */
/* 10 . select the name and phone number of drivers who have delivered more than 20 orders*/
-- select * from Orders left join Drivers on Orders.order_id = Drivers.driver_id;
select Drivers.name, Drivers.phone, Orders.order_total
from Drivers
left join Orders on Drivers.driver_id = Orders.order_id;
-- 
select Drivers.name, Drivers.phone, Orders.order_total
from Drivers
left join Orders on Drivers.driver_id = Orders.order_id
where Orders.order_total > 150;
-- 
/* 11 . select the name and phone number of drivers who have delivered more than 20 orders 
and have a rating of 4 or higher*/
-- select * from Orders left join Drivers on Orders.order_id = Drivers.driver_id;
select Drivers.name, Drivers.phone, Orders.order_total
from Drivers
join Orders on Drivers.driver_id = Orders.order_id
where Orders.order_total > 150;
-- 
select Drivers.name, Drivers.phone, Orders.order_total, Rating.rating_id
from Drivers
join Orders on Drivers.driver_id = Orders.order_id
join Rating on Drivers.driver_id = Rating.rating_id
where Orders.order_total > 150 and Rating.rating_id >= 0;
-- 
/* 12 . select the names of the restaurants that have not received any orders from a particular user*/
-- select * from Restaurants right join Orders on Restaurants.restaurent_id = Orders.order_id;
select Restaurants.name, Orders.order_id
from Orders
right join Restaurants on Orders.order_id = Restaurants.restaurent_id;
-- 
select Restaurants.name, Orders.order_id
from Orders
right join Restaurants on Orders.order_id = Restaurants.restaurent_id
where Orders.order_id <= 1;
-- 
-- ------------------------------------ -- 
