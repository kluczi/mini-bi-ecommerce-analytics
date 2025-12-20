SELECT
    dc.country,
    sum(fct.order_value) as revenue,
    count(distinct di.invoice_no) as order_cnt,
    revenue/order_cnt as aov
FROM intermediate.fct_ecommerce fct
LEFT JOIN intermediate.dim_invoice di ON fct.invoice_sk=di.invoice_sk
LEFT JOIN intermediate.dim_customer dc ON fct.customer_sk=dc.customer_sk
GROUP BY 1
ORDER BY 4 DESC
