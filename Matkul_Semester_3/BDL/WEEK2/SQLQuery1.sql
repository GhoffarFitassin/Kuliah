
-- PRAKTIKUM BAGIAN 1
-- SELECT
    -- GETDATE() AS currentdatetime,
    -- CAST(GETDATE() AS DATE) AS currentdate,
    -- CAST(GETDATE() AS TIME)  AS currenttime,
    -- DATEPART(YEAR, GETDATE()) AS currentyear,
    -- DATEPART(MONTH, GETDATE()) AS currentmonth,
    -- DATEPART(DAY, GETDATE()) AS currentday,
    -- DATEPART(WEEK, GETDATE()) AS currentweeknumber,
    -- DATENAME(MONTH, GETDATE()) AS currentmonthname
-- ;

-- PRAKTIKUM BAGIAN 2
-- SELECT CAST(GETDATE() AS DATE) AS todaysdate;
-- SELECT FORMAT(GETDATE(), 'MMM dd, yyyy') AS todaysdate;
-- SELECT FORMAT(GETDATE(), 'dd MMM yyyy') AS todaysdate;

-- PRAKTIKUM BAGIAN 3
-- SELECT 
	-- DATEADD(MONTH,5,GETDATE()) AS fivemonths,
	-- DATEDIFF(DAY, GETDATE(),DATEADD(MONTH,5,GETDATE())) AS diffdays,
	-- DATEDIFF(WEEK, '1945-08-17', '2022-08-17') AS diffweeks,
	-- CAST(DATEFROMPARTS(YEAR(GETDATE()),MONTH(GETDATE()),1)  AS DATETIME) AS firstday
-- ;


-- PRAKTIKUM BAGIAN 4
-- USE TSQL;
-- GO

-- ALTER TABLE [Sales].[Somedates]
-- ADD converteddate DATE;

-- SELECT
	-- [isitdate],
	-- CASE
		-- WHEN ISDATE([isitdate]) = 1 THEN CASt([isitdate] AS DATE)
		-- ELSE NULL
	-- END AS coverteddate
-- FROM [Sales].[Somedates];		

-- SELECT
-- SYSDATETIME() AS sysdatetimes,
-- CURRENT_TIMESTAMP AS current_timestamps;

-- PRAKTIKUM BAGIAN 5
-- USE TSQL;
-- GO

-- SELECT
	-- [custid],
	-- [shipname],
	-- [shippeddate]
-- FROM[Sales].[Orders]
-- WHERE YEAR([shippeddate]) = 2008
-- AND MONTH([shippeddate]) = 3;

-- PRAKTIKUM BAGIAN 6

-- SELECT
-- GETDATE() AS currentdatetime,
-- CAST(DATEFROMPARTS(YEAR(GETDATE()),MONTH(GETDATE()),1)  AS DATE) AS firstday,
-- CAST(DATEFROMPARTS(YEAR(GETDATE()),MONTH(GETDATE()),30)  AS DATE) AS lastday
-- ;

-- PRAKTIKUM BAGIAN 7
-- USE TSQL
-- GO

-- SELECT
	-- [orderid],
	-- [custid],
	-- [orderdate],
	-- [shipaddress]
-- FROM [Sales].[Orders]
-- WHERE DAY([orderdate]) > (DAY(EOMONTH([orderdate])) - 5);

-- PRAKTIKUM BAGIAN 8
-- USE TSQL;
-- GO

-- SELECT
-- [contactname] + ' (city: '+ [city] +')' AS contactdetails
-- FROM [Sales].[Customers];

-- PRAKTIKUM BAGIAN 9
-- USE TSQL;
-- GO

-- SELECT
-- [contactname],
-- [contacttitle]
-- FROM [Sales].[Customers]
-- WHERE[contactname] LIKE '[A-G]%';

-- PRAKTIKUM BAGIAN 10
-- USE TSQL;

-- SELECT
-- REPLACE([contactname], ',', '') AS contactname,
-- SUBSTRING([contactname],1, CHARINDEX(',', [contactname]) -1) AS lastname
-- FROM [Sales].[Customers];

-- PRAKTIKUM BAGIAN 11
-- USE TSQL;

-- SELECT
	-- [custid],
	-- 'C' + RIGHT('0000' + CAST([custid] AS varchar(6)),6) AS newcustid
-- FROM [Sales].[Customers];

-- PRAKTIKUM BAGIAN 14
USE TSQL;

SELECT
	[contactname],
	LEN([contactname]) - LEN(REPLACE([contactname], 'a', '')) AS numberofa
FROM [Sales].[Customers]
ORDER BY numberofa DESC;