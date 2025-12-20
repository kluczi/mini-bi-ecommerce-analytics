SELECT
    DATE_TRUNC('year', di.invoice_ts) AS year,
    SUM(fct.order_value) AS revenue,
    COUNT(DISTINCT di.invoice_no) AS order_cnt,
    revenue/order_cnt AS aov
FROM intermediate.fct_ecommerce fct
LEFT JOIN intermediate.dim_invoice di ON fct.invoice_sk=di.invoice_sk
GROUP BY 1
