# Walmart-Sales-Analysis

Based on Kaggle's Walmart Sales Data we aim to gain insights into different factors that affect sales of the different branches.

# About the Data
The dataset was obtained from the Kaggle Walmart Sales Forecasting Competition. This dataset contains sales transactions from a three different branches of Walmart, respectively located in Mandalay, Yangon and Naypyitaw. The data contains 17 columns and 1000 rows
1. Invoice_id Varchar(30): gives the invoice of the purchase
2. Branch Varchar(5): the associated branch from where the purchase was made
3. Customer_type Varchar(30): If the customer is a member or not
4. gender Varchar(10): if the customer is male or female
5. product_line Varchar(100): Category of the product purchased
6. unit_price Decimal(10,2): price of one item
7. quantity int: quantity purchased
8. VAT Float(6,4)
9. Total Decimal(12,4): total price paid by the customer
10. Date Datetime: Date of purchase
11. time time: time of purchase
12. payment_method Varchar(15): Mode of payment used for the purchase
13. cogs Decimal(10,2); cost of goods and Services
14. gross_margin_pct float(11,9) 
15. gross_income Decimal(12,4)
16. rating float(2,1): rating of the purchase made

The following analysis were done in the MySQL code provided:
  1. Analysis on the data to understand the different product lines, the products lines that are performing best and the product lines that need to be improved.
  2. Analysis to answer the question of the sales trends of product. The result of this can help use measure the effectiveness of each sales strategy the business applies and what modificatoins are needed to gain more sales.
  3. Analysis to uncover the different customers segments, purchase trends and the profitability of each customer segment.

# Steps involved:
1. Understanding the objective: We want to analyse the walmart sales data in the given 3 cities and identify based on that the store performance. So we look out for store/product analysis, the sales analysis and customer demographic to understand what types of customers are involved. The queries are formulated in such a way that an analyst can read into the data and fine tune their strategy for business.
2. Data Collection: The data is taken from the Walmart competition on Kaggle, imported as table in MySQL database.
3. Data Cleaning: Removing/filling null rows. Out of 1000 rows only 5 rows were NULL (0.5% of the data), hence removing those rows didn't affect the results much.
4. Understanding the data: The data is reviewed to classify as categorical or numerical or datetime, etc to understand it's relation with the sales
5. Feature Engineering: Generated new coloumns like time of the day, day of the week, month of the year to analyse the trends as to when they vary
6. Exploratory Data Analysis (EDA): Exploratory data analysis is done where we explore through the data how and what relates with what. The following are the answered questions:

# Questions answered and analysis performed
### Generic Question
1. How many unique cities does the data have?
2. In which city is each branch?
### Product
1. How many unique product lines does the data have?
2. What is the most common payment method?
3. What is the most selling product line?
4. What is the total revenue by month?
5. What month had the largest COGS?
6. What product line had the largest revenue?
7. What is the city with the largest revenue?
8. What product line had the largest VAT?
9. Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales
10. Which branch sold more products than average product sold?
11. What is the most common product line by gender?
12. What is the average rating of each product line?
### Sales
1. Number of sales made in each time of the day per weekday
2. Which of the customer types brings the most revenue?
3. Which city has the largest tax percent/ VAT (Value Added Tax)?
4. Which customer type pays the most in VAT?
### Customer
1. How many unique customer types does the data have?
2. How many unique payment methods does the data have?
3. What is the most common customer type?
4. Which customer type buys the most?
5. What is the gender of most of the customers?
6. What is the gender distribution per branch?
7. Which time of the day do customers give most ratings?
8. Which time of the day do customers give most ratings per branch?
9. Which day fo the week has the best avg ratings?
10. Which day of the week has the best average ratings per branch?

The sql file is well detailed to give the answers to all the queries!

