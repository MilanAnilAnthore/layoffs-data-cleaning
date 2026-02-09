-- =====================================
-- Layoffs Data - Exploratory Data Analysis (EDA)
-- Author: Milan
-- =====================================

-- ========================
-- 0. Notes
-- ========================
-- This script performs key exploratory data analysis on the cleaned layoffs table.
-- All queries use the 'layoffs_cleaned' table created from previous data cleaning steps.
-- Export results to CSV for visualization and reporting.

-- ========================
-- 1. Overview
-- ========================

SELECT 
    COUNT(*) as total_records,
    MIN(`date`) as earliest_layoff,
    MAX(`date`) as latest_layoff,
    SUM(total_laid_off) as total_employees_affected
FROM layoffs_cleaned;


-- ========================
-- 2. Top 10 Companies by Total Layoffs
-- ========================


SELECT 
    company,
    SUM(total_laid_off) as total_laid_off
FROM layoffs_cleaned
WHERE total_laid_off IS NOT NULL
GROUP BY company
ORDER BY total_laid_off DESC
LIMIT 10;


-- ========================
-- 3. Layoffs by Industry
-- ========================

SELECT 
    industry,
    SUM(total_laid_off) as total_laid_off,
    COUNT(*) as num_events
FROM layoffs_cleaned
WHERE total_laid_off IS NOT NULL
GROUP BY industry
ORDER BY total_laid_off DESC;


-- ========================
-- 4. Layoffs by Year
-- ========================
SELECT 
    YEAR(`date`) as year,
    SUM(total_laid_off) as total_laid_off
FROM layoffs_cleaned
WHERE total_laid_off IS NOT NULL AND `date` IS NOT NULL
GROUP BY YEAR(`date`)
ORDER BY year;


-- ========================
-- 5. Companies with Complete Shutdowns (100% layoffs)
-- ========================
SELECT 
    company,
    industry,
    total_laid_off,
    `date`
FROM layoffs_cleaned
WHERE percentage_laid_off = 1 OR percentage_laid_off = 100
ORDER BY total_laid_off DESC;