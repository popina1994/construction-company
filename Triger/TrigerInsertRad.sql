-- ================================================
-- Template generated from Template Explorer using:
-- Create Trigger (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- See additional Create Trigger templates for more
-- examples of different Trigger statements.
--
-- This block of comments will not be included in
-- the definition of the function.
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
ALTER TRIGGER InsertUpdateRad
   ON  Rad
   AFTER INSERT,UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DECLARE @cursorInserted CURSOR
	DECLARE @IDPosao IDType
	DECLARE @IDZaposleni IDType
	DECLARE @DatumPocetka DateType
	DECLARE @DatumKraja DateType
	DECLARE @DatumPocetkaP DateType
	DECLARE @DatumKrajaP DateType
	DECLARE @Status CHAR(1)

	SET @cursorInserted = CURSOR FOR
	SELECT DatumKraja, DatumPocetka, IDPosao, IDZaposleni
	FROM inserted

	OPEN @cursorInserted

	FETCH NEXT FROM @cursorInserted
	INTO @DatumKraja, @DAtumPocetka, @IDPosao, @IDZaposleni

	WHILE @@FETCH_STATUS = 0
	BEGIN
		SELECT @DatumPocetkaP = DatumPocetka, @DatumKrajaP = DatumKraja, @Status = Status
		FROM Posao
		WHERE @IDPosao = IDPosao;

		IF @Status ='Z'
			THROW 50002, 'Ne moze se raditi kad je posao vec gotov', 1

		IF (@DatumPocetka < @DatumPocetkaP) OR ( (@DatumKraja IS NOT NULL) AND (@DatumKraja <@DatumPocetkaP))
			THROW 50001, 'Datum pocetka/kraja rada je pre datuma pocetka posla', 1 
		-- There is no need for checks whether @DatumPocetka is less thant DatumKrajaP


		FETCH NEXT FROM @cursorInserted
		INTO @DatumKraja, @DAtumPocetka, @IDPosao, @IDZaposleni
	END

	CLOSE @cursorInserted
	DEALLOCATE @cursorInserted

END
GO
