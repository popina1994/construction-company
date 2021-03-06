-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER TRIGGER [dbo].[InsertUpdateRad]
   ON  [dbo].[Rad]
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
	DECLARE @IDRad IDType
	DECLARE @DatumPocetka DateType
	DECLARE @DatumKraja DateType
	DECLARE @DatumPocetkaP DateType
	DECLARE @DatumKrajaP DateType
	DECLARE @Status CHAR(1)

	SET @cursorInserted = CURSOR FOR
	SELECT DatumKraja, DatumPocetka, IDPosao, IDZaposleni, IDRad
	FROM inserted

	OPEN @cursorInserted

	FETCH NEXT FROM @cursorInserted
	INTO @DatumKraja, @DAtumPocetka, @IDPosao, @IDZaposleni, @IDRad 

	WHILE @@FETCH_STATUS = 0
	BEGIN
		SELECT @DatumPocetkaP = DatumPocetka, @DatumKrajaP = DatumKraja, @Status = Status
		FROM Posao
		WHERE @IDPosao = IDPosao;

		IF @Status ='Z'
			THROW 50002, 'Ne moze se raditi kad je posao vec gotov', 1;

		IF (@DatumPocetka < @DatumPocetkaP) OR ( (@DatumKraja IS NOT NULL) AND (@DatumKraja <@DatumPocetkaP))
			THROW 50001, 'Datum pocetka/kraja rada je pre datuma pocetka posla', 1;
		
		IF EXISTS (SELECT * FROM Rad
			WHERE (((@DatumPocetka >= DatumPocetka) AND (@DatumPocetka <= DatumKraja)) 
				OR 
				((@DatumKraja >= DatumPocetka) AND (@DatumKraja <= DatumKraja)))
					AND IDZaposleni = @IDZaposleni AND @IDRad != IDRad)
			throw 50002, 'Ne mogu dva rada istog radnika da se preklapaju', 1;

		IF ( (SELECT IDMagacin 
				FROM Zaposleni 
				WHERE IDZaposleni = @IDZaposleni) IS NOT NULL) AND ( @DatumKraja IS NULL)
			THROW 50010, 'Zaposleni ne moze da radi i u magacinu i na poslu', 1



		FETCH NEXT FROM @cursorInserted
		INTO @DatumKraja, @DAtumPocetka, @IDPosao, @IDZaposleni, @IDRad 
	END

	CLOSE @cursorInserted
	DEALLOCATE @cursorInserted

END
