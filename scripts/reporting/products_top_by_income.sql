SELECT
    dp.description AS product,
    sum(fct.quantity*fct.unit_price) as income
FROM intermediate.fct_ecommerce fct
LEFT JOIN intermediate.dim_product dp ON fct.product_sk=dp.product_sk
WHERE
    fct.quantity>0
    and dp.description = upper(dp.description)
    and dp.description != lower(dp.description)
    and dp.description is not null
GROUP BY 1
ORDER BY 2 DESC