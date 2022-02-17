SELECT
	i.cpu_count
	,(i.physical_memory_kb / 1024) / 1024 physical_memory_GB
	,(i.virtual_memory_kb / 1024) / 1024 / 1024 virtual_memory_TB 
FROM sys.dm_os_sys_info i


EXEC sp_spaceused 'TABLE_NAME'

SELECT ORIGINAL_LOGIN() 
SELECT DB_NAME()


-- Ver el último identity de una tabla
SELECT
	OBJECT_NAME(object_id) AS TableName, 
  	name AS ColumnName, 
  	TYPE_NAME(system_type_id) AS DataType, 
  	last_value
FROM sys.identity_columns ic
WHERE 
	OBJECT_NAME(object_id) = 'TABLE_NAME'

select SUSER_NAME(), HOST_NAME()