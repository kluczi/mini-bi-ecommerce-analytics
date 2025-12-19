select
  date_trunc('month', di.invoice_ts) as month,
  count(distinct di.invoice_no) as orders_cnt,
  sum(fct.quantity * fct.unit_price) as revenue
from intermediate.fct_ecommerce fct
left join intermediate.dim_invoice di
  on fct.invoice_sk = di.invoice_sk
where di.invoice_ts is not null
group by 1