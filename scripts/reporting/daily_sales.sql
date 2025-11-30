with ecommerce_parsed as (
    select
        invoice_no,
        quantity,
        unit_price,
        coalesce(
            try_strptime(invoice_date_raw, '%m/%d/%Y %H:%M')
        )::timestamp as invoice_ts
    from staging.stg_ecommerce
)

select
    cast(invoice_ts as date) as order_date,
    count(distinct invoice_no) as orders_cnt,
    sum(quantity * unit_price) as revenue
from ecommerce_parsed
where invoice_ts is not null
group by 1
order by 1;
