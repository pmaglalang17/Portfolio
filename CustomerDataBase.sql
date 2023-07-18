DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS order_details;
DROP TABLE IF EXISTS items;
DROP TABLE IF EXISTS artists;
DROP TABLE IF EXISTS employees;




-- create tables

CREATE TABLE customers

(
  
customer_id           INT          ,
  
customer_first_name   VARCHAR(20),
  
customer_last_name    VARCHAR(20)     NOT NULL,
  
customer_address      VARCHAR(50)    NOT NULL,
  
customer_city         VARCHAR(20)     NOT NULL,
  
customer_state        CHAR(2)         NOT NULL,
  
customer_zip          CHAR(5)     NOT NULL,
  
customer_phone        CHAR(10)     NOT NULL,
  
customer_fax          CHAR(10),
  
CONSTRAINT customers_pk 
  PRIMARY KEY (customer_id)

)
;



CREATE TABLE artists

(
  
artist_id           INT             NOT NULL,
  
artist_name   VARCHAR(30),
  
CONSTRAINT artist_pk 
  PRIMARY KEY (artist_id)

)
;


CREATE TABLE items

(
  
item_id       INT             NOT NULL,
  
title         VARCHAR(50)     NOT NULL,
  
artist_id     INT     NOT NULL,
  
unit_price    DECIMAL(9,2)    NOT NULL,
  
CONSTRAINT items_pk 
    PRIMARY KEY (item_id),
 
CONSTRAINT items_fk_artists
    FOREIGN KEY (artist_id) REFERENCES artists (artist_id)
);





CREATE TABLE employees

(
  
employee_id         INT               NOT NULL,
  
last_name           VARCHAR(20)       NOT NULL,
  
first_name          VARCHAR(20)       NOT NULL,
   
manager_id          INT
,
CONSTRAINT employees_pk 
  PRIMARY KEY (employee_id),
CONSTRAINT emp_fk_mgr FOREIGN KEY (manager_id) REFERENCES employees(employee_id) );

CREATE TABLE orders

(
  
order_id          INT         NOT NULL,
  
customer_id       INT         NOT NULL,
  
order_date        DATE        NOT NULL,
  
shipped_date      DATE,
 
employee_id       INT,
  
CONSTRAINT orders_pk
    PRIMARY KEY (order_id),
  
CONSTRAINT orders_fk_customers
    FOREIGN KEY (customer_id) REFERENCES customers (customer_id),
CONSTRAINT orders_fk_employees
    FOREIGN KEY (employee_id) REFERENCES employees (employee_id)

);



CREATE TABLE order_details

(
  
order_id      INT           NOT NULL,
  
item_id       INT           NOT NULL,
  
order_qty     INT           NOT NULL,
  
CONSTRAINT order_details_pk 
    PRIMARY KEY (order_id, item_id),
  
CONSTRAINT order_details_fk_orders
    FOREIGN KEY (order_id)
    REFERENCES orders (order_id),
  
CONSTRAINT order_details_fk_items
    FOREIGN KEY (item_id)
    REFERENCES items (item_id)

);








-- insert rows into tables

INSERT INTO customers VALUES 

(1,'Korah','Blanca','1555 W Lane Ave','Columbus','OH','43221','6145554435','6145553928'), 

(2,'Yash','Randall','11 E Rancho Madera Rd','Madison','WI','53707','2095551205','2095552262'), 

(3,'Johnathon','Millerton','60 Madison Ave','New York','NY','10010','2125554800',NULL), 

(4,'Mikayla','Davis','2021 K Street Nw','Washington','DC','20006','2025555561',NULL), 

(5,'Kendall','Mayte','4775 E Miami River Rd','Cleves','OH','45002','5135553043',NULL), 

(6,'Kaitlin','Hostlery','3250 Spring Grove Ave','Cincinnati','OH','45225','8005551957','8005552826'), 

(7,'Derek','Chaddick','9022 E Merchant Wy','Fairfield','IA','52556','5155556130',NULL), 

(8,'Deborah','Davis','415 E Olive Ave','Fresno','CA','93728','5595558060',NULL), 

(9,'Karina','Lacy','882 W Easton Wy','Los Angeles','CA','90084','8005557000',NULL), 

(10,'Kurt','Nickalus','28210 N Avenue Stanford','Valencia','CA','91355','8055550584','055556689'), 

(11,'Kelsey','Eulalia','7833 N Ridge Rd','Sacramento','CA','95887','2095557500','2095551302'), 

(12,'Anders','Rohansen','12345 E 67th Ave NW','Takoma Park','MD','24512','3385556772',NULL), 

(13,'Thalia','Neftaly','2508 W Shaw Ave','Fresno','CA','93711','5595556245',NULL), 

(14,'Gonzalo','Keeton','12 Daniel Road','Fairfield','NJ','07004','2015559742',NULL), 

(15,'Ania','Irvin','1099 N Farcourt St','Orange','CA','92807','7145559000',NULL), 

(16,'Dakota','Baylee','1033 N Sycamore Ave.','Los Angeles','CA','90038','2135554322',NULL), 

(17,'Samuel','Jacobsen','3433 E Widget Ave','Palo Alto','CA','92711','4155553434',NULL), 

(18,'Justin','Javen','828 S Broadway','Tarrytown','NY','10591','8005550037',NULL), 

(19,'Kyle','Marissa','789 E Mercy Ave','Phoenix','AZ','85038','9475553900',NULL), 

(20,'Erick','Kaleigh','Five Lakepointe Plaza, Ste 500','Charlotte','NC','28217','7045553500',NULL), 

(21,'Marvin','Quintin','2677 Industrial Circle Dr','Columbus','OH','43260','6145558600','6145557580'), 

(22,'Rashad','Holbrooke','3467 W Shaw Ave #103','Fresno','CA','93711','5595558625','5595558495'), 

(23,'Trisha','Anum','627 Aviation Way','Manhatttan Beach','CA','90266','3105552732',NULL), 

(24,'Julian','Carson','372 San Quentin','San Francisco','CA','94161','6175550700',NULL), 

(25,'Kirsten','Story','2401 Wisconsin Ave NW','Washington','DC','20559','2065559115',NULL),

(26,'Ahmed','Azam','372 San Quentin','San Francisco','CA','94161','6175550700',NULL);





INSERT INTO artists(artist_id,artist_name) VALUES 

(10, 'Umani'),
(11, 'The Ubernerds'),
(12, 'No Rest For The Weary'),
(13, 'Burt Ruggles'),
(14, 'Sewed the Vest Pocket'),
(15, 'Jess & Odie'),
(16, 'Onn & Onn');


INSERT INTO items (item_id,title,artist_id,unit_price) VALUES 

(1,'Umami In Concert',10,17.95),

(2,'Race Car Sounds',11,13),

(3,'No Rest For The Weary',12,16.95),

(4,'More Songs About Structures and Comestibles',12,17.95),

(5,'On The Road With Burt Ruggles',13,17.5),

(6,'No Fixed Address',14,16.95),

(7,'Rude Noises',15,13),

(8,'Burt Ruggles: An Intimate Portrait',13,17.95),

(9,'Zone Out With Umami',10,16.95),

(10,'Etcetera',16,17);

INSERT INTO employees VALUES 

(1,'Smith',    'Cindy', null),

(2,'Jones',    'Elmer', 1),

(3,'Simonian', 'Ralph', 2),
(9,'Locario',  'Paulo',1),
(8,'Leary', 'Rhea',9),
(4,'Hernandez','Olivia',9),

(5,'Aaronsen', 'Robert',4),

(6,'Watson',   'Denise',8),

(7,'Hardy',    'Thomas',2);



INSERT INTO orders VALUES

(19, 1, '2012-10-23', '2012-10-28', 6),

(29, 8, '2012-11-05', '2012-11-11', 6),

(32, 11, '2012-11-10', '2012-11-13', NULL),

(45, 2, '2012-11-25', '2012-11-30', NULL),

(70, 10, '2012-12-28', '2013-01-07', 5),

(89, 22, '2013-01-20', '2013-01-22', 7),

(97, 20, '2013-01-29', '2013-02-02', 5),

(118, 3, '2013-02-24', '2013-02-28', 7),

(144, 17, '2013-03-21', '2013-03-29', NULL),

(158, 9, '2013-04-04', '2013-04-20', NULL),

(165, 14, '2013-04-11', '2013-04-13', NULL),

(180, 24, '2013-04-25', '2013-05-30', NULL),

(231, 15, '2013-06-14', '2013-06-22', NULL),

(242, 23, '2013-06-24', '2013-07-06', 3),

(264, 9, '2013-07-15', '2013-07-18', 6),

(298, 18, '2013-08-18', '2013-09-22', 3),

(321, 2, '2013-09-09', '2013-10-05', 6),

(381, 7, '2013-11-08', '2013-11-16', 7),
(413, 17, '2013-12-05', '2014-01-11', 7),

(442, 5, '2013-12-28', '2014-01-03', 5),

(479, 1, '2014-01-30', '2014-03-03', 3),

(491, 16, '2014-02-08', '2014-02-14', 5),


(523, 3, '2014-03-07', '2014-03-15', 3),

(548, 2, '2014-03-22', '2014-04-18', NULL),

(550, 17, '2014-03-23', '2014-04-03', NULL),

(601, 16, '2014-04-21', '2014-04-27', NULL),

(607, 20, '2014-04-25', '2014-05-04', NULL),

(624, 2, '2014-05-04', '2014-05-09', NULL),

(627, 17, '2014-05-05', '2014-05-10', NULL),

(630, 20, '2014-05-08', '2014-05-18', 7),

(651, 12, '2014-05-19', '2014-06-02', 7),

(658, 12, '2014-05-23', '2014-06-02', 7),

(687, 17, '2014-06-05', '2014-06-08', NULL),

(693, 9, '2014-06-07', '2014-06-19', NULL),

(703, 19, '2014-06-12', '2014-06-19', 7),

(778, 13, '2014-07-12', '2014-07-21', 7),

(796, 17, '2014-07-19', '2014-07-26', 5),

(800, 19, '2014-07-21', '2014-07-28', NULL),

(802, 2, '2014-07-21', '2014-07-31', NULL),

(824, 1, '2014-08-01', NULL, NULL),

(827, 18, '2014-08-02', NULL, NULL),

(829, 9, '2014-08-02', NULL, NULL);




INSERT INTO order_details VALUES 

(381,1,1),
(601,9,1),
(442,1,1),
(523,9,1),

(630,5,1),
(778,1,1),
(693,10,1),
(118,1,1),

(264,7,1),
(607,10,1),
(624,7,1),
(658,1,1),

(800,5,1),
(158,3,1),
(321,10,1),
(687,6,1),

(827,6,1),
(144,3,1),

(479,1,2),

(630,6,2),
(796,5,1),
(97,4,1),
(601,5,1),

(800,1,1),
(29,10,1),
(70,1,1),


(165,4,1),
(180,4,1),
(231,10,1),


(413,10,1),
(491,6,1),

(607,3,1),
(651,3,1),
(703,4,1),


(802,3,1),
(824,7,2),

(829,1,1),
(550,4,1),
(796,7,1),
(693,6,1),
(29,3,1),
(32,7,1),
(242,1,1),

(298,1,1),
(479,4,1),
(548,9,1),
(627,9,1),

(778,3,1),

(19,5,1),
(89,4,1),

(242,6,1),
(264,4,1),
(550,1,1),


(693,7,3),
(824,3,1),
(829,5,1),
(829,9,1);


SELECT customer_first_name, customer_last_name, customer_phone
FROM customers
ORDER BY customer_last_name, customer_first_name

/* 
This query selects the customer's first name, last name and phone number from the customers table. I then used the ORDER BY function in order to sort the names 
in alphabetical order prioritizing customer last name first.
*/

SELECT customer_first_name + ' ' + customer_last_name AS FullName, customer_phone AS Phone
FROM customers
WHERE customer_state IN ('NY','NJ','DC')
ORDER BY customer_phone

/*
This query selects and combines the customers' first and last name under the column aliased as "FullName." It also selects the customers phone number under the column
aliased as "Phone." I also set a condition in which only customers that live in the states 'NY', 'NJ' and 'DC' are show. We order the results by customer_phone
*/

SELECT DISTINCT customer_city AS Cities
FROM customers
WHERE customer_id IS NOT NULL
ORDER BY customer_city

/* 
This query selects all unique cities in which there are customers that have a customer ID and it is sorted by city name.
*/

SELECT title, unit_price AS Original, CAST(ROUND(unit_price* 0.75,2) AS DECIMAL (8,2)) AS Sale
FROM items
ORDER BY Sale 

/* 
This query creates a derived function aliased as "Sale." The column is derived from the unit_price of the items table and it shows a 25% sale on all the items.
The ROUND function is used to round the derived values to two decimal places. The CAST function is used to specify that there can be a maximum of 8 values to
the left of the decimal point and 2 the the right of the decimal point. The query is then sorted in ascending order by Sale.
*/

SELECT customer_city, customer_first_name, customer_last_name, customer_zip
FROM customers
WHERE customer_zip LIKE '4%'

/*
This query shows the customer_city, customer_first_name, customer_last_name and customer_zip from the customers table. We use the LIKE function to filter through
only customer who live in a zip code that start with a 4.
*/


SELECT order_id, FORMAT (order_date, 'MMMM dd, yyyy') AS Ordered
FROM orders
WHERE order_date>= '2014-03-01' and order_date<= '2014-04-30'
ORDER BY order_date

/*
This query selects order_id and order_date formatted as Month Date, Year with the alias "Ordered" from the orders table. We then filter through the orders and 
only show the orders between March 1, 2014 through April 30, 2014. We then sort the results by order_date.
*/

SELECT order_id,  FORMAT(order_date, 'MM/dd/yy') AS Ordered
FROM orders
WHERE order_date BETWEEN '2014-05-01' AND '2014-05-31'
ORDER BY order_date

/*
This query shows the orders in May and they in ascending order.
*/

SELECT order_id, customer_id, DATEDIFF (d, order_date, shipped_date) AS Days
FROM orders
Where DATEDIFF (d, order_date, shipped_date)> 15
ORDER BY Days DESC

/*
This query shows the order_id, customer_id and a derived column that shows the difference between the order date and shipped data as a column aliased as "Days" 
from the orders table. A condition is set in which only orders that took at least 15 days to ship show and they are ordered by the column "Days."
*/

SELECT order_id, customer_id, order_date
FROM orders
WHERE shipped_date IS NULL
ORDER BY order_date

/* 
This query shows the order_id, customer_id and order_date from the orders table. The query filters orders who do not have a shipped_date which means they are
yet to be shipped. They are then ordered by the oldest order first.
*/

SELECT order_id, order_date, shipped_date, DATENAME(dw, order_date) AS Order_Day
FROM orders
WHERE DATENAME(dw, order_date)= 'Saturday' or DATENAME(dw, order_date)= 'Sunday'
ORDER BY order_date 

/*
This query shows the order_id, order_date, shipped date and a derived column that shows the day of the week in which the order was made from the
orders table. It filters through the orders that where made on Saturday and Sunday and ordered by the oldest order date.
*/


SELECT customer_last_name, customer_phone, customer_fax
FROM customers
WHERE customer_fax IS NOT NULL

/* 
This query shows the customer_last_name, customer_phone and customer_fax from the customers table, but only for the customers who have a fax number.
*/

INSERT INTO items (item_id, title, artist_id, unit_price)
VALUES (11, 'Ode to My ERD', 15, 11.99)

/* 
This query creates a new row in the items table.
*/

UPDATE items
SET unit_price= 9.77
WHERE item_id=11

/* 
This query updates the unit price of the item that has the item_id o 11.
*/

DELETE FROM items WHERE item_id=11

/* 
This query deletes the item with the item_id of 11
*/

SELECT CONCAT (customer_last_name, ', ', customer_first_name) AS Customer,
CONCAT ( '(', SUBSTRING (customer_phone, 1,3), ') ',
SUBSTRING (customer_phone, 4, 3), '-',
SUBSTRING (customer_phone, 7, 4)) AS Phone
FROM customers
ORDER BY customer_last_name
/*
This query uses the CONCAT function to combine customer first and last name under the column aliased as "Customer" and formats the customer phone number as (XXX) 
XXX-XXXX from the customers table. The result is then ordered by customer_last_name.
*/
