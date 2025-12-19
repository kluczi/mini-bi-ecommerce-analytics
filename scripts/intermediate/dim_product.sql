select distinct
    md5(trim(lower(cast(stock_code as varchar)))) as product_sk,
    stock_code,
    description
from staging.stg_ecommerce
where
    description is not null;