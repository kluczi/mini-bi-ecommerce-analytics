SELECT
    month,
    revenue,
    LAG(revenue) OVER (ORDER BY month) AS prev_revenue,
    revenue - prev_revenue AS mom_abs,
    (revenue - prev_revenue)
    / NULLIF(prev_revenue, 0) AS mom_pct
FROM reporting.sales_monthly
ORDER BY month