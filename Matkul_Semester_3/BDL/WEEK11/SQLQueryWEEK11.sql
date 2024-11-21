-- SOAL 
-- TEMPLATE
----------------------------------------------------------
SELECT *
FROM 
    sys.objects
WHERE type='pk';

-- SOAL 1
SELECT name, database_id, create_date
FROM sys.databases;
----------------------------------------------------------

-- SOAL 2
SELECT object_id, name, schema_id, type, type_desc, create_date, modify_date
FROM sys.objects 
WHERE type = 'U'
ORDER BY create_date;	
----------------------------------------------------------

-- SOAL 3
SELECT t.object_id, t.name, s.name as schema_name, t.type, t.type_desc, t.create_date, t.modify_date
FROM sys.tables as t
JOIN sys.schemas as s ON t.schema_id = s.schema_id
WHERE t.type = 'U'
ORDER BY create_date;	
----------------------------------------------------------

-- SOAL 4
SELECT c.name as column_name, c.column_id, 
TYPE_NAME(c.system_type_id)as data_type, c.max_length, c.precision, c.scale, c.collation_name 
FROM sys.columns as c 
WHERE OBJECT_ID = object_id('Sales.Customers') 
ORDER BY c.column_id;
----------------------------------------------------------

-- SOAL 5
SELECT
	DB_ID() AS database_id,
	DB_NAME() AS database_name,
	USER_ID() AS user_id,
	USER_NAME() AS user_name;
----------------------------------------------------------

-- SOAL 6
SELECT 
	name, 
	type_desc, 
	OBJECT_NAME(object_id) as object_id , 
	SCHEMA_NAME(schema_id) as schema_name
FROM sys.objects;
----------------------------------------------------------

-- SOAL 7
SELECT c.name AS column_name, OBJECT_NAME(c.object_id)
AS table_name, OBJECT_SCHEMA_NAME(c.object_id) AS schema_name 
FROM sys.columns as c WHERE c.name LIKE '%name%' AND OBJECTPROPERTY(c.object_id, 'IsUserTable')=1;
----------------------------------------------------------

-- SOAL 8
PRINT object_definition (object_id('Sales.CustOrders'));
----------------------------------------------------------

-- SOAL 9
SELECT session_id, login_time, host_name, language, login_name, date_format 
FROM sys.dm_exec_sessions;
----------------------------------------------------------

-- SOAL 10
SELECT 
	CPU_COUNT as[Logical CPU Count ],
	hyperthread_ratio as [Hyperthread Ratio],
	cpu_count / hyperthread_ratio as [Physical CPU Count],
	physical_memory_kb / 1024 as [RAM (MB)],  
	sqlserver_start_time as [Last SQL Server Start]
FROM sys.dm_os_sys_info;
----------------------------------------------------------

-- SOAL 11
SELECT 
    total_physical_memory_kb/1048576 AS [Total RAM (GB)],
    available_physical_memory_kb/1048576 AS [Available RAM (GB)],
    total_page_file_kb/1048576 AS [Total Page File (GB)],
    available_page_file_kb/1048576 AS [Available Page File (GB)],
    system_memory_state_desc AS [RAM Availability Status]
FROM sys.dm_os_sys_memory;
----------------------------------------------------------

