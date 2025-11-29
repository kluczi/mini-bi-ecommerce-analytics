with ecommerce_parsed as (
    select
        coalesce(
            try_strptime(invoice_date_raw, '%m/%d/%Y %H:%M')
        )::timestamp as invoice_ts,
        quantity,
        unit_price,
        description
    from staging.ecommerce
)
select
    extract(month from invoice_ts) as month,
    sum(quantity) as refunds,
    sum(quantity*unit_price) as losses
from ecommerce_parsed
where
    quantity<0
    and description = upper(description)
    and description != lower(description)
    and description is not null
group by month
order by 2 ASC, 1 ASC;


