USE BD_UPNSAC_DES
GO

DECLARE @JSON VARCHAR(MAX) = N'{"id":"1","questions":{"1":"1","2":"9","3":"13","4":"17","5":"dddd"}}'
DECLARE @S_ENCUESTADO_CODIGO varchar(15) = '18859999-6'

BEGIN TRANSACTION
BEGIN TRY
	IF ((SELECT ISJSON(@JSON)) = 0) SELECT 'ERROR JSON'

	DECLARE @N_ENCUESTA_ID INT = CAST((SELECT JSON_VALUE(@JSON, '$.id')) AS int)
	IF (@N_ENCUESTA_ID IS NULL) SELECT 'ERROR ENCUESTA_ID';

	DECLARE @N_ENCUESTADO_ID INT = (SELECT n_encuestado_id FROM surv.encuestado WHERE n_encuesta_id = @N_ENCUESTA_ID AND s_codigo = @S_ENCUESTADO_CODIGO)
	IF (@N_ENCUESTADO_ID IS NULL) SELECT 'ERROR ENCUESTADO_ID';

	DROP TABLE IF EXISTS surv.#SURV_QUESTIONS;
	CREATE TABLE surv.#SURV_QUESTIONS(
		n_option_id INT,
		s_value VARCHAR(512),
		n_type INT
	);

	INSERT INTO #SURV_QUESTIONS
	SELECT * FROM OPENJSON(@JSON,'$.questions') 
	IF NOT EXISTS(SELECT * FROM #SURV_QUESTIONS) SELECT 'ERROR_QUESTIONS';

	DECLARE @FECHA_ENCUESTA DATETIME2(0) = SYSDATETIME();

	INSERT INTO surv.respuesta
	SELECT
		'x'
		,n_option_id
		,s_value
		,1
		,'SYS'
		,@FECHA_ENCUESTA
		,NULL
		,NULL
	FROM #SURV_QUESTIONS;

	UPDATE surv.encuestado
	SET d_fecha_encuesta = @FECHA_ENCUESTA
	WHERE n_encuestado_id = @N_ENCUESTADO_ID;
	--COMMIT TRANSACTION
END TRY
BEGIN CATCH
	select @@TRANCOUNT --número de transacciones abierto en la sessión actual
	select XACT_STATE()
	select @@rowcount --Returns the number of rows affected by the last statement.
	select @@ERROR --Returns the error number for the last Transact-SQL statement executed.
	
	/* Ocurrió un error, deshacemos los cambios*/ 
	ROLLBACK TRANSACTION



	DECLARE @ErrorMessage VARCHAR(4000) = ERROR_MESSAGE();
	DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
	DECLARE @ErrorState INT = ERROR_STATE();

	--SELECT @ErrorMessage as ErrorMessage, @ErrorSeverity as ErrorSeverity, @ErrorState as ErrorState;
	RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
END CATCH

IF @@TRANCOUNT > 0  
    COMMIT TRANSACTION;  
GO  