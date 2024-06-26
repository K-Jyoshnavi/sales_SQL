use sales;

select * from customers;
select * from transactions;
select * from markets;
select * from products;
select * from date;

## 1. What are the total amount of transactions, customers?
select count(*) from transactions;
select count(*) from customers;

## 2. Extract all the transactions, and count of transactions from chennai market?
select * from transactions where market_code =(select markets_code from markets where markets_name = "Chennai");
select count(*) from transactions where market_code =(select markets_code from markets where markets_name = "Chennai");

## 3. Extract all the transactions where currency is in USD?
select * from transactions where currency = "USD";

## 4. Extract all the transactions happened in 2020?
#select * from transactions where order_date = (select * from date where year > "2019");
# Here we cannot use this subquery because the subquery is having more than one row. we will perform inner joint
select * from transactions inner join date on transactions.order_date = date.date where year = "2020";

## 5. What is the revenue ( total sales ) in year 2020?
select sum( transactions.sales_amount )from transactions inner join date on transactions.order_date = date.date where year = "2020";

## 6. What is the revenue done in chennai in 2020?
select * from transactions inner join date on transactions.order_date = date.date where year = "2020" and  market_code =(select markets_code from markets where markets_name = "Chennai"); 
select sum(transactions.sales_amount) from transactions inner join date on transactions.order_date = date.date where year = "2020" and  market_code =(select markets_code from markets where markets_name = "Chennai");

## 7. How many transactions are having sales amount as -1, 0?
select count(*) from transactions where  sales_amount <= 0;

