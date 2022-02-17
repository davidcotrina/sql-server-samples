DECLARE @StartTime DATETIME = GETDATE();

CREATE TABLE #ALUMNO(s_alu_codigo VARCHAR(20), s_sem_codigo_ingreso VARCHAR(6), s_car_codigo VARCHAR(20), n_unidad_negocio_id INT, s_alu_egresa VARCHAR(20));
CREATE CLUSTERED INDEX ix_tempALUMNO ON #ALUMNO (s_alu_codigo);

INSERT INTO #ALUMNO
SELECT 
	A.s_alu_codigo
	,A.s_sem_codigo_ingreso
	,A.s_car_codigo
	,A.n_unidad_negocio_id
	,AD.s_alu_egresa
--INTO #ALUMNO
FROM alumno A WITH (NOLOCK) 
JOIN alumno_datos AD ON A.s_alu_codigo = AD.s_alu_codigo AND A.s_alu_codigo LIKE 'N%'
OPTION (RECOMPILE);

select * from #alumno;

DROP TABLE #ALUMNO;

PRINT DATEDIFF(ms,@StartTime,GETDATE());