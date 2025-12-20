SELECT
    rp.product AS product,
    rp.refunds AS refunds,
    st.total_sales AS total_sales,
    (refunds/total_sales) AS refunds_pct
FROM reporting.refunds_by_product rp
CROSS JOIN reporting.sales_total st
GROUP BY 1,2,3
ORDER BY 3 DESC, 4 DESC