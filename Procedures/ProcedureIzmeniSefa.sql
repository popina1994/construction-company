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
ALTER PROCEDURE IzmeniSefa
	-- Add the parameters for the stored procedure here
	@IDMagacin IDType,
	@IDZaposleni IDType
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   	BEGIN TRY
		BEGIN TRANSACTION
        SAVE TRANSACTION ProcTakeMaterijalForNorma;
		
		DECLARE @OldSef IDType

		SELECT @OldSef = @IDZaposleni
		FROM Magacin
		WHERE @IDMagacin = IDMagacin

		UPDATE Magacin
		SET IDZaposleni = NULL
		WHERE @IDMagacin = @IDMagacin

		DELETE FROM Sef
		WHERE @OldSef = IDZaposleni

		INSERT INTO SEF(IDZaposleni)
		VALUES (@IDZaposleni)
		
		Exec ZaposliUMagacin @IDZaposleni = @IDZaposleni, @IDMagacin = @IDMagacin

		UPDATE Magacin
		SET IDZaposleni = @IDZaposleni

		COMMIT 
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
