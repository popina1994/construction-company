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
ALTER PROCEDURE UzmiRobuIzMagacinPoJed
	-- Add the parameters for the stored procedure here
	@IDRoba IDType,
	@IDMagacin IDType,
	@jedinica int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DECLARE @jedinicaIma int
	DECLARE @IDIma IDType
	BEGIN TRY
		BEGIN TRANSACTION
        SAVE TRANSACTION ProcUzmiRobuIzMagacinPoJed;
		SELECT @jedinicaIma = Jedinica, @IDIma = Ima.IDIma
		FROM Ima, ImaJedinica
		WHERE @IDRoba = IDRoba AND @IDMagacin = IDMagacin AND Ima.IDIma = ImaJedinica.IDIma;

		-- If there is more robe than it is needed we just take the amount which we need
		IF @jedinicaIma >= @jedinica
			SET @jedinicaIma = @jedinica

		-- Insert statements for procedure here
		EXEC [TakeImaJedinica] @IDIma = @IDIma, @jedinica = @jedinicaIma
		COMMIT 
		RETURN @jedinicaIma
	END TRY
	BEGIN CATCH
	SELECT
			ERROR_NUMBER() AS ErrorNumber
			,ERROR_SEVERITY() AS ErrorSeverity
			,ERROR_STATE() AS ErrorState
			,ERROR_PROCEDURE() AS ErrorProcedure
			,ERROR_LINE() AS ErrorLine
			,ERROR_MESSAGE() AS ErrorMessage;
        ROLLBACK TRANSACTION ProcUzmiRobuIzMagacinPoJed;
		throw;		
	END CATCH
END
GO
