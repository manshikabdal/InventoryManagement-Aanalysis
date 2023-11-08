-----------------------------------------------------------------------------------
-- Analysing the data with some business questions--
-----------------------------------------------------------------------------------

USE inventory;

-----------------------------------------------------------------------------------
-- RETRIEVING THE DATA --
-----------------------------------------------------------------------------------

/* Q1. Write a SQL query ti retrieve all the columns from the 'stocks' table. */

SELECT * 
FROM past_orders;

DESC past_orders;

/* Q2. Write a SQL query to insert a new record into the 'past_orders' table. */

INSERT INTO past_orders
VALUES ('14-06-2023','2024AA',100);

/* Q3. Write a SQL query to update the "order_quantity" column of the "past_orders" table
to 10 where the "sku_id" is 2024AA. */

SET SQL_SAFE_UPDATES=0;

UPDATE past_orders
SET order_quantity = 10
WHERE sku_id = '2024AA';

/* Q4. Write a SQL query to delete all the recorders from the "past_orders" table where
the "order_quantity" is "0". */

DELETE FROM past_orders
WHERE order_quantity = 0;

SET SQL_SAFE_UPDATES=1;


--------------------------------------------------------------------------------------
-- FILTERING AND SORTING DATA --
--------------------------------------------------------------------------------------


/* Q5. Write a SQL Query to retrieve all the columns from the "Past_orders" table 
where the "order_quantity" is greater than 50000. */

SELECT *
FROM past_orders
WHERE order_quantity > 50000;

/* Q6. Write a SQL query to retrieve all the columns from the "stocks"
table where the "current_stock_quantity" less than "100" and the "unit_price" 
is greater than 10000 */

SELECT *
FROM stocks
WHERE current_stock_quantity < 100 AND unit_price >10000;


/* Q7. Write a SQL query to retrieve the sku_id of all the stocks from the "stocks" 
table in ascending order. */

SELECT sku_id
FROM stocks
ORDER BY sku_id ASC;

/* Q8. Write a SQl query to a retrieve the total number of orders from the 
"past_orders" table */

SELECT COUNT(*) AS Total_number_of_orders
FROM past_orders;
 
 
-------------------------------------------------------------------------------------- 
-- JOINING TABLE --
--------------------------------------------------------------------------------------


/* Q9. Write a SQl query to a retrieve the unit_price and order_date from the
"stocks" and "past_orders" tables, joining them on the "sku_id" column. */

SELECT past_orders.order_date, stocks.unit_price
FROM past_orders
JOIN stocks 
ON past_orders.sku_id = stocks.sku_id; 


/* Q10 Write a SQL query to retrieve the unit price and order date from the
"stocks" and "past_orders" tables, joining them on the "sku_id" column, and
only including orders with unit price greater than 10000.  */

SELECT p.order_date, s.unit_price
FROM past_orders p
JOIN stocks s
ON p.sku_id = s.sku_id
WHERE s.unit_price > 10000;

-----------------------------------------------------------------------------------
-- Aggregating Data --
-----------------------------------------------------------------------------------


/* Q11.  Wrire a SQL query to retrieve the total number of orders for each sku id 
from the "past_orders" table.  */

SELECT sku_id, COUNT(order_date) AS total_orders
FROM past_orders
GROUP BY sku_id;


/* Q12 . Write a SQL query to retrieve the unit price of stocks in each sku_id
from the "stocks" table. */
 
SELECT sku_id, AVG(unit_price) AS avg_price
FROM stocks
GROUP BY sku_id;


/* Q13. Write a SQL query to retrieve the maximum order quantity for 
each sku_id from the "past_orders" table.  */

SELECT sku_id, MAX(order_quantity) AS max_quantity
FROM past_orders
GROUP BY sku_id;


/* Q14. Write a SQL query to retrieve the total revenue generated from each 
sku_id from the "stocks" and "past_orders" table.  */

SELECT past_orders.order_quantity * stocks.unit_price AS total_revenue
FROM past_orders, stocks
ORDER BY stocks.sku_id ASC;


--------------------------------------------------------------------------------------
-- Data Manipulation -- 
--------------------------------------------------------------------------------------


/* Q.15 Write a SQL query to update the "order_quantity" column of the 
"past_orders" table to 20 for all order with a quantity less than 10.  */

SET SQL_SAFE_UPDATES=0;


UPDATE past_orders
SET order_quantity = 20
WHERE order_quantity <10;


SET SQL_SAFE_UPDATES=1;


/* Q16. Write a SQL query to delete all records from the "past_orders" table 
where the "order_quantity" is 0.  */

SET SQL_SAFE_UPDATES=0;

DELETE FROM past_orders
WHERE order_quantity = 0;

SET SQL_SAFE_UPDATES=0;


/* Q17. Write a SQL query to insert new records into the "stocks" table, 
selecting data from the "past_orders" table. */

INSERT INTO stocks
SELECT * 
FROM past_orders 
WHERE sku_id = '2024AA';

/* Q18. Write a SQL query to update the "unit_price" column of the "stocks"
 table by increasing it by 5% for all orders where current stock quantity is 
 less than 5. */
 
 SET SQL_SAFE_UPDATES=0;
 
 UPDATE stocks
 SET unit_price = Unit_price + unit_price*(5/100)
 WHERE current_stock_quantity < 5;
 
 SET SQL_SAFE_UPDATES=1;
 
 
 -------------------------------------------------------------------------------------
 -- Advanced filtering and sorting --
-------------------------------------------------------------------------------------

 
 /* Q19. Write a SQL query to retrieve all the orders where sku_id ends with 'A' 
 and have a date december 2022. */

SELECT sku_id, order_date
FROM past_orders
WHERE sku_id LIKE '%A' AND order_date = '04-12-2022';


/* Q20. Write a SQL query to retrieve all the stocks with a unit price either above
1000 or below 500.  */

SELECT sku_id, unit_price
FROM stocks
WHERE unit_price BETWEEN 500 AND 1000;

/* Q21. Write a SQL query to retrieve the sku_id of the orders that were sold between
 a specific date range.  */

SELECT *
FROM past_orders
WHERE order_date BETWEEN "01-01-2023" AND "31-01-2023" 
ORDER BY order_date ASC;


/* Q22. Write a SQL query to retrieve all the sku_id which has order_quantity 10
in the database. */ 

SELECT sku_id
FROM past_orders
WHERE order_quantity = 10;

/* Q23. Retrieve Top 50 sku_id which are having highest unit_price. */

SELECT sku_id, ROUND(unit_price,2) AS highest_unit_price
FROM stocks
GROUP BY sku_id
ORDER BY unit_price DESC
LIMIT 50;


/* Q24. Find the products with sku_id starting with '1' and ending with 'AA'. */

SELECT sku_id
FROM stocks
WHERE sku_id LIKE '1%AA'
ORDER BY sku_id ASC ;


---------------------------------------------------------------------------------------
-- Working with Functions --
---------------------------------------------------------------------------------------

 
/* Q25. Write a SQL query to retrieve the length of the sku_id from the 
"stocks" table.  */

SELECT LENGTH(sku_id)
FROM stocks;


/* Q26. Write a SQL query to retrieve the current date & time.  */

SELECT CURDATE(), CURTIME();

/* Q27. Write a SQl query to retrieve the alphabets of all the sku_id
from the "stocks" table.  */

SELECT substr(sku_id,5,2)
FROM stocks;


/* Q28. Write a SQl query to retrieve the average unit price of orders after applying 
a 10% discount from the "stocks" table.  */

SELECT ROUND(AVG(Unit_price + unit_price*(10/100)),2) AS 'avg_up_10%'
FROM stocks;


-------------------------------------------------------------------------------------
-- SUBQUERIES --
-------------------------------------------------------------------------------------


/* Q29. Write a SQl query to retrieve all the sku_id with a unit price higher than 
the average unit price of all orders. */

SELECT sku_id
FROM stocks
WHERE unit_price > (SELECT AVG(unit_price)
FROM stocks);


/* Q30. Write a SQL query to retrieve all the sku_id which have a maximum lead time 
higher than the maximum of average lead time of the 'stocks' table.  */

SELECT sku_id
FROM stocks
WHERE maximum_lead_time_in_days > (SELECT MAX(average_lead_time_in_days)
FROM stocks);

--------------------------------------------------------------------------------------
-- VIEWS AND INDEXES --
--------------------------------------------------------------------------------------


/* Q31. Create a view named "high_unit_price" that retrieves all the sku_id
with a unit_price greater than 10000 from the "stocks" table. */

CREATE VIEW high_unit_price AS
SELECT sku_id, unit_price, current_stock_quantity
FROM stocks
WHERE unit_price >10000;

/* Q32. Create an index on the "email" column of the "customers" table for faster 
searching.  */

CREATE INDEX current_stock_index
ON stocks (current_stock_quantity);


---------------------------------------------------------------------------------------
-- DATA INTEGRITY AND CONSTRAINTS--
---------------------------------------------------------------------------------------


/* Q33. Create a table named "orders" with columns for sku_ID, current_stock_quantity,
and unit_price, where the sku_ID is the primary key. */

CREATE TABLE  orders (PRIMARY KEY (sku_id))
SELECT sku_id, current_stock_quantity, unit_price
FROM stocks;

select * 
from orders;

---------------------------------------------------------------------------------------
-- MODIFYING TABLES --
---------------------------------------------------------------------------------------

/* Q34. Alter the "orders" table to add a new column named "discount" of type INT.  */

ALTER TABLE orders
ADD discount INT;

/* Q35. Rename the table "orders" to "sales". */

RENAME TABLE orders TO sales;

/* Q36. Delete the "discount" column from the "sales" table. */
 ALTER TABLE sales
 DROP COLUMN discount;
 
/* Q37. Modify the "sales" table to change the data type of the "current_stock_quantity"
column to decimal(10,4).  */
 
ALTER TABLE sales
MODIFY COLUMN current_stock_quantity DECIMAL(10,4);

----------------------------------------------------------------------------------------
-- ADVANCED JOINS AND SUBQUERIES --
----------------------------------------------------------------------------------------


/* Q38. Write a SQL query to retrieve all sku_id and their unit_price 
from the "stocks" table using a self-join. */

SELECT a.sku_id, b.unit_price
FROM stocks a
JOIN stocks b
ON a.sku_id = b.sku_id
WHERE b.sku_id LIKE '%AA';


/* Q39. Write a SQL query to retrieve all the columns in stocks that do not 
have same unit_price in the "sales" table.  */

SELECT a.sku_id
FROM stocks a
INNER JOIN sales b
ON a.sku_id = b.sku_id
WHERE a.unit_price != b.unit_price;

/* Q40. Write a SQL query to retrieve all the columns of past_orders along with 
the current stock quantity and unit price from stocks table using a join and ordered
them according to order date than order quantity. */

SELECT a.*, b.current_stock_quantity, b.unit_price
FROM past_orders a
LEFT JOIN stocks b
ON a.sku_id = b.sku_id
ORDER BY order_date ASC, order_quantity ASC;


