use [TSQL];


SELECT 
	p.[firstname] AS FIRST_NAME, 
	p.[lastname] AS LAST_NAME,
	P.[city] AS CITY,
	P.[country] AS COUNTRY
FROM [HR].[Employees] AS p
WHERE P.[city] = 'Seattle' AND P.[country] = 'USA';