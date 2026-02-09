-- =====================================
-- Layoffs Data Cleaning Project
-- Author: Milan
-- =====================================

-- ========================
-- 1. Create Staging Table
-- ========================

DROP TABLE IF EXISTS layoffs_staging;
CREATE TABLE layoffs_staging LIKE layoffs;


-- Copy all records from the original layoffs table into the staging table for cleaning
INSERT layoffs_staging
SELECT *
FROM layoffs;

-- ========================
-- 2. Remove duplicates
-- ========================

-- Create deduplicated staging table using ROW_NUMBER
-- Using ROW_NUMBER to identify duplicate records
CREATE TABLE layoffs_staging2 AS
SELECT *,
ROW_NUMBER() OVER(
    PARTITION BY company,
                 location,
                 industry, 
                 total_laid_off, 
                 percentage_laid_off,
                 `date`,
                 stage,
                 country,
                 funds_raised_millions
) AS row_num
FROM layoffs_staging;


-- Remove duplicate rows, keeping only the first occurrence of each unique record
DELETE
FROM layoffs_staging2
WHERE row_num > 1;


-- ========================
-- 3. Standardizing data
-- ========================

-- Remove the white space from the ends
UPDATE layoffs_staging2
SET company = TRIM(company);


-- Update all records in the layoffs_staging2 table where the industry starts with 'Crypto'
-- and standardize the industry name to 'Crypto'
UPDATE layoffs_staging2
SET industry = 'Crypto'
WHERE industry LIKE 'Crypto%';


-- Remove any trailing periods from country names starting with 'United States' 
-- to standardize the country field in layoffs_staging2
UPDATE layoffs_staging2
SET country = TRIM(TRAILING '.' FROM country) 
WHERE country LIKE 'United States%';


-- Convert the 'date' column from string format '%m/%d/%Y' to proper DATE type
-- in layoffs_staging2 for consistent date handling
UPDATE layoffs_staging2
SET `date` = STR_TO_DATE(`date`, '%m/%d/%Y');


-- Change the data type of the 'date' column to DATE 
-- in layoffs_staging2 to ensure proper date storage and operations
ALTER TABLE layoffs_staging2
MODIFY COLUMN `date` DATE;




