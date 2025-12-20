SELECT
    DATE_TRUNC('day', invoice_ts) AS day,
    EXTRACT(YEAR FROM day) AS year,
    COUNT(DISTINCT invoice_no) AS orders_cnt
FROM intermediate.dim_invoice
GROUP BY 1
ORDER BY 1 ASC