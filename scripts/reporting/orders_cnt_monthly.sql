SELECT
    dcnt.year AS year,
    EXTRACT(MONTH FROM dcnt.day) AS month,
    SUM(dcnt.orders_cnt) AS orders_cnt
FROM reporting.orders_cnt_daily dcnt
GROUP BY 1,2
ORDER BY 1 ASC, 2 ASC

