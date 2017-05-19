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
CREATE PROCEDURE InsertImaJedinica
	-- Add the parameters for the stored procedure here
	@IDMagacin IDType,
	@IDRoba IDType,
	@jedinica int 
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @IDIma IDType

	BEGIN TRANSACTION
		BEGIN TRY
		DECLARE	@return_value int
		EXEC	@return_value = [dbo].[InsertIma]
		@IDMagacin = @IDMagacin,
		@IDRoba= @IDRoba

		IF @return_value = -1
		BEGIN
			THROW -1, 'Something is wrong with execution of InsertIma', 1;
		END
		SET @IDIma = @return_value

		INSERT INTO ImaJedinica(IDIma, Jedinica)
		VALUES (@IDIma, @jedinica)

		END TRY
			BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ErrorNumber
			,ERROR_SEVERITY() AS ErrorSeverity
			,ERROR_STATE() AS ErrorState
			,ERROR_PROCEDURE() AS ErrorProcedure
			,ERROR_LINE() AS ErrorLine
			,ERROR_MESSAGE() AS ErrorMessage;
			IF @@TRANCOUNT > 0
			BEGIN
				ROLLBACK TRANSACTION;
			END
		RETURN -1;
	END CATCH
	IF @@TRANCOUNT > 0
		COMMIT TRANSACTION;
	RETURN @IDIma
END
GO
