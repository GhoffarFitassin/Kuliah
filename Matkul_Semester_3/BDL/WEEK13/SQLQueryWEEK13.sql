USE TSQL;
GO

-- SOAL 
-- Template
-------------------------------------------------------------------

IF OBJECT_ID('Sales.TempOrders') IS NOT NULL DROP TABLE Sales.TempOrders; 
SELECT
orderid, custid, empid, orderdate, requireddate, shippeddate, shipperid, freight,
shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry INTO Sales.TempOrders FROM Sales.Orders AS o
CROSS JOIN dbo.Nums AS n WHERE n.n <= 120;

-- SOAL 2
SELECT
	orderid, custid, orderdate
FROM Sales.TempOrders;
-------------------------------------------------------------------

-- SOAL 6
SELECT TOP 1
	orderid, custid, orderdate
FROM Sales.TempOrders;
-------------------------------------------------------------------

-- SOAL 7
-- Jawaban: Adanya operator Top ditengah operator select dan table scan
-------------------------------------------------------------------
SELECT
	orderid, custid, orderdate
FROM Sales.TempOrders;
-- SOAL 8
-- Template
-------------------------------------------------------------------

-- SOAL 9
-- Template
-------------------------------------------------------------------

-- SOAL 10
-- Template
-------------------------------------------------------------------
