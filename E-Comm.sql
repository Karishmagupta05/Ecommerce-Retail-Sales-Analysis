CREATE DATABASE EcommDB;

use EcommDB;

select * from retail;



-- Data Cleaning
SELECT * FROM retail
WHERE transactions_id IS NULL;

SELECT * FROM retail
WHERE sale_date IS NULL;

SELECT * FROM retail
WHERE sale_time IS NULL;


SELECT * FROM retail
WHERE 
    transactions_id IS NULL
    OR
    sale_date IS NULL
    OR 
    sale_time IS NULL
    OR
    gender IS NULL
    OR
    category IS NULL
    OR
    quantiy IS NULL
    OR
    cogs IS NULL
    OR
    total_sale IS NULL;
    
-- 
DELETE FROM retail
WHERE 
    transactions_id IS NULL
    OR
    sale_date IS NULL
    OR 
    sale_time IS NULL
    OR
    gender IS NULL
    OR
    category IS NULL
    OR
    quantiy IS NULL
    OR
    cogs IS NULL
    OR
    total_sale IS NULL;
    
    
    
-- Data Exploration    
-- How many sales we have?
SELECT COUNT(*) FROM retail;
SELECT COUNT(*) as total_sale FROM retail;

-- How many unique customers we have ?
SELECT COUNT(DISTINCT customer_id) as total_customers FROM retail;

-- Unique Category
SELECT DISTINCT category FROM retail;

-- Data Analysis & Business Key Problems
-- Write a SQL query to retrieve all columns for sales made on '2022-11-05
SELECT *
FROM retail
WHERE sale_date = '05/11/22';


-- Write a SQL query to retrieve all transactions where the category is 'Beauty' and the quantity sold is more than 4
SELECT 
  *
FROM retail
WHERE 
    category = 'Beauty'
    AND
    quantiy >= 4;


-- Write a SQL query to calculate the total sales (total_sale) for each category.
SELECT 
    category,
    SUM(total_sale) as net_sale
FROM retail
GROUP BY category;

SELECT 
    category,
    SUM(total_sale) as net_sale,
    COUNT(*) as total_orders
FROM retail
GROUP BY 1;

--  Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.

SELECT
    ROUND(AVG(age), 2) as avg_age
FROM retail
WHERE category = 'Beauty';


--  Write a SQL query to find all transactions where the total_sale is greater than 1000.

SELECT * FROM retail
WHERE total_sale > 1000;


--  Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.

SELECT 
    category,
    gender,
    COUNT(*) as total_trans
FROM retail
GROUP 
    BY 
    category,
    gender
ORDER BY 1;

-- Write a SQL query to find the top 5 customers based on the highest total sales 

SELECT 
    customer_id,
    SUM(total_sale) as total_sales
FROM retail
GROUP BY customer_id
ORDER BY total_sales DESC
LIMIT 5;

--  Write a SQL query to find the number of unique customers who purchased items from each category.

SELECT 
    category,    
    COUNT(DISTINCT customer_id) as cnt_unique_cs
FROM retail
GROUP BY category;













