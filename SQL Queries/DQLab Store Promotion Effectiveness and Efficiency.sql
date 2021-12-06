---Promotion Effectiveness and Efficiency by Years
SELECT
YEAR(order_date) AS years,
SUM(sales) as sales,
SUM(discount_value) AS promotion_value,
ROUND((SUM(discount_value)/SUM(sales))*100,2) AS burn_rate_percentage
FROM dqlab_sales_store
WHERE order_status = 'Order Finished'
GROUP BY year(order_date);

---Promotion Effectiveness and Efficiency by Product Sub Category
select
year(order_date) as years,
product_sub_category,
product_category,
SUM(sales) as sales,
sum(discount_value) as promotion_value,
round((sum(discount_value) / SUM(sales))*100,2) as burn_rate_percentage
from dqlab_sales_store
where order_status = 'Order Finished'
and year(order_date) = 2012
group by
year(order_date),
product_sub_category,
product_category
order by sales desc;