select
    stock_code,
    description,
    unit_price
from intermediate.fct_ecommerce
where
    description is not null;