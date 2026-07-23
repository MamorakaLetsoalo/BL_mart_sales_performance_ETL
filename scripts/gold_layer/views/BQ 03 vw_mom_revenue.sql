--What is the month-over-month revenue growth rate across all stores combined?

CREATE VIEW gold.vw_monthly_revenue
AS
SELECT
    d.month_name,
    SUM(f.transaction_amount) AS TotalRevenue
FROM gold.fact_sales f
LEFT JOIN gold.dim_date d
    ON f.date_ID = d.date_ID
WHERE d.full_date BETWEEN '2024-01-01' AND '2024-06-30'
GROUP BY
    d.month_name;


