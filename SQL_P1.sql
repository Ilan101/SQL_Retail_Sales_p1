-- SQL Retail Sales Analysis - P1
CREATE DATABASE sql_project_p2;


-- Create table 
DROP TABLE IF EXISTS retail_sales;
CREATE TABLE retail_sales
		(
			transactions_id	INT PRIMARY KEY,
			sale_date DATE,
			sale_time TIME,	
			customer_id INT,
			gender VARCHAR(15),
			age	INT,
			category VARCHAR(15),	
			quantiy	INT,
			price_per_unit FLOAT,
			cogs FLOAT,	
			total_sale FLOAT
		);
		
SELECT * FROM retail_sales;

-- FIND NULL ENTRIES 
SELECT * FROM retail_sales
WHERE transaction_id IS NULL


--FIND ALL NULL ENTRIES
SELECT * FROM retail_sales
WHERE 
transactions_id IS NULL
OR sale_date IS NULL
OR sale_time IS NULL
OR customer_id IS NULL
OR gender IS NULL
OR age IS NULL
OR category IS NULL
OR quantity IS NULL
OR price_per_unit IS NULL
OR cogs IS NULL
OR total_sale IS NULL

-- DATA CLEANING
DELETE FROM retail_sales
WHERE 
transactions_id IS NULL
OR sale_date IS NULL
OR sale_time IS NULL
OR customer_id IS NULL
OR gender IS NULL
OR age IS NULL
OR category IS NULL
OR quantity IS NULL
OR price_per_unit IS NULL
OR cogs IS NULL
OR total_sale IS NULL

--
SELECT * FROM retail_sales

-- DATA Exploration 
-- How many sales do we have?
SELECT COUNT(*) as total_sale FROM retail_sales

-- How many unique customers do we have?
SELECT COUNT(DISTINCT customer_id) as total_sale FROM retail_sales

-- What are the unique catagories that we have?
SELECT DISTINCT category as total_sale FROM retail_sales

-- DATA ANALYSIS

--Sales made on 2022-11-05
SELECT * FROM retail_sales
WHERE sale_date='2022-11-05';

-- Clothing Transactions where quantity>2 and date is November 2022

SELECT * from retail_sales 
WHERE category='Clothing' 
AND quantity>2
AND TO_CHAR(sale_date, 'YYYY-MM')='2022-11'

-- TOTAL SALES FOR EACH CAT.

SELECT category, sum(total_sale) as net_sale FROM retail_sales
GROUP BY 1

-- AVERAGE AGE OF USERS WHO PURCHASED BEUATY ITEMS

SELECT ROUND(AVG(age),0) as average_age FROM retail_sales
WHERE category='Beauty'

-- BEST SELLING MONTH ON AVERAGE
SELECT EXTRACT(YEAR FROM sale_date) as year, EXTRACT(MONTH FROM sale_date) as month, AVG(total_sale) as average_sale from retail_sales
GROUP by 1, 2
ORDER BY YEAR, MONTH

-- TOP 5 CUSTOMERS BASED ON TOTAL SALES

SELECT customer_id, SUM(total_sale) as total_sales FROM retail_sales
GROUP by 1
ORDER BY 2 DESC

--DURING WHICH SHIFT ARE ORDERS RECIEVED (AM/PM)

SELECT *, CASE WHEN EXTRACT(Hour FROM sale_time)<12 THEN 'AM'
ELSE 'PM'
END as shift
FROM retail_sales


--END PROJECT
