CREATE TABLE sales_sample (
    Product_Id INTEGER,
    Region VARCHAR(50),
    Date DATE,
    Sales_Amount NUMERIC
);
INSERT INTO sales_sample (Product_Id, Region, Date, Sales_Amount)
VALUES
    (1, 'East', '2023-01-15', 1000.50),
    (2, 'West', '2023-01-20', 800.75),
    (1, 'East', '2023-02-05', 1200.25),
    (3, 'North', '2023-02-10', 950.00),
    (2, 'West', '2023-03-15', 750.30),
    (1, 'East', '2023-03-20', 1100.75),
    (4, 'South', '2023-04-10', 850.50),
    (2, 'West', '2023-04-15', 720.90),
    (3, 'North', '2023-05-05', 1000.25),
    (1, 'East', '2023-05-20', 1150.60);
SELECT Region, Product_Id, SUM(Sales_Amount) AS Total_Sales
FROM sales_sample
GROUP BY Region, Product_Id
ORDER BY Region, Product_Id;
SELECT Region, SUM(Sales_Amount) AS Total_Sales
FROM sales_sample
GROUP BY Region
UNION ALL
SELECT 'All Regions' AS Region, SUM(Sales_Amount) AS Total_Sales
FROM sales_sample;
SELECT Region, Product_Id, Date, SUM(Sales_Amount) AS Total_Sales
FROM sales_sample
GROUP BY ROLLUP (Region, Product_Id, Date);
SELECT *
FROM sales_sample
WHERE Region = 'East' AND Date BETWEEN '2023-01-01' AND '2023-01-31';
SELECT *
FROM sales_sample
WHERE Region = 'West' AND Product_Id = 2 AND Date BETWEEN '2023-01-01' AND '2023-02-28';



