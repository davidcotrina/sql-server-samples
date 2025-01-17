-- Si los datos están en SOURCE pero no están en TARGET “WHEN NOT MATCHED BY TARGET THEN”.
-- Si los datos están en TARGET pero no en SOURCE “WHEN NOT MATCHED BY SOURCE THEN”.

MERGE <table_destino> [AS TARGET]
USING <table_origen> [AS SOURCE]
   ON <condicion_compara_llaves>
[WHEN MATCHED THEN 
    <accion cuando coinciden> ]
[WHEN NOT MATCHED [BY TARGET] THEN 
    <accion cuando no coinciden por destino> ]
[WHEN NOT MATCHED BY SOURCE THEN 
    <accion cuando no coinciden por origen> ];

WHEN MATCHED THEN
WHEN NOT MATCHED BY TARGET THEN
	--Los registros del SOURCE que NO están en el TARGET.
WHEN NOT MATCHED BY SOURCE THEN
	--Los registros del TARGET que NO están en el SOURCE.


-- EJM
MERGE STG_facultad AS T   
USING (
        SELECT * FROM PETCABDPW06.BD_UPNSAC.dbo.facultad fa WITH (NOLOCK)
        WHERE fa.n_facultad_id NOT IN (8,11,12)
    ) AS S  
ON (T.n_facultad_id = S.n_facultad_id)    
WHEN NOT MATCHED BY TARGET THEN
    INSERT (n_facultad_id,s_nombre,s_descripcion) 
    VALUES (S.n_facultad_id,S.s_nombre,S.s_descripcion) 
WHEN MATCHED THEN 
    UPDATE SET T.s_nombre = S.s_nombre, T.s_descripcion = S.s_descripcion   
WHEN NOT MATCHED BY SOURCE THEN 
    DELETE;  