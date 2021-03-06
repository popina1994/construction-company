USE [Projekat]
GO
/****** Object:  StoredProcedure [dbo].[InsertPosao]    Script Date: 20.05.2017. 17:36:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[InsertPosao]
	-- Add the parameters for the stored procedure here
	@IDNorma IDType,
	@IDSprat IDType,
	@DatumPocetka DateType
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @IDPosao IDType
	DECLARE @IDObjekat IDType
	DECLARE @IDGradiliste IDType
	DECLARE @IDMagacin IDType
    -- Insert statements for procedure here
	
	BEGIN TRY
		BEGIN TRANSACTION
		SAVE TRAN ProcInsertPosao

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
		EXEC	 [dbo].[TakeMaterijalForNorma]
					@IDNorma = @IDNorma,
					@IDMagacin=@IDMagacin
		INSERT INTO Posao(IDSprat, IDNorma, DatumPocetka, DatumKraja, Status)
		VALUES ( @IDSprat, @IDNorma, @DatumPocetka, NULL, 'U')
		SET @IDPosao = SCOPE_IDENTITY()
		COMMIT TRANSACTION;
		RETURN @IDPosao
	END TRY
	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ErrorNumber
			,ERROR_SEVERITY() AS ErrorSeverity
			,ERROR_STATE() AS ErrorState
			,ERROR_PROCEDURE() AS ErrorProcedure
			,ERROR_LINE() AS ErrorLine
			,ERROR_MESSAGE() AS ErrorMessage
		ROLLBACK TRANSACTION ProcInsertPosao;
		THROW;
	END CATCH


END
