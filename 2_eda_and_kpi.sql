/*
OVERALL BUSINESS KPIS
purpose: quick executive snapshot of total sales, volume, 
average order value (AOV), and average discount rate.
*/

SELECT 
    COUNT(*) AS total_transactions,
    SUM(quantity_sold) AS total_units_sold,
    ROUND(SUM(sales_amount), 2) AS total_revenue,
    ROUND(AVG(sales_amount), 2) AS avg_order_value,
    ROUND(AVG(discount) * 100, 2) AS avg_discount_pct
FROM sales_data;

/*
DATA HYGIENE & VALUE DISTRIBUTION
Purpose: Verify dataset bounds (date range, min/max order size, min/max price).
*/

SELECT 
    MIN(sale_date) AS earliest_sale_date,
    MAX(sale_date) AS latest_sale_date,
    MIN(sales_amount) AS min_order_amount,
    MAX(sales_amount) AS max_order_amount,
    COUNT(DISTINCT product_id) AS distinct_products_count,
    COUNT(DISTINCT sales_rep) AS distinct_sales_reps
FROM sales_data;

/* 
PRODUCT CATEGORY BREAKDOWN
Purpose: Identify top revenue drivers and average unit margins by category.
*/

SELECT 
    product_category,
    COUNT(*) AS total_orders,
    SUM(quantity_sold) AS total_units_sold,
    ROUND(SUM(sales_amount), 2) AS total_revenue,
    ROUND(AVG(sales_amount), 2) AS avg_order_value,
    ROUND(AVG(unit_price - unit_cost), 2) AS avg_unit_margin
FROM sales_data
GROUP BY product_category
ORDER BY total_revenue DESC;

/*
REGIONAL SALES PERFORMANCE
Pupose: Evaluate geographical distribution of transactions and revenue
*/

SELECT 
    region,
    COUNT(*) AS total_orders,
    SUM(quantity_sold) AS total_units_sold,
    ROUND(SUM(sales_amount), 2) AS total_revenue,
    ROUND(SUM(sales_amount) / SUM(SUM(sales_amount)) OVER () * 100, 2) AS revenue_share_pct
FROM sales_data
GROUP BY region
ORDER BY total_revenue DESC;

/* 
SALES CHANNEL & PAYMENT METHOD ANALYSIS
Purpose: Understand customer purchasing preferences across channels and payment modes.
*/

SELECT 
    sales_channel,
    payment_method,
    COUNT(*) AS total_orders,
    ROUND(SUM(sales_amount), 2) AS total_revenue,
    ROUND(AVG(sales_amount), 2) AS avg_order_value
FROM sales_data
GROUP BY sales_channel, payment_method
ORDER BY sales_channel, total_revenue DESC;

/* 
CUSTOMER TYPE DYNAMICS
Purpose: Compare new vs. returing customers on volume, revenue, and discount sensitivity.
*/

SELECT 
    customer_type,
    COUNT(*) AS total_orders,
    ROUND(SUM(sales_amount), 2) AS total_revenue,
    ROUND(AVG(sales_amount), 2) AS avg_order_value,
    ROUND(AVG(discount) * 100,2) AS avg_discount_pct
FROM sales_data
GROUP BY customer_type;