
-- Renombrar
EXEC sp_rename 'TABLE_NAME', 'NEW_TABLE_NAME'

-- Para activar/desactivar la inserción en campos identity
SET IDENTITY_INSERT NombreTabla ON
-- SENTENCIAS
SET IDENTITY_INSERT NombreTabla OFF

--RECOMENDACIONES
    --USAR smalldatetime