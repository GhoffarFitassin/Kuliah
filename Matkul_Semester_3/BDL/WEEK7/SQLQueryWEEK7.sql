USE TSQL;
GO

SELECT 
	RANK() OVER(order by orderdate desc) as rankno,
	orderid,
	orderdate,
	shipcountry
FROM Sales.Orders;

SELECT 
	DENSE_RANK() OVER(order by orderdate desc) as rankno,
	orderid,
	orderdate,
	shipcountry
FROM Sales.Orders;

-- SOAL 1
SELECT
	orderid, orderdate, val,
	ROW_NUMBER() OVER(order by orderdate) AS rowno
FROM Sales.OrderValues;

-- SOAL 2
SELECT
	orderid, orderdate, val,
	ROW_NUMBER() OVER(order by orderdate) AS rowno,
	RANK() OVER(order by orderdate) AS rankno
FROM Sales.OrderValues;
-- SOAL 3
-- jika ROW_NUMBER() akan menghitung secara urut perbarisnya, sedangkan jika RANK() apabila orderdate ada yang sama maka ranknya akan sama 
-- SOAL 4
SELECT
	orderid, orderdate, custid, val,
	RANK() OVER(partition by custid order by val desc) AS orderrankno
FROM Sales.OrderValues;

-- SOAL 5
SELECT
	custid,
	val,
	YEAR (orderdate) AS orderyear,
	RANK() OVER (PARTITION BY custid, YEAR(orderdate) ORDER BY val DESC) AS orderrankno
FROM Sales.OrderValues;


-- SOAL 6
WITH RankedOrders AS(
	SELECT
		custid,
		val,
		YEAR (orderdate) AS orderyear,
		RANK() OVER (PARTITION BY custid, YEAR(orderdate) ORDER BY val DESC) AS orderrankno
	FROM Sales.OrderValues
)
SELECT
	custid,
	orderyear,
	orderrankno,
	val
FROM RankedOrders
WHERE orderrankno <= 2;

-- SOAL 7
WITH OrderRows AS(
	SELECT
		orderid,
		orderdate,
		val,
		ROW_NUMBER() OVER(ORDER BY orderdate, orderid) AS rowno
	FROM Sales.OrderValues
)
SELECT
	orderid,
	orderdate,
	val,
	rowno
FROM OrderRows;

-- SOAL 8
WITH orderrows as
(
	SELECT orderid, orderdate, val,
	ROW_NUMBER() OVER(order by orderdate, orderid) rowno
	from Sales.OrderValues
)
SELECT o.orderid, o.orderdate, o.val,
	o2.val as preval,
	o.val - o2.val as diffprev
FROM orderrows AS o
LEFT OUTER JOIN orderrows as o2 ON o.rowno=o2.rowno+1;

-- SOAL 9
SELECT
	orderid,
	orderdate,
	val,
	LAG(val) OVER(ORDER BY orderdate, orderid) AS prevval,
	val - LAG(val) OVER(ORDER BY orderdate, orderid) AS diffprev
FROM
Sales.OrderValues;

-- SOAL 10
WITH SalesMonth2007 AS (
	SELECT
		MONTH(orderdate) AS monthno, SUM(val) AS val
	FROM
	Sales.OrderValues
	WHERE
		YEAR (orderdate) = 2007
	GROUP BY
		MONTH(orderdate)
)
SELECT
	monthno,
	val
FROM SalesMonth2007;