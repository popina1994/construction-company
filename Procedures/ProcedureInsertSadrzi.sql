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
ALTER PROCEDURE InsertSadrzi
	-- Add the parameters for the stored procedure here
	@IDRoba IDType,
	@IDNorma IDType
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   -- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @IDSadrzi IDType

    -- Insert statements for procedure here
	BEGIN TRANSACTION
	BEGIN TRY
		INSERT INTO Sadrzi(IDNorma, IDRoba)
		VALUES (@IDNorma, @IDRoba)
		SET @IDSadrzi = SCOPE_IDENTITY()
	END TRY
	BEGIN CATCH
			SELECT
			ERROR_NUMBER() AS ErrorNumber
			,ERROR_SEVERITY() AS ErrorSeverity
			,ERROR_STATE() AS ErrorState
			,ERROR_PROCEDURE() AS ErrorProcedure
			,ERROR_LINE() AS ErrorLine
			,ERROR_MESSAGE() AS ErrorMessage;
			IF @@TRANCOUNT > 0
		BEGIN
			ROLLBACK TRANSACTION;
		END
		RETURN -1;

	END CATCH
	IF @@TRANCOUNT > 0
		COMMIT TRAN
	RETURN @IDSadrzi
END
GO
