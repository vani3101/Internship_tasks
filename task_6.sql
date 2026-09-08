/* 
Monthly sales performance: 
calculating monthly revenue along with the order volume
*/

SELECT 
    EXTRACT(YEAR FROM o.order_date) AS order_year,
    EXTRACT(MONTH FROM o.order_date) AS order_month,
    SUM(d.amount) AS total_revenue,
    COUNT(DISTINCT o.order_id) AS order_volume
FROM orders o
JOIN details d 
    ON o.order_id = d.order_id
GROUP BY
    EXTRACT(YEAR FROM o.order_date),
    EXTRACT(MONTH FROM o.order_date)
ORDER BY
    order_year,
    order_month;

/* 
Average Order Value:
*/

SELECT 
    ROUND(SUM(d.amount) / COUNT (DISTINCT o.order_id), 2) AS aov
FROM orders o 
JOIN details d 
    ON o.order_id = d.order_id

/*
Key Insights:
1. Peak revenue month - January($61,632 across 61 orders)
2. Lowest revenue month - July($12,966 across 31 orders)
3. Average Order Value - $875.54
*/

