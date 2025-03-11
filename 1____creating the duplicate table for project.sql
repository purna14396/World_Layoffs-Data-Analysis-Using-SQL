
-- Data Cleaning Project On Worlds Layoff's DataSet

SELECT * FROM layoffs;

-- 1. Remove Duplicates
-- 2. Standardize data ( data formates , cases etc )
-- 3. Handling Null Values / Blanks
-- 4. Remove Unnecessary Records / Columns

CREATE TABLE layoffs_staging LIKE layoffs;

-- New Table 
SELECT * FROM layoffs_staging;

INSERT layoffs_staging SELECT * FROM layoffs;

SELECT * FROM layoffs_staging;








