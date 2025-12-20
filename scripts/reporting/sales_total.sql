SELECT
    sum(fct.quantity*fct.unit_price) as total_sales
FROM intermediate.fct_ecommerce fct
