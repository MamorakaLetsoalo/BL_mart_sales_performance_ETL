--What was the total revenue per store, broken down by month, for the January–June 2024 period?

CREATE VIEW gold.vw_revenue_per_store
AS
SELECT
    s.store_name,
    d.month_name,
    SUM(f.transaction_amount) AS TotalRevenue
FROM gold.fact_sales f
LEFT JOIN gold.dim_store s
    ON f.store_ID = s.store_ID
LEFT JOIN gold.dim_date d
    ON f.date_ID = d.date_ID
WHERE d.full_date BETWEEN '2024-01-01' AND '2024-06-30'
GROUP BY
    s.store_name,
    d.month_name;
