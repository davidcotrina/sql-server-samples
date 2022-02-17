-- ERROR_LINE() returns the line number on which the exception occurred.
-- ERROR_MESSAGE() returns the complete text of the generated error message.
-- ERROR_PROCEDURE() returns the name of the stored procedure or trigger where the error occurred.
-- ERROR_NUMBER() returns the number of the error that occurred.
-- ERROR_SEVERITY() returns the severity level of the error that occurred.
-- ERROR_STATE() returns the state number of the error that occurred.


CREATE PROC usp_report_error
AS
BEGIN
    SELECT   
        ERROR_NUMBER() AS ErrorNumber  
        ,ERROR_SEVERITY() AS ErrorSeverity  
        ,ERROR_STATE() AS ErrorState  
        ,ERROR_LINE () AS ErrorLine  
        ,ERROR_PROCEDURE() AS ErrorProcedure  
        ,ERROR_MESSAGE() AS ErrorMessage; 
END
GO

-- Para capturar las transacciones
SET XACT_ABORT ON


INSERT INTO dbo.dbErrorLogs (UserName,ErrorNumber,ErrorState,ErrorSeverity,ErrorLine,ErrorProcedure,ErrorMessage,ErrorOccuredOn)
        VALUES (SUSER_SNAME(),ERROR_NUMBER(),ERROR_STATE(),ERROR_SEVERITY(),ERROR_LINE(),ERROR_PROCEDURE(),ERROR_MESSAGE(),GETDATE())


--XACT_STATE 
-- IS 1 : la transacción es comprometible
-- IS -1: la transacción no se puede comprometer y se debe revertir
-- IS 0 : no hay transacciones pendientes
-- Se puede generar un error y obtener transacción comprometible