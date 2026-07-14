/* 
script porpose : this dtored ptocedure performs the ETL process to populate the silver schema tables from bronze schema.
Actions perforemed:
          -inserts transformed and cleansed data from bronze into silver tables*/

CREATE OR ALTER PROCEDURE [silver].[sp_Load_Customer_Transactions]
AS
BEGIN
    SET NOCOUNT ON;

    ;WITH Deduplicated AS
    (
        SELECT *,
               ROW_NUMBER() OVER
               (
                   PARTITION BY transaction_id
                   ORDER BY transaction_date DESC
               ) AS rn
        FROM [bronze].[customer_transactions]
    )

    INSERT INTO [silver].[customer_transactions]
    (
        transaction_id,
        transaction_date,
        payment_method,
        cashier_name,
        transaction_amount,
        transaction_discount,
        customer_first_name,
        customer_last_name,
        customer_email,
        customer_phone,
        customer_city,
        customer_province,
        customer_loyalty_tier,
        customer_since,
        store_name,
        store_city,
        store_province,
        store_region,
        store_manager,
        product_name,
        category,
        sub_category,
        sku,
        unit_price,
        cost_price,
        supplier,
        qty,
        line_amount,
        stock_on_hand,
        reorder_threshold
    )

    SELECT

        transaction_id,
        transaction_date,
        TRIM(payment_method),
        TRIM(cashier_name),
        transaction_amount,
        transaction_discount,
        TRIM(customer_first_name),
        TRIM(customer_last_name),
        LOWER(TRIM(customer_email)),
        TRIM(customer_phone),
        TRIM(customer_city),
        TRIM(customer_province),
        TRIM(customer_loyalty_tier),
        customer_since,
        TRIM(store_name),
        TRIM(store_city),
        TRIM(store_province),
        TRIM(store_region),
        TRIM(store_manager),
        TRIM(product_name),
        TRIM(category),
        TRIM(sub_category),
        UPPER(TRIM(sku)),
        unit_price,
        cost_price,
        TRIM(supplier),
        qty,
        line_amount,
        stock_on_hand,
        reorder_threshold

    FROM Deduplicated
    WHERE rn = 1;

END;
GO