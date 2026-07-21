-- check for negative amounts
SELECT *
FROM dwh_BL_mart.bronze.customer_transactions
WHERE transaction_amount < 0;