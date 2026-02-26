create database retail_data;
CREATE TABLE retail_sales (
    InvoiceID INT,
    Date DATE,
    ProductID INT,
    TotalSales FLOAT,
    Discount FLOAT,
    CustomerID INT,
    Quantity INT
);

SELECT *
FROM retail_data.retail_sales
WHERE InvoiceID IS NOT NULL
AND Date IS NOT NULL
AND TotalSales IS NOT NULL;

SELECT *,
(TotalSales - Discount) AS Net_Revenue
FROM retail_data.retail_sales;

SELECT SUM(TotalSales) AS Total_Revenue
FROM retail_data.retail_sales;

SELECT SUM(TotalSales - Discount) AS Net_Revenue
FROM retail_data.retail_sales;

SELECT 
    MONTH(Date) AS Month,
    SUM(TotalSales - Discount) AS Monthly_Net_Revenue
FROM retail_data.retail_sales
GROUP BY MONTH(Date)
ORDER BY Month;

SELECT 
    SUM(Discount) AS Total_Discount_Given,
    ROUND((SUM(Discount) / SUM(TotalSales)) * 100,2) AS Discount_Percentage
FROM retail_data.retail_sales;

SELECT 
    CustomerID,
    SUM(TotalSales - Discount) AS Customer_Revenue
FROM retail_data.retail_sales
GROUP BY CustomerID
ORDER BY Customer_Revenue DESC;

SELECT 
    ProductID,
    SUM(Quantity) AS Total_Quantity_Sold,
    SUM(TotalSales - Discount) AS Net_Revenue
FROM retail_data.retail_sales
GROUP BY ProductID
ORDER BY Net_Revenue DESC;