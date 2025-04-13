-- database creation

CREATE DATABASE bookstore;

USE bookstore;

-- Table creation

-- This is table for book language

CREATE TABLE book_language (
    language_id INT PRIMARY KEY AUTO_INCREMENT,
    language_name VARCHAR(100) NOT NULL
);

-- Table for publisher
    CREATE TABLE publisher (
    publisher_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    address_id INT,
    FOREIGN KEY (address_id) REFERENCES address(address_id)
    
);

-- Table for author

CREATE TABLE author (
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100),
    last_name VARCHAR(100)
);


-- Table for country
CREATE TABLE country (
    country_id INT PRIMARY KEY AUTO_INCREMENT,
    country_name VARCHAR(100) NOT NULL


-- Table for book
CREATE TABLE book (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    publisher_id INT,
    language_id INT,
    FOREIGN KEY (publisher_id) REFERENCES publisher(publisher_id),
    FOREIGN KEY (language_id) REFERENCES book_language(language_id)
);


-- Table for book_author
CREATE TABLE book_author (
    book_id INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id),
    FOREIGN KEY (author_id) REFERENCES author(author_id)

);

-- Table for address
CREATE TABLE address (
    address_id INT PRIMARY KEY AUTO_INCREMENT,
    street VARCHAR(100),
    city VARCHAR(100),
    country_id INT,
    FOREIGN KEY (country_id) REFERENCES country(country_id)
);

-- Table for address_status
CREATE TABLE address_status (
    status_id INT PRIMARY KEY AUTO_INCREMENT,
    status_name VARCHAR(100) NOT NULL
);

-- Table for customer
CREATE TABLE customer (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100)
);

-- Table for shipping_method
CREATE TABLE shipping_method (
    shipping_method_id INT PRIMARY KEY AUTO_INCREMENT,
    method_name VARCHAR(100) NOT NULL
);

-- Table for order_status
CREATE TABLE order_status (
    order_status_id INT PRIMARY KEY AUTO_INCREMENT,
    status_name VARCHAR(100) NOT NULL
);


-- Table for cust_order
CREATE TABLE cust_order (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    shipping_method_id INT,
    order_status_id INT,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (shipping_method_id) REFERENCES shipping_method(shipping_method_id),
    FOREIGN KEY (order_status_id) REFERENCES order_status(order_status_id)
);

-- Table for customer_address
CREATE TABLE customer_address (
    customer_id INT,
    address_id INT,
    address_status_id INT,
    PRIMARY KEY (customer_id, address_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (address_id) REFERENCES address(address_id),
    FOREIGN KEY (address_status_id) REFERENCES address_status(status_id)
);
-- Table for order_line
CREATE TABLE order_line (
    order_id INT,
    book_id INT,
    quantity INT,
    price DECIMAL(10,2),
    PRIMARY KEY (order_id, book_id),
    FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id)
);

-- Table for order_history
CREATE TABLE order_history (
    history_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    status_id INT,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
    FOREIGN KEY (status_id) REFERENCES order_status(order_status_id)
);

-- Content insertion starts from here


-- Customer content insertion
INSERT INTO customer (first_name, last_name, email) VALUES 
('John', 'Johnson', 'john@example.com'),
('James', 'Williams', 'james@example.com'),
('Johnson', 'Williams', 'johnson@example.com');
('victor', 'Jude', 'victor@example.com');

-- Shipping method insertion
INSERT INTO shipping_method (method_name) VALUES 
('Standard'), 
('Express');

-- Order status insertion
INSERT INTO order_status (status_name) VALUES 
('Pending'), 
('Shipped'), 
('Delivered');

-- Customer order insertion
INSERT INTO cust_order (customer_id, shipping_method_id, order_status_id) VALUES 
(1, 1, 1),
(2, 2, 2);

-- Address status insertion
INSERT INTO address_status (status_name) VALUES 
('Home'), 
('Work');

-- Customer address insertion
INSERT INTO customer_address (customer_id, address_id, address_status_id) VALUES 
(1, 1, 1),
(2, 2, 2);

-- Author insertion
INSERT INTO author (first_name, last_name) VALUES 
('John', 'james'),
('Janet', 'Smith'),
('Victoria', 'Zola');

-- country insertion
INSERT INTO country (country_name) VALUES 
('USA'), 
('South Africa'), 
('Nigeria');

-- book language insertion
INSERT INTO book_language (language_name) VALUES 
('English'), 
('French'), 
('Spanish');

-- address insertion
INSERT INTO address (street, city, country_id) VALUES 
('123 Elm St', 'New York', 1),
('456 Maple Ave', 'Toronto', 2),
('789 Rue de Paris', 'Paris', 3);

-- publisher insertion
  INSERT INTO publisher (name, address_id) VALUES 
('Pearson', 1),
('Reilly Media', 2),
('Gallimard', 3);

-- book insertion
INSERT INTO book (title, publisher_id, language_id) VALUES 
('Learning SQL', 1, 1),
('Advanced Python', 2, 1),
('Germinal', 3, 2);

-- book author insertion
INSERT INTO book_author (book_id, author_id) VALUES 
(1, 1),
(2, 2),
(3, 3);

-- order line insertion
INSERT INTO order_line (order_id, book_id, quantity, price) VALUES 
(4, 1, 2, 29.99),
(4, 2, 1, 49.99),
(5, 3, 1, 19.99);

-- order history insertion
INSERT INTO order_history (order_id, status_id) VALUES 
(4, 1),
(4, 2),
(5, 2);
