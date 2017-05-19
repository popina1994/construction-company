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
ALTER PROCEDURE TakeMaterijalForNorma
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

			SELECT 'Ima'= @IDIma
			SELECT 'Roba'= @IDRoba
			SELECT 'Magacin'= @IDMagacin

			EXEC	 [dbo].[TakeImaJedinica]
					@IDIma = @IDIma,
					@Jedinica = @Jedinica

			
			FETCH NEXT FROM @Cursor
			INTO @IDSadrzi, @Jedinica, @IDRoba
		END 

		CLOSE @Cursor
		DEALLOCATE @Cursor
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
GO
