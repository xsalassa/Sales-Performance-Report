# Sales Performance Report: SQL retail analytics

An educational SQL analytics project using the **DQLab Sales Store** dataset. The existing queries explore sales performance, product subcategories, promotion spend, and customer activity.

> **Project context:** This is a learning/portfolio analysis, not a production data platform. Results and dataset access are governed by the original DQLab material.

## Questions explored

1. How do completed-order sales change by year?
2. Which product subcategories generate the most sales?
3. How much discount value is associated with promotions, and what is the promotion burn rate?
4. How does customer transaction activity vary by year?

## Repository contents

| Location | Description |
| --- | --- |
| [`SQL Queries/DQLab Store Overall Performance.sql`](SQL%20Queries/DQLab%20Store%20Overall%20Performance.sql) | Yearly sales and sales by product subcategory. |
| [`SQL Queries/DQLab Store Promotion Effectiveness and Efficiency.sql`](SQL%20Queries/DQLab%20Store%20Promotion%20Effectiveness%20and%20Efficiency.sql) | Discount value and promotion-burn-rate analysis. |
| [`SQL Queries/Customers Transactions per Year.sql`](SQL%20Queries/Customers%20Transactions%20per%20Year.sql) | Customer-transaction analysis. |
| [`Output/`](Output/) | Existing query/report outputs. |
| [`Sales Performance Report.pdf`](Sales%20Performance%20Report.pdf) | Project report bundled in the original repository. |
| [`dqlab_sales_store.xlsx`](dqlab_sales_store.xlsx) | Source workbook listed in the public repository; contents and redistribution terms need review before reuse. |

## Data model assumptions

The SQL scripts reference the table `dqlab_sales_store` and fields such as `order_date`, `sales`, `order_quantity`, `order_status`, `discount_value`, `product_category`, and `product_sub_category`. The repository describes a retail dataset with order statuses and dates spanning 2009–2012.

A workbook named `dqlab_sales_store.xlsx` is listed in the repository root. A workbook alone does not establish a working database import procedure or permission to redistribute the data. Inspect its sheets, confirm the schema and SQL dialect, and check the DQLab reuse terms before running or republishing the analysis.

## How to explore the project

1. Review the dataset description and the existing SQL files.
2. Inspect the bundled workbook and confirm permission to use its DQLab data, or obtain an authorized copy from the provider.
3. Create or connect to the `dqlab_sales_store` table in a compatible SQL environment.
4. Run the queries individually and compare results with the included `Output/` artifacts.

## Metric definitions and validation notes

| Metric | Current approach | Recommended validation |
| --- | --- | --- |
| Sales | `SUM(sales)` for finished orders | Check nulls and whether sales values are gross or net. |
| Order count | `COUNT(order_quantity)` in the current overall-performance query | This counts non-null rows, **not necessarily distinct orders**. Confirm the intended grain and identifier before renaming it `order_count`. |
| Promotion burn rate | `SUM(discount_value) / SUM(sales) * 100` | Define which sales base is intended and protect against zero sales using `NULLIF`. |
| Subcategory sales | Group by year and subcategory | Confirm that every source row maps to exactly one intended category. |

## Planned improvements (not yet implemented)

- [ ] Add a reproducible, synthetic or redistribution-approved sample dataset.
- [ ] Publish `schema.sql` and sample expected outputs.
- [ ] Separate query-only files from screenshot/presentation outputs.
- [ ] Add automated checks for metric grain, zero denominators, and null handling.
- [ ] Document SQL engine/version, sample execution commands, and licensing/attribution.
- [ ] Add a compact data model diagram and a verified results screenshot.

## Acknowledgment

The original exercise and dataset description reference **DQLab**. This repository documents an analysis of that educational material; it does not imply ownership of the training dataset.
