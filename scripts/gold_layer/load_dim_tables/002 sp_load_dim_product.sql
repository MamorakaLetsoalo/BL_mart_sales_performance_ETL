--stored procedure to load dim product

CREATE OR ALTER PROCEDURE gold.sp_Load_Dim_Product
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dwh_BL_mart].gold.dim_product
    (
        sku,
        product_name,
        category,
        sub_category,
        supplier,
        unit_price,
        cost_price,
        reorder_threshold
    )

    SELECT DISTINCT

        sku,
        product_name,
        category,
        sub_category,
        supplier,
        unit_price,
        cost_price,
        reorder_threshold

    FROM [dwh_BL_mart].silver.customer_transactions

END;
GO
