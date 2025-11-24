-- Creating Database 

CREATE DATABASE IF NOT EXISTS Retail;

USE Retail;

CREATE TABLE retail_sales
            (
                transaction_id INT PRIMARY KEY,	
                sale_date DATE,	 
                sale_time TIME,	
                customer_id	INT,
                gender	VARCHAR(15),
                age	INT,
                category VARCHAR(15),	
                quantity	INT,
                price_per_unit FLOAT,	
                cogs	FLOAT,
                total_sale FLOAT
            );
            
SELECT * FROM retail_sales;

ALTER TABLE retail_sales
RENAME COLUMN retail_sales to sales;

ALTER TABLE retail_sales
RENAME COLUMN transaction_id to id;

SELECT  * FROM sales;

-- checking for duplicates

select * ,
dense_rank() over(partition by id) as Duplicates
from sales;

select* from
(
select * ,
dense_rank() over(partition by id) as Duplicates
from sales
) t
where duplicates >1;

-- no duplicates found

--checking for null value

select * from sales
 where   id is null 
 or sale_date is null
 or sale_time is null
 or customer_id is null
 or gender is null
 or age is null
 or category is null
 or quantity is null
 or price_per_unit is null
 or cogs is null
 or total_sale is null;
 
 --no null values found

select * from sales;
  
CREATE OR REPLACE VIEW cleaned_data AS
SELECT *,
    YEAR(sale_date) AS year,
    MONTHNAME(sale_date) AS month_name,
    CONCAT('Q', QUARTER(sale_date)) AS quarter,
FROM sales;

select * from cleaned_data;


 
