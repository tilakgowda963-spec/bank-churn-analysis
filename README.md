# Bank Churn Analysis — SQL & Strategy Project

## 📊 Project Overview
Analyzed a dataset of **10,000 customers** across the European banking sector to identify churn drivers and develop a high-impact retention strategy. This project focuses on protecting over **$1.04M** in vulnerable capital.

## 🛠️ Tools Used
* **PostgreSQL / pgAdmin 4**: Core database management and advanced querying.
* **Business Analytics**: Strategic ROI modeling and customer segmentation.

## 📁 Dataset
* **10,000 records** | 3 Regions | 14 Customer Metrics.
* **Key Variables**: Credit Score, Balance, Tenure, Product Ownership, and Activity Status.

## 🔍 Key Findings
* **Germany Risk**: Churn in Germany is **65%**, which is significantly higher than Spain (33%) and France (32%).
* **Age Factor**: Customers aged **50+** churn at 45.5%, a 6x increase over the 18-29 cohort (7.6%).
* **Product Impact**: Customers with 2 products are much stickier (7.6% churn) than those with only 1 product (27.7% churn).
* **Activity Gap**: Inactive members show a churn rate of **26.9%** compared to 14.3% for active members.

## 💡 Strategic Recommendations
* **Safe Reactivation Campaign**: A pilot program targeting high-value, inactive customers with credit scores **≥ 700** to protect **$1,045,971** in deposits.
* **The "Year 3 Cliff"**: Identified a major concentration of wealth at the 3-year tenure mark, requiring proactive loyalty "lock-in" offers.
* **Retention Matrix**: Implementation of a "Loyalty-Risk" matrix to prioritize retention budgets for high-balance customers with safe credit scores.

## 📝 Queries Covered
* **Basic**: `COUNT`, `SUM`, `AVG`, `MIN/MAX`.
* **Intermediate**: `GROUP BY`, `ORDER BY`, `CASE WHEN`, `UNION ALL`.
* **Advanced**: `DENSE_RANK()`, `PERCENTILE_CONT()`, `PARTITION BY`, `CTEs`.
