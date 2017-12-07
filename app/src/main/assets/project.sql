﻿--script to create final project database

.echo ON

.mode list
.separator "  |  "

.output Group.txt

PRAGMA foreign_keys = ON;


DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS admin;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS order_details;
DROP TABLE IF EXISTS food;
DROP TABLE IF EXISTS cuisine;
DROP TABLE IF EXISTS food_ingredient_amount;
DROP TABLE IF EXISTS food_ingredient;
DROP TABLE IF EXISTS feedback;

CREATE TABLE customer
(cust_id INTEGER, 
cust_pwd VARCHAR(15),
CONSTRAINT customer_cust_id_pk PRIMARY KEY (cust_id));

CREATE TABLE admin
(ad_id INTEGER, 
ad_pwd VARCHAR(15),
CONSTRAINT admin_ad_id_pk PRIMARY KEY (ad_id));

CREATE TABLE cuisine
(cuis_id VARCHAR(10), 
cuis_name VARCHAR(30),
CONSTRAINT cuisine_cuis_id_pk PRIMARY KEY (cuis_id));

CREATE TABLE food
(f_id VARCHAR(10), 
cuis_id INTEGER,
f_name VARCHAR(30),
f_price REAL,
ad_id INTEGER,
CONSTRAINT food_cuis_id_fk FOREIGN KEY (cuis_id) REFERENCES cuisine(cuis_id),
CONSTRAINT food_ad_id_fk FOREIGN KEY (ad_id) REFERENCES admin(ad_id),
CONSTRAINT food_f_id_pk PRIMARY KEY (f_id));

CREATE TABLE orders
(o_id INTEGER, 
cust_id INTEGER,
/*o_date DATE,*/
CONSTRAINT orders_o_id_pk PRIMARY KEY (o_id),
CONSTRAINT orders_cust_id_fk FOREIGN KEY (cust_id) REFERENCES customer(cust_id));

CREATE TABLE order_details
(o_id INTEGER, 
f_id VARCHAR(10),
qtyord INTEGER, 
CONSTRAINT order_details_o_id_fk FOREIGN KEY (o_id) REFERENCES orders(o_id),
CONSTRAINT order_details_f_id_fk FOREIGN KEY (f_id) REFERENCES food(f_id),
CONSTRAINT order_details_oid_fid_pk PRIMARY KEY(o_id, f_id));

CREATE TABLE food_ingredient
(fi_id VARCHAR(10), 
fi_name VARCHAR(25),
carb INTEGER, 
fat INTEGER, 
sugar INTEGER, 
fiber INTEGER, 
calories INTEGER, 
CONSTRAINT food_ingredient_fi_id_pk PRIMARY KEY(fi_id));

CREATE TABLE food_ingredient_amount
(f_id INTEGER, 
fi_id INTEGER,
fi_amount REAL, 
CONSTRAINT food_ingredient_amount_f_id_fk FOREIGN KEY (f_id) REFERENCES food(f_id),
CONSTRAINT food_ingredient_amount_fi_id_fk FOREIGN KEY (fi_id) REFERENCES food_ingredient(fi_id),
CONSTRAINT food_ingredient_amount_fid_fiid_pk PRIMARY KEY(f_id, fi_id));

CREATE TABLE feedback
(f_id INTEGER, 
cust_id INTEGER,
comment VARCHAR(200),
CONSTRAINT feedback_f_id_fk FOREIGN KEY (f_id) REFERENCES food(f_id),
CONSTRAINT feedback_cust_id_fk FOREIGN KEY (cust_id) REFERENCES customer(cust_id),
CONSTRAINT feedback_fid_custid_pk PRIMARY KEY(f_id, cust_id));

INSERT INTO customer VALUES
(1001,'customer1');

INSERT INTO customer VALUES
(1002,'customer2');

INSERT INTO customer VALUES
(1003,'customer3');

INSERT INTO customer VALUES
(1004,'customer4');

INSERT INTO customer VALUES
(1005,'customer5');


INSERT INTO cuisine VALUES
('c1','Breakfast');

INSERT INTO cuisine VALUES
('c2','Lunch');

INSERT INTO cuisine VALUES
('c3','Dinner');


INSERT INTO admin VALUES
(2001,'Admin1');

INSERT INTO admin VALUES
(2002,'Admin2');


INSERT INTO orders VALUES 
(1,1001,date('2017-10-30'));

INSERT INTO orders VALUES 
(2,1002,date('2017-10-28'));

INSERT INTO orders VALUES 
(3,1003,date('2017-10-25'));

INSERT INTO orders VALUES 
(4,1004,date('2017-10-10'));

INSERT INTO orders VALUES 
(5,1005,date('2017-10-03'));


INSERT INTO food VALUES
('f11','c3','Shrimp Fried Rice',8.59, 2001);

INSERT INTO food VALUES
('f12','c3','Meatball Sub',8.59, 2001);

INSERT INTO food VALUES
('f21','c1','Tomato Omlette',3.99, 2002);

INSERT INTO food VALUES
('f22','c1','Oat Meal',3.99, 2002);

INSERT INTO food VALUES
('f31','c2','Cheese Pizza',2.99, 2001);

INSERT INTO food VALUES
('f32','c2','Chicken Burger',2.99, 2002);

INSERT INTO food VALUES
('f33','c2','Rice Bowl',2.99, 2002);


INSERT INTO order_details VALUES
(1,'f11',1);

INSERT INTO order_details VALUES
(2,'f12',1);

INSERT INTO order_details VALUES
(3,'f21',2);

INSERT INTO order_details VALUES
(4,'f22',1);

INSERT INTO order_details VALUES
(5,'f31',1);

INSERT INTO order_details VALUES
(6,'f32',2);

INSERT INTO order_details VALUES
(7,'f33',2);


INSERT INTO food_ingredient VALUES			
('i1','Rice', 28, 0.3, 0.1, 0.4, 130);			
			
INSERT INTO food_ingredient VALUES			
('i2','Beef', 0, 15, 0, 0, 250);			
			
INSERT INTO food_ingredient VALUES			
('i3','Shrimp', 0.2, 0.3, 0, 0, 99);			
			
INSERT INTO food_ingredient VALUES			
('i4','Chicken', 0, 3, 0, 0, 151);			
			
INSERT INTO food_ingredient VALUES			
('i5','Carrot', 10, 0, 5, 3, 41);			
			
INSERT INTO food_ingredient VALUES			
('i6','Tomato', 4, 16, 3, 1, 18);			
			
INSERT INTO food_ingredient VALUES			
('i7','Oats', 3, 0, 2, 1, 14);			
			
INSERT INTO food_ingredient VALUES			
('i8','Cheese', 0, 35, 0, 0, 420);			
			
INSERT INTO food_ingredient VALUES			
('i9','Flour', 80, 3, 77, 6, 380);			


INSERT INTO food_ingredient_amount VALUES
('f11','i1', 1);

INSERT INTO food_ingredient_amount VALUES
('f11','i3', 0.5);

INSERT INTO food_ingredient_amount VALUES
('f11','i5', 0.25);

INSERT INTO food_ingredient_amount VALUES
('f11','i7', 0.1);

INSERT INTO food_ingredient_amount VALUES
('f12','i1', 1);

INSERT INTO food_ingredient_amount VALUES
('f12','i2', 0.5);

INSERT INTO food_ingredient_amount VALUES				
('f11','i1', 1);				
				
INSERT INTO food_ingredient_amount VALUES				
('f11','i3', 0.5);				
				
INSERT INTO food_ingredient_amount VALUES				
('f11','i5', 0.25);				
				
				
				
				
INSERT INTO food_ingredient_amount VALUES				
('f12','i10', 1);				
				
INSERT INTO food_ingredient_amount VALUES				
('f12','i2', 0.5);				
				
INSERT INTO food_ingredient_amount VALUES				
('f12','i6', 0.25);				
				
INSERT INTO food_ingredient_amount VALUES				
('f12','i8', 0.1);				
				
INSERT INTO food_ingredient_amount VALUES				
('f21','i8', 0.25);				
				
INSERT INTO food_ingredient_amount VALUES				
('f21','i6', 0.1);				
				
INSERT INTO food_ingredient_amount VALUES				
('f22','i7', 0.25);				
				
INSERT INTO food_ingredient_amount VALUES				
('f31','i8', 0.5);				
				
INSERT INTO food_ingredient_amount VALUES				
('f31','i6', 0.3);				
				
INSERT INTO food_ingredient_amount VALUES				
('f32','i8', 0.5);				
				
INSERT INTO food_ingredient_amount VALUES				
('f32','i4', 0.3);				
				
INSERT INTO food_ingredient_amount VALUES				
('f32','i6', 0.3);				
				
INSERT INTO food_ingredient_amount VALUES				
('f32','i9', 0.3);				
				
INSERT INTO food_ingredient_amount VALUES				
('f33','i6', 0.3);				
				
INSERT INTO food_ingredient_amount VALUES				
('f33','i8', 0.3);				
				
INSERT INTO food_ingredient_amount VALUES				
('f33','i9', 0.3);				
				


.output stdout
.echo OFF