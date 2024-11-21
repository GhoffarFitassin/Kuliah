USE TSQL;
GO

-- CREATE VIEW
CREATE VIEW Sales.CustGroups AS
SELECT 
	custid, 
	CHOOSE(custid % 3 + 1, N'A', N'B', N'C') AS custgroup, 
	country
FROM Sales.Customers;
----------------------------------------------------------------------

-- SOAL 1
SELECT custid, custgroup, country
FROM Sales.CustGroups;
----------------------------------------------------------------------

-- SOAL 2
SELECT
	country,
	p.A,
	p.B,
	p.C
FROM Sales.CustGroups
PIVOT(COUNT(custid) FOR custgroup IN (A,B,C)) AS p;
----------------------------------------------------------------------

-- ALTER VIEW
ALTER VIEW Sales.CustGroups AS
SELECT
	custid,
	CHOOSE(custid % 3 + 1, N'A', N'B', N'C') AS custgroup,
	country,
	city,
	contactname
FROM Sales.Customers;
----------------------------------------------------------------------

-- SOAL 3
SELECT
	country,
	p.A,
	p.B,
	p.C
FROM Sales.CustGroups
PIVOT(COUNT(custid) FOR custgroup IN (A,B,C)) AS p;
-- Jawaban: Berbeda dalam jumlah rows nya, pada percobaan sebelumnya output yg dihasilkan 21s, sedangkan pada percobaan kali ini output yang dihasilkan 91 rows
----------------------------------------------------------------------

-- SOAL 4
SELECT
	country,
	city,
	contactname,
	p.A,
	p.B,
	p.C
FROM Sales.CustGroups
PIVOT(COUNT(custid) FOR custgroup IN (A,B,C)) AS p;
----------------------------------------------------------------------

-- SOAL 5
WITH PivotCustGroup AS(
	SELECT custid, country, custgroup
    FROM Sales.CustGroups
)
SELECT
	country,
	p.A,
	p.B,
	p.C
FROM PivotCustGroup
PIVOT(COUNT(custid) FOR custgroup IN (A,B,C)) AS p;
----------------------------------------------------------------------

-- SOAL 8
WITH SalesByCategory AS (
	SELECT
		o.custid,
		(d.qty * d.unitprice) AS salesvalue,
		c.categoryname
	FROM Sales.Orders AS o
	INNER JOIN Sales.OrderDetails AS d ON o.orderid = d.orderid
	INNER JOIN Production.Products AS p ON d.productid = p.productid
	INNER JOIN Production.Categories AS c ON p.categoryid = c.categoryid
	WHERE YEAR(o.orderdate) = 2008
)
SELECT
	custid,
	[Beverages] AS Beverages,
	[Condiments] AS Condiments,
	[Confections] AS Confections, 
	[Dairy Products] AS [Dairy Products],
	[Grain/Cereals] AS [Grain/Cereals], 
	[Meat/Poultry] AS [Meat/Poultry],
	[Produce] AS Produce,
	[Seafood] AS Seafood
FROM SalesByCategory
PIVOT(
	SUM(salesvalue)
	FOR categoryname IN (
	[Beverages], 
	[Condiments], 
	[Confections],
	[Dairy Products],
	[Grain/Cereals],
	[Meat/Poultry],
	[Produce],
	[Seafood])
) AS Pivotable;
----------------------------------------------------------------------

-- SOAL 9
CREATE VIEW Sales.PivotCustGroups AS
WITH PivotCustGroups AS
(
SELECT
custid,
country,
custgroup
FROM Sales. CustGroups
)
SELECT
country,
p.A,
p.B,
p.C
FROM PivotCustGroups
PIVOT (COUNT (custid) FOR custgroup IN (A, B, C)) AS p;

SELECT * FROM Sales.PivotCustGroups;
----------------------------------------------------------------------

-- SOAL 10
SELECT
	custgroup,
	country,
	numberofcustomers
FROM Sales.PivotCustGroups
UNPIVOT( numberofcustomers FOR custgroup IN(A, B, C)) AS unpvt;
----------------------------------------------------------------------

-- SOAL 11
SELECT
	country,
	city,
	COUNT(*) AS noofcustomers
FROM Sales.Customers
GROUP BY GROUPING SETS(
	(country, city),
	(country),
	(city),
	()
);
----------------------------------------------------------------------

-- SOAL 12
SELECT
	YEAR(orderdate) AS orderyear, 
	MONTH(orderdate) AS ordermonth, 
	DAY(orderdate) AS orderday, 
	SUM(val) AS salesvalue
FROM Sales.OrderValues
GROUP BY CUBE (YEAR(orderdate), MONTH(orderdate), DAY (orderdate));
----------------------------------------------------------------------

-- SOAL 13
SELECT
	YEAR(orderdate) AS orderyear, 
	MONTH(orderdate) AS ordermonth, 
	DAY(orderdate) AS orderday, 
	SUM(val) AS salesvalue
FROM Sales.OrderValues
GROUP BY ROLLUP (YEAR(orderdate), MONTH(orderdate), DAY (orderdate));
----------------------------------------------------------------------

-- SOAL 15
SELECT
	GROUPING_ID(YEAR (orderdate), MONTH(orderdate)) AS groupid,
	YEAR(orderdate) AS orderyear,
	MONTH(orderdate) AS ordermonth,
	SUM(val) AS salesvalue
FROM Sales. OrderValues
GROUP BY GROUPING SETS ( 
	(YEAR (orderdate), MONTH (orderdate)),
	(YEAR(orderdate)),
	()
)
ORDER BY groupid, orderyear, ordermonth;
----------------------------------------------------------------------