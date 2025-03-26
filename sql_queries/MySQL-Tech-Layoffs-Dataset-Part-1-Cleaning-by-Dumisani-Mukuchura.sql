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

-- 1.3 Make a copy of the Table and Work on the Copy

CREATE TABLE tech_layoffs_dup
LIKE tech_layoffs; -- this creates the tables only but does not have the data so we need to include the data by an INSERT

INSERT tech_layoffs_dup
SELECT *
FROM tech_layoffs;

SELECT *
FROM tech_layoffs_dup; -- Confirm new Duplicate table.

-- 2. Check for Duplicates and Remove them if any.

-- There is no identifier so use row_num to act as the identifier and assign rank 
SELECT *,
ROW_NUMBER() OVER(PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised) AS row_num
FROM tech_layoffs_dup;

-- Package it as a CTE and then use it to find if there is a row_num greater than 1

WITH Tech_Layoffs_Duplicate_CTE AS
(
SELECT *,
ROW_NUMBER() OVER(PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised) AS row_num
FROM tech_layoffs_dup
)
SELECT *
FROM Tech_Layoffs_Duplicate_CTE
WHERE row_num > 1;

-- Response: 0 Rows returned thus there are no duplicates according to the set criteria

/* If there was Duplicates we would have created another table insert Data from the CTE then DELETE those greater than 1 in row_num

DROP TABLE IF EXISTS tech_layoffs_dup1;

CREATE TABLE `tech_layoffs_dup1` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` double DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised` text,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Confirm the creation of the Table, though it won't have Data yet
SELECT *
FROM tech_layoffs_dup1;

-- Insert Data into the created tech_layoffs_dup1 Table with that row number column
INSERT INTO layoffs_staging_3
SELECT *,
ROW_NUMBER() OVER(PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) AS row_num
FROM layoffs_staging_2;

-- Confirm Data addition and also existence of Duplicates 
SELECT *
FROM layoffs_staging_3
WHERE row_num > 1;

-- Action a DELETE of these row_num greater than 1 i.e the Duplicates
DELETE
FROM layoffs_staging_3
WHERE row_num > 1;

*/


