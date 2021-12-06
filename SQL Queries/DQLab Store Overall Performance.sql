
--- Overall Performance by Year
SELECT
YEAR(order_date) AS years,
SUM(sales) as sales,
COUNT(order_quantity) AS number_of_order
FROM dqlab_sales_store
WHERE order_status = 'Order Finished'
GROUP BY YEAR(order_date);

---Overall Performance by Product Sub Category

SELECT
YEAR(order_date) AS years,
product_sub_category,
SUM(sales) as sales
FROM dqlab_sales_store
WHERE order_status = 'Order Finished'
AND YEAR(order_date) > 2010
GROUP BY year(order_date), product_sub_category
ORDER BY years, sales DESC;