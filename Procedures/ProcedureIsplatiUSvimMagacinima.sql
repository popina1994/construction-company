-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE IsplatiUSvimMagacinima
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

     BEGIN TRY
		BEGIN TRANSACTION
        SAVE TRANSACTION ProcIsplatiUSvimMagacinima
		
		DECLARE @Cursor CURSOR 
		DECLARE @IDMagacin IDType
		

		SET @Cursor = CURSOR FOR
		SELECT IDMagacin
		FROM Magacin
		OPEN @Cursor
		FETCH NEXT FROM @Cursor 
		INTO @IDMagacin

		WHILE @@FETCH_STATUS = 0
		BEGIN 
			EXEC IsplatiZaposlenogUMagacinu
			@IDMagacin = @IDMagacin;


			FETCH NEXT FROM @Cursor
			INTO @IDMagacin
		END 

		CLOSE @Cursor
		DEALLOCATE @Cursor 

		COMMIT 
	END TRY
	BEGIN CATCH
	SELECT
			ERROR_NUMBER() AS ErrorNumber
			,ERROR_SEVERITY() AS ErrorSeverity
			,ERROR_STATE() AS ErrorState
			,ERROR_PROCEDURE() AS ErrorProcedure
			,ERROR_LINE() AS ErrorLine
			,ERROR_MESSAGE() AS ErrorMessage;
        ROLLBACK TRANSACTION ProcIsplatiUSvimMagacinima;
		throw;		
	END CATCH
END
GO
