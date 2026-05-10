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
<img width="920" height="561" alt="لقطة شاشة 2026-05-11 012634" src="https://github.com/user-attachments/assets/3638986a-94ff-45d4-af1e-a00f889b3419" />

<img width="920" height="584" alt="لقطة شاشة 2026-05-11 012729" src="https://github.com/user-attachments/assets/67d89eda-0ea8-41fd-acea-53c1b06932c8" />

<img width="926" height="583" alt="لقطة شاشة 2026-05-11 012745" src="https://github.com/user-attachments/assets/c897fe9c-6b4d-4fc1-a5e6-ee2e93c5a682" />

<img width="922" height="574" alt="لقطة شاشة 2026-05-11 012803" src="https://github.com/user-attachments/assets/b951feba-0a95-4803-9130-3f278c2882d5" />

<img width="905" height="588" alt="لقطة شاشة 2026-05-11 012814" src="https://github.com/user-attachments/assets/b625632e-9cdd-4ddd-b9db-b4e834eb0723" />

<img width="934" height="583" alt="لقطة شاشة 2026-05-11 012826" src="https://github.com/user-attachments/assets/eda22f0e-8227-410b-a691-061360488870" />

<img width="915" height="524" alt="لقطة شاشة 2026-05-11 012857" src="https://github.com/user-attachments/assets/4fe7fa3c-ccbf-46fd-92ee-a06b70862bef" />

<img width="922" height="561" alt="لقطة شاشة 2026-05-11 012950" src="https://github.com/user-attachments/assets/3f9dbb45-2ab7-461c-82a9-710ab84a2c9c" />

<img width="932" height="559" alt="لقطة شاشة 2026-05-11 013004" src="https://github.com/user-attachments/assets/b148b537-e01f-4533-9d4a-e58599730803" />

<img width="924" height="584" alt="لقطة شاشة 2026-05-11 013027" src="https://github.com/user-attachments/assets/7dca9f9d-bc1f-43f5-95e0-d7e9f7292f67" />










**👤 Prepared by:** Shahd Mohamed Sayed  
**🎓 Specialization:** Information Science | Junior Data Analyst  
**🚀 Goal:** Turning raw data into actionable business insights.
