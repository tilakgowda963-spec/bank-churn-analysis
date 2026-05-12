# Bank Churn Analysis — SQL & Strategy Project

## 📊 Project Overview
Analyzed a dataset of **10,000 customers** across the European banking sector to identify churn drivers and develop a high-impact retention strategy. [cite_start]This project focuses on protecting over **$1.04M** in vulnerable capital[cite: 6, 297].

## 🛠️ Tools Used
* [cite_start]**PostgreSQL / pgAdmin 4**: Core database management and advanced querying [cite: 95-96].
* [cite_start]**Business Analytics**: Strategic ROI modeling and customer segmentation[cite: 291, 333].

## 📁 Dataset
* **10,000 records** | 3 Regions | [cite_start]14 Customer Metrics [cite: 11, 76-91].
* [cite_start]**Key Variables**: Credit Score, Balance, Tenure, Product Ownership, and Activity Status[cite: 13].

## 🔍 Key Findings
* [cite_start]**Germany Risk**: Churn in Germany is **65%**, which is significantly higher than Spain (33%) and France (32%)[cite: 55, 250].
* [cite_start]**Age Factor**: Customers aged **50+** churn at 45.5%, a 6x increase over the 18-29 cohort (7.6%)[cite: 41, 204].
* [cite_start]**Product Impact**: Customers with 2 products are much stickier (7.6% churn) than those with only 1 product (27.7% churn)[cite: 34].
* [cite_start]**Activity Gap**: Inactive members show a churn rate of **26.9%** compared to 14.3% for active members[cite: 48].

## 💡 Strategic Recommendations
* [cite_start]**Safe Reactivation Campaign**: A pilot program targeting high-value, inactive customers with credit scores **≥ 700** to protect **$1,045,971** in deposits [cite: 305-307, 314-315].
* [cite_start]**The "Year 3 Cliff"**: Identified a major concentration of wealth at the 3-year tenure mark, requiring proactive loyalty "lock-in" offers[cite: 356, 360].
* [cite_start]**Retention Matrix**: Implementation of a "Loyalty-Risk" matrix to prioritize retention budgets for high-balance customers with safe credit scores[cite: 370].

## 📝 Queries Covered
* [cite_start]**Basic**: `COUNT`, `SUM`, `AVG`, `MIN/MAX` [cite: 151-152, 197-198].
* [cite_start]**Intermediate**: `GROUP BY`, `ORDER BY`, `CASE WHEN`, `UNION ALL` [cite: 167-184, 188-202].
* [cite_start]**Advanced**: `DENSE_RANK()`, `PERCENTILE_CONT()`, `PARTITION BY`, `CTEs` [cite: 171-173, 259, 280].
