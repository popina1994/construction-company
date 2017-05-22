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
CREATE TRIGGER DeleteMagacin
   ON  Magacin
   AFTER DELETE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	
	DECLARE @CUrsor CURSOR
	DECLARE @IDMagacin IDType

	SET @Cursor = CURSOR FOR
	SELECT IDMagacin
	 FROM Magacin

	OPEN @Cursor 

	FETCH NEXT FROM @Cursor 
	INTO @IDMagacin
	WHILE @@FETCH_STATUS = 0
	BEGIN 
		FETCH NEXT FROM @Cursor 
		INTO @IDMagacin
	END 

	
	
	CLOSE @Cursor
	DEALLOCATE @Cursor 
    -- Insert statements for trigger here

END
GO
