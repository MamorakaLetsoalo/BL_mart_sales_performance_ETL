--check for unwanted spaces
SELECT cashier_name
FROM [dwh_BL_mart].[bronze].[customer_transactions]
WHERE cashier_name != TRIM(cashier_name)

SELECT customer_first_name
FROM [dwh_BL_mart].[bronze].[customer_transactions]
WHERE customer_first_name != TRIM(customer_first_name)