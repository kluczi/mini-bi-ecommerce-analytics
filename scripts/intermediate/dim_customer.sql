select
    customer_id,
    country
from staging.stg_ecommerce
where customer_id is not null;