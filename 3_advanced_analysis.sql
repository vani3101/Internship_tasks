/* SALES REP PERFORMANCE RANKING (WITHIN REGION)
Purpose: Use DENSE_RANK() window to rank sales reps 
by total revenue within their assigned geographic territories.
*/

WITH rep_performance AS (
    SELECT
        region,
        sales_rep,
        COUNT(*) AS total_orders,
        SUM(quantity_sold) AS total_units_sold,
        ROUND(SUM(sales_amount), 2) AS total_revenue
    FROM sales_data
    GROUP BY region, sales_rep
)

SELECT
    region,
    sales_rep,
    total_orders,
    total_units_sold,
    total_revenue,
    DENSE_RANK() OVER (PARTITION BY region ORDER BY total_revenue DESC) AS regional_rank
FROM rep_performance
ORDER BY region, regional_rank;

/*
MONTH-OVER-MONTH (MoM) REVENUE GROWTH
Purpose: Track revenue trtrajectories using LAG() to calculate 
absolute growth and MoM growth rate percentage.
*/

WITH monthly_revenue AS (
    SELECT 
        TO_CHAR(sale_date, 'YYYY-MM') AS sale_month,
        ROUND(SUM(sales_amount), 2) AS current_month_revenue
    FROM sales_data
    GROUP BY TO_CHAR(sale_date, 'YYYY-MM')
)
SELECT 
    sale_month,
    current_month_revenue,
    LAG(current_month_revenue, 1) OVER (ORDER BY sale_month) AS prior_month_revenue,
    ROUND(
        current_month_revenue - LAG(current_month_revenue, 1) OVER (ORDER BY sale_month), 
        2
    ) AS mom_growth_amount,
    ROUND(
        (current_month_revenue - LAG(current_month_revenue, 1) OVER (ORDER BY sale_month)) 
        / NULLIF(LAG(current_month_revenue, 1) OVER (ORDER BY sale_month), 0) * 100, 
        2
    ) AS mom_growth_pct
FROM monthly_revenue
ORDER BY sale_month;

/* 
CUMULATIVE RUNNING TOTAL & 3-MONTH MOVING AVERAGE
Purpose: Smooth monthly fluctuations with rolling averages 
and track year-to-date aggregate business growth.
*/

WITH monthly_metrics AS (
    SELECT 
        DATE_TRUNC('month', sale_date)::DATE AS sales_month,
        ROUND(SUM(sales_amount), 2) AS total_revenue
    FROM sales_data
    GROUP BY DATE_TRUNC('month', sale_date)
)
SELECT 
    sales_month,
    total_revenue,
    ROUND(SUM(total_revenue) OVER (ORDER BY sales_month), 2) AS running_total_revenue,
    ROUND(
        AVG(total_revenue) OVER (
            ORDER BY sales_month 
            ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
        ), 
        2
    ) AS rolling_3mo_avg_revenue
FROM monthly_metrics
ORDER BY sales_month;

/* 
TOP 3 HIGHEST-GROSSING PRODUCTS PER CATEGORY
Purpose: Identify best-selling SKUs within each category 
using ROW_NUMBER() window partitioning.
*/

WITH ranked_products AS (
    SELECT 
        product_category,
        product_id,
        SUM(quantity_sold) AS total_units_sold,
        ROUND(SUM(sales_amount), 2) AS product_revenue,
        ROW_NUMBER() OVER (
            PARTITION BY product_category 
            ORDER BY SUM(sales_amount) DESC
        ) AS category_rank
    FROM sales_data
    GROUP BY product_category, product_id
)
SELECT 
    product_category,
    category_rank,
    product_id,
    total_units_sold,
    product_revenue
FROM ranked_products
WHERE category_rank <= 3
ORDER BY product_category, category_rank;

/*
DISCOUNT SENSITIVITY & MARGIN IMPACT
Purpose: Segment transactions into discount tiers to evaluate 
if higher discounts drive volume at the expense of profit margin.
*/

SELECT 
    CASE 
        WHEN discount = 0 THEN '0% (No Discount)'
        WHEN discount > 0 AND discount <= 0.10 THEN '1% - 10%'
        WHEN discount > 0.10 AND discount <= 0.20 THEN '11% - 20%'
        ELSE '21%+'
    END AS discount_tier,
    COUNT(*) AS total_transactions,
    ROUND(AVG(quantity_sold), 1) AS avg_units_per_order,
    ROUND(AVG(sales_amount), 2) AS avg_order_value,
    ROUND(AVG((unit_price - unit_cost) / NULLIF(unit_price, 0)) * 100, 2) AS avg_unit_margin_pct,
    ROUND(SUM(sales_amount), 2) AS total_revenue
FROM sales_data
GROUP BY 1
ORDER BY MIN(discount);

/*
CHANNEL PROFITABILITY & CUSTOMER RETENTION MATRIX
Purpose: Cross-tabulate sales channels with customer loyalty 
to detect channel-specific conversion and profitability.
*/

SELECT 
    sales_channel,
    customer_type,
    COUNT(*) AS total_orders,
    SUM(quantity_sold) AS total_units,
    ROUND(SUM(sales_amount), 2) AS total_revenue,
    ROUND(AVG(sales_amount), 2) AS avg_order_value,
    ROUND(
        SUM(sales_amount) / SUM(SUM(sales_amount)) OVER (PARTITION BY sales_channel) * 100, 
        2
    ) AS channel_revenue_share_pct
FROM sales_data
GROUP BY sales_channel, customer_type
ORDER BY sales_channel, customer_type;