select
    "InvoiceNo"      as invoice_no,
    "StockCode"      as stock_code,
    "Description"   as description,
    "Quantity"::int as quantity,
    "InvoiceDate"   as invoice_date_raw,
    "UnitPrice"::float as unit_price,
    "CustomerID"    as customer_id,
    "Country"       as country
from read_csv(
    'data/ecommerce.csv',
    header = true,
    ignore_errors = true
);
