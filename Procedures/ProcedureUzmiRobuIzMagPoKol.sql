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
ALTER PROCEDURE UzmiRobuIzMagacinPoKol
	-- Add the parameters for the stored procedure here
	@IDRoba IDType,
	@IDMagacin IDType,
	@kolicina FloatType
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @kolicinaIma FLoatType
	DECLARE @IDIma IDType
	BEGIN TRY
		BEGIN TRANSACTION
        SAVE TRANSACTION ProcUzmiRobuIzMagacinPoKol;
		SELECT @kolicinaIma = Kolicina, @IDIma = Ima.IDIma
		FROM Ima, ImaKolicine
		WHERE @IDRoba = IDRoba AND @IDMagacin = IDMagacin AND Ima.IDIma = ImaKolicine.IDIma;

		IF @kolicinaIma >= @kolicina
			SET @kolicinaIma = @kolicina

		-- Insert statements for procedure here
		EXEC [TakeImaKolicina] @IDIma = @IDIma, @kolicina = @kolicinaIma
		COMMIT 
		RETURN @kolicinaIma
	END TRY
	BEGIN CATCH
	SELECT
			ERROR_NUMBER() AS ErrorNumber
			,ERROR_SEVERITY() AS ErrorSeverity
			,ERROR_STATE() AS ErrorState
			,ERROR_PROCEDURE() AS ErrorProcedure
			,ERROR_LINE() AS ErrorLine
			,ERROR_MESSAGE() AS ErrorMessage;
        ROLLBACK TRANSACTION ProcUzmiRobuIzMagacinPoKol;
		throw;		
	END CATCH
END
GO
