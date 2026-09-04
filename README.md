# Titanic Survival Analysis & Exploratory Data Analysis (EDA)

An end-to-end exploratory data analysis, data cleaning, and feature engineering study based on the Titanic passenger dataset. This project investigates the demographic, socioeconomic, and logistical factors determining passenger survival during the maritime disaster.

---

## 📌 Project Overview

The objective of this project is to analyze passenger data from `train.csv` (891 records) to uncover key drivers of survival. Using Python, pandas, and Seaborn/matplotlib, this project performs:
- Targeted missing value imputation using demographic grouping (`Title` and `Pclass`).
- Domain-specific feature engineering (`Title`, `FamilySize`, `TravelGroup`, `Has_Cabin`, `AgeGroup`).
- Bivariate and multivariate visual analysis highlighting socioeconomic and gender disparities.
- Correlation ranking against survival outcomes to guide predictive modeling.

---

## ⚙️ Key Technical Steps

* **Missing Value Imputation**:
  * **`Embarked`**: Imputed 2 missing records with the port mode (`'S'`).
  * **`Cabin`**: Converted 687 missing records into a binary indicator `Has_Cabin` (1 for known cabin, 0 for missing) and extracted the initial deck letter (`Deck`).
  * **`Age`**: Imputed 177 missing records using the median age grouped by extracted passenger `Title` and `Pclass` to avoid distortions from a global median.
* **Feature Engineering**:
  * **`Title` Extraction**: Parsed honorific prefixes from passenger names (`Mr`, `Miss`, `Mrs`, `Master`, `Royalty`, `Officer`) to capture social status and age nuance.
  * **`FamilySize` & `TravelGroup`**: Combined `SibSp + Parch + 1` into total family size aboard, categorizing passengers into `Solo (1)`, `Small Family (2–4)`, and `Large Family (5+)`.
  * **`AgeGroup`**: Discretized continuous ages into distinct cohorts: `Child (<=12)`, `Teen (13–19)`, `Adult (20–59)`, and `Senior (60+)`.
  * **`FareBracket`**: Segmented ticket fares into quartiles (`Q1` to `Q4`) to analyze survival progression across expenditure levels.
* **Data Type Optimization**:
  * Cast `Pclass` to an ordered categorical type (`1 < 2 < 3`).
  * Cast `Sex` and `Embarked` to nominal categorical types to optimize memory usage and downstream modeling.

---

## 💡 Key Insights

* **Strong Gender Priority**: Females achieved an overall survival rate of **74.20%** compared to **18.89%** for males, aligning with the maritime "women and children first" evacuation protocol.
* **Socioeconomic Advantage**: Survival was strongly correlated with passenger class—**62.96%** for 1st Class, **47.28%** for 2nd Class, and **24.24%** for 3rd Class.
* **Class & Gender Intersection**: Women in 1st and 2nd class experienced near-complete survival (**96.8%** and **92.1%** respectively), whereas female survival dropped to **50.0%** in 3rd class. Male survival remained low across all classes, peaking at only **36.9%** in 1st class.
* **Children's Prioritization**: Children aged 12 and under recorded a **57.53%** survival rate. Young boys titled *Master* had a **57.50%** survival rate, contrasting sharply with adult men titled *Mr.* (**15.67%**).
* **Non-Linear Family Dynamics**: Small families (2 to 4 members) had the highest survival rate at **57.88%**. Solo travelers (**30.35%**) and large families of 5 or more (**16.13%**) suffered far higher mortality rates due to lack of assistance or coordination challenges during evacuation.
* **Fare & Cabin Indicators**: Recorded cabin allocation correlated positively with survival ($r = +0.32$) due to higher deck positioning, and survivors paid a median fare of **£26.00** compared to **£10.50** for non-survivors.

---

## 📈 Visualizations Included

* **Survival Rate by Sex and Class (Annotated Bar Charts)**:
  * Compares survival percentages across genders and displays the class-by-gender interaction.
  * Quantifies the survival drop between 1st/2nd class females (>92%) and 3rd class females (50%).
* **Age & Fare Distributions by Survival Outcome (KDE & Box Plots)**:
  * **Age KDE Density**: Highlights the survival density peak among young children (ages 0–10) and casualty concentration among young adults (ages 18–32).
  * **Fare Box Plot**: Illustrates the significant upward shift in median and interquartile fare values among survivors relative to casualties.
* **Ranked Feature Correlations with Survival (Horizontal Bar Chart)**:
  * Ranks individual predictor variables by their linear correlation coefficient with `Survived`.
  * Highlights `Sex_Female` ($+0.54$), `Has_Cabin` ($+0.32$), and `Fare` ($+0.26$) as primary positive drivers, and `Pclass` ($-0.34$) as the strongest negative driver.
* **Survival Probability: Class & Sex Interaction (Point Plot)**:
  * Traces survival trajectories across ticket classes separated by gender without visual clutter.
  * Demonstrates the sharp drop in female survival in 3rd class alongside the steep decline for males outside 1st class.
