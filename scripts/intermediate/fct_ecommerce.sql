select
    invoice_no,
    stock_code,
    description,
    quantity,
    invoice_date_raw,
    try_strptime(invoice_date_raw, '%m/%d/%Y %H:%M') as invoice_ts,
    unit_price,
    customer_id,
    country
from staging.ecommerce