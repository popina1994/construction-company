USE [Projekat]
GO
/****** Object:  StoredProcedure [dbo].[InsertIma]    Script Date: 19.05.2017. 2:28:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[InsertIma]
	-- Add the parameters for the stored procedure here
	@IDMagacin IDType,
	@IDRoba IDType
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @IDIma IDType

    -- Insert statements for procedure here
	
	BEGIN TRY
		BEGIN TRANSACTION
		SAVE TRAN ProcInsertIma
		INSERT INTO Ima(IDMagacin, IDRoba)
		VALUES (@IDMagacin, @IDRoba)
		SET @IDIma = SCOPE_IDENTITY()
		COMMIT TRAN
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
			IF @@TRANCOUNT > 0
		ROLLBACK TRANSACTION ProcInsertIma;
		THROW

	END CATCH

END

