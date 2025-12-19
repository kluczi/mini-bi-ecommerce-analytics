select
    dc.country as country,
    count(fct.quantity) as refunds,
    sum(fct.quantity*fct.unit_price) as losses
from intermediate.fct_ecommerce fct
LEFT JOIN intermediate.dim_customer dc ON fct.customer_sk=dc.customer_sk
LEFT JOIN intermediate.dim_product dp ON fct.product_sk=dp.product_sk
where
    fct.quantity<0
    and dp.description = upper(dp.description)
    and dp.description != lower(dp.description)
    and dp.description is not null
group by 1
order by 2 DESC;
