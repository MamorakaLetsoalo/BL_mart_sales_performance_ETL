--check all values without duplicates
SELECT *
FROM(
SELECT*,
ROW_NUMBER() OVER (PARTITION BY sku ORDER BY customer_since desc) AS flag_last
FROM [dwh_BL_mart].[bronze].[customer_transactions])t
WHERE flag_last =1 