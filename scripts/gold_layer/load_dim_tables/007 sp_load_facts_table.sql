-- Create stored procedure to load FACTS table

CREATE OR ALTER PROCEDURE gold.sp_Load_Fact_Sales
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY

        INSERT INTO gold.fact_sales
        (
            customer_ID,
            product_ID,
            supplier_ID,
            store_ID,
            inventory_ID,
            date_ID,
            payment_method,
            cashier_name,
            qty,
            unit_price,
            cost_price,
            transaction_amount,
            transaction_discount,
            line_amount,
            stock_on_hand
        )

        SELECT
            c.customer_ID,
            p.product_ID,
            sup.supplier_ID,
            st.store_ID,
            inv.inventory_ID,
            d.date_ID,
            b.payment_method,
            b.cashier_name,
            b.qty,
            b.unit_price,
            b.cost_price,
            b.transaction_amount,
            b.transaction_discount,
            b.line_amount,
            b.stock_on_hand

        FROM dwh_BL_mart.silver.customer_transactions AS b

        -- Customer Dimension
        LEFT JOIN gold.dim_customer AS c
            ON b.customer_email = c.customer_email

        -- Product Dimension
        LEFT JOIN gold.dim_product AS p
            ON b.sku = p.sku

        -- Supplier Dimension
        LEFT JOIN gold.dim_supplier AS sup
            ON b.supplier = sup.supplier_name

        -- Store Dimension
        LEFT JOIN gold.dim_store AS st
            ON b.store_name = st.store_name
           AND b.store_city = st.store_city
           AND b.store_province = st.store_province

        -- Inventory Dimension
        LEFT JOIN gold.dim_inventory AS inv
            ON b.sku = inv.sku
           AND b.stock_on_hand = inv.stock_on_hand
           AND b.reorder_threshold = inv.reorder_threshold

        -- Date Dimension
        LEFT JOIN gold.dim_date AS d
            ON CAST(b.transaction_date AS DATE) = d.full_date;

        PRINT 'Fact table loaded successfully.';

    END TRY

    BEGIN CATCH

        PRINT 'Error loading fact table: ' + ERROR_MESSAGE();

        THROW;

    END CATCH

END;
GO


