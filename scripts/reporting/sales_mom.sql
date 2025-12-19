SELECT
    month,
    revenue,
    lag(revenue) over (order by month) as prev_revenue,
    revenue - lag(revenue) over (order by month) as mom_abs,
    (revenue - lag(revenue) over (order by month))
    / nullif(lag(revenue) over (order by month), 0) as mom_pct
FROM reporting.sales.sales_monthly
ORDER BY month;