with ecommerce_parsed as (
    select
        country,
        quantity,
        unit_price,
        description
    from staging.ecommerce
)

select
    country as country,
    count(quantity) as refunds,
    sum(quantity*unit_price) as losses
from ecommerce_parsed
where
    quantity<0
    and description = upper(description)
    and description != lower(description)
    and description is not null
group by 1
order by 2 DESC;
