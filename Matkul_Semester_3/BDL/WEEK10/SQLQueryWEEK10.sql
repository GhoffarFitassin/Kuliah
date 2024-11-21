USE TSQL;
GO

-- SOAL 
-- template
--------------------------------------------------

CREATE PROCEDURE Sales.GetTopCustomers AS
SELECT TOP(10) c.custid, c.contactname, SUM(o.val) AS salesvalue
FROM Sales.OrderValues AS o INNER JOIN Sales.Customers AS c ON c.custid = o.custid
GROUP BY c.custid, c.contactname ORDER BY salesvalue DESC;


-- SOAL 1
EXEC Sales.GetTopCustomers;
--------------------------------------------------

ALTER PROCEDURE Sales.GetTopCustomers AS
SELECT	c.custid, c.contactname, SUM(o.val) AS salesvalue
FROM Sales.OrderValues AS o INNER JOIN Sales.Customers AS c ON c.custid = o.custid
GROUP BY c.custid, c.contactname ORDER BY salesvalue DESC
OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY;

-- SOAL 3
EXEC Sales.GetTopCustomers;
--------------------------------------------------

-- SOAL 
-- Jawaban: perbedaan terletak pada penggunaan klausa, pada langkah 2 menggunakan klausa top yg mana digunakan untuk mengembalikan nilai 10 rows paling atas, 
-- sedangkan pada langkah 5 menggunakan klausa offset dan fetch, yg mana offset digunakan untuk menentukan jumlah baris yg akan dilewati sebelum mengembalikan data 
-- sedangkan fetch digunakan untuk menentukan jumlah baris yang akan ditampilkan
--------------------------------------------------

ALTER PROCEDURE Sales.GetTopCustomers @orderyear int
AS
SELECT c.custid, c.contactname, SUM(o.val) AS salesvalue
FROM Sales.OrderValues AS o 
INNER JOIN Sales.Customers AS c ON c.custid = o.custid
WHERE YEAR(o.orderdate) = @orderyear GROUP BY c.custid, c.contactname ORDER BY salesvalue DESC
OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY;

-- SOAL 6
EXECUTE Sales.GetTopCustomers @orderyear = 2007;
--------------------------------------------------

-- SOAL 8
EXECUTE Sales.GetTopCustomers @orderyear = 2008;
--------------------------------------------------

-- SOAL 9
EXECUTE Sales.GetTopCustomers;
--------------------------------------------------

-- SOAL 10
-- Jawaban: Stored procedure tersebut membutuhkan parameter bernama '@orderyear' yang wajib diisi, tetapi parameter tersebut tidak disertakan saat procedure dipanggil.
--------------------------------------------------

ALTER PROCEDURE Sales.GetTopCustomers @orderyear int = NULL
AS
SELECT c.custid, c.contactname, SUM(o.val) AS salesvalue
FROM Sales.OrderValues AS o INNER JOIN Sales.Customers AS c ON c.custid = o.custid
WHERE YEAR(o.orderdate) = @orderyear OR @orderyear IS NULL
GROUP BY c.custid, c.contactname ORDER BY salesvalue DESC
OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY;

-- SOAL 11
EXECUTE Sales.GetTopCustomers;
--------------------------------------------------

-- SOAL 12
-- Jawaban: Modifikasi stored procedure dapat mempengaruhi aplikasi terutama jika ada perubahan pada parameter wajib, nama parameter, tipe data, atau struktur output. 
-- Untuk perubahan internal seperti optimasi query atau penambahan parameter opsional dengan nilai default biasanya tidak memerlukan modifikasi aplikasi.
--------------------------------------------------

ALTER PROCEDURE Sales.GetTopCustomers @orderyear int = NULL,
@n int = 10 AS
SELECT c.custid, c.contactname, SUM(o.val) AS salesvalue
FROM Sales.OrderValues AS o INNER JOIN Sales.Customers AS c ON c.custid = o.custid
WHERE YEAR(o.orderdate) = @orderyear OR
@orderyear IS NULL
GROUP BY c.custid, c.contactname ORDER BY salesvalue DESC
OFFSET 0 ROWS FETCH NEXT @n ROWS ONLY;


-- SOAL 13
EXECUTE Sales.GetTopCustomers;
--------------------------------------------------

-- SOAL 14
EXECUTE Sales.GetTopCustomers @n = 20;
--------------------------------------------------

-- SOAL 15
-- Jawaban: Jika parameter baru yang ditambahkan bersifat opsional (memiliki nilai default), maka aplikasi tidak perlu diubah. 
-- Namun jika parameter baru tersebut bersifat wajib (required), maka aplikasi perlu dimodifikasi untuk menyertakan nilai parameter tersebut saat memanggil stored procedure.
--------------------------------------------------

ALTER PROCEDURE Sales.GetTopCustomers @customerpos int = 1,
@customername nvarchar(30) OUTPUT AS
SET @customername = ( SELECT	c.contactname FROM Sales.OrderValues AS o
INNER JOIN Sales.Customers AS c ON c.custid = o.custid
GROUP BY c.custid, c.contactname ORDER BY SUM(o.val) DESC
OFFSET @customerpos - 1 ROWS FETCH NEXT 1 ROW ONLY
);

-- SOAL 16
EXEC sys.sp_help;
--------------------------------------------------

-- SOAL 17
EXEC sys.sp_help 'Sales.Customers';
--------------------------------------------------

-- SOAL 18
EXECUTE sys.sp_helptext 'Sales.GetTopCustomers';
--------------------------------------------------

-- SOAL 19
EXECUTE sys.sp_columns 
    @table_name = 'Customers',
    @table_owner = 'Sales';
-------------------------------------------------

DROP PROCEDURE Sales.GetTopCustomers;
GO