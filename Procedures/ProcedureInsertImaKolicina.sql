USE [Projekat]
GO
/****** Object:  StoredProcedure [dbo].[InsertImaKolicina]    Script Date: 19.05.2017. 15:05:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[InsertImaKolicina]
	-- Add the parameters for the stored procedure here
	@IDMagacin IDType,
	@IDRoba IDType,
	@kolicina FloatType
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @IDIma IDType

	
	BEGIN TRY
		BEGIN TRANSACTION 
		SAVE TRAN ProcInsertImaKolicina
		IF EXISTS (SELECT * FROM Ima WHERE IDRoba = @IDRoba AND IDMagacin = @IDMagacin)
				BEGIN
					SELECT @IDIma = IDIma FROM Ima WHERE  IDRoba = @IDRoba AND IDMagacin = @IDMagacin
					UPDATE ImaKolicine
					SET Kolicina = Kolicina+ @kolicina
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
				THROW -1, 'Something is wrong with execution of InsertIma', 1;
			END
			SET @IDIma = @return_value
			SELECT 'Nesto' = @return_value

			INSERT INTO ImaKolicine(IDIma, Kolicina)
			VALUES (@IDIma, @kolicina)
			COMMIT TRANSACTION;
			RETURN @IDIma
		END
		END TRY
			BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ErrorNumber
			,ERROR_SEVERITY() AS ErrorSeverity
			,ERROR_STATE() AS ErrorState
			,ERROR_PROCEDURE() AS ErrorProcedure
			,ERROR_LINE() AS ErrorLine
			,ERROR_MESSAGE() AS ErrorMessage;
			
		ROLLBACK TRANSACTION ProcInsertImaKolicina;
		THROW;
	END CATCH



END

