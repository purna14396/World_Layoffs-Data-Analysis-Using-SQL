
SELECT * FROM layoffs_staging;

-- Creating the Row number

SELECT * ,
ROW_NUMBER() OVER(PARTITION BY company , location , industry , total_laid_off ,
percentage_laid_off , `date` , stage , country , funds_raised_millions) AS row_num
FROM layoffs_staging;



-- Identifying the Duplicates using the C T E

WITH duplicates AS
(
SELECT * ,
ROW_NUMBER() OVER(PARTITION BY company , location , industry , total_laid_off ,
percentage_laid_off , `date` , stage , country , funds_raised_millions) AS row_num
FROM layoffs_staging
)

SELECT * FROM duplicates
WHERE row_num > 1;


-- Creating the new stage 2 for remove duplicates

CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SELECT * FROM layoffs_staging2;

-- Inserting the new data into new table with row number as

INSERT INTO layoffs_staging2 
SELECT * ,
ROW_NUMBER() OVER(PARTITION BY company , location , industry , total_laid_off ,
percentage_laid_off , `date` , stage , country , funds_raised_millions) AS row_num
FROM layoffs_staging;

SELECT * FROM layoffs_staging2;

-- Removing the Duplicates

SELECT * FROM layoffs_staging2
WHERE row_num > 1;

SELECT * FROM layoffs_staging2
WHERE company = 'Casper';

DELETE FROM layoffs_staging2
WHERE row_num > 1;

-- Checking if the duplicates exists or not 
SELECT * FROM layoffs_staging2
WHERE row_num > 1;


