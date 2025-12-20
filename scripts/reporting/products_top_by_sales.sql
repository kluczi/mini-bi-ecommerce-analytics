SELECT
    dp.description AS product,
    SUM(fct.quantity) AS pieces_sold
FROM intermediate.fct_ecommerce fct
LEFT JOIN intermediate.dim_product dp ON fct.product_sk=dp.product_sk
WHERE
    fct.quantity>0
    AND dp.description = UPPER(dp.description)
    AND dp.description != LOWER(dp.description)
    AND dp.description IS NOT NULL
GROUP BY 1
ORDER BY 2 DESC