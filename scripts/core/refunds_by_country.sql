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
    sum(quantity) as refunds,
    sum(unit_price) as units_price
from ecommerce_parsed
where
    quantity<0
    and description = upper(description)
    and description != lower(description)
    and description is not null
group by country
order by refunds ASC;
