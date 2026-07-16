-- create din store table

CREATE TABLE gold.dim_store
(
    store_key INT IDENTITY(1,1) PRIMARY KEY,
    store_name VARCHAR(150),
    store_city VARCHAR(100),
    store_province VARCHAR(100),
    store_region VARCHAR(100),
    store_manager VARCHAR(100),
    created_at DATETIME DEFAULT GETDATE()
);