SELECT
    dc.customer_id as customer,
    sc.total_orders,
    rc.refunds,
    (rc.refunds/sc.total_orders) as return_rate
FROM intermediate.fct_ecommerce fct
LEFT JOIN intermediate.dim_customer dc ON fct.customer_sk=dc.customer_sk
LEFT JOIN reporting.sales_by_customer sc ON dc.customer_id=sc.customer
LEFT JOIN reporting.refunds_by_customer rc ON dc.customer_id=rc.customer_id
WHERE
    fct.quantity < 0
GROUP BY 1,2,3