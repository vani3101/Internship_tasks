# Retail Sales Performance & Exploratory Data Analysis (SQL)

A structured SQL-based data analytics project analyzing transactional sales data across multiple dimensions including product categories, regional territories, sales representatives, and customer purchasing behaviors.

---

## 📌 Project Overview

This project explores a transactional retail dataset containing 1,000 sales records from January 2023 to January 2024. The analysis extracts key business performance indicators (KPIs), tracks revenue growth month-over-month, ranks sales rep productivity within regions, and evaluates pricing/margin dynamics across sales channels.

### Key Metrics Snapshot
* **Total Transactions:** 1,000
* **Total Units Sold:** 25,355
* **Total Revenue Generated:** $5,019,265.23
* **Average Order Value (AOV):** $5,019.27
* **Product Categories Analyzed:** Furniture, Food, Clothing, Electronics
* **Territories Covered:** North, South, East, West

---

## 🛠️ Tech Stack & SQL Concepts

* **Database Engine:** PostgreSQL
* **Tooling:** Visual Studio Code, Git, GitHub
* **Core SQL Skills Demonstrated:**
  * **Aggregation & Grouping:** `GROUP BY`, `HAVING`, multi-level aggregations.
  * **Window Functions:** `DENSE_RANK()`, `ROW_NUMBER()`, `LAG()`, `OVER (PARTITION BY ... ORDER BY ...)`.
  * **Time-Series Analysis:** `TO_CHAR()`, `DATE_TRUNC()`, Month-over-Month (MoM) revenue trajectory.
  * **Analytical Calculations:** Common Table Expressions (CTEs), cumulative running totals, rolling moving averages, and margin analysis.

---

## 🔍 Key Insights

### 1. Overall KPIs & High-Level Metrics
Summarized core transaction bounds, gross revenue, volume metrics, and discount rates across all completed orders (`02_eda_and_kpis.sql`).

### 2. Category & Margin Performance
Evaluated gross profit margins by comparing unit price against unit cost across categories (Clothing, Furniture, Electronics, Food) to identify high-margin vs. high-volume drivers.

### 3. Regional Rep Rankings
Leveraged `DENSE_RANK() PARTITION BY region` to rank individual sales representatives based on closed revenue and volume in their respective territories (`03_advanced_analysis.sql`).

### 4. Month-over-Month (MoM) Growth & Trends
Calculated monthly revenue variances using `LAG()` window functions and smoothed short-term seasonality with 3-month rolling averages and running totals.

### 5. Channel & Customer Segmentation
Cross-tabulated new versus returning customer behavior across `Online` and `Retail` channels to assess discount sensitivity and average transaction size.

---

## 📊 Query Execution Outputs

> *All query result screenshots are organized in the [`screenshots/`](./screenshots/) directory.*

---
