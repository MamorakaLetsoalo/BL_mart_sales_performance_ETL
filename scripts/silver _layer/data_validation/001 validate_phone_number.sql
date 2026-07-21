--validate phone number digits
SELECT *
FROM dwh_BL_mart.bronze.customer_transactions
WHERE LEN(customer_phone) < 9
OR customer_phone IS NULL;