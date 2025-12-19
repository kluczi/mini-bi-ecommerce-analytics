select distinct
    md5(trim(cast(customer_id as varchar))) as customer_sk,
    customer_id,
    country
from staging.stg_ecommerce
where customer_id is not null;