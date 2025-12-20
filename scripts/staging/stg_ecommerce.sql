SELECT
    "InvoiceNo" AS invoice_no,
    "StockCode" AS stock_code,
    "Description" AS description,
    "Quantity"::int AS quantity,
    "InvoiceDate" AS invoice_date_raw,
    "UnitPrice"::float AS unit_price,
    "CustomerID" AS customer_id,
    "Country" AS country
FROM read_csv(
    'data/ecommerce.csv',
    header = true,
    ignore_errors = true
);
