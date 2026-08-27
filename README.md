# Task 1: Data Cleaning & Preprocessing (Marketing Campaign Dataset)

## 📌 Task Overview
This task focuses on preparing, cleaning, and standardizing the raw **Customer Marketing Campaign** dataset. The primary objective is to resolve formatting inconsistencies, handle missing values, filter demographic outliers, standardize categorical values, and prepare the dataset for exploratory data analysis (EDA) and customer segmentation.

---

## 📂 Deliverables & File Structure
```text
task_1/
│
├── marketing_campaign.csv          # Original raw dataset (tab-separated)
├── cleaned_marketing_campaign.csv  # Final cleaned & standardized dataset
└── README.md                       # Task 1 documentation & data dictionary
```

---

## 📊 Dataset Comparison Summary

| Metric | Raw Dataset | Cleaned Dataset | Notes / Changes |
| :--- | :--- | :--- | :--- |
| **Total Rows** | 2,240 | 2,207 | 33 invalid / outlier / missing rows removed |
| **Total Columns** | 29 | 27 | 2 zero-variance constant columns dropped |
| **Delimiter** | Tab (`\t`) | Comma (`,`) | Converted to standard CSV format |
| **Missing Values** | 24 (in `Income`) | 0 | Blank records filtered/resolved |
| **Duplicate Records** | 0 | 0 | Verified across unique customer IDs |

---

## 🛠️ Data Cleaning & Processing Pipeline

1. **Delimiter & Encoding Fix:**
   - Converted the raw tab-delimited file into a standard comma-separated format (`.csv`).

2. **Handling Missing Values:**
   - Addressed **24 missing records** in the `Income` attribute.

3. **Outlier Treatment:**
   - **Year of Birth:** Removed 3 historical anomaly records with birth years prior to 1920 (`1893`, `1899`, `1900`).
   - **Income:** Handled extreme anomaly entry (`$666,666`) to prevent skewed statistical distributions.

4. **Categorical Standardization:**
   - Cleaned `marital_status` values (`Alone`, `Absurd`, and `YOLO` consolidated into standard demographic categories).
   - Consolidated `education` tiers into clean groupings (`Basic`, `Graduation`, `Master`, `PhD`).

5. **Dimensionality Reduction (Zero-Variance Columns):**
   - Dropped `z_cost_contact` (constant value = 3) and `z_revenue` (constant value = 11) as they offer zero predictive/analytical variance.

6. **Schema & Header Standardization:**
   - Converted all column names into clean, uniform lowercase `snake_case` format for easy SQL/Python/Excel querying.

---

## 📖 Data Dictionary

### Customer Demographics
| Column | Type | Description |
| :--- | :--- | :--- |
| `id` | Integer | Unique identifier for each customer |
| `year_birth` | Integer | Year of birth of the customer |
| `education` | Categorical | Highest educational qualification completed |
| `marital_status` | Categorical | Customer marital status |
| `income` | Numeric | Annual customer household income ($ USD) |
| `kidhome` | Integer | Number of small children in customer household |
| `teenhome` | Integer | Number of teenagers in customer household |
| `dt_customer` | Date | Date of customer enrollment with the company |
| `recency` | Integer | Days elapsed since customer’s last purchase |
| `complain` | Binary | 1 if customer lodged a complaint in the last 2 years, 0 otherwise |

### Product Spend (Past 2 Years)
| Column | Type | Description |
| :--- | :--- | :--- |
| `mnt_wines` | Numeric | Total amount spent on wine products |
| `mnt_fruits` | Numeric | Total amount spent on fruits |
| `mnt_meat_products` | Numeric | Total amount spent on meat products |
| `mnt_fish_products` | Numeric | Total amount spent on fish products |
| `mnt_sweet_products` | Numeric | Total amount spent on sweet snacks / desserts |
| `mnt_gold_prods` | Numeric | Total amount spent on gold / luxury products |

### Channel Activity & Campaign Responses
| Column | Type | Description |
| :--- | :--- | :--- |
| `num_deals_purchases` | Integer | Number of purchases made with promotional discounts |
| `num_web_purchases` | Integer | Number of purchases completed via website |
| `num_catalog_purchases` | Integer | Number of purchases completed via catalog |
| `num_store_purchases` | Integer | Number of purchases made in physical stores |
| `num_web_visits_month` | Integer | Visits to the company website over the past month |
| `accepted_cmp1` to `5` | Binary | 1 if customer accepted offer in campaign 1–5, 0 otherwise |
| `response` | Binary | 1 if customer accepted offer in the final marketing campaign, 0 otherwise |

---
