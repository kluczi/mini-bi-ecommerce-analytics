SELECT
    st.total_sales as sales,
    rt.refunds as refunds,
    (refunds/sales) as refunds_pct
FROM reporting.sales_total st
CROSS JOIN reporting.refunds_total rt