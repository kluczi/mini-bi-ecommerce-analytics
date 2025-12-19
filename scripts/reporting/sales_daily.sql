SELECT
    cast(di.invoice_ts as date) as order_date,
    count(distinct di.invoice_no) as orders_cnt,
    sum(fct.quantity * fct.unit_price) as revenue
from intermediate.fct_ecommerce fct
LEFT JOIN intermediate.dim_invoice di ON fct.invoice_sk=di.invoice_sk
WHERE di.invoice_ts IS NOT NULL
GROUP BY 1
ORDER BY 1
