select
    stock_code,
    description,
    unit_price
from staging.stg_ecommerce
where
    description is not null;