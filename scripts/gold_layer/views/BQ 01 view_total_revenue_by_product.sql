--B1: What were the top 5 best-selling products by total revenue between January and June 2024?

CREATE VIEW gold.vw_Top5_BestSellingProducts
AS
SELECT TOP 5
    p.product_name,
    p.category,
    SUM(f.transaction_amount) AS TotalRevenue
FROM gold.fact_sales f
LEFT JOIN gold.dim_product p
    ON f.product_ID = p.product_ID
LEFT JOIN gold.dim_date d
    ON f.date_ID = d.date_ID
WHERE d.full_date BETWEEN '2024-01-01' AND '2024-06-30'
GROUP BY
    p.product_name,
    p.category
ORDER BY TotalRevenue DESC;

SELECT * FROM gold.vw_Top5_BestSellingProducts
