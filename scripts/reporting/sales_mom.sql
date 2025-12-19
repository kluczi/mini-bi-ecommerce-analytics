SELECT
    month,
    revenue,
    lag(revenue) over (order by month) as prev_revenue,
    revenue - prev_revenue as mom_abs,
    (revenue - prev_revenue)
    / nullif(prev_revenue, 0) as mom_pct
FROM reporting.sales_monthly
ORDER BY month