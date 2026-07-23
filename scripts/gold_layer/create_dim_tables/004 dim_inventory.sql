--create inventory dimension

CREATE TABLE gold.dim_inventory
(
    inventory_ID INT IDENTITY(1,1) PRIMARY KEY,
    sku VARCHAR(50),
    stock_on_hand INT,
    reorder_threshold INT,
    created_at DATETIME DEFAULT GETDATE()
);

