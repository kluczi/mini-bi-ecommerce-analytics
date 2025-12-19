select
    date_trunc('month', invoice_ts) as month,
    count(fct.quantity) as refunds,
    sum(fct.quantity*fct.unit_price) as losses
from intermediate.fct_ecommerce fct
LEFT JOIN intermediate.dim_invoice di ON fct.invoice_sk=di.invoice_sk
LEFT JOIN intermediate.dim_product dp ON fct.product_sk=dp.product_sk
where
    fct.quantity<0
    and dp.description = upper(dp.description)
    and dp.description != lower(dp.description)
    and dp.description is not null
group by month
order by 2 ASC;


