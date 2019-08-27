DROP DATABASE IF EXISTS bamazon;

CREATE DATABASE bamazon;

USE  bamazon;

CREATE TABLE products(
item_id INT AUTO_INCREMENT,
product_name VARCHAR(100) NOT NULL,
department_name	VARCHAR(30) NOT NULL,
price DECIMAL(5,2) NOT NULL,
stock_quantity INT NOT NULL,
PRIMARY KEY(item_id)
);

INSERT INTO products (product_name, department_name, price, 
stock_quantity) VALUES ("Echo dot (3rd Gen)", "Electronics", 29.99, 40);

INSERT INTO products (product_name, department_name, price, 
stock_quantity) VALUES ("Fancy Linen 3pc Non-Slip Bath Mat", "Home and Kitchen", 18.99, 12);

INSERT INTO products (product_name, department_name, price, 
stock_quantity) VALUES ("AquaDance High Pressure 6-Setting 3.5 Chrome Face Handheld Shower", "Home and Kitchen", 16.99, 34);

INSERT INTO products (product_name, department_name, price, 
stock_quantity) VALUES ("Bose QuietComfort 35 II Wireless Bluetooth Headphones", "Home Audio and Theatre", 299.99, 8);

INSERT INTO products (product_name, department_name, price, 
stock_quantity) VALUES ("Tribit MaxSound Plus Portable Bluetooth Speaker", "Home Audio and Theatre", 47.29, 89);

INSERT INTO products (product_name, department_name, price, 
stock_quantity) VALUES ("Xbox One X 1TB Console", "Electronics", 389.00, 3);

INSERT INTO products (product_name, department_name, price, 
stock_quantity) VALUES ("Frederick Douglass: Prophet of Freedom", "Books", 14.00, 99);

INSERT INTO products (product_name, department_name, price, 
stock_quantity) VALUES ("The Outsider: A Novel", "Books", 16.39, 27);

INSERT INTO products (product_name, department_name, price, 
stock_quantity) VALUES ("NordicTrack T Series Treadmills (6.5S & 6.5Si Models)", "Sports and Fitness", 899.00, 11);

INSERT INTO products (product_name, department_name, price, 
stock_quantity) VALUES ("Bowflex SelectTech 552 Adjustable Dumbbells (Pair)", "Sports and Fitness", 299.00, 74);

SELECT * FROM  products;


