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
ALTER TRIGGER TrigerUpdateInsertZaposleni
   ON  Zaposleni
   AFTER INSERT, UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @Cursor CURSOR 
	DECLARE @IDZaposleni IDType
	DECLARE @IDMagacin IDType

	SET @Cursor = CURSOR FOR 
	SELECT IDZaposleni, IDMagacin
	FROM inserted

	OPEN @Cursor
	FETCH NEXT FROM @Cursor 
	INTO @IDZaposleni, @IDMagacin

	WHILE @@FETCH_STATUS = 0
	BEGIN 
		IF ( EXISTS(SELECT * 
					FROM Rad
					WHERE IDZaposleni = @IDZaposleni
					AND DatumKraja IS NULL) AND (@IDMagacin IS NOT NULL))
			THROW 50010, 'Zaposleni ne moze da radi i u magacinu i na poslu', 1
		FETCH NEXT FROM @Cursor 
		INTO @IDZaposleni, @IDMagacin
	END
		

    CLOSE @Cursor
	DEALLOCATE @Cursor

END
GO
