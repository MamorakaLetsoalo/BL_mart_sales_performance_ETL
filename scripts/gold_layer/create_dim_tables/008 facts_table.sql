--create facts table

CREATE TABLE gold.fact_sales
(
    sales_ID BIGINT IDENTITY(1,1) PRIMARY KEY,
    customer_ID INT,
    product_ID INT,
    supplier_ID INT,
    store_ID INT,
    inventory_ID INT,
    date_ID INT,
    unit_price DECIMAL(32,2),
    cost_price DECIMAL(32,2),
    payment_method VARCHAR(50),
    cashier_name VARCHAR(100),
    qty INT,
    transaction_amount DECIMAL(32,2),
    transaction_discount DECIMAL(32,2),
    line_amount DECIMAL(32,2),
    created_at DATETIME DEFAULT GETDATE(),

);