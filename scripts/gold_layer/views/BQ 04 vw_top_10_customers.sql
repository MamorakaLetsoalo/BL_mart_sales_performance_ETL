--Who are the top 10 loyalty customers ranked by total spend over the reporting period?

CREATE VIEW gold.vw_top_10_customers
AS
SELECT TOP 10
    c.customer_first_name,
    c.customer_last_name,
    c.customer_loyalty_tier,
    SUM(f.transaction_amount) AS TotalSpend
FROM gold.fact_sales f
LEFT JOIN gold.dim_customer c
    ON f.customer_ID = c.customer_ID
LEFT JOIN gold.dim_date d
    ON f.date_ID = d.date_id
WHERE d.full_date BETWEEN '2024-01-01' AND '2024-06-30'
GROUP BY
    c.customer_first_name,
    c.customer_last_name,
    c.customer_loyalty_tier
ORDER BY TotalSpend DESC;
