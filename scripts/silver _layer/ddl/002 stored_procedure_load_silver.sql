--Store procedure to load silver table


CREATE OR ALTER PROCEDURE silver.sp_Load_Customer_Transactions
AS
BEGIN
    SET NOCOUNT ON;

    -- Clear the Silver table
    TRUNCATE TABLE silver.customer_transactions;

    -- Load cleaned data
    INSERT INTO silver.customer_transactions
    (
        transaction_date,
        payment_method,
        cashier_name,
        transaction_amount,
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

    SELECT DISTINCT

        CAST(transaction_date AS DATE) AS transaction_date,

        -- Standardize payment method
        CASE
            WHEN UPPER(LTRIM(RTRIM(payment_method))) = 'CASH' THEN 'Cash'
            WHEN UPPER(LTRIM(RTRIM(payment_method))) = 'CREDIT CARD' THEN 'Credit Card'
            WHEN UPPER(LTRIM(RTRIM(payment_method))) = 'DEBIT CARD' THEN 'Debit Card'
            WHEN UPPER(LTRIM(RTRIM(payment_method))) = 'STORE CREDIT' THEN 'Store Credit'
            ELSE 'Unknown'
        END,

        LTRIM(RTRIM(cashier_name)),

        -- Remove negative amounts
        ABS(transaction_amount),

        LTRIM(RTRIM(customer_first_name)),
        LTRIM(RTRIM(customer_last_name)),

        -- Clean email
        CASE
            WHEN customer_email LIKE '%@%.%'
                THEN LOWER(LTRIM(RTRIM(customer_email)))
            ELSE NULL
        END,

        LTRIM(RTRIM(customer_phone)),
        LTRIM(RTRIM(customer_city)),
        LTRIM(RTRIM(customer_province)),

        ISNULL(customer_loyalty_tier,'Unknown'),

        customer_since,

        LTRIM(RTRIM(store_name)),
        LTRIM(RTRIM(store_city)),
        LTRIM(RTRIM(store_province)),
        LTRIM(RTRIM(store_region)),
        LTRIM(RTRIM(store_manager)),

        LTRIM(RTRIM(product_name)),

        ISNULL(category,'Unknown'),
        ISNULL(sub_category,'Unknown'),

        LTRIM(RTRIM(sku)),

        unit_price,
        cost_price,

        LTRIM(RTRIM(supplier)),

        qty,

        -- Recalculate line amount
        qty * unit_price,

        stock_on_hand,
        reorder_threshold

    FROM bronze.customer_transactions

    WHERE
        transaction_amount > 0
        AND qty > 0;

END;
