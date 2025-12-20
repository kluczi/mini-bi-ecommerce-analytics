SELECT
    rp.product as product,
    rp.refunds as refunds,
    st.total_sales as total_sales,
    (refunds/total_sales) as refunds_pct
FROM reporting.refunds_by_product rp
CROSS JOIN reporting.sales_total st
GROUP BY 1,2,3
ORDER BY 3 DESC, 4 DESC