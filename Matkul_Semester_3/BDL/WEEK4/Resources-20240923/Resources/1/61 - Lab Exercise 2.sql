---------------------------------------------------------------------
-- LAB 09
--
-- Exercise 2
---------------------------------------------------------------------

USE TSQL;
GO

---------------------------------------------------------------------
-- Task 1
-- 
-- Open the project file F:\10774A_Labs\10774A_09_PRJ\10774A_09_PRJ.ssmssln and the T-SQL script 61 - Lab Exercise 2.sql. Ensure that you are connected to the TSQL2012 database.
--
-- Write a SELECT statement to retrieve the orderid column from the Sales.Orders table and the total sales amount per orderid. (Hint: Multiply the qty and unitprice columns from the Sales.OrderDetails table.) Use the alias salesmount for the calculated column. Sort the result by the total sales amount in descending order.
--
-- Execute the written statement and compare the results that you got with the desired results shown in the file 62 - Lab Exercise 2 - Task 1 Result.txt.
---------------------------------------------------------------------

SELECT
	o.[orderid],
	o.[orderdate],
	SUM(d.[qty] * d.[unitprice]) AS salesamount
FROM [Sales].[Orders] AS o
JOIN [Sales].[OrderDetails] AS d 
	ON o.orderid=d.orderid
GROUP BY 
    o.[orderid], o.[orderdate]
ORDER BY 
	salesamount DESC;

---------------------------------------------------------------------
-- Task 2
-- 
-- Copy the T-SQL statement in task 1 and modify it to include the total number of order lines for each order and the average order line sales amount value within the order. Use the aliases nooforderlines and avgsalesamountperorderline, respectively.
--
-- Execute the written statement and compare the results that you got with the recommended result shown in the file 63 - Lab Exercise 2 - Task 2 Result.txt. 
---------------------------------------------------------------------

SELECT
	o.[orderid],
	o.[orderdate],
	SUM(d.[qty] * d.[unitprice]) AS salesamount,
	COUNT(d.orderid) AS nooforderlines,
	SUM(d.qty*d.unitprice) /  COUNT(DISTINCT o.orderid) salesamountperorderlines
FROM [Sales].[Orders] AS o
JOIN [Sales].[OrderDetails] AS d 
	ON o.orderid=d.orderid
GROUP BY
	o.orderid, o.orderdate
ORDER BY 
salesamountperorderlines DESC;

---------------------------------------------------------------------
-- Task 3
-- 
-- Write a select statement to retrieve the total sales amount for each month. The SELECT clause should include a calculated column named yearmonthno (YYYYMM notation) based on the orderdate column in the Sales.Orders table and a total sales amount (multiply the qty and unitprice columns from the Sales.OrderDetails table). Order the result by the yearmonthno calculated column.
--
-- Execute the written statement and compare the results that you got with the recommended result shown in the file 64 - Lab Exercise 2 - Task 3 Result.txt.
---------------------------------------------------------------------

SELECT
	FORMAT(o.[orderdate], 'yyyyMM') AS yearmonthno, 
    SUM(d.[qty] * d.[unitprice]) AS saleamountpermonth
FROM [Sales].[Orders] AS o
JOIN [Sales].[OrderDetails] AS d
	ON o.orderid=d.orderid
GROUP BY
	FORMAT(o.[orderdate], 'yyyyMM')
ORDER BY yearmonthno;

---------------------------------------------------------------------
-- Task 4
-- 
-- Write a select statement to retrieve all the customers (including those that did not place any orders) and their total sales amount, maximum sales amount per order line, and number of order lines. 
--
-- The SELECT clause should include the custid and contactname columns from the Sales.Customers table and four calculated columns based on appropriate aggregate functions:
--  totalsalesamount, representing the total sales amount per order
--  maxsalesamountperorderline, representing the maximum sales amount per order line
--  numberofrows, representing the number of rows (use * in the COUNT function)
--  numberoforderlines, representing the number of order lines (use the orderid column in the COUNT function)
--
-- Order the result by the totalsalesamount column.
--
-- Execute the written statement and compare the results that you got with the recommended result shown in the file 65 - Lab Exercise 2 - Task 4 Result.txt. 
--
-- Notice that the custid 22 and 57 rows have a NULL in the columns with the SUM and MAX aggregate functions. What are their values in the COUNT columns? Why are they different?
---------------------------------------------------------------------

SELECT 
    c.[custid],
    c.[contactname],
    COALESCE(SUM(d.[qty] * d.[unitprice]), NULL) AS totalsalesamount,  
    COALESCE(MAX(d.[qty] * d.[unitprice]), NULL) AS maxsalesamountperorderline,  
    COUNT(*) AS numberofrows, 
    COUNT(od.[orderid]) AS numberoforderlines  
FROM 
    [Sales].[Customers] AS c
LEFT JOIN 
    [Sales].[Orders] AS o ON c.[custid] = o.[custid]
LEFT JOIN 
    [Sales].[OrderDetails] AS od ON o.[orderid] = od.[orderid]
GROUP BY 
    c.[custid], c.[contactname]
ORDER BY 
    totalsalesamount;
