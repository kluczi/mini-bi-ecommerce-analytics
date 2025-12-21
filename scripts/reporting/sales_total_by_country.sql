SELECT
    dc.country,
    sum(fct.quantity*fct.unit_price) as total_sales
FROM intermediate.fct_ecommerce fct
LEFT JOIN intermediate.dim_invoice di ON fct.invoice_sk=di.invoice_sk
LEFT JOIN intermediate.dim_customer dc ON fct.customer_sk=dc.customer_sk
WHERE
    fct.quantity>0
GROUP BY
    dc.country