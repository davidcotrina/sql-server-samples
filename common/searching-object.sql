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


-- Buscar Tablas
select * from sys.tables where name like '%alumno%'

-- Buscar Dependencias
exec sp_depends campus_sede

SELECT OBJECT_NAME (referencing_id),referenced_database_name, 
       referenced_schema_name, referenced_entity_name
FROM sys.sql_expression_dependencies d
WHERE OBJECT_NAME(d.referenced_id) = 'campus_sede' -- table that has miss-spelled column
      AND OBJECT_DEFINITION (referencing_id)  LIKE '%n_sed_id%'; -- miss-spelled column