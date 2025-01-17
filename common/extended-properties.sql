SQL_EXTENDED_PROPERTY

--https://solutioncenter.apexsql.com/sql-server-extended-properties/

--Ejemplo
EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'PD: EN PROCESO DOCENTE / RE: PENDIENTE RECUPERACION / CA: CIERRE ACADEMICO' , 
    @level0type=N'SCHEMA',
    @level0name=N'dbo', 
    @level1type=N'TABLE',
    @level1name=N'alumno_nota', 
    @level2type=N'COLUMN',
    @level2name=N's_alno_estado';

EXECUTE sp_addextendedproperty 
    @name = N'PurposeOfNameColumn'
    ,@value = N'Holds name of employee'
    ,@level0type = N'SCHEMA'
    ,@level0name = 'dbo'
    ,@level1type = N'Table'
    ,@level1name = 'SQLTable'
    ,@level2type = 'Column'
    ,@level2name = 'Name';


EXECUTE sp_updateextendedproperty 
    @name = N'PurposeOfNameColumn'
    ,@value = N'Holds first name of employee'
    ,@level0type = N'SCHEMA'
    ,@level0name = 'dbo'
    ,@level1type = N'Table'
    ,@level1name = 'SQLTable'
    ,@level2type = 'Column'
    ,@level2name = 'Name';


 EXECUTE sp_dropextendedproperty 
    @name = N'PurposeOfNameColumn'
    --,@value = N'Holds first name of employee'
    ,@level0type = N'SCHEMA'
    ,@level0name = 'dbo'
    ,@level1type = N'Table'
    ,@level1name = 'SQLTable'
    ,@level2type = 'Column'
    ,@level2name = 'Name';


--Visualizar extended properties
SELECT
   SCHEMA_NAME(tbl.schema_id) AS SchemaName,	
   tbl.name AS TableName, 
   clmns.name AS ColumnName,
   p.name AS ExtendedPropertyName,
   CAST(p.value AS sql_variant) AS ExtendedPropertyValue
FROM
   sys.tables AS tbl
   INNER JOIN sys.all_columns AS clmns ON clmns.object_id=tbl.object_id
   INNER JOIN sys.extended_properties AS p ON p.major_id=tbl.object_id AND p.minor_id=clmns.column_id AND p.class=1

CREATE VIEW V_TABLE_DESCRIPTION
AS
SELECT
   SCHEMA_NAME(tbl.schema_id) AS SchemaName,	
   tbl.name AS TableName, 
   clmns.name AS ColumnName,
   p.name AS ExtendedPropertyName,
   CAST(p.value AS sql_variant) AS ExtendedPropertyValue
FROM
   sys.tables AS tbl
   JOIN sys.all_columns AS clmns ON clmns.object_id=tbl.object_id
   JOIN sys.extended_properties AS p ON p.major_id=tbl.object_id AND p.minor_id=clmns.column_id AND p.class=1

--HELPER
CREATE PROCEDURE PA_INSERT_UPDATE_EXTENDED_PROPERTIES
(
	@name varchar(128)
	,@value varchar(128)
	,@table varchar(128)
	,@column varchar(128)
	,@schema varchar(128) = N'dbo'
)
AS

IF EXISTS (
			SELECT NULL FROM sys.extended_properties 
			WHERE [major_id] = OBJECT_ID(@table) AND [name] = @name 
			AND [minor_id] = (SELECT [column_id] FROM sys.columns WHERE [name] = @column AND [object_id] = OBJECT_ID(@table))
			)
	EXEC sys.sp_updateextendedproperty @name,@value,'SCHEMA',@schema,'TABLE',@table,'COLUMN',@column;
ELSE 
	EXEC sys.sp_addextendedproperty @name,@value,'SCHEMA',@schema,'TABLE',@table,'COLUMN',@column;