Create Database if not exists WalmartSalesData;

Create table if not exists sales(
invoice_id Varchar(30) not null primary key,
branch varchar(5) not null, 
city varchar(30) not null, 
customer_type varchar(30) not null,
gender varchar(10) not null,
product_line varchar(100) not null,
unit_price Decimal(10,2) Not null,
quantity int not null,
VAT Float(6,4) not null,
total Decimal(12,4) not null,
date Datetime not null,
time TIme not null,
payment_method varchar(15) not null,
cogs Decimal(10,2) not null,
gross_margin_pct float(11,9),
gross_income Decimal(12,4) not null,
rating float(2,1)
);



-- ---------------------------------------Feature Engineering---------------------------------------------------------------------------------
-- time_of_day

select time, (Case 
when time between "00:00:00" AND "12:00:00" Then "Morning"
when time between "12:00:00" AND "16:00:00" then "Afternoon"
else "Evening"
END) as time_of_date
 from sales;

Alter table sales 
add column time_of_day varchar(20);

update sales
set time_of_day = (Case 
when time between "00:00:00" AND "12:00:00" Then "Morning"
when time between "12:00:00" AND "16:00:00" then "Afternoon"
else "Evening"
END
);
-- -----------------------------------------------------------------------------
Select date, dayname(date) 
from sales;

Alter table sales 
add column day_name varchar(20);

update sales
set day_name = dayname(date);
-- -----------------------------------------------------------------
Select date, monthname(date) 
from sales;

Alter table sales 
add column month_name varchar(20);

update sales
set month_name = monthname(date);

-- --------------------------------------------------------------------
-- how many unique city does the data have?

Select distinct city 
from sales;

Select distinct branch 
from sales;

Select distinct city, branch 
from sales; -- which city has which branch
-- ---------------------------------------------------------------

-- how many unique product lines?

Select distinct product_line 
from sales;
Select count(distinct product_line) as product_line_count f
rom sales;

-- most common payment method

Select count(*) as count, payment_method 
from sales 
group by payment_method;

Select count(*) as count, payment_method 
from sales 
group by payment_method 
order by count desc 
limit 1; -- max paying mode

-- most selling product line
Select count(*) as count, product_line 
from sales 
group by product_line 
order by count desc 
limit 1;

-- total revenue by month?

Select month_name as month, sum(total) as Total_Revenue
from sales
group by month_name
order by total_revenue;

-- month with largest COGS?
Select month_name as month, sum(cogs) as COGS 
from sales 
group by month_name
order by cogs;

-- product line with largest revenue

select product_line, sum(total) as total_revenue 
from sales
group by product_line
order by total_revenue Desc; 

-- city with largest revenue?
select branch, city, sum(total) as total_revenue 
from sales
group by city, branch
order by total_revenue Desc; 

-- Largest VAT

select product_line, avg (VAT) as avg_tax
from sales
group by product_line
order by avg_tax;

-- branch that sole more products than avg sold?

Select branch, sum(quantity) as qty 
from sales
group by Branch
having sum(quantity)> (select avg(quantity) from sales);

-- most common product_line by gender
Select gender, product_line, count(gender) as total_cnt
from sales
group by gender, product_line
order by total_cnt desc;

-- avg rating of each?

Select product_line, Round(avg(rating),2) as avg 
from sales
group by product_line
order by avg DESC;

-- add a column of good/bad
select product_line, case when sum(quantity)  > (Select avg(quantity) as avg_sales from sales) then "good" else "bad" end as good_or_bad from sales
group by product_line;

-- -------------------------------------------------------------------
-- no of sales made in each time of the day

SELECT day_name, time_of_day, COUNT(*) AS total_sales
FROM sales
WHERE day_name IN ('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday')
GROUP BY day_name, time_of_day
ORDER BY FIELD(day_name, 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'), total_sales DESC;

-- which customer types brings most revenue?
Select customer_type, sum(total) as total_revenue
from sales
group by customer_type
order by total_revenue DESC;

-- city with largest tax percent/vat?
Select city, avg(VAT) as VAT from sales
group by city
order by VAT desc; 

-- which customer pays most VAT
Select customer_type, avg(VAT) as VAT from sales
group by customer_type
order by VAT desc; 

-- --------------------------------------------------------------------------------
-- unique customer types?
Select distinct customer_type from sales;

 -- unique payment_method
Select distinct payment_method from sales; 

-- most common customer type

Select customer_type, count(*) as cus_cnt
from sales
group by customer_type;

-- gender?
Select gender, count(*) as gender_cnt
from sales
group by gender;

-- gender distribution per branch?
Select branch, gender, count(*) as gender_cnt, Round((COUNT(*) * 100.0) / SUM(COUNT(*)) OVER (PARTITION BY branch), 2) AS gender_percentage
from sales
group by branch, gender;

-- which time of the day customer gives more rating
Select time_of_day, avg(rating) as avg_rating
from sales
group by time_of_day
order by avg_rating DESC;

-- time of the day customers give most rating per branch
Select branch, time_of_day, avg(rating) as avg_rating
from sales
group by branch, time_of_day
order by avg_rating DESC;

-- day of the week with best avg rating
Select day_name, avg(rating) as avg_rating
from sales
group by day_name
order by avg_rating DESC; 

-- best rating per branch
Select branch, day_name, avg(rating) as avg_rating
from sales
group by branch, day_name
order by avg_rating DESC;

