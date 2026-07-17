SELECT
    LOWER(TRIM(customer_email)) AS customer_email,
    COUNT(*) AS TotalRows
FROM gold.dim_customer
GROUP BY LOWER(TRIM(customer_email))
HAVING COUNT(*) > 1;

SELECT
    UPPER(TRIM(sku)) AS sku,
    COUNT(*) AS TotalRows
FROM gold.dim_product
GROUP BY UPPER(TRIM(sku))
HAVING COUNT(*) > 1;

SELECT
    TRIM(supplier_name) AS supplier_name,
    COUNT(*) AS TotalRows
FROM gold.dim_supplier
GROUP BY TRIM(supplier_name)
HAVING COUNT(*) > 1;

SELECT
    TRIM(store_name),
    TRIM(store_city),
    TRIM(store_province),
    COUNT(*) AS TotalRows
FROM gold.dim_store
GROUP BY
    TRIM(store_name),
    TRIM(store_city),
    TRIM(store_province)
HAVING COUNT(*) > 1;

SELECT
    UPPER(TRIM(sku)) AS sku,
    COUNT(*) AS TotalRows
FROM gold.dim_inventory
GROUP BY UPPER(TRIM(sku))
HAVING COUNT(*) > 1;

SELECT
    UPPER(TRIM(sku)) AS sku,
    COUNT(*) AS TotalRows
FROM gold.dim_inventory
GROUP BY UPPER(TRIM(sku))
HAVING COUNT(*) > 1;