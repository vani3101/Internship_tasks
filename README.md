# Sales Trend Analysis Using Aggregations

## Overview
This task focuses on analyzing sales performance and order trends over time using SQL aggregations. By joining transactional order details with order metadata, the analysis tracks monthly revenue and distinct order volume throughout the year.

---

## Objective
* Extract temporal components (year and month) from order timestamps.
* Aggregate financial metrics (`total_revenue`) and fulfillment volume (`order_volume`).
* Identify seasonal patterns, peak performance periods, and fluctuations across months.

---

## Dataset Description
The analysis utilizes two tables loaded from relational CSV exports:

* **`orders`**: Contains high-level order metadata.
  * `order_id`: Unique identifier for each order (Primary Key).
  * `order_date`: Date when the order was placed.
  * `customer_name`: Name of the customer.
  * `state`: State where the order was placed.
  * `city`: City of delivery.
* **`details`**: Contains item-level order transactions.
  * `order_id`: Foreign key referencing `orders(order_id)`.
  * `amount`: Transaction amount per line item.
  * `profit`: Net profit generated per line item.
  * `quantity`: Units ordered.
  * `category`: Product category.
  * `sub_category`: Specific item classification.
  * `payment_mode`: Payment method used.

---

## Key Insights & Business Observations

* **Q1 Strong Start & Peak Demand:** Sales surged significantly in the first quarter, with **January** generating the year's highest revenue at **₹61,632** across **61 orders**, followed closely by **March (₹60,694, 58 orders)**.
* **Mid-Year Slump:** Performance experienced a steady decline from April through July. **July** recorded the lowest revenue of the year (**₹12,966** across 31 orders), representing a **~79% drop** from January's peak.
* **Q4 Recovery & Festive Uptick:** Demand rebounded entering the final quarter, with revenue rising from **₹31,613 in October** to **₹48,469 in November (46 orders)** before stabilizing at **₹37,579 in December**.
* **Volume vs. Basket Size Variations:** While order counts remained flat at **30–31 orders per month** between May and September, revenue fluctuated between **₹12,966 and ₹31,492**, indicating substantial variations in average order value (AOV) and product mix across different months.

---

## SQL Query

```sql
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

