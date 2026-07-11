/*Script Purpose:
This script creates tables in the 'bronze' schema
Run this script to re-define the DDL structure of 'bronze' Tables*/

--create table "customer_transactions" in the bronze layer
 IF OBJECT_ID ('bronze.customer_transactions' , 'U') IS NOT NULL
 DROP TABLE bronze.customer_transactions
 CREATE TABLE bronze.customer_transactions(
    transaction_id INT IDENTITY(1,1) PRIMARY KEY,
    transaction_date DATETIME NOT NULL,
    payment_method VARCHAR(50) NOT NULL,
    cashier_name VARCHAR(100) NOT NULL,
    transaction_amount DECIMAL(32,2) NOT NULL,
    transaction_discount DECIMAL(32,2),
    customer_first_name VARCHAR(100),
    customer_last_name VARCHAR(100),
    customer_email VARCHAR(250),
    customer_phone VARCHAR(50),
    customer_city VARCHAR(50),
    customer_province VARCHAR(50),
    customer_loyalty_tier VARCHAR(50),
    customer_since DATE,
    store_name VARCHAR(250),
    store_city VARCHAR(50),
    store_province VARCHAR(50),
    store_region VARCHAR(50),
    store_manager VARCHAR(50),
    product_name VARCHAR(250),
    category VARCHAR(100),
    sub_category VARCHAR(100),
    sku VARCHAR(100),
    unit_price DECIMAL(32,2),
    cost_price DECIMAL(32,2),
    supplier VARCHAR(150),
    qty INT,
    line_amount DECIMAL(32,2),
    stock_on_hand INT,
    reorder_threshold INT,
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME NULL
);