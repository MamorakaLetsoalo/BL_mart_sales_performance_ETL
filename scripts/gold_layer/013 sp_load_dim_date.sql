--Create stored procedure to load dim date

CREATE OR ALTER PROCEDURE gold.sp_Load_Dim_Date
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO dwh_BL_mart.gold.dim_date
    (
        date_ID,
        full_date,
        day_number,
        month_number,
        month_name,
        quarter_number,
        year_number,
        day_name,
        week_number,
        is_weekend
    )

    SELECT DISTINCT

        CONVERT(INT,CONVERT(CHAR(8),CAST(transaction_date AS DATE),112)),

        CAST(transaction_date AS DATE),

        DAY(transaction_date),

        MONTH(transaction_date),

        DATENAME(MONTH,transaction_date),

        DATEPART(QUARTER,transaction_date),

        YEAR(transaction_date),

        DATENAME(WEEKDAY,transaction_date),

        DATEPART(WEEK,transaction_date),

        CASE
            WHEN DATENAME(WEEKDAY,transaction_date)
                 IN ('Saturday','Sunday')
            THEN 1
            ELSE 0
        END

    FROM dwh_BL_mart.silver.customer_transactions;

END;
GO