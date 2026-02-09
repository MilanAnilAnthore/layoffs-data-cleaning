-- =====================================
-- Layoffs Data Cleaning Project
-- Author: Milan
-- =====================================

-- ========================
-- 1. Create Staging Table
-- ========================

CREATE TABLE layoffs_staging
LIKE layoffs;

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


-- Remove duplicate rows
DELETE
FROM layoffs_staging2
WHERE row_num > 1;








