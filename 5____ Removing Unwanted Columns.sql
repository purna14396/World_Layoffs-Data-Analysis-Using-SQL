

-- 5. Deleting the Unnecessary data 
-- without having the total-laid and percentage-laid we dont need that records for analysis lets delete this 

SELECT * FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

-- we have 361 rows 

DELETE FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

SELECT * FROM layoffs_staging2;

-- Droping the Unwanted columns
ALTER TABLE layoffs_staging2
DROP COLUMN row_num;

SELECT * FROM layoffs_staging2;

