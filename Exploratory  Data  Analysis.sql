
-- Exploratory Data Analysis

SELECT * FROM layoffs_staging2;


--  maximum layoffs in single day

SELECT company , total_laid_off FROM layoffs_staging2
WHERE total_laid_off = (SELECT MAX(total_laid_off)
FROM layoffs_staging2);





-- the companies which has fully laid off 
SELECT company FROM layoffs_staging2
WHERE percentage_laid_off = 1
ORDER BY total_laid_off DESC
LIMIT 10;



-- Finding min and Max date range
SELECT MIN(`date`), MAX(`date`)
FROM layoffs_staging2;

-- Company wise total laid offs 
SELECT company , SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company
ORDER BY 2 DESC
LIMIT 10;




-- Industry wise total laid offs 
SELECT industry , SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY industry
ORDER BY 2 DESC
LIMIT 10;

-- Country wise total laid offs 
SELECT country , SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY country
ORDER BY 2 DESC
LIMIT 10;


-- Year wise total laid offs 
SELECT YEAR(`date`) , SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY YEAR(`date`)
ORDER BY 2 DESC;


-- Stage wise total laid offs 
SELECT stage , SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY stage
ORDER BY 2 DESC;


-- Month wise total laid offs 
SELECT SUBSTRING(`date` , 1 , 7) as `MONTH`, SUM(total_laid_off)
FROM layoffs_staging2
WHERE SUBSTRING(`date` , 1 , 7) IS NOT NULL
GROUP BY `MONTH`
ORDER BY 1;


-- Rolling total laid offs using the C T E
-- MONTH wise laid off adding from starting date to ending date

with rolling_total AS (

SELECT SUBSTRING(`date` , 1 , 7) as `MONTH`, SUM(total_laid_off) AS total_off
FROM layoffs_staging2
WHERE SUBSTRING(`date` , 1 , 7) IS NOT NULL
GROUP BY `MONTH`
ORDER BY 1

)

SELECT `MONTH`,total_off ,  SUM(total_off) OVER(ORDER BY `MONTH`) AS Rolling_total
FROM rolling_total;



-- YEAR wise laid offs by the company 
 
SELECT company, YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2
WHERE YEAR(`date`) IS NOT NULL
GROUP BY company, YEAR(`date`)
ORDER BY 3 DESC
LIMIT 10;



-- Company RANKING laid offs by the company  year wise

WITH rank_company (company , years , total_layoffs)  AS(

SELECT company, YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2
WHERE YEAR(`date`) IS NOT NULL
GROUP BY company, YEAR(`date`)

), 

company_ranking AS (
SELECT * , DENSE_RANK() OVER(PARTITION BY years ORDER BY total_layoffs DESC) AS ranking
FROM rank_company


)

SELECT * FROM company_ranking
WHERE ranking <= 5;