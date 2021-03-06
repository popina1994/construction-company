USE [Projekat]
GO
/****** Object:  StoredProcedure [dbo].[InsertImaJedinica]    Script Date: 19.05.2017. 15:06:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[InsertImaJedinica]
	-- Add the parameters for the stored procedure here
	@IDMagacin IDType,
	@IDRoba IDType,
	@jedinica int 
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @IDIma IDType
	
	
		BEGIN TRY
			BEGIN TRANSACTION ProcInsertImaJedinica
			SAVE TRAN ProcInsertImaJedinica;		
			IF EXISTS (SELECT * FROM Ima WHERE IDRoba = @IDRoba AND IDMagacin = @IDMagacin)
				BEGIN
					SELECT @IDIma = IDIma FROM Ima WHERE  IDRoba = @IDRoba AND IDMagacin = @IDMagacin
					UPDATE ImaJedinica
					SET Jedinica = Jedinica + @jedinica
					WHERE IDIma = @IDIma
				END
			ELSE 
			BEGIN 
		

				DECLARE	@return_value int
				EXEC	@return_value = [dbo].[InsertIma]
				@IDMagacin = @IDMagacin,
				@IDRoba= @IDRoba

				IF @return_value = -1
				BEGIN

					THROW 50000, 'Something is wrong with execution of InsertIma', 1;
				END
				SET @IDIma = @return_value

				INSERT INTO ImaJedinica(IDIma, Jedinica)
				VALUES (@IDIma, @jedinica)
			END
			
			COMMIT TRANSACTION;
			RETURN @IDIma
		END TRY
			BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ErrorNumber
			,ERROR_SEVERITY() AS ErrorSeverity
			,ERROR_STATE() AS ErrorState
			,ERROR_PROCEDURE() AS ErrorProcedure
			,ERROR_LINE() AS ErrorLine
			,ERROR_MESSAGE() AS ErrorMessage;

		ROLLBACK TRANSACTION ProcInsertImaJedinica;
		THROW;
	END CATCH

END
