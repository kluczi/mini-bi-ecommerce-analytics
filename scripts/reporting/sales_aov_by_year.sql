SELECT
    date_trunc('year', di.invoice_ts) as year,
    sum(fct.order_value) as revenue,
    count(distinct di.invoice_no) as order_cnt,
    revenue/order_cnt as aov
FROM intermediate.fct_ecommerce fct
LEFT JOIN intermediate.dim_invoice di ON fct.invoice_sk=di.invoice_sk
GROUP BY 1
