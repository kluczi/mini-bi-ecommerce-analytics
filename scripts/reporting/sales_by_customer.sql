SELECT
    dc.customer_id as customer,
    count(dc.customer_id) as total_orders,
    sum(fct.quantity*fct.unit_price) as total_ov
FROM intermediate.fct_ecommerce fct
LEFT JOIN intermediate.dim_customer dc ON fct.customer_sk=dc.customer_sk
GROUP BY dc.customer_id