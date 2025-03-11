
-- Standardizing the DATA look at each column

SELECT * FROM layoffs_staging2;


-- 1. Trimming the spaces and Update the data on company 

SELECT company , TRIM(company)
FROM layoffs_staging2;

UPDATE layoffs_staging2
SET company = TRIM(company);

-- 2. Handling  names  and Update the data on Industry
SELECT DISTINCT industry 
FROM layoffs_staging2
ORDER BY 1;

SELECT *
FROM layoffs_staging2
WHERE industry LIKE 'Crypto%';
-- here we have found everything is crypto does'nt have new names

-- Updating the industry 
UPDATE layoffs_staging2
SET industry = 'Crypto'
WHERE industry LIKE 'Crypto%';


-- 3. Handling names  and Update the data on location
SELECT DISTINCT location 
FROM layoffs_staging2
ORDER BY 1;
-- here evertything seems good


-- 4. Handling names  and Update the data on country
SELECT DISTINCT country 
FROM layoffs_staging2
ORDER BY 1;
-- have found issue with united states lets check

SELECT *
FROM layoffs_staging2
WHERE country LIKE 'United States_%';

-- Updating the country
UPDATE layoffs_staging2
SET country = 'United States'
WHERE country LIKE 'United States%';



-- 5. date column and changing the formates currently it is in text format
SELECT `date` , 
str_to_date(`date` , '%m/%d/%Y')
FROM layoffs_staging2;

UPDATE layoffs_staging2
SET `date` = str_to_date(`date` , '%m/%d/%Y');

SELECT `date` 
FROM layoffs_staging2
ORDER BY 1;
-- also found few nulls will look at that later

ALTER TABLE layoffs_staging2
MODIFY COLUMN `date` DATE;
-- column changed to the date format

SELECT `date` 
FROM layoffs_staging2
ORDER BY 1;

DESCRIBE layoffs_staging2;