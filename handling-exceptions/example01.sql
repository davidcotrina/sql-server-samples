BEGIN TRANSACTION

BEGIN TRY
	--your code here

	INSERT INTO A VALUES (10, 'A')

	/* Confirmamos la transaccion*/
	COMMIT TRANSACTION
END TRY

BEGIN CATCH
	/* Ocurrió un error, deshacemos los cambios*/ 
	ROLLBACK TRANSACTION

	DECLARE @ErrorMessage VARCHAR(4000) = ERROR_MESSAGE();
	DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
	DECLARE @ErrorState INT = ERROR_STATE();


	--SELECT @ErrorMessage as ErrorMessage, @ErrorSeverity as ErrorSeverity, @ErrorState as ErrorState;

	RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);

END CATCH