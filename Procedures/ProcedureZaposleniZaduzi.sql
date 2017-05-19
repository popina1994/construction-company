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
ALTER PROCEDURE ZaposleniZaduzi
	-- Add the parameters for the stored procedure here
	@IDZaposleni IDType,
	@IDMagacin IDType,
	@IDRoba IDType,
	@DatumZaduzenja DateType,
	@Napomena VARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @IDIMa IDType
	DECLARE @IDZaduzio IDType
	BEGIN TRY
		BEGIN TRANSACTION
		SAVE TRANSACTION ProcZaposleniZaduzi;
		SELECT  @IDIma = IDIma FROM Ima
		WHERE IDRoba = @IDRoba AND IDMagacin = @IDMagacin

		EXEC	[dbo].[TakeImaJedinica]
			@IDIma = @IDIma,
			@Jedinica = 1
		INSERT INTO Zaduzio(IDRoba, IDMagacin, IDZaposleni, DatumZaduzenja, DatumRazduzenja, Napomena)
		VALUES (@IDRoba, @IDMagacin, @IDZaposleni, @DatumZaduzenja, NULL, @Napomena)
		SET @IDZaduzio  = SCOPE_IDENTITY()
		COMMIT TRAN
		RETURN @IDZaduzio 
	END TRY
	BEGIN CATCH
	SELECT
			ERROR_NUMBER() AS ErrorNumber
			,ERROR_SEVERITY() AS ErrorSeverity
			,ERROR_STATE() AS ErrorState
			,ERROR_PROCEDURE() AS ErrorProcedure
			,ERROR_LINE() AS ErrorLine
			,ERROR_MESSAGE() AS ErrorMessage;
        ROLLBACK TRANSACTION ProcZaposleniZaduzi;
		throw;		
	END CATCH

    
	
END
