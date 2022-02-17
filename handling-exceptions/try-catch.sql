
-- Nested TRY CATCH constructs
BEGIN TRY
    --- statements that may cause exceptions
END TRY
BEGIN CATCH
    -- statements to handle exception
    BEGIN TRY
        --- nested TRY block
    END TRY
    BEGIN CATCH
        --- nested CATCH block
    END CATCH
END CATCH

CREATE PROC usp_divide(
    @a decimal,
    @b decimal,
    @c decimal output
) AS
BEGIN
    BEGIN TRY
        SET @c = @a / @b;
    END TRY
    BEGIN CATCH
        SELECT  
            ERROR_NUMBER() AS ErrorNumber  
            ,ERROR_SEVERITY() AS ErrorSeverity  
            ,ERROR_STATE() AS ErrorState  
            ,ERROR_PROCEDURE() AS ErrorProcedure  
            ,ERROR_LINE() AS ErrorLine  
            ,ERROR_MESSAGE() AS ErrorMessage;  
    END CATCH
END;
GO