# 🚀 Modern Data Warehouse Project (SQL Server)

## 📌 Project Overview
This project demonstrates the end-to-end implementation of a **Modern Data Warehouse** using SQL Server. It follows the **Medallion Architecture (Bronze, Silver, Gold layers)** to transform raw data into structured, analytics-ready datasets.

The project simulates a real-world data engineering workflow, including **data ingestion, transformation, and reporting**.

---

## 🏗️ Data Architecture

This project follows a layered architecture:

### 🥉 Bronze Layer (Raw Data)
- Stores raw data from source systems (CSV files)
- No transformations applied
- Acts as a **single source of truth**

### 🥈 Silver Layer (Cleaned Data)
- Data cleaning and transformation
- Handles missing values and duplicates
- Standardizes formats across datasets

### 🥇 Gold Layer (Business Layer)
- Business-ready data for analytics
- Includes **dimension tables and views**
- Optimized for reporting (Power BI)

---

## ⚙️ Tech Stack
- **SQL Server**
- **T-SQL (Stored Procedures, Views)**
- **ETL Pipeline (Extract, Load, Transform)**
- **Git & GitHub**

---

## 📊 Key Features
- End-to-end data pipeline (CSV → SQL Server → Analytics)
- Medallion architecture implementation
- Data cleaning and transformation logic
- Creation of analytical views (e.g., `gold.dim_customers`)

---

## 📂 Project Structure
```
bronze/   → Raw data ingestion  
silver/   → Data cleaning & transformation  
gold/     → Final business views  
```

---

## 🎯 Project Objective
The main objective of this project is to:

- Build a scalable data warehouse using SQL Server  
- Implement ETL pipelines for data processing  
- Design a structured data model for analytics  
- Enable business insights through clean and reliable data  

---

## 📈 Future Enhancements
- Implement **incremental loading**
- Integrate with **AWS (S3, Redshift)**
- Build interactive **Power BI dashboards**

---

## 👨‍💻 Author
**Aniket Mahesh Chaudhari**  
Aspiring Data Engineer | Data Analyst  