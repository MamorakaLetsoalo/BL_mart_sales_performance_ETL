--Stored procedure to create dim inventory

CREATE OR ALTER PROCEDURE gold.sp_Load_dim_inventory
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO dwh_BL_mart.gold.dim_inventory
    (
        sku,
        stock_on_hand,
        reorder_threshold
    )

    SELECT DISTINCT

        sku,
        stock_on_hand,
        reorder_threshold

    FROM dwh_BL_mart.silver.customer_transactions
END;
GO