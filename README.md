# MySQL Tech Layoffs Dataset - Part 1: Data Cleaning

## Project Overview
This project focuses on **data cleaning and preprocessing** of a **Tech Layoffs dataset** using **SQL (MySQL)**. The goal is to **clean, standardize, and prepare** the dataset for further analysis by handling **duplicates, null values, inconsistent formats, and redundant data**.

- **Dataset Source:** [Kaggle - Tech Layoffs Dataset](https://www.kaggle.com/datasets/swaptr/layoffs-2022)  
- **Tools Used:** MySQL, SQL Queries  
- **Author:** Dumisani Maxwell Mukuchura  
- **Contact:** dumisanimukuchura@gmail.com | [LinkedIn](https://www.linkedin.com/in/dumisani-maxwell-mukuchura-4859b7170/)  

## Goals of This Project
1. **Understand the Dataset:** Identify column names, data types, and structure.
2. **Check and Remove Duplicates:** Ensure no repeated records exist.
3. **Standardize the Data:** Clean column values, fix inconsistencies, and format data properly.
4. **Handle Missing Values:** Identify and remove or fill NULL/blank values appropriately.
5. **Remove Redundant Data:** Drop columns or rows that provide no analytical value.

---

## Folder Structure 
MySQL-Tech-Layoffs-Dataset-Part-1-Cleaning/ 
│── data/ # Contains the dataset 
│── sql_queries/ # SQL queries and analysis 
│── README.md # Project documentation 


## **Project Progress & Key Steps**

### **1. Understanding the Dataset**
- Imported the dataset into **MySQL** via the Table Import Wizard.
- **Columns Identified (9 Total):**  
  `company, location, industry, total_laid_off, percentage_laid_off, date, stage, country, funds_raised`
- Dataset contains **1,288 rows**.

---

### **2. Checking for Duplicates**
- Since there was **no unique identifier (ID column)**, used **ROW_NUMBER()** to check for exact duplicates.
- **No duplicates found**, so no deletion was required.

---

### **3. Data Standardization**
- **Fixed Whitespaces in Company Names**  
  - Used `TRIM(company)` to remove leading/trailing spaces.  
- **Cleaned Location Data**  
  - Removed special characters (`['']`) and **added a new column `us_status`** to differentiate U.S. vs. Non-U.S. locations.
- **Converted Date to Proper Format**  
  - Originally stored as `TEXT`, converted to **DATETIME** using `STR_TO_DATE(date, "%Y-%m-%d")`.
- **Updated Data Types**  
  - `percentage_laid_off` and `funds_raised` were stored as **TEXT** → Converted to **DOUBLE** for proper numerical operations.

---

### **4. Handling Missing Values**
- **Checked NULL/Blank values in:**  
  - `percentage_laid_off` → **457 missing values**  
  - `funds_raised` → **165 missing values**  
  - **66 rows had both missing** → **Deleted those rows**  
- Converted **remaining blanks to NULLs** to ensure proper handling.

---

### **5. Removing Redundant Columns**
- **All columns were found to be useful**, so no columns were removed.

---

## **Final Outcomes**
✅ The dataset is now **cleaned, standardized, and ready** for further analysis.  
✅ **No duplicates, unnecessary spaces, or formatting errors** remain.  
✅ **NULL handling completed**, and **data types properly assigned**.


## 🎯 Project Goals and Outcomes Summary

### 1. Understand Dataset Structure
- Examine columns, rows, and data types  
- Create a working copy of the original data  

### 2. Check for and Remove Duplicates
- Identify duplicate rows using window functions  
- Remove any found duplicates  

### 3. Standardize the Data
- Clean whitespace in company names  
- Normalize location formatting  
- Convert text dates to proper datetime format  
- Correct data types for numeric columns  

### 4. Handle NULL/Blank Values
- Identify missing values in key columns  
- Convert blank strings to NULL  
- Remove rows with NULLs in both percentage_laid_off and funds_raised  

### 5. Remove Redundant Columns
- Evaluate all columns for usefulness 