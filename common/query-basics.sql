-- Para desactivar/activar el número de registros en cada búsqueda.
SET NOCOUNT ON;
    -- SELECT
SET NOCOUNT OFF;

-- Para no bloquear tablas
SELECT * FROM TABLE_NAME WITH (NOLOCK)

-- Obtener current identity
SELECT IDENT_CURRENT('TABLE_NAME')

-- Optimizar consultas que tiene parámetros dinámicos
@PARAMETER
WITH RECOMPILE

OPTION (RECOMPILE);


--
FORMAT(sc.d_fecha_pago, 'dd-MM-yyyy') AS FechaPago

REPLACE(FORMAT(sc.d_fecha_pago, 'dd-MM-yyyy'), '01/01/1900', '')


--
select STUFF(
(
SELECT ',', s_sed_nombre AS 'data()'     
FROM SEDE s    
where s.s_sed_codigo in (select Valor from dbo.Split('caj,tsi,tml',','))    
FOR XML PATH('')), 1, 1, '') Sede



SELECT STRING_AGG(s_sed_nombre, ',') FROM sede s where s.s_sed_codigo in (select Valor from dbo.Split('caj,tsi,tml',',')) 


select distinct e.s_car_codigo COLLATE database_default  from STG_curricula_epec