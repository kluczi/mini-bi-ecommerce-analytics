select
    dp.product_sk,
    di.invoice_sk,
    dc.customer_sk,
    stg.quantity,
    stg.unit_price,
    stg.quantity*stg.unit_price as order_value
from staging.stg_ecommerce stg
JOIN intermediate.dim_customer dc ON stg.customer_id=dc.customer_id
JOIN intermediate.dim_invoice di ON stg.invoice_no=di.invoice_no
JOIN intermediate.dim_product dp ON stg.stock_code=dp.stock_code;