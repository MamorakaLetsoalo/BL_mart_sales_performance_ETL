--check for Nulls or duplicates in primary key
--Expectation: No result

SELECT transaction_id,
COUNT(*)
FROM [dwh_BL_mart].[bronze].[customer_transactions]
GROUP BY transaction_id
HAVING COUNT(*) > 1

