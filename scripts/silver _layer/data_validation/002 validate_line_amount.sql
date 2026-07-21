--Validate line amount calculation

SELECT
qty,
unit_price,
line_amount,
(qty * unit_price) AS CalculatedAmount
FROM dwh_BL_mart.bronze.customer_transactions
WHERE ABS(line_amount - (qty * unit_price)) > 0.01;