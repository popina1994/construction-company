USE [Projekat]
GO
/****** Object:  StoredProcedure [dbo].[InsertMagacin]    Script Date: 19.05.2017. 2:28:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[InsertMagacin]
	-- Add the parameters for the stored procedure here
	@IDGradiliste IDType,
	@IDSef IDType,
	@plata FloatType
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @IDMagacinRet IDType

    BEGIN TRANSACTION
	BEGIN TRY
		INSERT INTO Sef(IDZaposleni) VALUES (@IDSef)
		INSERT INTO Magacin(IDGradiliste, IDZaposleni, Plata) VALUES(@IDGradiliste, @IDSef, @plata)
		DECLARE	@return_value int
		SET @IDMagacinRet = SCOPE_IDENTITY()
		EXEC	@return_value = [dbo].[ZaposliUMagacin]
		@IDZaposleni = @IDSef,
		@IDMagacin = @IDMagacinRet

		IF @return_value = -1
		BEGIN
			THROW -1, 'Something is wrong with execution of ZaposliUMagacin', 1;
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
			IF @@TRANCOUNT > 0
		BEGIN
			ROLLBACK TRANSACTION;
		END
		RETURN -1;
	END CATCH
	IF @@TRANCOUNT > 0
		COMMIT TRANSACTION;
	RETURN @IDMagacinRet

END

