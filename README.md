# Retail Sales Analysis SQL Project

## Project Overview

**Database**: `p1_retail_sales`

This project is designed to demonstrate SQL skills and techniques typically used by data analysts to explore, clean, and analyze retail sales data. The project involves setting up a retail sales database, performing exploratory data analysis (EDA), and answering specific business questions through SQL queries. This project is ideal for those who are starting their journey in data analysis and want to build a solid foundation in SQL.

## Objectives

1. **Set up a retail sales database**: Create and populate a retail sales database with the provided sales data.
2. **Data Cleaning**: Identify and remove any records with missing or null values.
3. **Exploratory Data Analysis (EDA)**: Perform basic exploratory data analysis to understand the dataset.
4. **Business Analysis**: Use SQL to answer specific business questions and derive insights from the sales data.

## Project Structure

### 1. Database Setup

- **Database Creation**: The project starts by creating a database named `sql_project_p2`.
- **Table Creation**: A table named `retail_sales` is created to store the sales data. The table structure includes columns for transaction ID, sale date, sale time, customer ID, gender, age, product category, quantity sold, price per unit, cost of goods sold (COGS), and total sale amount.

```sql
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
		
```

### 2. Data Exploration & Cleaning

- **Record Count**: Determine the total number of records in the dataset.
- **Customer Count**: Find out how many unique customers are in the dataset.
- **Category Count**: Identify all unique product categories in the dataset.
- **Null Value Check**: Check for any null values in the dataset and delete records with missing data.

```sql
SELECT COUNT(*) FROM retail_sales;
SELECT COUNT(DISTINCT customer_id) FROM retail_sales;
SELECT DISTINCT category FROM retail_sales;

SELECT * FROM retail_sales
WHERE 
    sale_date IS NULL OR sale_time IS NULL OR customer_id IS NULL OR 
    gender IS NULL OR age IS NULL OR category IS NULL OR 
    quantity IS NULL OR price_per_unit IS NULL OR cogs IS NULL;

DELETE FROM retail_sales
WHERE 
    sale_date IS NULL OR sale_time IS NULL OR customer_id IS NULL OR 
    gender IS NULL OR age IS NULL OR category IS NULL OR 
    quantity IS NULL OR price_per_unit IS NULL OR cogs IS NULL;
```

### 3. Data Analysis & Findings
```sql
The following SQL queries were developed to answer specific business questions:
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
```

## Findings

- **Customer Demographics**: The dataset includes customers from various age groups, with sales distributed across different categories such as Clothing and Beauty.
- **High-Value Transactions**: Several transactions had a total sale amount greater than 1000, indicating premium purchases.
- **Sales Trends**: Monthly analysis shows variations in sales, helping identify peak seasons.
- **Customer Insights**: The analysis identifies the top-spending customers and the most popular product categories.

## Reports

- **Sales Summary**: A detailed report summarizing total sales, customer demographics, and category performance.
- **Trend Analysis**: Insights into sales trends across different months and shifts.
- **Customer Insights**: Reports on top customers and unique customer counts per category.

