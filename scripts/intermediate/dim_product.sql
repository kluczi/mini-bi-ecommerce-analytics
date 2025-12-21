SELECT DISTINCT
    MD5(TRIM(LOWER(CAST(stock_code AS VARCHAR)))) AS product_sk,
    stock_code,
    description
FROM staging.stg_ecommerce
WHERE
    description IS NOT NULL -- need business clarification