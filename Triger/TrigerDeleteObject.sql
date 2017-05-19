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
ALTER TRIGGER DeleteObject
   ON  Objekat
   AFTER DELETE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DECLARE @cursorDeleted CURSOR 
	DECLARE @IDGradiliste int

	SET @cursorDeleted = CURSOR FOR
	SELECT IDGradiliste
	FROM deleted

	OPEN @cursorDeleted

	FETCH NEXT FROM @cursorDeleted 
	INTO @IDGradiliste

	WHILE @@FETCH_STATUS = 0
	BEGIN
		UPDATE Gradiliste 
		SET BrojObjekata = BrojObjekata - 1 
		WHERE IDGradiliste = @IDGradiliste

		FETCH NEXT FROM @cursorDeleted 
		INTO @IDGradiliste
	END

	CLOSE @cursorDeleted
	DEALLOCATE @cursorDeleted

END
GO
