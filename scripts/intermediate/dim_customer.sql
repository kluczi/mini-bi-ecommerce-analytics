SELECT DISTINCT
    MD5(TRIM(CAST(customer_id AS VARCHAR))) AS customer_sk,
    customer_id,
    country
FROM staging.stg_ecommerce
WHERE customer_id IS NOT NULL;