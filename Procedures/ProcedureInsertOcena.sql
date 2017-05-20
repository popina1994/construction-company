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
ALTER TRIGGER InsertOcena
   ON  Ocena
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
		
		SET @Sum = @Sum + 10;
		SET @Cnt = @Cnt + 1

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
GO
