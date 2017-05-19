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
ALTER PROCEDURE TakeImaKolicina
	-- Add the parameters for the stored procedure here
	@IDIma IDType,
	@kolicina FloatType
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	
	BEGIN TRY
		BEGIN TRANSACTION ProcTakeImaKolicina
		SAVE TRAN ProcTakeImaKolicina
		IF EXISTS (SELECT * FROM ImaKolicine WHERE @IDIma = IDIma)
		BEGIN
			DECLARE @oldKolicina int
			SELECT @oldKolicina = Kolicina FROM ImaKolicine WHERE @IDIma = IDIma
			IF (@kolicina > @oldKolicina)
			BEGIN
				RETURN -1
			END
			ELSE IF (@kolicina = @oldKolicina)
			BEGIN
				DELETE FROM Ima WHERE @IDIma = IDIma
			END
			ELSE 
			BEGIN
				UPDATE ImaKolicine
				SET Kolicina = Kolicina - @kolicina
				WHERE @IDIma = IDIma
			END
		END
		ELSE 
			THROW 50000, 'Wrong id', 1;

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
			
			ROLLBACK TRANSACTION ProcTakeImaKolicina;
			THROW;		
	END CATCH
END
GO
