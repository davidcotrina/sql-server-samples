-- INDICES
	--Sin indice: Table Scan
	--clustered: Index Scan
	--Index Seek: se busca por indice cluster

-- NAME CONVENTIONS
	-- PK_ for primary keys
	-- CLIX_ for Clustered Index (non PK)
	-- UK_ for unique keys
	-- IX_ for non clustered non unique indexes
	-- UX_ for unique indexes


-- PK / CLUSTERED INDEX
	-- Un campo que sea PK no necesariamente tiene que ser INDEX CLUSTER, IDENTITY y viceversa
	-- Si se elimina PK de una tabla el IDENTITY se mantiene
	-- Cuando se crea un PK automáticamente se crea un INDEX CLUSTERED
	-- Cuando se crea un INDEX CLUSTERED no se crea un PK


-- Para buscar indices de una tabla
EXEC sp_helpindex 'TABLE_NAME'


-- 
SELECT * FROM sys.sysindexes


CREATE CLUSTERED INDEX IDX_NAME ON [dbo].[TABLE] (COLUMNS)


-- COLUMNS_1: Son columnas en donde se realiza la búsqueda en WHERE CLAUSE
-- COLUMNS_2: Son columnas que se muestran en el resultado en SELECT CLAUSE
CREATE NONCLUSTERED INDEX IDX_TABLE_NAME
ON TABLE_NAME (COLUMNS_1)
INCLUDE (COLUMNS_2);


-- Eliminar INDEX
-- No aplica para PK CLUSTERED INDEX porque es un CONSTRAINT
DROP INDEX INDEX_NAME ON TABLE_NAME;


-- Para eliminar PK CLUSTERED INDEX, se tiene que eliminar el PK.
ALTER TABLE TABLE_NAME DROP CONSTRAINT PK_COLUMN_NAME;


SELECT  'DROP INDEX [' + ix.name + '] ON ' + OBJECT_NAME(ID) + '; '
FROM  sysindexes ix
WHERE   ix.Name IS NOT null and ix.Name like '%PU_alumnos_riesgo_%'
