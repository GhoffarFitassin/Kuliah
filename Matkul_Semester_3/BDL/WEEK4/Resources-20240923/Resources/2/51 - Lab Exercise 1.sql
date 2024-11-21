---------------------------------------------------------------------
-- LAB 10
--
-- Exercise 1
---------------------------------------------------------------------

USE TSQL;
GO

---------------------------------------------------------------------
-- Task 1
-- 
-- Open the project file F:\10774A_Labs\10774A_10_PRJ\10774A_10_PRJ.ssmssln and the T-SQL script 51 - Lab Exercise 1.sql. To set your database context to that of the TSQL2012 database, highlight the statement USE TSQL2012; and execute the highlighted code. After executing this statement, the TSQL2012 database should be selected in the Available Databases box. In subsequent exercises, you will simply be instructed to ensure that you are connected to the TSQL2012 database.
--
-- Write a SELECT statement to return the maximum order data from the table Sales.Orders.
--
-- Execute the written statement and compare the results that you got with the desired results shown in the file 52 - Lab Exercise 1 - Task 1 Result.txt.
---------------------------------------------------------------------

SELECT
	MAX([orderdate]) AS lastorderdate
FROM [Sales].[Orders];

---------------------------------------------------------------------
-- Task 2
-- 
-- Write a SELECT statement to return the orderid, orderdate, empid, and custid columns from the Sales.Orders table. Filter the results to include only orders where the date order equals the last order date. (Hint: Use the query in task 1 as a self-contained subquery.)
--
-- Execute the written statement and compare the results that you got with the desired results shown in the file 53 - Lab Exercise 1 - Task 2 Result.txt.
---------------------------------------------------------------------

SELECT
	[orderid],
	[orderdate],
	[empid],
	[custid]
FROM [Sales].[Orders]
WHERE 
    [orderdate] = (SELECT MAX(orderdate) FROM [Sales].[Orders]);

---------------------------------------------------------------------
-- Task 3
-- 
-- The IT department has written a T-SQL statement that retrieves the orders for all customers whose contact name starts with a letter I: 
--
-- Execute the query and observe the result.
--
-- Modify the query to filter customers whose contact name starts with a letter B.
--
-- Execute the query. What happened? What is the error message? Why did the query fail?
--
-- Apply the needed changes to the T-SQL statement so that it will run without an error.
--
-- Execute the written statement and compare the results that you got with the desired results shown in the file 54 - Lab Exercise 1 - Task 3 Result.txt.
---------------------------------------------------------------------

SELECT
	orderid, orderdate, empid, custid
FROM Sales.Orders
WHERE 
	custid IN 
	(
		SELECT custid
		FROM Sales.Customers
		WHERE contactname LIKE N'B%'
	);


---------------------------------------------------------------------
-- Task 4
-- 
-- Write a SELECT statement to retrieve the orderid column from the Sales.Orders table and the following calculated columns: 
--  totalsalesamount (based on the qty and unitprice columns in the Sales.OrderDetails table) 
--  salespctoftotal (percentage of the total sales amount for each order divided by the total sales amount for all orders in specific period) 
--
-- Filter the results to include only orders placed in May 2008.
--
-- Execute the written statement and compare the results that you got with the desired results shown in the file 55 - Lab Exercise 1 - Task 4 Result.txt. 
---------------------------------------------------------------------

SELECT 
    o.orderid,
    SUM(od.qty * od.unitprice) AS totalsalesamount,  -- Menghitung total penjualan per pesanan
    (SUM(od.qty * od.unitprice) * 100.0 / 
     (SELECT SUM(od2.qty * od2.unitprice) 
      FROM Sales.Orders AS o2 
      JOIN Sales.OrderDetails AS od2 ON o2.orderid = od2.orderid 
      WHERE o2.orderdate >= '2008-05-01' AND o2.orderdate < '2008-06-01')
    ) AS salespctoftotal  -- Menghitung persentase penjualan per pesanan terhadap total penjualan
FROM 
    Sales.Orders AS o
JOIN 
    Sales.OrderDetails AS od ON o.orderid = od.orderid  -- Menggabungkan tabel Orders dan OrderDetails
WHERE 
    o.orderdate >= '2008-05-01' AND o.orderdate < '2008-06-01'  -- Memfilter untuk bulan Mei 2008
GROUP BY 
    o.orderid;