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
ALTER PROCEDURE ZavrsiRadIDajPlateIZavrsiPosao
	-- Add the parameters for the stored procedure here
	@IDPosao IDType,
	@DatumKraja DateType
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		BEGIN TRANSACTION
        SAVE TRANSACTION ProcZavrsiRadIDajPlate;
		
		UPDATE Rad 
		SET DatumKraja = @DatumKraja
		WHERE (@IDPosao = IDPosao) AND (DatumKraja IS NULL)
		
		DECLARE @Cursor CURSOR 
		DECLARE @IDZaposleni IDType

		SET @Cursor = CURSOR FOR 
		SELECT DISTINCT(IDZaposleni)
		FROM Rad 
		WHERE @IDPosao = IDPosao

		OPEN @CUrsor
		FETCH NEXT FROM @Cursor 
		INTO @IDZaposleni

		WHILE @@FETCH_STATUS = 0
		BEGIN
			DECLARE @Plata FloatType
			DECLARE @BrojDana int
			DECLARE @TrajanjePosla int 
			DECLARE @JedinicnaPlata FloatType

			SELECT @BrojDana = SUM(DATEDIFF(DAY, DatumPocetka, DatumKraja + 1))
			FROM Rad
			WHERE IDZaposleni = @IDZaposleni

			SELECT @TrajanjePosla = DATEDIFF(DAY, DatumPocetka, @DatumKraja + 1)
			FROM Posao
			WHERE IDPosao = @IDPosao

			SELECT @JedinicnaPlata = Plata
			FROM Norma, Posao
			WHERE @IDPosao = IDPosao AND Norma.IDNorma = Posao.IDNorma

			UPDATE Zaposleni
			SET IsplaceniIznos = IsplaceniIznos + ProsecnaOcena * @BrojDana / @TrajanjePosla * @JedinicnaPlata
			WHERE IDZaposleni = @IDZaposleni

			FETCH NEXT FROM @Cursor 
			INTO @IDZaposleni
		END

		CLOSE @Cursor
		DEALLOCATE @Cursor


		UPDATE Posao
		SET DatumKraja = @DatumKraja, Status = 'Z' 
		WHERE @IDPosao = IDPosao


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
        ROLLBACK TRANSACTION ProcZavrsiRadIDajPlate;
		throw;		
	END CATCH

    
	
END
GO
