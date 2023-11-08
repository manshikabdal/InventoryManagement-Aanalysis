## Creating the database named Inventory to store the information realated to stocks.

CREATE DATABASE Inventory;

## Using the the inventory database to create tables

USE Inventory;

# Creating the table for stocks and defining their data type

CREATE TABLE Stocks(
sku_id VARCHAR(50) NOT NULL PRIMARY KEY,
current_stock_quantity INT,
units_no_per_kg VARCHAR(5),
average_lead_time_in_days INT,
maximum_lead_time_in_days INT,
unit_price NUMERIC(10,4)
);


SELECT * FROM Stocks;
DESC Stocks;

## Created the table past_orders &  load the data by using Table data import wizard.

SELECT * FROM Past_orders;
DESC Past_orders;











