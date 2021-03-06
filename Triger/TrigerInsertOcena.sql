USE [Projekat]
GO
/****** Object:  Trigger [dbo].[InsertOcena]    Script Date: 20.05.2017. 13:57:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER TRIGGER [dbo].[InsertOcena]
   ON  [dbo].[Ocena]
   AFTER INSERT, UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @Cursor CURSOR 
	DECLARE @IDRad IDType
	DECLARE @IDZaposleni int 
	DECLARE @Sum int 
	DECLARE @Cnt int

	SET @Cursor = CURSOR FOR
	SELECT IDRad
	FROM inserted

	OPEN @Cursor

	FETCH NEXT FROM @Cursor
	INTO  @IDRad

	WHILE @@FETCH_STATUS = 0
	BEGIN
		SELECT @IDZaposleni = IDZaposleni 
		FROM Rad
		WHERE IDRad = @IDRad 

		SELECT @Sum = SUM(Ocena), @Cnt = COUNT(Ocena)
		FROM Ocena, Rad
		WHERE (Ocena.IDRad = Rad.IDRad) AND (Rad.IDZaposleni = @IDZaposleni);
		
		IF (@Sum IS NULL)
			SET @SUM = 10
		IF (@Cnt IS NULL)
			SET @Cnt = 1

		UPDATE Zaposleni
		SET ProsecnaOcena = CAST(@SUM AS decimal(10 ,3)) / CAST(@Cnt AS decimal(10, 3))
		WHERE IDZaposleni = @IDZaposleni

		FETCH NEXT FROM @Cursor
		INTO  @IDRad
	END 

	CLOSE @Cursor
	DEALLOCATE @Cursor
    -- Insert statements for trigger here

END
