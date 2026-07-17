CREATE OR ALTER PROCEDURE gold.sp_Load_Dim_Product
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY

        -- Full Refresh

        ;WITH ProductCTE AS
        (
            SELECT
                sku,
                product_name,
                category,
                sub_category,
                supplier,
                unit_price,
                cost_price,
                reorder_threshold,
                transaction_id,
                ROW_NUMBER() OVER
                (
                    PARTITION BY UPPER(TRIM(sku))
                    ORDER BY transaction_id
                ) AS rn
            FROM silver.customer_transactions
            WHERE sku IS NOT NULL
        )

        INSERT INTO gold.dim_product
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

        SELECT
            UPPER(TRIM(sku)),
            TRIM(product_name),
            TRIM(category),
            TRIM(sub_category),
            TRIM(supplier),
            unit_price,
            cost_price,
            reorder_threshold
        FROM ProductCTE
        WHERE rn = 1;

        PRINT 'Product Dimension loaded successfully.';

    END TRY

    BEGIN CATCH

        PRINT 'Error loading Product Dimension: ' + ERROR_MESSAGE();

        THROW;

    END CATCH

END;
GO