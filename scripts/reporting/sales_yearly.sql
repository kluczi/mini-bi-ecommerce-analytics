SELECT
  DATE_TRUNC('year', di.invoice_ts) AS year,
  COUNT(DISTINCT di.invoice_no) AS orders_cnt,
  SUM(fct.quantity * fct.unit_price) AS revenue
FROM intermediate.fct_ecommerce fct
LEFT JOIN intermediate.dim_invoice di
  ON fct.invoice_sk = di.invoice_sk
WHERE di.invoice_ts IS NOT NULL
GROUP BY 1