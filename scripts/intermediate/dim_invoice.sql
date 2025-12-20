SELECT DISTINCT
    MD5(TRIM(CAST(invoice_no AS VARCHAR))) AS invoice_sk,
    invoice_no,
    TRY_STRPTIME(invoice_date_raw, '%m/%d/%Y %H:%M') AS invoice_ts
FROM staging.stg_ecommerce;