SELECT
    date_trunc('day', invoice_ts) as day,
    extract(YEAR FROM day) as year,
    count(distinct invoice_no) as orders_cnt
FROM intermediate.dim_invoice
GROUP BY 1
ORDER BY 1 ASC