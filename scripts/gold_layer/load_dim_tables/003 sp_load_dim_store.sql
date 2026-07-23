-- Create stored procedure to load dim supplier table

CREATE OR ALTER PROCEDURE gold.sp_Load_Dim_Store
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO dwh_BL_mart.gold.dim_store
    (
        store_name,
        store_city,
        store_province,
        store_region,
        store_manager
    )
    SELECT DISTINCT

       store_name,
       store_city,
       store_province,
       store_region,
       store_manager

    FROM dwh_BL_mart.silver.customer_transactions
END;
