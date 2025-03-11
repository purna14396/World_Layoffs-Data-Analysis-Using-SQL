

--  Handling the null values 

SELECT * FROM layoffs_staging2;

-- START with important columns

SELECT * FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

SELECT *
FROM layoffs_staging2
WHERE industry IS NULL
OR 
industry = '';


-- check the industry having null or blank 

SELECT t1.company , t1.industry , t2.industry
FROM layoffs_staging2 t1
JOIN layoffs_staging2 t2
ON t1.company = t2.company
WHERE (t1.industry IS NULL OR t1.industry = '')
AND  (t2.industry IS NOT NULL AND t2.industry != '');

-- UPDATING THE industry 

UPDATE layoffs_staging2 t1 
JOIN layoffs_staging2 t2
	ON t1.company = t2.company
    
SET t1.industry = t2.industry

WHERE (t1.industry IS NULL OR t1.industry = '')
AND (t2.industry IS NOT NULL AND t2.industry != '');

-- LETS CHECK 
SELECT * FROM layoffs_staging2
WHERE company = 'Airbnb';
-- updated successfully 

SELECT * FROM layoffs_staging2
WHERE industry IS NULL;
-- we have found one company with null because of only having one record with the company name 

SELECT * FROM layoffs_staging2
WHERE company Like "Bally's%";
-- we have found one company with null because of only having one record with the company name 


