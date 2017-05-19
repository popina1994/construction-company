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
ALTER PROCEDURE InsertSadrziJedinica
	-- Add the parameters for the stored procedure here
		@IDRoba IDType,
	@IDNorma IDType,
	@jedinica int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @IDSadrzi IDType

	
	BEGIN TRY
		BEGIN TRANSACTION
		SAVE TRAN ProcInsertSadrziJedinica
		DECLARE	@return_value IDType
		EXEC	@return_value = [dbo].[InsertSadrzi]
		@IDRoba = @IDRoba,
		@IDNorma = @IDNorma

		IF @return_value = -1
		BEGIN
			THROW 50000, 'Something is wrong with execution of InsertSadrzi', 1;
		END
		SET @IDSadrzi = @return_value

		INSERT INTO SadrziJedinica(IDSadrzi, Broj)
		VALUES (@IDSadrzi, @jedinica)
		COMMIT TRANSACTION;
		RETURN @IDSadrzi
	END TRY
	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ErrorNumber
			,ERROR_SEVERITY() AS ErrorSeverity
			,ERROR_STATE() AS ErrorState
			,ERROR_PROCEDURE() AS ErrorProcedure
			,ERROR_LINE() AS ErrorLine
			,ERROR_MESSAGE() AS ErrorMessage;
		ROLLBACK TRANSACTION ProcInsertSadrziJedinica;
		THROW;
	END CATCH
	
END
GO