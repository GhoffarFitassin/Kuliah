---------------------------------------------------------------------
-- LAB 09
--
-- Exercise 1
---------------------------------------------------------------------

USE TSQL;
GO

---------------------------------------------------------------------
-- Task 1
-- 
-- Open the project file F:\10774A_Labs\10774A_09_PRJ\10774A_09_PRJ.ssmssln and the T-SQL script 51 - Lab Exercise 1.sql. To set your database context to that of the TSQL2012 database, highlight the statement USE TSQL2012; and execute the highlighted code. After executing this statement, the database name TSQL2012 should be selected in the Available Databases box. In subsequent exercises, you will simply be instructed to ensure that you are connected to the TSQL2012 database.
--
-- Write a SELECT statement that will return groups of customers that made a purchase. The SELECT clause should include the custid column from the Sales.Orders table and the contactname column from the Sales.Customers table. Group by both columns and filter only the orders from the sales employee whose empid equals five.
--
-- Execute the written statement and compare the results that you got with the desired results shown in the file 52 - Lab Exercise 1 - Task 1 Result.txt.
---------------------------------------------------------------------

SELECT
	o.[custid], c.[contactname]
FROM [Sales].[Orders] AS o
INNER JOIN [Sales].[Customers] AS c
ON o.[custid] = c.[custid]
WHERE o.[empid] = 5
GROUP BY o.custid, c.contactname;

---------------------------------------------------------------------
-- Task 2
-- 
-- Copy the T-SQL statement in task 1 and modify it to include the city column from the Sales.Customers table in the SELECT clause. 
--
-- Execute the query. You will get an error. What is the error message? Why?
--
-- Correct the query so that it will execute properly.
--
-- Execute the query and compare the results that you got with the desired results shown in the file 53 - Lab Exercise 1 - Task 2 Result.txt.
---------------------------------------------------------------------

SELECT
	o.[custid], c.[contactname], c.[city]
FROM [Sales].[Orders] AS o
INNER JOIN [Sales].[Customers] AS c
ON o.[custid] = c.[custid]
WHERE o.[empid] = 5
GROUP BY o.custid, c.contactname, c.city;

---------------------------------------------------------------------
-- Task 3
-- 
-- Write a SELECT statement that will return groups of rows based on the custid column and a calculated column orderyear representing the order year based on the orderdate column from the Sales.Orders table. Filter the results to include only the orders from the sales employee whose empid equal five.
--
-- Execute the written statement and compare the results that you got with the desired results shown in the file 54 - Lab Exercise 1 - Task 3 Result.txt.
---------------------------------------------------------------------

SELECT
	custid, YEAR(orderdate) AS orderyear
FROM [Sales].[Orders]
WHERE empid = 5
GROUP BY custid, YEAR(orderdate)
ORDER BY custid, orderyear;

---------------------------------------------------------------------
-- Task 4
-- 
-- Write a SELECT statement to retrieve groups of rows based on the categoryname column in the Production.Categories table. Filter the results to include only the product categories that were ordered in the year 2008.
--
-- Execute the written statement and compare the results that you got with the desired results shown in the file 55 - Lab Exercise 1 - Task 4 Result.txt. 
---------------------------------------------------------------------

select c.categoryid,c.categoryname
    from Sales.orders o
    INNER JOIN Sales.OrderDetails d ON o.orderid=d.orderid
    INNER JOIN Production.Products p ON p.productid=p.productid
    INNER JOIN Production.Categories c ON c.categoryid=p.categoryid
    WHERE o.orderdate >='20080101' AND o.orderdate <'20090101'
    GROUP BY c.categoryid, c.categoryname
    order by c.categoryid ASC;