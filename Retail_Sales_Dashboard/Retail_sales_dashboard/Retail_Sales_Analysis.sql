 CREATE DATABASE RetailSalesDB;

 USE RetailSalesDB;

 CREATE TABLE retail_sales (
    Order_ID INT,
    Order_Date DATE,
    Customer_ID VARCHAR(20),
    Region VARCHAR(20),
    Category VARCHAR(50),
    Product_Name VARCHAR(100),
    Quantity INT,
    Unit_Price DECIMAL(10,2),
    Sales DECIMAL(12,2),
    Cost DECIMAL(12,2),
    Profit DECIMAL(12,2)
);


USE RetailSalesDB;
GO
SELECT COUNT(*) FROM dbo.retail_sale;

--TOTAL REVENUE
SELECT SUM(Sales) AS Total_Revenue
FROM dbo.retail_sale;

--TOTAL PROFIT
SELECT SUM(Profit) AS Total_Profit
FROM dbo.retail_sale;

--PROFITE MARGIN
SELECT 
    SUM(Profit) * 100.0 / SUM(Sales) AS Profit_Margin_Percentage
FROM dbo.retail_sale;

--SALES BY REGION
SELECT 
    Region,
    SUM(Sales) AS Total_Sales
FROM dbo.retail_sale
GROUP BY Region
ORDER BY Total_Sales DESC;

--MONTHLY SALES TREND
SELECT 
    MONTH(Order_Date) AS Month_Number,
    DATENAME(MONTH, Order_Date) AS Month_Name,
    SUM(Sales) AS Monthly_Sales
FROM dbo.retail_sale
GROUP BY 
    MONTH(Order_Date),
    DATENAME(MONTH, Order_Date)
ORDER BY Month_Number;


