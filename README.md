#  Layoffs Data Cleaning & Analysis

A SQL-based data cleaning and exploratory analysis project focused on global company layoffs from 2020-2023. This project demonstrates my data cleaning and transformation workflow—from handling messy data to extracting meaningful insights.

## Project Overview

As a web developer, understanding data workflows is crucial for building robust backend systems and making informed decisions. This project showcases my ability to work with databases, write SQL queries, ensure data quality, and extract actionable insights—all useful skills for full-stack development.

### Key Highlights

- **383,659 employees** affected across the dataset
- Cleaned and standardized **1,996 records** from messy raw data
- Analyzed trends across **multiple industries and countries**
- **2022** was the peak year with **160,661 layoffs**

##  Dataset

- **Source**: Global company layoffs dataset (2020-2023)
- **Raw Records**: ~2,362 entries with inconsistencies and duplicates
- **Cleaned Records**: 1,996 validated and analysis-ready entries
- **Columns**: `company`, `location`, `industry`, `total_laid_off`, `percentage_laid_off`, `date`, `stage`, `country`, `funds_raised_millions`

##  Data Cleaning Process

### 1️ **Staging & Preservation**
- Created staging tables to preserve original data
- Implemented safe, non-destructive cleaning workflow

### 2️ **Deduplication**
- Used `ROW_NUMBER()` window function to identify duplicates
- Partitioned by all key columns to catch true duplicates
- Removed 366 duplicate records

### 3️ **Standardization**
- Trimmed whitespace from company names
- Normalized industry categories (e.g., "Crypto Currency" → "Crypto")
- Fixed country name inconsistencies (e.g., "United States." → "United States")
- Converted date strings to proper `DATE` type for analysis

### 4️ **NULL Handling**
- Converted empty strings to `NULL` for consistency
- Backfilled missing industry values using self-join logic
- Removed rows with no useful layoff data (both metrics NULL)

### 5️ **Final Output**
- Exported clean, analysis-ready dataset

##  Key Findings

###  **Most Affected Companies**
1. **Amazon** - Largest total layoffs
2. **Google** - Significant workforce reduction
3. **Meta** - Major restructuring
4. **Salesforce** - Enterprise tech downsizing
5. **Philips** - Healthcare sector impact

###  **Most Impacted Industries**
1. **Consumer** - Hardest hit sector
2. **Retail** - E-commerce adjustments
3. **Other** - Diverse sectors affected
4. **Transportation** - Post-pandemic shifts
5. **Finance** - Economic pressures

###  **Temporal Trends**
- **2022** was the worst year with **160,661 employees** laid off
- Tech industry faced unprecedented restructuring
- Clear correlation with economic conditions

##  Technologies & Skills

**Database & Query Language:**
- MySQL - Data cleaning, transformation, and analysis
- SQL techniques: Window Functions, Joins, Date Handling, Aggregations

**Data Skills Demonstrated:**
- Data transformation workflow design
- Data quality assessment
- Duplicate detection & removal
- Data standardization & normalization
- NULL value handling
- Temporal data analysis
- Aggregation & grouping

**Best Practices:**
- Staging table methodology
- Non-destructive data operations
- Well-commented SQL scripts
- Version control with Git

##  How to Run

### Prerequisites
- MySQL 5.7+ or MariaDB 10.2+
- MySQL Workbench (optional, for easier execution)

### Step 1: Import Raw Data
```sql
-- Create database
CREATE DATABASE layoffs_project;
USE layoffs_project;

-- Create base table
CREATE TABLE layoffs (
    company VARCHAR(255),
    location VARCHAR(255),
    industry VARCHAR(255),
    total_laid_off INT,
    percentage_laid_off DECIMAL(5,2),
    date VARCHAR(50),
    stage VARCHAR(50),
    country VARCHAR(255),
    funds_raised_millions INT
);

-- Load data from CSV
LOAD DATA INFILE 'data/raw/layoffs.csv' 
INTO TABLE layoffs
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
```

### Step 2: Run Cleaning Process
```bash
mysql -u your_username -p layoffs_project < sql/data_cleaning.sql
```

### Step 3: Run Exploratory Analysis
```bash
mysql -u your_username -p layoffs_project < sql/Layoffs\ Data\ -\ Exploratory\ Data\ Analysis\ \(EDA\).sql
```

##  Project Structure

```
layoffs-data-cleaning/
├── README.md                          # You're here!
├── LICENSE                            # MIT License
├── data/
│   ├── raw/
│   │   └── layoffs.csv               # Original unclean data (~2,362 rows)
│   └── cleaned/
│       └── layoffs_cleaned.csv       # Clean, analysis-ready data (~1,996 rows)
└── sql/
    ├── data_cleaning.sql             # Complete data cleaning script
    └── Layoffs Data - EDA.sql        # Exploratory analysis queries
```

##  Relevance to Web Development

This project demonstrates skills applicable to web development:

- **User Data Migrations**: Cleaning legacy data during system upgrades or platform migrations
- **Database Work**: Writing SQL queries for data transformation
- **Data Validation**: Understanding data quality and integrity
- **Admin Dashboards**: SQL skills applicable to building analytics features
- **Data Integrity**: Implementing validation logic in backend services

##  What I Learned

✅ Write clean, well-documented SQL queries  
✅ Handle messy datasets  
✅ Design data transformation workflows  
✅ Apply window functions for data operations  
✅ Work with databases effectively  
✅ Extract insights from data  
✅ Document technical work effectively  

##  Connect With Me

**Milan Anil Anthore**

[![LinkedIn](https://img.shields.io/badge/LinkedIn-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://linkedin.com/in/milananilanthore)
[![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/MilanAnilAnthore)

---

##  About This Project

This project was completed as part of my continuous learning in data analysis and backend development. All code was written and understood by me, demonstrating my ability to work with datasets and extract meaningful insights.

*Feel free to explore, fork, or reach out if you have questions!* 

---

**License**: MIT © 2026 Milan Anil Anthore