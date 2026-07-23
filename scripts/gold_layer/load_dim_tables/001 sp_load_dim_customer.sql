--Stored procedure to load dim customer

CREATE OR ALTER PROCEDURE gold.sp_Load_Dim_Customer
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dwh_BL_mart].gold.dim_customer
    (
        customer_email,
        customer_first_name,
        customer_last_name,
        customer_phone,
        customer_city,
        customer_province,
        customer_loyalty_tier,
        customer_since
    )

    SELECT DISTINCT

        (customer_email),
        (customer_first_name),
        (customer_last_name),
        (customer_phone),
        (customer_city),
        (customer_province),
        (customer_loyalty_tier),
        customer_since

    FROM [dwh_BL_mart].silver.customer_transactions

END;
GO

EXECUTE gold.sp_Load_Dim_Customer

SELECT * FROM [gold].[dim_customer]

