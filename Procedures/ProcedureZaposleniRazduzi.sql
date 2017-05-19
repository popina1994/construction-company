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
CREATE PROCEDURE ZaposleniRazduzi
	-- Add the parameters for the stored procedure here
	@IDZaduzi IDType,
	@DatumRazduzenja DateType
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SET NOCOUNT ON;

	DECLARE @IDIMa IDType
	DECLARE @IDRoba IDType
	DECLARE @IDMagacin IDType
	DECLARE @IDZaposleni IDType
	BEGIN TRY
		BEGIN TRANSACTION
		SAVE TRANSACTION ProcZaposleniRazduzi;

		SELECT @IDRoba = IDRoba, @IDMagacin = IDMagacin, @IDZaposleni = IDZaposleni
		FROM Zaduzio
		WHERE @IDZaduzi = IDZaduzio

		SELECT  @IDIma = IDIma FROM Ima
		WHERE IDRoba = @IDRoba AND IDMagacin = @IDMagacin

		EXEC	[dbo].[InsertImaJedinica]
			@IDMagacin = @IDMagacin,
			@IDRoba = @IDRoba,
			@Jedinica = 1
		UPDATE Zaduzio
		SET DatumRazduzenja = @DatumRazduzenja
		UPDATE Zaposleni
		SET BrojZaduzeneOpreme = BrojZaduzeneOpreme - 1
		WHERE IDZaposleni = @IDZaposleni
		COMMIT TRAN
	END TRY
	BEGIN CATCH
	SELECT
			ERROR_NUMBER() AS ErrorNumber
			,ERROR_SEVERITY() AS ErrorSeverity
			,ERROR_STATE() AS ErrorState
			,ERROR_PROCEDURE() AS ErrorProcedure
			,ERROR_LINE() AS ErrorLine
			,ERROR_MESSAGE() AS ErrorMessage;
        ROLLBACK TRANSACTION ProcZaposleniRazduzi;
		throw;		
	END CATCH
END
GO
