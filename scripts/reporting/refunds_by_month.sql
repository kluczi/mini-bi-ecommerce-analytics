SELECT
    DATE_TRUNC('month', invoice_ts) AS month,
    COUNT(fct.quantity) AS refunds,
    SUM(fct.quantity*fct.unit_price) AS losses
FROM intermediate.fct_ecommerce fct
LEFT JOIN intermediate.dim_invoice di ON fct.invoice_sk=di.invoice_sk
LEFT JOIN intermediate.dim_product dp ON fct.product_sk=dp.product_sk
WHERE
    fct.quantity<0
    AND dp.description = UPPER(dp.description)
    AND dp.description != LOWER(dp.description)
    AND dp.description IS NOT NULL
GROUP BY month
ORDER BY 2 ASC;


