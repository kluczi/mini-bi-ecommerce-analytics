select
    invoice_no,
    stock_code,
    description,
    quantity,
    try_strptime(invoice_date_raw, '%m/%d/%Y %H:%M') as invoice_ts,
    unit_price,
    customer_id,
    country
from staging.stg_ecommerce