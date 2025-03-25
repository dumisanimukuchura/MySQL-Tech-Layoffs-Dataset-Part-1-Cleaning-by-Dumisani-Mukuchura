/*
Project: Data Cleaning with SQL on a Tech Layoffs Dataset by Dumisani Mukuchura
By: Dumisani Maxwell Mukuchura
Email: dumisanimukuchura@gmail.com
Dataset: https://www.kaggle.com/datasets/swaptr/layoffs-2022

Goals: 
1. Understand Dataset: the Columns, Rows and setup.
2. Check for Duplicates and Remove them if any.
3. Standardize the Data considering understanding from Step 1.
4. Check for NULL/Blank values and decide how to deal with them.
5. Remove Columns/Rows that do not have value to the Dataset.
*/

-- 0. Import the CSV File via the Craetion of New Schema, name it and via Table import Wizard

-- Inspection shows there are 9 columns and all of them are of variable type: text except 'total_laid_off' which is a double
-- 9 Columns: company, location, industry, total_laid_off, percentage_laid_off, date, stage, country, funds_raised

-- 1 Understand Dataset: the Columns, Rows and setup.
-- 1.1 Preview the Dataset and view Columns and Rows to have a sense of the Dataset.

SELECT *
FROM tech_layoffs;

-- Example Row Returned 'Brightcove', '[\'Boston\']', 'Marketing', '198', '0.33', '2025-03-19T00:00:00.000Z', 'Acquired', 'United States', '145.0'

-- 1.2 Understand the Total number of Rows in the Dataset

SELECT COUNT(*) AS Total_Rows
FROM tech_layoffs;

-- Answer: 1288 Rows