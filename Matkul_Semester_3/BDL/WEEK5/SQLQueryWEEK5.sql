	USE TSQL;
GO
-- SOAL 1
SELECT
[productid],[productname],[supplierid],[unitprice],[discontinued]
FROM [Production].[Products]
WHERE categoryid=1;

-- SOAL 2
CREATE VIEW Production.ProductsBeverages AS
SELECT
	productid, productname, supplierid, unitprice, discontinued
FROM Production.Products
WHERE categoryid = 1;

SELECT * FROM Production.ProductsBeverages;

-- soal 4
ALTER VIEW Production.ProductsBeverages AS
SELECT
	productid, productname, supplierid, unitprice, discontinued
FROM Production.Products
WHERE categoryid = 1
ORDER BY productname;
-- karena ada orderby tidak bisa digunakan pada view, kecuali menggunakan offset atau top

-- SOAL 5
ALTER VIEW Production.ProductsBeverages AS
SELECT TOP(100) PERCENT
productid, productname, supplierid, unitprice, discontinued
FROM Production.Products
WHERE categoryid = 1
ORDER BY productname;

SELECT * FROM Production.ProductsBeverages
ORDER BY productname asc;
-- tidak, meskipun sudah diatur pad syntax tersebut, tetap tidak akan nelakukan perubahan pada hasil, kecuali jika pada saat menampilkan views baru diurutkan maka akan bisa berubah

-- SOAL 6
ALTER VIEW Production.ProductsBeverages AS
SELECT
productid, productname, supplierid, unitprice, discontinued,
CASE WHEN unitprice > 100. THEN N'high' ELSE N'normal' END keterangan
FROM Production.Products
WHERE categoryid = 1; 


-- tabel turunan
DECLARE @emp_id INT = 9;
SELECT orderyear, COUNT(DISTINCT custid) AS
cust_count
FROM (
SELECT YEAR(orderdate) AS orderyear,
custid
FROM Sales.Orders
WHERE empid=@emp_id
) AS derived_year
GROUP BY orderyear;

-- SOAL 8
SELECT 
    p.productid, p.productname 
FROM 
    (
        SELECT 
            productid, productname, supplierid, unitprice, discontinued, 
        CASE 
			WHEN unitprice > 100 THEN N'high' 
			ELSE N'normal' 
        END AS pricetype  
        FROM 
            Production.Products
		WHERE
			categoryid = 1
    ) AS p 
WHERE 
    p.pricetype = N'high';

-- SOAL 9
SELECT
c.custid,
SUM(c.totalsalesamountperorder) AS totalsalsesamount,
AvG(c.totalsalesamountperorder) AS avgsalesamount
FROM
(
SELECT
	o.custid, o.orderid, SUM(d.unitprice * d.qty) AS totalsalesamountperorder
	FROM Sales.Orders AS o
	INNER JOIN Sales.OrderDetails d ON d.orderid =o.orderid
	GROUP BY o.custid, o.orderid
) AS c
GROUP BY c.custid;

-- SOAL 11
WITH ProductsBeverages AS
	(
		SELECT 
            productid, productname, supplierid, unitprice, discontinued, 
        CASE 
			WHEN unitprice > 100 THEN N'high' 
			ELSE N'normal' 
        END AS pricetype  
        FROM 
            Production.Products
		WHERE categoryid = 1
	)
SELECT 
	productid, productname
FROM ProductsBeverages
WHERE pricetype = N'high';

-- SOAL 14
SELECT
custid, SUM(val) AS totalsalesamount
FROM Sales.OrderValues
WHERE YEAR(orderdate) = 2007
GROUP BY custid;

-- ss
CREATE FUNCTION dbo.fnGetSalesByCustomer
(@orderyear AS INT) RETURNS TABLE
AS
RETURN
SELECT
custid, SUM(val) AS totalsalesamount
FROM Sales.OrderValues
WHERE YEAR(orderdate) = @orderyear
GROUP BY custid;
--
SELECT 
custid, totalsalesamount
FROM dbo.fnGetSalesByCustomer(2007);