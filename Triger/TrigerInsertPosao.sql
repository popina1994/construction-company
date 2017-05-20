-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER TRIGGER TrigerInsertPosao
   ON  Posao
   AFTER UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DECLARE @Cursor CURSOR
	DECLARE @DatumPocetka DateType
	DECLARE @DatumKraja DateType
	DECLARE @Status CHAR(1)
	DECLARE @IDPosao IDType
	DECLARE @oldStatus CHAR(1)

	SET @CUrsor = CURSOR FOR
	SELECT DatumPocetka, DatumKraja, Status, IDPosao
	FROM inserted

	OPEN @Cursor

	FETCH NEXT FROM @Cursor
	INTO @DatumPocetka, @DatumKraja, @Status, @IDPosao;

	WHILE @@FETCH_STATUS = 0
	BEGIN
		SELECT @oldStatus=Status 
		FROM deleted 
		WHERE @IDPosao = IDPosao;

		IF (@oldStatus = 'Z' )
			throw 50003, 'Ne moze da se menja zavrsen posao', 1;

		IF (EXISTS 
			(SELECT * FROM Rad
			WHERE IDPosao = @IDPosao
			AND ( (DatumPocetka < @DatumPocetka) OR (DatumPocetka > @DatumKraja) OR (DatumKraja > @DatumKraja) OR (DatumKraja < @DatumPocetka))))
				throw 50004, 'Vreme rada ne moze da bude izvan vremena referenciranog posla', 1

		FETCH NEXT FROM @Cursor
		INTO @DatumPocetka, @DatumKraja, @Status, @IDPosao
	END
	CLOSE @Cursor
	DEALLOCATE @Cursor

END
