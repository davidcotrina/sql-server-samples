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


-- OFFSET & FETCH NEXT
SELECT * 
FROM TABLE_NAME
ORDER BY COLUMN_NAME        --> *
OFFSET 5 ROWS               --> Omite las 5 primeras filas
FETCH NEXT 2 ROWS ONLY;     --> Obtiene las 2 siguientes
-- OR
OFFSET 0 ROWS               --> No omite ninguna
FETCH FIRST 10 ROWS ONLY;   --> Obtiene las 10 primeras


-- COALESCE vs. CASE expression
-- expression to evaluate a list of arguments and to return the first number:
SELECT 
    COALESCE(NULL, NULL, 100, 200) result;
--
COALESCE(e1,e2,e3)
--OR
CASE
    WHEN e1 IS NOT NULL THEN e1
    WHEN e2 IS NOT NULL THEN e2
    ELSE e3
END


-- NULLIF and CASE expression
-- The NULLIF expression accepts two arguments and returns NULL if two arguments are equal. Otherwise, it returns the first expression.
SELECT 
    NULLIF(a,b)
--OR
CASE 
    WHEN a=b THEN NULL 
    ELSE a 
END