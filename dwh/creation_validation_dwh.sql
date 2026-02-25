
CREATE DATABASE olist_dwh;
USE olist_dwh;

CREATE TABLE Time (
	time_id INT PRIMARY KEY,
    date DATE,
    day INT,
    month INT,
    quarter INT,
    year INT
);


CREATE TABLE Product (
    product_id VARCHAR(50) PRIMARY KEY,
    product_category_name VARCHAR(50),
    product_weight_g INT,
    product_length_cm INT,
    product_height_cm INT,
    product_width_cm INT,
    product_photos_qty INT
);

CREATE TABLE Customer (
    customer_id VARCHAR(50) PRIMARY KEY,
    customer_city VARCHAR(50),
    customer_state VARCHAR(50),
    customer_zip_code_prefix INT,
    latitude DECIMAL(10,6),
    longitude DECIMAL(10,6)
);

CREATE TABLE Seller (
    seller_id VARCHAR(50) PRIMARY KEY,
    seller_city VARCHAR(50),
    seller_state VARCHAR(50),
    seller_zip_code_prefix INT,
    latitude DECIMAL(10,6),
    longitude DECIMAL(10,6)
);

CREATE TABLE Sales (
	order_id VARCHAR(50),
    order_item_id INT,
    time_id INT,
    product_id VARCHAR(50),
    customer_id VARCHAR(50),
    seller_id VARCHAR(50),
    review_score INT,
    price DECIMAL(10,2),
    freight_value DECIMAL(10,2),
    total_item_value DECIMAL(20,6),
    delivery_delay_days INT,
    is_delivered BOOLEAN,
    PRIMARY KEY (order_id, order_item_id),
    FOREIGN KEY (time_id) REFERENCES Time(time_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (seller_id) REFERENCES Seller(seller_id)
);

SELECT order_id, order_item_id, COUNT(*) AS nb_lignes
FROM Sales
GROUP BY order_id, order_item_id
HAVING nb_lignes > 1;

SELECT COUNT(*) AS nb_null_delivery_delay
FROM Sales
WHERE total_item_value IS NULL;

SELECT COUNT(*) AS nb_null_delivery_delay
FROM Sales
WHERE delivery_delay_days IS NULL;

SELECT COUNT(*) AS nb_null_review_score
FROM Sales
WHERE review_score IS NULL;

select count(*) as nb_total
from sales;

SELECT *
FROM Sales
WHERE product_id IS NULL;

SELECT COUNT(*) AS nb_null_customer_id
FROM Sales
WHERE customer_id IS NULL;
SELECT COUNT(*) AS nb_null_seller_id
FROM Sales
WHERE seller_id IS NULL;
SELECT COUNT(*) AS nb_null_seller_id
FROM Sales
WHERE seller_id IS NULL;

SELECT COUNT(*) AS nb_null_time_id
FROM Sales
WHERE time_id IS NULL;

-- Prix négatifs
SELECT COUNT(*) 
FROM Sales
WHERE price < 0 OR freight_value < 0;

-- Product
SELECT COUNT(*) AS nb_invalid_product
FROM Sales s
LEFT JOIN Product p ON s.product_id = p.product_id
WHERE p.product_id IS NULL;

-- Customer
SELECT COUNT(*) AS nb_invalid_customer
FROM Sales s
LEFT JOIN Customer c ON s.customer_id = c.customer_id
WHERE c.customer_id IS NULL;

-- Seller
SELECT COUNT(*) AS nb_invalid_seller
FROM Sales s
LEFT JOIN Seller sl ON s.seller_id = sl.seller_id
WHERE sl.seller_id IS NULL;

-- Time
SELECT COUNT(*) AS nb_invalid_time
FROM Sales s
LEFT JOIN Time t ON s.time_id = t.time_id
WHERE t.time_id IS NULL;


CREATE TABLE control_sales AS
SELECT COUNT(*) AS nb_rows,
       SUM(price) AS total_price,
       SUM(freight_value) AS total_freight,
       AVG(delivery_delay_days) AS avg_delay,
       AVG(review_score) AS avg_review
FROM Sales;


select * from control_sales;

  





