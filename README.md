# 🚀 Internship Tasks & Projects Repository

Welcome to my **Data Analytics Internship Repository**! This repository serves as a central hub documenting the data cleaning, exploratory data analysis (EDA), database management, and business intelligence dashboard projects completed during my internship.

---

## 🔀 Branch Navigation & Repository Structure

Each task in this repository is maintained in its own dedicated Git branch to isolate project files, code scripts, Power BI reports, and dataset documentation.

### 📌 Quick Branch Directory

| Branch Name | Task / Project Title | Core Tech Stack | Primary Focus / Key Output |
| :--- | :--- | :--- | :--- |
| [`Task_01`](../../tree/Task_01) | **Data Cleaning & Preprocessing** | Excel | Marketing dataset standardization, outlier removal, missing value handling |
| [`Task_02`](../../tree/Task_02) | **Superstore Performance Dashboard** | Power BI, DAX | Interactive 2-page BI report analyzing $2.26M sales, fulfillment, & segments |
| [`Task_03`](../../tree/Task_03) | **Retail Sales EDA & Advanced Analytics** | PostgreSQL, SQL | Transactional EDA, MoM revenue growth, window ranking, & margin calculations |
| [`Task_04`](../../tree/Task_04) | **AdventureWorks Sales & Margin Dashboard** | Power BI, DAX | Global enterprise dashboard ($109.81M sales), B2B vs B2C split, margin erosion |
| [`Task_05`](../../tree/Task_05) | **Titanic Survival Analysis & EDA** | Python, Pandas, Seaborn | Demographics, missing value imputation, feature engineering, & correlation EDA |
| [`Task_06`](../../tree/Task_06) | **Sales Trend Analysis Using Aggregations** | PostgreSQL, SQL | Temporal joins, monthly revenue aggregation, seasonality, & order volume tracking |

---

## 📊 Executive Results Summary

| Task | Project Title | Tech Stack | Dataset Scale / Scope | Key Findings & Quantitative Outcomes |
| :--- | :--- | :--- | :--- | :--- |
| **Task 1** | Data Cleaning & Preprocessing | Excel | 2,240 records, 29 attributes | Standardized tab-delimited raw files, resolved 24 blank income records, removed historical date outliers and income extremes (`$666,666`), and dropped zero-variance constant columns. |
| **Task 2** | Superstore Performance Dashboard | Power BI, DAX | 4.9K orders, 9,800 line items ($2.26M revenue) | Built an interactive 2-page executive report tracking regional performance, customer segments, and multi-level time-series trends (2015–2018) with dynamic visual parameters. |
| **Task 3** | Retail Sales EDA & Advanced Analytics | PostgreSQL, SQL | 1,000 transactions ($5.02M revenue, 25.3K units) | Evaluated gross margins, used `DENSE_RANK()` for rep productivity ranking, and applied `LAG()` window functions for Month-over-Month (MoM) revenue growth tracking. |
| **Task 4** | AdventureWorks Sales & Margin Dashboard | Power BI, DAX | 31.4K orders ($109.81M revenue) | Uncovered an 11.43% profit margin with a B2B Reseller (73.26%) vs. B2C Internet (26.74%) split; identified negative-margin products (e.g., -10% to -24% on touring bikes/jerseys). |
| **Task 5** | Titanic Survival Analysis & EDA | Python, Pandas, Seaborn | 891 passenger records | Engineered features (`Title`, `FamilySize`, `Deck`); found a 74.20% female vs. 18.89% male survival rate, 62.96% for 1st Class, and peak survival (57.88%) among small families (2–4 members). |
| **Task 6** | Sales Trend Analysis Using Aggregations | PostgreSQL, SQL | Orders & Details relational tables | Revealed a strong Q1 start (Jan peak at ₹61,632 across 61 orders), a mid-year slump down to ₹12,966 in July (~79% drop), and a Q4 festive recovery rising to ₹48,469 in November. |

---

## 🛠️ How to Switch Branches in Git

To view the source code, raw datasets, SQL queries, or `.pbix` dashboard files for any specific task, switch to its corresponding branch using Git:

```bash
# Clone the repository (if you haven't already)
git clone [https://github.com/vani3101/Internship_tasks.git](https://github.com/vani3101/Internship_tasks.git)
cd Internship_tasks

# Fetch all remote branches
git fetch --all

# Checkout a specific task branch
git checkout Task_01   # For Data Cleaning (Excel)
git checkout Task_02   # For Superstore Dashboard (Power BI)
git checkout Task_03   # For Retail Sales Analysis (SQL)
git checkout Task_04   # For AdventureWorks Dashboard (Power BI)
git checkout Task_05   # For Titanic Survival Analysis (Python)
git checkout Task_06   # For Sales Trend Analysis (SQL)
