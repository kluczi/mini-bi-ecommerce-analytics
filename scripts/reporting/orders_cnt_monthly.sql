SELECT
    dcnt.year as year,
    extract(MONTH FROM dcnt.day) as month,
    sum(dcnt.orders_cnt) as orders_cnt
FROM reporting.orders_cnt_daily dcnt
GROUP BY 1,2
ORDER BY 1 ASC, 2 ASC

