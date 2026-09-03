# 🚲 AdventureWorks Sales & Margin Performance Dashboard

An interactive Power BI business intelligence solution built on the **AdventureWorks Data Warehouse** dataset. This project tracks **$109.81M** in commercial transactions across global territories, analyzing sales trajectories, B2B Reseller vs. B2C Internet channel splits, regional concentration, and product-level margin erosion.

---

## 📌 KPI Summary

| Metric | Dashboard Value | Calculation Logic | Business Significance |
| :--- | :--- | :--- | :--- |
| **Total Sales** | **$109.81M** | `SUM(Sales Amount)` | Total commercial revenue generated across FY2018–FY2021 |
| **Total Orders** | **31K** (31,455) | `DISTINCTCOUNT(Sales Order)` | Unique customer checkouts and commercial invoices processed |
| **Profit Margin %** | **11.43%** | `(Total Sales - Total Cost) / Total Sales` | Net operating gross margin after actual manufacturing cost |
| **Average Order Value (AOV)** | **$3.49K** ($3,491.03) | `Total Sales / Total Orders` | Mean spend realized per distinct order invoice |

---

## 📊 Dashboard Breakdown

The report consists of two analytical pages designed for executive decision-makers and operational category planners.

### Page 1: Executive Summary
Focused on macro financial health, annual revenue cadence, and channel dynamics.
* **Top Metric Ribbon:** Card visuals displaying enterprise **Total Sales**, **Total Orders**, **Profit Margin %**, and **AOV**.
* **Trend Analysis (Stacked Area Chart):** Displays revenue performance across years and fiscal quarters, highlighting rapid expansion through FY2019 (>42M) followed by volume normalization.
* **Channel Distribution (Donut Chart):** Segments revenue by fulfillment stream, showing **Reseller (B2B)** driving **73.26%** of top-line revenue vs. **Internet (B2C)** accounting for **26.74%**.
* **Dynamic Metric Navigator:** Interactive bottom parameter selector enabling single-click toggling between **Total Orders**, **Total Sales**, and **Profit Margin**.

### Page 2: Product & Regional Deep Dive
Focused on geographic volume, customer segment balance, and item-level profitability.
* **Header Controls:** Dedicated back-navigation arrow (`←`) and global slicers for **Fiscal Year** and **Channel** (`Internet` / `Reseller`).
* **Top Categories & Subcategories (Treemap):** 
  * Tile size mapped to **Total Sales** (dominated by Bikes at >80% share).
  * Conditional color formatting mapped to **Profit Margin %** to flag volume-driving segments that yield sub-optimal profit.
* **Bottom 5 Products (Horizontal Bar Chart):** Ranks negative-margin items causing profit erosion, led by apparel and touring models operating at **-10% to -24%** margins.
* **Country & Regional Distribution (Horizontal Bar Chart):** Evaluates geographic volume led by the **United States (>50M)**, followed by **Canada (~14M)**, **France**, the **United Kingdom**, **Germany**, and **Australia**.
* **Reseller Business Type (Donut Chart):** Highlights a balanced wholesale distribution model across **Value Added Resellers (34.0%)**, **Warehouses (33.1%)**, and **Specialty Bike Shops (33.0%)**.

---

## 💡 Key Insights (Summary)

* **Apparel & Touring Margin Leaks:** Gross company margins are compressed to **11.43%** primarily due to products whose production costs exceed realized selling prices. The worst-performing items include:
  * `Short-Sleeve Classic Jersey, XL`: **-24.38%** margin (-$31.5K net loss)
  * `Short-Sleeve Classic Jersey, L`: **-20.23%** margin (-$19.9K net loss)
  * `Long-Sleeve Logo Jersey, L`: **-13.18%** margin (-$26.2K net loss)
  * `Touring-3000 Blue, 50`: **-11.33%** margin (-$39.5K net loss)
* **B2B Volume vs. B2C Margin Asymmetry:** Wholesale Resellers represent the primary cash driver (**73.26%** of revenue), but direct-to-consumer Internet sales deliver higher profit margins per unit on accessories, clothing, and replacement components.
* **Balanced Partner Mix:** B2B wholesale revenue is split evenly (~33% to 34% each) among Value-Added Resellers, Warehouses, and Bike Shops, reducing systemic counterparty risk.
* **North American Revenue Concentration:** Over 65% of global revenue originates from the US and Canada. European markets (UK, France, Germany) maintain strong margin profiles but remain under-penetrated in volume.

---

## 🧮 DAX Calculations

All measures are isolated in a dedicated `_measures` table for clean data model management:

```dax
// Total Gross Revenue
Total Sales = 
SUM( 'Sales_data'[Sales Amount] )

// Total Cost of Goods Sold (COGS)
Total Cost = 
SUM( 'Sales_data'[Total Product Cost] )

// Gross Operating Profit
Total Profit = 
[Total Sales] - [Total Cost]

// Operating Profit Margin %
Profit Margin % = 
DIVIDE( [Total Profit], [Total Sales], 0 )

// Distinct Order / Invoice Count
Total Orders = 
DISTINCTCOUNT( 'SalesOrder'[Sales Order] )

// Average Order Value
AOV = 
DIVIDE( [Total Sales], [Total Orders], 0 )
