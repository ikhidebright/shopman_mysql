CREATE SCHEMA `shopman`;

CREATE TABLE customers (
customer_id INT(11) PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR (50) NOT NULL,
last_name VARCHAR (50) NOT NULL,
dob DATE NOT NULL,
phone_number VARCHAR (20) NOT NULL,
address VARCHAR (255),
email VARCHAR (255) NOT NULL UNIQUE,
city VARCHAR (255) NOT NULL,
state VARCHAR (255) NOT NULL,
country VARCHAR (255) NOT NULL,
registration_date DATE,
password VARCHAR (255)
);

CREATE TABLE products (
product_id INT(11) PRIMARY KEY AUTO_INCREMENT,
name VARCHAR (255) NOT NULL,
description VARCHAR (255) NOT NULL,
price DECIMAL (15,2) NOT NULL,
discount_price DECIMAL (15,2),
quantity INT(11),
views INT(11),
likes INT(11),
date_added DATE,
status VARCHAR (50),
rating INT(5),
product_thumb VARCHAR (255) NOT NULL,
image_1 VARCHAR (255),
image_2 VARCHAR (255),
image_3 VARCHAR (255)
);

CREATE TABLE reviews (
review_id INT(11) PRIMARY KEY AUTO_INCREMENT,
rating INT(5) NOT NULL,
message VARCHAR (255) NOT NULL,
product_id INT(11) NOT NULL,
FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE orders (
order_id INT(11) PRIMARY KEY AUTO_INCREMENT,
order_date DATE,
order_quantity INT(11),
product_id INT(11),
customer_id INT(11),
FOREIGN KEY (product_id) REFERENCES products(product_id),
FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE payments (
payment_id INT(11) PRIMARY KEY AUTO_INCREMENT,
payment_date DATE,
card_holder_name VARCHAR (50),
card_type VARCHAR (50),
payment_status VARCHAR (50) NOT NULL,
amount_paid DECIMAL (15,2),
order_id INT(11),
FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

CREATE TABLE shipping (
shipping_id INT(11) PRIMARY KEY AUTO_INCREMENT,
shipping_date DATE,
shipping_fee DECIMAL (15,2),
shipping_address VARCHAR (255),
shipping_state VARCHAR (255),
shipping_city VARCHAR (255),
shipping_status VARCHAR (45),
order_id INT(11),
payment_id INT(11),
customer_id INT(11),
FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
FOREIGN KEY (payment_id) REFERENCES payments(payment_id),
FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

CREATE TABLE categories (
category_id INT(11) PRIMARY KEY AUTO_INCREMENT,
category_name VARCHAR (255),
product_id INT(11),
FOREIGN KEY (product_id) REFERENCES products(product_id)
);
