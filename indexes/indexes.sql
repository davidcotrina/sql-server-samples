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


-- ALUMNO DATOS
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE Name = 'IX_alumno_datos_IX03' AND object_id = OBJECT_ID('alumno_datos'))
BEGIN 
	CREATE NONCLUSTERED INDEX IX_alumno_datos_IX03 ON [dbo].[alumno_datos] ([s_alu_dni],[s_alu_codigo]);
END

-- LOE_TIPO_ESTUDIANTE
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE Name = 'CLIX_LOE_TIPO_ESTUDIANTE' AND object_id = OBJECT_ID('LOE_TIPO_ESTUDIANTE'))
BEGIN 
	CREATE CLUSTERED INDEX CLIX_LOE_TIPO_ESTUDIANTE ON LOE_TIPO_ESTUDIANTE (SPRIDEN_ID);
END


/*
CREATE NONCLUSTERED INDEX [NOMBRE_INDEX]  
ON [NOMBRE_TABLA] ([CAMPOS_CLAVE])
INCLUDE ([CAMPOS_EXTRA])


--PARTIMOS DE QUE CADA QUERY TIENE UN LOGICA PROPIA

CAMPOS_CLAVE: VAN LOS CAMPOS USADOS CON `JOIN` Y `WHERE CLAUSE` 

CAMPOS_EXTRA: LOS CAMPOS DEL SELECT, SE PUEDE INCLUIR EL PK QUE PUEDE SER CLUSTERED

*/