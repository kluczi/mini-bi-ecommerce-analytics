# Mini BI Ecommerce Analytics

## Overview

A Business Intelligence analytics project for ecommerce data using DuckDB. This project implements a dimensional data model (star schema) with staging, intermediate, and reporting layers to analyze sales, refunds, customer behavior and product performance.

## Architecture

-   **Medallion**: Bronze (staging) → Silver (intermediate) → Gold (reporting)
-   **Star schema**: One fact table (`fct_ecommerce`) with conformed dimensions (`dim_customer`, `dim_invoice`, `dim_product`)
-   **Storage**: DuckDB, orchestrated via `lea`

## Project Structure

```
mini-bi-ecommerce-analytics/
├── data/
│   └── ecommerce.csv           # Source data file
└──  scripts/
    ├── staging/                # Staging layer transformations
    ├── intermediate/           # Dimensional model (dimensions & facts)
    └── reporting/              # Business reports and analytics
```

## Prerequisites

-   DuckDB (for analytical database)
-   Python 3.x (if using lea orchestrator)
-   .env file (for configuration)
-   lea orchestrator (for ETL pipeline orchestration)

## Installation & run

git clone https://github.com/kluczi/mini-bi-ecommerce-analytics
cd mini-bi-ecommerce-analytics/

After installation, the pipeline can be run using:

```bash
lea run --env-file .env
```

This will execute the ETL pipeline in the following order:

1. Staging layer: Loads raw data from CSV
2. Intermediate layer: Creates dimensional model (dimensions and fact tables)
3. Reporting layer: Generates business reports and analytics

## Data Sources

-   **ecommerce.csv**: Ecommerce transaction data containing invoice information, product details, customer IDs, quantities, prices, and country information. The data includes both sales and refunds (negative quantities).

## Scripts Organization

### Staging Layer

-   `stg_ecommerce.sql`: Loads raw ecommerce data from CSV file, performs basic type casting (quantity to int, unit_price to float), and standardizes column names.

### Intermediate Layer

-   `dim_customer.sql`: Customer dimension table
-   `dim_invoice.sql`: Invoice dimension table
-   `dim_product.sql`: Product dimension table
-   `fct_ecommerce.sql`: Sales fact table

### Reporting Layer

**Sales Reports:**

-   `sales_total.sql`: Total number of sales transactions
-   `sales_daily.sql`: Daily sales revenue and order counts
-   `sales_monthly.sql`: Monthly sales revenue and order counts
-   `sales_yearly.sql`: Yearly sales revenue and order counts
-   `sales_mom.sql`: Month-over-month sales growth (absolute and percentage)
-   `sales_yoy.sql`: Year-over-year sales growth (absolute and percentage)
-   `sales_by_customer.sql`: Sales aggregated by customer
-   `sales_total_by_country.sql`: Total sales by country
-   `sales_aov_by_country.sql`: Average order value (AOV) by country
-   `sales_aov_by_year.sql`: Average order value by year

**Refund Reports:**

-   `refunds_total.sql`: Total refunds count and losses
-   `refunds_by_customer.sql`: Refunds and losses by customer
-   `refunds_by_product.sql`: Refunds and losses by product
-   `refunds_by_country.sql`: Refunds and losses by country
-   `refunds_by_month.sql`: Refunds and losses by month
-   `refunds_pct.sql`: Overall refund percentage

**Product Reports:**

-   `products_top_by_sales.sql`: Top products by quantity sold
-   `products_top_by_income.sql`: Top products by revenue
-   `products_problematic.sql`: Products with high refund rates

**Order Reports:**

-   `orders_cnt_daily.sql`: Daily order counts
-   `orders_cnt_weekly.sql`: Weekly order counts
-   `orders_cnt_monthly.sql`: Monthly order counts

**Customer Reports:**

-   `customer_return_rate.sql`: Customer refund rates

## Running the Pipeline

The ETL pipeline follows a three-layer architecture:

1. **Staging Layer**: Raw data is loaded and cleaned

    ```sql
    -- Creates: staging.stg_ecommerce
    ```

2. **Intermediate Layer**: Dimensional model is built

    ```sql
    -- Creates: intermediate.dim_customer, dim_invoice, dim_product, fct_ecommerce
    ```

3. **Reporting Layer**: Business reports are generated
    ```sql
    -- Creates: Various reporting views/tables
    ```

Execute the pipeline using:

```bash
lea run --env-file .env
```

## Database Schema

The project uses a star schema dimensional model:

**Dimensions:**

-   `dim_customer`: Customer dimension with customer_id, country, and surrogate key (customer_sk)
-   `dim_invoice`: Invoice dimension with invoice_no, invoice_ts (timestamp), and surrogate key (invoice_sk)
-   `dim_product`: Product dimension with stock_code, description, and surrogate key (product_sk)

**Fact Table:**

-   `fct_ecommerce`: Fact table containing transaction-level data with foreign keys to all dimensions, quantity, unit_price, and calculated order_value

**Staging:**

-   `stg_ecommerce`: Staging table with raw data from CSV

## Reports

The reporting layer provides comprehensive analytics across multiple dimensions:

-   **Sales Analytics**: Track sales performance over time (daily, monthly, yearly) with growth metrics (MoM, YoY)
-   **Refund Analysis**: Monitor refunds by customer, product, country, and time period
-   **Product Performance**: Identify top-selling products and problematic products with high refund rates
-   **Customer Insights**: Analyze customer behavior, return rates, and sales by customer
-   **Geographic Analysis**: Sales and AOV metrics by country
-   **Order Metrics**: Order counts aggregated by day, week, and month

All reports are available as SQL views/tables in the `reporting` schema.
