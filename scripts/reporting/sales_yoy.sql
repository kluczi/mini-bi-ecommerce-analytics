SELECT
    year,
    revenue,
    lag(revenue) over (order by year) as prev_revenue,
    revenue - lag(revenue) over (order by year) as mom_abs,
    (revenue - lag(revenue) over (order by year))
    / nullif(lag(revenue) over (order by year), 0) as mom_pct
FROM reporting.sales_yearly
ORDER BY year