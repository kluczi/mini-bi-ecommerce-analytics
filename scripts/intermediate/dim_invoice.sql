select distinct
    md5(trim(cast(invoice_no as varchar))) as invoice_sk,
    invoice_no,
    try_strptime(invoice_date_raw, '%m/%d/%Y %H:%M') as invoice_ts
from staging.stg_ecommerce;