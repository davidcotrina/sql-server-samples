SELECT name, create_date, modify_date
FROM sys.objects
WHERE type = 'P'
AND name = 'Procedimiento_almacenado'

SELECT name
FROM sys.procedures 
WHERE name LIKE '%encuesta%'

SELECT name, create_date, modify_date, type
FROM sys.objects
WHERE type = 'U'
AND name like 'pu_%'

SELECT *
FROM sys.objects
WHERE type = 'P' 
AND name = 'PA_SEGUIMIENTO_PU_CRUD'
ORDER BY modify_date DESC