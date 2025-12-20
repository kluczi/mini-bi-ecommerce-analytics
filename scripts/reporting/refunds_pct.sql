SELECT
    st.total_sales AS sales,
    rt.refunds AS refunds,
    (refunds/sales) AS refunds_pct
FROM reporting.sales_total st
CROSS JOIN reporting.refunds_total rt