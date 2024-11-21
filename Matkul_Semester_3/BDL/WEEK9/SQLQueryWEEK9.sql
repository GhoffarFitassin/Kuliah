USE TSQL;
GO

-- SOAL 
-- Template
----------------------------------------------------------------

----------------------------------------------------------------
SELECT
productid, productname
FROM
Production.Products
WHERE
categoryid = 4;

SELECT
P.productid,
P.productname
FROM
Production. Products P INNER JOIN Sales.OrderDetails AS OD
ON
P.productid = OD.productid
GROUP BY
P.productid, P.productname
HAVING
SUM(OD.qty * OD.unitprice) > 50000;
----------------------------------------------------------------

-- SOAL 1
SELECT
    productid,
    productname
FROM
    Production.Products
WHERE
    categoryid = 4

UNION

SELECT
    P.productid,
    P.productname
FROM
    Production.Products P
    INNER JOIN Sales.OrderDetails AS OD ON P.productid = OD.productid
GROUP BY
    P.productid, P.productname
HAVING
    SUM(OD.qty * OD.unitprice) > 50000;
----------------------------------------------------------------

-- SOAL 2
SELECT
    productid,
    productname
FROM
    Production.Products
WHERE
    categoryid = 4

UNION ALL

SELECT
    P.productid,
    P.productname
FROM
    Production.Products P
    INNER JOIN Sales.OrderDetails AS OD ON P.productid = OD.productid
GROUP BY
    P.productid, P.productname
HAVING
    SUM(OD.qty * OD.unitprice) > 50000;
----------------------------------------------------------------

-- SOAL 3
-- UNION menggabungkan hasil dua query dan menghapus duplikat, sedangkan UNION ALL menggabungkan semua hasil tanpa menghapus duplikat.
----------------------------------------------------------------

-- SOAL 4
SELECT 
    c.custid, c.contactname, v.orderdate, v.val
FROM 
    Sales.Customers c
INNER JOIN 
    Sales.OrderValues v ON C.custid = v.custid
WHERE 
    MONTH(v.orderdate) = 1 AND YEAR(v.orderdate) = 2008

UNION ALL

SELECT 
    c.custid, c.contactname, v.orderdate, v.val
FROM 
    Sales.Customers c
INNER JOIN 
    Sales.OrderValues v ON c.custid = v.custid
WHERE 
    MONTH(v.orderdate) = 2 AND YEAR(v.orderdate) = 2008
ORDER BY 
    val DESC OFFSET 0 ROWS 
FETCH NEXT 20 ROWS ONLY;
----------------------------------------------------------------
 
SELECT p.productid, p.productname, o.orderid FROM Production. Products AS p
CROSS APPLY
(
SELECT TOP (2)
d.orderid
FROM Sales. OrderDetails AS d
WHERE d.productid = p.productid
ORDER BY d.orderid DESC
) AS o
ORDER BY p.productid;

IF OBJECT_ID('dbo.fnGetTop3ProductsForCustomer') IS NOT NULL
DROP FUNCTION dbo.fnGetTop3ProductsForCustomer;
GO
CREATE FUNCTION dbo.fnGetTop3ProductsForCustomer(@custid AS INT)
RETURNS TABLE
AS
RETURN
SELECT TOP (3)
d.productid,
p.productname,
SUM(d.qty * d.unitprice) AS totalsalesamount
FROM Sales. Orders AS O
INNER JOIN Sales. OrderDetails AS d ON d.orderid = o.orderid
INNER JOIN Production. Products AS p ON p.productid = d.productid
WHERE custid = @custid
GROUP BY d.productid, p.productname
ORDER BY totalsalesamount DESC;
GO

SELECT
c.custid, c.contactname, p.productid, p.productname, p.totalsalesamount
FROM
Sales. Customers AS c
CROSS APPLY
dbo.fnGetTop3ProductsForCustomer (c.custid) AS p
ORDER BY
c.custid;

-- SOAL 5
SELECT
c.custid, c.contactname, p.productid, p.productname, p.totalsalesamount
FROM
Sales. Customers AS c
OUTER APPLY
dbo.fnGetTop3ProductsForCustomer (c.custid) AS p
ORDER BY
c.custid;
----------------------------------------------------------------

-- SOAL 6
SELECT
    c.custid, c.contactname, p.productid, p.productname, p.totalsalesamount
FROM
    Sales.Customers AS c
OUTER APPLY 
    dbo.fnGetTop3ProductsForCustomer(c.custid) AS p
WHERE 
    p.productid IS NULL
ORDER BY
    c.custid;
----------------------------------------------------------------
IF OBJECT_ID('dbo.fnGetTop3ProductsForCustomer') IS NOT NULL
DROP FUNCTION dbo.fnGetTop3ProductsForCustomer;
----------------------------------------------------------------

SELECT o.custid
FROM Sales. Orders AS o
INNER JOIN Sales. OrderDetails AS d ON d.orderid = o.orderid
GROUP BY o.custid
HAVING COUNT (DISTINCT d.productid) > 20;

-- SOAL 7
SELECT o.custid
FROM Sales.Orders AS o
WHERE o.shipcountry = 'USA'

EXCEPT

SELECT o.custid
FROM Sales.Orders AS o
INNER JOIN Sales.OrderDetails AS d ON d.orderid = o.orderid
GROUP BY o.custid
HAVING COUNT(DISTINCT d.productid) > 20;
----------------------------------------------------------------

-- SOAL 8
-- 3.1
SELECT o.custid
FROM Sales.Orders AS o
INNER JOIN Sales.OrderDetails AS d ON d.orderid = o.orderid
GROUP BY o.custid
HAVING COUNT(DISTINCT d.productid) > 20

INTERSECT

-- 3.3
SELECT o.custid
FROM Sales.Orders AS o
INNER JOIN Sales.OrderDetails AS d ON d.orderid = o.orderid
GROUP BY o.custid
HAVING SUM(d.qty * d.unitprice) > 10000;
----------------------------------------------------------------

-- SOAL 10
SELECT * FROM (
-- 3.1
SELECT o.custid
FROM Sales.Orders AS o
INNER JOIN Sales.OrderDetails AS d ON d.orderid = o.orderid
GROUP BY o.custid
HAVING COUNT(DISTINCT d.productid) > 20
) result

INTERSECT

-- 3.3
SELECT o.custid
FROM Sales.Orders AS o
INNER JOIN Sales.OrderDetails AS d ON d.orderid = o.orderid
GROUP BY o.custid
HAVING SUM(d.qty * d.unitprice) > 10000;
----------------------------------------------------------------

IF OBJECT_ID('Sales.trgAutoAddOrderDetailsForOrder') IS NOT NULL
	DROP TRIGGER Sales.trgAutoAddOrderDetailsForOrder;
GO

CREATE TRIGGER trgAutoAddOrderDetailsForOrder ON Sales.Orders
AFTER INSERT
AS
	PRINT 'TRIGGER trgAutoAddOrderDetailsForOrder dipanggil!';

	DECLARE @orderid INT = (SELECT orderid FROM inserted);
	DECLARE @productid INT = 1;
	DECLARE @unitprice MONEY = 0;
	DECLARE @qty SMALLINT = 1;
	DECLARE @discount NUMERIC(4,3) = 0;

	INSERT INTO Sales.OrderDetails VALUES
	(@orderid, @productid, @unitprice, @qty, @discount);

	PRINT 'Data kosong ditambahkan secara otomatis ke tabel Sales.OrderDetails';
GO

INSERT INTO Sales.Orders
	(custid, empid, orderdate, requireddate, shipperid, freight,
	shipname, shipaddress, shipcity, shipcountry)
VALUES
(85, 5, GETDATE(), GETDATE(), 3, 100, 'Kapal Api', 'Jl. Soekarno-Hatta', 'Malang', 'Indonesia');

IF OBJECT_ID('Production.trgAutoUpdateOrderDetailsUnitPrice') IS NOT NULL
DROP TRIGGER Production.trgAutoUpdateOrderDetailsUnitPrice;
GO

CREATE TRIGGER trgAutoUpdateOrderDetailsUnitPrice ON Production.Products
AFTER UPDATE
AS 
	PRINT 'Trigger trgAutoUpdateOrderDetailsUnitPrice DIPANGGIL!';

	DECLARE @productid INT = (SELECT productid FROM inserted);
	DECLARE @uniprice MONEY = COALESCE((SELECT unitprice FROM inserted), 0.0);

	UPDATE Sales.OrderDetails SET unitprice = @uniprice
	WHERE productid = @productid;

	PRINT 'Harga di tabel Sales.OrderDetails secara otomatis disesuaikan';
GO

UPDATE Production.Products SET unitprice = 100 WHERE productid = 11;
SELECT * FROM Production.Products WHERE productid = 11;
SELECT * FROM Sales.OrderDetails WHERE productid = 11;


-- SOAL 12
DELETE FROM Sales.OrderDetails WHERE productid = 10;
SELECT * FROM Production.Products WHERE productid = 10;
----------------------------------------------------------------

INSERT INTO HR.EmployeesBackup (
	lastname, firstname, title, titleofcourtesy, birthdate, hiredate, 
	address, city, region, postalcode, country, phone, mgrid)
SELECT lastname, firstname, title, titleofcourtesy, birthdate, hiredate,
	address, city, region, postalcode, country, phone, mgrid
FROM HR.Employees;


IF OBJECT_ID('HR.trgDivertInsertEmployeeToBackup') IS NOT NULL
DROP TRIGGER HR.trgDivertInsertEmployeeToBackup
GO

CREATE TRIGGER trgDivertInsertEmployeeToBackup ON HR.Employees
INSTEAD OF INSERT
AS
	PRINT 'TRIGGER trgDivertInsertEmployeeToBackup DIPANGGIL!!';

	INSERT INTO HR.EmployeesBackup (
		lastname, firstname, title, titleofcourtesy, birthdate, hiredate,
		address, city, region, postalcode, country, phone, mgrid)
	SELECT 
		lastname, firstname, title, titleofcourtesy, birthdate, hiredate,
		address, city, region, postalcode, country, phone, mgrid
	FROM inserted;

	PRINT 'Employee baru disimpan di tabel HR.EmployeesBackup';
GO

INSERT INTO HR.Employees
VALUES
	('Santoso', 'Adi', 'Staff', 'Mr. ', '19830101', '20170101',
	'Jl. Soekarno-Hatta', 'Malang', 'Jawa Timur', '65150', 'Indonesia',
	'(085) 123-456', 1);
SELECT * FROM HR.EmployeesBackup;

-- SOAL 13
CREATE TRIGGER preventUserToUpdateEmployeeData ON HR.Employees
INSTEAD OF UPDATE
AS
	PRINT 'TRIGGER preventUserToUpdateEmployeeData dipanggil!'
	
	INSERT INTO HR.EmployeesBackup 
		(LastName, FirstName, Title, TitleOfCourtesy, BirthDate, HireDate, 
		Address, City, Region, PostalCode, Country, Phone, MGrid)
    SELECT LastName, FirstName, Title, TitleOfCourtesy, BirthDate, HireDate, 
           Address, City, Region, PostalCode, Country, Phone, MGrid
    FROM inserted;
GO

UPDATE HR.Employees SET firstname = 'DEPAN', lastname = 'BELAKANG'
WHERE firstname = 'Adi';
SELECT * FROM HR.EmployeesBackup;
GO
----------------------------------------------------------------

-- SOAL 14
CREATE TRIGGER preventUserToDeleteEmployeeData ON HR.Employees
INSTEAD OF DELETE
AS
	PRINT 'TRIGGER preventUserToDeleteEmployeeData dipanggil!';

	DELETE FROM HR.EmployeesBackup
    WHERE empid = (SELECT empid deleted)
GO
DELETE FROM HR.Employees WHERE firstname = 'Maria';
SELECT * FROM HR.EmployeesBackup;
----------------------------------------------------------------