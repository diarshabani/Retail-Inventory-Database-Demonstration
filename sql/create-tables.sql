CREATE DATABASE cs204_demo;

CREATE TABLE Categories (
                            category_id INT PRIMARY KEY,
                            category_name VARCHAR(255)
);

CREATE TABLE Suppliers (
                           supplier_id INT PRIMARY KEY,
                           supplier_name VARCHAR(255),
                           phone VARCHAR(20),
                           email VARCHAR(255)
);

CREATE TABLE Products (
                          product_id INT PRIMARY KEY,
                          product_name VARCHAR(255),
                          unit_price INT,
                          qoh INT,
                          category_id INT,
                          supplier_id INT,
                          FOREIGN KEY (category_id) REFERENCES Categories(category_id),
                          FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id)
);

CREATE TABLE Orders (
                        order_id INT PRIMARY KEY,
                        customer_id VARCHAR(255),
                        product_id INT,
                        quantity INT NOT NULL,
                        order_amount INT NOT NULL,
                        order_date DATE,
                        order_time TIME,
                        FOREIGN KEY (product_id) REFERENCES Products(product_id)
);