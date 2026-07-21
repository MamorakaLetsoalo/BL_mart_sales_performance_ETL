--Data cleaning 
--Check for invalid email address
SELECT *
FROM dwh_BL_mart.bronze.customer_transactions
WHERE customer_email NOT LIKE '%@%.%'
OR customer_email IS NULL
OR customer_email='';



