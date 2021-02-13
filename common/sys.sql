SELECT
	i.cpu_count
	,(i.physical_memory_kb / 1024) / 1024 physical_memory_GB
	,(i.virtual_memory_kb / 1024) / 1024 / 1024 virtual_memory_TB 
FROM sys.dm_os_sys_info i


EXEC sp_spaceused 'TABLE_NAME'