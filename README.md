# ☕ Starbucks Global Directory | Advanced SQL Data Cleaning

## 📌 Project Overview
This project showcases a rigorous **Data Cleaning and Transformation** process using **MySQL**. I transformed a raw dataset of Starbucks store locations into a high-integrity relational database. The workflow follows professional database management practices, including the creation of staging environments and the use of advanced SQL techniques.

## 🛠️ Technical Deep Dive (The Workflow)

### 1️⃣ Database Architecture & Staging 🏗️
* **Safe Transformation:** Used `CREATE TABLE ... LIKE` and `INSERT INTO` to build a **Staging Environment**.
* **Why?** This ensures raw data remains untouched while performing complex transformations.

### 2️⃣ Multi-Stage Duplicate Removal 🛡️
* **Identification:** Used **Window Functions** (`ROW_NUMBER() OVER(PARTITION BY...)`) to detect duplicates across 7 unique dimensions.
* **Isolation:** Implemented **CTEs** and Subqueries to filter out redundant records.
* **Deletion:** Created an optimized table to permanently remove rows where `row_num > 1`.

### 3️⃣ Data Standardization & String Manipulation 🧹
* **Whitespace Cleanup:** Applied `TRIM()` to remove leading/trailing spaces.
* **Pattern Correction:** Used `TRIM(TRAILING '-' FROM City)` to fix specific formatting errors in location names.
* **Schema Tuning:** Utilized `ALTER TABLE` and `MODIFY COLUMN` to optimize data types for efficiency.

### 4️⃣ Advanced Data Imputation (Self-Join Logic) 🔗
* **Value Restoration:** Identified records with missing `Phone Number` or `Postcode`.
* **The Logic:** Developed **Self-Join** update scripts that cross-reference store names to "fill in the blanks" from other existing entries.

### 5️⃣ Final Schema Refinement 🏁
* **Null Handling:** Converted empty strings (`''`) to `NULL` for standard database behavior.
* **Final Cleanup:** Dropped auxiliary columns (like `row_num`) to deliver a clean, production-ready table.

## 💻 Key SQL Snippets Used
* 🔹 **Window Functions:** `ROW_NUMBER() OVER(PARTITION BY ...)`
* 🔹 **Joins:** `UPDATE t1 JOIN t2 ON t1.name = t2.name SET ...`
* 🔹 **DDL:** `CREATE TABLE`, `ALTER TABLE`
* 🔹 **DML:** `INSERT INTO`, `DELETE`, `UPDATE`

---
**👤 Prepared by:** Shahd Mohamed Sayed  
**🎓 Specialization:** Information Science | Junior Data Analyst  
**🚀 Goal:** Turning raw data into actionable business insights.
