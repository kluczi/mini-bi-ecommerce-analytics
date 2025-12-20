SELECT
    dp.description as product,
    count(fct.quantity) as refunds
FROM intermediate.fct_ecommerce fct
LEFT JOIN intermediate.dim_product dp ON fct.product_sk=dp.product_sk
WHERE
    fct.quantity<0
    and dp.description = upper(dp.description)
    and dp.description != lower(dp.description)
    and dp.description is not null
GROUP BY product
ORDER BY refunds DESC