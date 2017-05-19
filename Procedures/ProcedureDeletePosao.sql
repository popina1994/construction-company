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
ALTER PROCEDURE DeletePosao
	-- Add the parameters for the stored procedure here
	@IDPosao IDType
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @IDObjekat IDType
	DECLARE @IDGradiliste IDType
	DECLARE @IDMagacin IDType
	DECLARE @IDSprat IDType
	DECLARE @IDNorma IDType
    -- Insert statements for procedure here
	
	BEGIN TRY
		BEGIN TRANSACTION
		SAVE TRAN ProcDeletePosao
		SELECT @IDSprat = IDSprat, @IDNorma = IDNorma
		FROM Posao 
		WHERE IDPosao = @IDPosao

		SELECT @IDObjekat = Sprat.IDObjekat
		FROM Objekat, Sprat
		WHERE Sprat.IDObjekat = Objekat.IDObjekat AND IDSprat = @IDSprat
			
		SELECT 'Objkeat' = @IDObjekat
		

		SELECT @IDGradiliste = Objekat.IDGradiliste
		FROM Gradiliste, Objekat
		WHERE Gradiliste.IDGradiliste = Objekat.IDGradiliste AND IDObjekat = @IDObjekat
		SELECT 'Grad' = @IDGradiliste
		SELECT @IDMagacin = IDMagacin
		FROM Magacin, Gradiliste
		WHERE Magacin.IDGradiliste = Gradiliste.IDGradiliste AND Gradiliste.IDGradiliste = @IDGradiliste
		SELECT 'Mag' = @IDMagacin
		-- TO DO : SET magacin, and debug this function
		EXEC	 [dbo].[ReturnMaterijalForNorma]
					@IDNorma = @IDNorma,
					@IDMagacin=@IDMagacin
		DELETE FROM Posao
		WHERE IDPosao = @IDPosao
		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ErrorNumber
			,ERROR_SEVERITY() AS ErrorSeverity
			,ERROR_STATE() AS ErrorState
			,ERROR_PROCEDURE() AS ErrorProcedure
			,ERROR_LINE() AS ErrorLine
			,ERROR_MESSAGE() AS ErrorMessage
		ROLLBACK TRANSACTION ProcDeletePosao;
		THROW;
	END CATCH
END
GO
