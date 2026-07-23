--Create customer dimension tabele

CREATE TABLE gold.dim_customer
(
    customer_ID INT IDENTITY(1,1) PRIMARY KEY,
    customer_email VARCHAR(255),
    customer_first_name VARCHAR(100),
    customer_last_name VARCHAR(100),
    customer_phone VARCHAR(30),
    customer_city VARCHAR(100),
    customer_province VARCHAR(100),
    customer_loyalty_tier VARCHAR(50),
    customer_since DATE,
    created_at DATETIME DEFAULT GETDATE()
);

