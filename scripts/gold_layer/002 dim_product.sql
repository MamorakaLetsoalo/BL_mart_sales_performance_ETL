-- Create dim product table
CREATE TABLE gold.dim_product
(
    product_ID INT IDENTITY(1,1) PRIMARY KEY,
    sku VARCHAR(50) ,
    product_name VARCHAR(200),
    category VARCHAR(100),
    sub_category VARCHAR(100),
    supplier VARCHAR(150),
    unit_price DECIMAL(12,2),
    cost_price DECIMAL(12,2),
    reorder_threshold INT,
    created_at DATETIME DEFAULT GETDATE()
);