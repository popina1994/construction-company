USE [Projekat]
GO
/****** Object:  StoredProcedure [dbo].[ZaposliUMagacin]    Script Date: 18.05.2017. 18:31:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[ZaposliUMagacin]
	-- Add the parameters for the stored procedure here
	@IDZaposleni IDType,
	@IDMagacin IdType
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	BEGIN TRY
		BEGIN TRANSACTION
		SAVE TRANSACTION ProcZaposliUMagacin
		UPDATE Zaposleni SET IDMagacin = @IDMagacin WHERE IDZaposleni = @IDZaposleni
		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		SELECT 
			ERROR_NUMBER() AS ErrorNumber
			,ERROR_SEVERITY() AS ErrorSeverity
			,ERROR_STATE() AS ErrorState
			,ERROR_PROCEDURE() AS ErrorProcedure
			,ERROR_LINE() AS ErrorLine
			,ERROR_MESSAGE() AS ErrorMessage;
			
			ROLLBACK TRANSACTION ProcZaposliUMagacin;
			THROW;
	END CATCH 
	
	
END
