TRUNCATE TABLE bronze.customer_transactions

TRUNCATE TABLE silver.customer_transactions

-- Truncate Fact Table
TRUNCATE TABLE gold.fact_sales;

-- Truncate Dimension Tables

TRUNCATE TABLE gold.dim_customer;

TRUNCATE TABLE gold.dim_product;

TRUNCATE TABLE gold.dim_store;

TRUNCATE TABLE gold.dim_supplier;

TRUNCATE TABLE gold.dim_inventory;

TRUNCATE TABLE gold.dim_date;