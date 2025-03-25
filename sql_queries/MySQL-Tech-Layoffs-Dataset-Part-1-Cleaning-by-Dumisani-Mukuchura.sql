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