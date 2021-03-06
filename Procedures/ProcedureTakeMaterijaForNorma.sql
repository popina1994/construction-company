USE [Projekat]
GO
/****** Object:  StoredProcedure [dbo].[TakeMaterijalForNorma]    Script Date: 19.05.2017. 15:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[TakeMaterijalForNorma]
	-- Add the parameters for the stored procedure here
	@IDNorma IDType,
	@IDMagacin IDType
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @Cursor CURSOR 
	DECLARE @IDSadrzi IDType
	DECLARE @Jedinica int
	DECLARE @kolicina FloatType
	DECLARE @IDRoba IDType

	-- Insert statements for procedure here
	BEGIN TRY
		BEGIN TRANSACTION
        SAVE TRANSACTION ProcTakeMaterijalForNorma;
		SET @Cursor = CURSOR FOR 
		SELECT Sadrzi.IDSadrzi AS IDSadrzi, Broj, IDRoba 
		FROM SadrziJedinica, Sadrzi
		WHERE IDNorma = @IDNorma AND Sadrzi.IDSadrzi = SadrziJedinica.IDSadrzi

		OPEN @Cursor
	
		FETCH NEXT FROM @Cursor
		INTO @IDSadrzi, @Jedinica, @IDRoba
		WHILE @@FETCH_STATUS = 0
		BEGIN
			DECLARE @IDIma IDType
			SET @IDIma  = -1
			SELECT @IDIma = Ima.Idima  
			FROM Ima, ImaJedinica
			WHERE IMa.IDIma = ImaJedinica.IDIma AND IDRoba = @IDRoba AND @IDMagacin = IDMagacin

			EXEC	 [dbo].[TakeImaJedinica]
					@IDIma = @IDIma,
					@Jedinica = @Jedinica

			
			FETCH NEXT FROM @Cursor
			INTO @IDSadrzi, @Jedinica, @IDRoba
		END 

		CLOSE @Cursor
		DEALLOCATE @Cursor


		SET @Cursor = CURSOR FOR 
		SELECT Sadrzi.IDSadrzi AS IDSadrzi, Kolicina, IDRoba 
		FROM SadrziKolicina, Sadrzi
		WHERE IDNorma = @IDNorma AND Sadrzi.IDSadrzi = SadrziKolicina.IDSadrzi

		OPEN @Cursor
	
		FETCH NEXT FROM @Cursor
		INTO @IDSadrzi, @kolicina, @IDRoba
		WHILE @@FETCH_STATUS = 0
		BEGIN
			SET @IDIma  = -1
			SELECT @IDIma = Ima.Idima  
			FROM Ima, ImaKolicine
			WHERE IMa.IDIma = ImaKolicine.IDIma AND IDRoba = @IDRoba AND @IDMagacin = IDMagacin


			EXEC	 [dbo].[TakeImaKolicina]
					@IDIma = @IDIma,
					@kolicina=@kolicina

			
			FETCH NEXT FROM @Cursor
			INTO @IDSadrzi, @kolicina, @IDRoba
		END 

		CLOSE @Cursor
		DEALLOCATE @Cursor

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	SELECT
			ERROR_NUMBER() AS ErrorNumber
			,ERROR_SEVERITY() AS ErrorSeverity
			,ERROR_STATE() AS ErrorState
			,ERROR_PROCEDURE() AS ErrorProcedure
			,ERROR_LINE() AS ErrorLine
			,ERROR_MESSAGE() AS ErrorMessage;
        ROLLBACK TRANSACTION ProcTakeMaterijalForNorma;
		throw;		
	END CATCH

END
