# 📊 Layoffs Data Analysis

## 📌 Overview
This repository contains an exploratory data analysis (EDA) of company layoffs using SQL. The analysis provides insights into layoffs trends by company, industry, country, year, and month.

## 📂 Table of Contents
- [Dataset Overview](#dataset-overview)

- [Data Cleaning](#data-cleaning)
- [Exploratory Data Analysis](#exploratory-data-analysis)
  - [Maximum Layoffs in a Single Day](#maximum-layoffs-in-a-single-day)
  - [Companies with 100% Layoffs](#companies-with-100-layoffs)
  - [Layoffs by Company](#layoffs-by-company)
  - [Layoffs by Industry](#layoffs-by-industry)
  - [Layoffs by Country](#layoffs-by-country)
  - [Yearly Layoffs by Company](#yearly-layoffs-by-company)
  - [Top Companies by Layoffs (Ranked)](#top-companies-by-layoffs-ranked)

---
## 📊 Dataset Overview
The dataset used for this analysis is `layoffs_staging2` after few stages of cleaning, which contains information on layoffs, including company name, total layoffs, percentage of workforce laid off, industry, country, and the date of layoffs.
---

📥 **Dataset Download:** [Click here to access the dataset](https://www.kaggle.com/datasets/swaptr/layoffs-2022)
---


# SQL Server - Data Cleaning and Data Analysis

## 📊 Data Cleaning
---


1. Removing Duplicates

   - To identify duplicates we will add one column named row_num which will specify the number of duplicate rows.
   - The rows having row_num > 1 are deleted.

2. Standardizing the rows
   
   - Industry column cantained entries such as 'Crypto', 'Cryptocurrency', and 'Crypto Currency', each referring to the same sector which were consolidated into a 
    single term, 'Crypto'.Similarly for country column 'United States' and 'United States.' were consolidated into 'United State'.
   - The data type of date was changed into 'date' from 'text'.

3. Removing null and blank values

   - Cases were found where companies had multiple entries, some of which were missing industry information while others were correctly categorized. To rectify these inconsistencies, I used self join to automatically fill all the null values in industry section.
    

4. Removing unwanted data and columns
   
   - Rows where total_laid_off and perentage laid-off are null were deleted.
   - row_num column was altered.
    

# 🔍 Exploratory Data Analysis

### 📈 Maximum Layoffs in a Single Day
Finds the highest number of layoffs recorded in a single day, along with the maximum percentage of a workforce laid off.

🖼️ ![Image](https://github.com/user-attachments/assets/c2e1cd8f-8645-4388-8623-344257c0ad60)



### 🚨 Companies with 100% Layoffs
Identifies companies that laid off their entire workforce.


🖼️ ![Image](https://github.com/user-attachments/assets/3710aeca-e5f3-4e9a-a31d-07627f0cc2dd)



### 🏢 Layoffs by Company
Shows the total number of layoffs per company.


🖼️ ![Image](https://github.com/user-attachments/assets/bd706d0f-bccb-4a53-8915-59d234cc0e44)


### 🏭 Layoffs by Industry
Aggregates layoffs by industry sector.


🖼️ ![Image](https://github.com/user-attachments/assets/c3de7100-4515-4cdb-8316-5236e18b8a60)


### 🌍 Layoffs by Country
Summarizes layoffs by country.


🖼️ ![Image](https://github.com/user-attachments/assets/e6db3dbd-96fe-4e94-be9a-f984920f62b8)



### 🏢 Yearly Layoffs by Company
Tracks layoffs by company for each year.


🖼️ ![Image](https://github.com/user-attachments/assets/a309e96b-ab47-4b20-a2d6-4787eb160e63)


### 🏆 Top Companies by Layoffs (Ranked)
Ranks companies based on layoffs per year.


🖼️ ![Image](https://github.com/user-attachments/assets/1e1ccd14-77ca-43a1-991e-7e13b1822630)

---

## 🛠️ Technologies Used
- SQL (for querying the dataset)
- SQL (Exploratory data Analysis)

## 📌 Contributing
Feel free to submit a pull request or open an issue if you have any suggestions or improvements!

---

🌟 **If you find this analysis helpful, give this repository a star!** 🌟


