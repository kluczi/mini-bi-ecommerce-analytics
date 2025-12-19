with ecommerce_parsed as (
    select
        customer_id,
        quantity,
        unit_price,
        description
    from staging.stg_ecommerce
)

select
    customer_id as customer_id,
    sum(quantity) as refunds,
    sum(quantity*unit_price) as losses
from ecommerce_parsed
where
    quantity<0
    and description = upper(description)
    and description != lower(description)
    and description is not null
    and customer_id is not null
group by customer_id
order by 2 ASC;


