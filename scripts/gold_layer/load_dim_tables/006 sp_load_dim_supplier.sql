--Create stored procedure for dim supplier 

CREATE OR ALTER PROCEDURE gold.sp_Load_Dim_Supplier
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO gold.dim_supplier
    (
        supplier_name
    )

    SELECT DISTINCT
        supplier
    FROM silver.customer_transactions
END;
