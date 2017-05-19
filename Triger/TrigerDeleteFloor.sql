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
CREATE TRIGGER DeleteFloor
   ON  Sprat
   AFTER DELETE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   
    DECLARE @cursorDeleted CURSOR 
	DECLARE @IDObjekat int

	SET @cursorDeleted = CURSOR FOR
	SELECT IDObjekat
	FROM deleted

	OPEN @cursorDeleted

	FETCH NEXT FROM @cursorDeleted 
	INTO @IDObjekat

	WHILE @@FETCH_STATUS = 0
	BEGIN
		UPDATE Objekat 
		SET BrojSpratova = BrojSpratova - 1 
		WHERE IDObjekat = @IDObjekat

		FETCH NEXT FROM @cursorDeleted 
		INTO @IDObjekat
	END

	CLOSE @cursorDeleted
	DEALLOCATE @cursorDeleted

END
GO
