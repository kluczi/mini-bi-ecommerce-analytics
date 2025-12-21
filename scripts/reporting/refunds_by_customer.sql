SELECT
    dc.customer_id AS customer_id,
    COUNT(fct.quantity) AS refunds,
    SUM(fct.quantity*fct.unit_price) AS losses
FROM intermediate.fct_ecommerce fct
LEFT JOIN intermediate.dim_customer dc ON fct.customer_sk=dc.customer_sk
LEFT JOIN intermediate.dim_product dp ON fct.product_sk=dp.product_sk
WHERE
    fct.quantity<0
    AND dp.description = UPPER(dp.description)
    AND dp.description != LOWER(dp.description)
    AND dp.description IS NOT NULL
    AND dc.customer_id IS NOT NULL
GROUP BY dc.customer_id


