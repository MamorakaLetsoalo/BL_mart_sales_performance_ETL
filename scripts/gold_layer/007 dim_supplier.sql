--Create dim supplier table

CREATE TABLE gold.dim_supplier
(
    supplier_ID INT IDENTITY(1,1) PRIMARY KEY,
    supplier_name VARCHAR(150),
    created_at DATETIME DEFAULT GETDATE()
);