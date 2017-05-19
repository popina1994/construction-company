
CREATE TYPE [IDType]
	FROM INTEGER NOT NULL
go

CREATE TYPE [FloatType]
	FROM DECIMAL(10,3) NULL
go

CREATE TYPE [JMBG]
	FROM CHAR(13) NULL
go

CREATE TYPE [Pol]
	FROM CHAR(1) NULL
go

CREATE TYPE [DateType]
	FROM DATETIME NULL
go

CREATE TABLE [Gradiliste]
(
	[IDGradiliste]       [IDType]  IDENTITY ( 0,1 ) ,
	[Naziv]              varchar(50)  NULL ,
	[DatumOsnivanja]     [DateType] ,
	[BrojObjekata]       integer  NULL
)
go

ALTER TABLE [Gradiliste]
	ADD CONSTRAINT [XPKGradiliste] PRIMARY KEY  CLUSTERED ([IDGradiliste] ASC)
go

CREATE TABLE [Ima]
(
	[IDMagacin]          [IDType] ,
	[IDRoba]             [IDType] ,
	[IDIma]              [IDType]  IDENTITY ( 0,1 )
)
go

ALTER TABLE [Ima]
	ADD CONSTRAINT [XPKIma] PRIMARY KEY  CLUSTERED ([IDIma] ASC)
go

CREATE TABLE [ImaJedinica]
(
	[Jedinica]           integer  NULL ,
	[IDIma]              [IDType]
)
go

ALTER TABLE [ImaJedinica]
	ADD CONSTRAINT [XPKImaJedinica] PRIMARY KEY  CLUSTERED ([IDIma] ASC)
go

CREATE TABLE [ImaKolicine]
(
	[Kolicina]           [FloatType] ,
	[IDIma]              [IDType]
)
go

ALTER TABLE [ImaKolicine]
	ADD CONSTRAINT [XPKImaKolicine] PRIMARY KEY  CLUSTERED ([IDIma] ASC)
go

CREATE TABLE [Magacin]
(
	[IDMagacin]          [IDType]  IDENTITY ( 0,1 ) ,
	[IDGradiliste]       [IDType] ,
	[IDZaposleni]        [IDType]  NULL ,
	[Plata]              [FloatType]
)
go

ALTER TABLE [Magacin]
	ADD CONSTRAINT [XPKMagacin] PRIMARY KEY  CLUSTERED ([IDMagacin] ASC)
go

CREATE TABLE [Norma]
(
	[IDNorma]            [IDType]  IDENTITY ( 0,1 ) ,
	[Naziv]              varchar(50)  NULL ,
	[Cena]               [FloatType] ,
	[Plata]              [FloatType]
)
go

ALTER TABLE [Norma]
	ADD CONSTRAINT [XPKNorma] PRIMARY KEY  CLUSTERED ([IDNorma] ASC)
go

CREATE TABLE [Objekat]
(
	[IDObjekat]          [IDType]  IDENTITY ( 0,1 ) ,
	[Naziv]              varchar(50)  NULL ,
	[BrojSpratova]       integer  NULL ,
	[IDGradiliste]       [IDType]
)
go

ALTER TABLE [Objekat]
	ADD CONSTRAINT [XPKObjekat] PRIMARY KEY  CLUSTERED ([IDObjekat] ASC)
go

CREATE TABLE [Ocena]
(
	[Ocena]              integer  NULL ,
	[IDRad]              [IDType]
)
go

ALTER TABLE [Ocena]
	ADD CONSTRAINT [XPKOcena] PRIMARY KEY  CLUSTERED ([IDRad] ASC)
go

CREATE TABLE [Posao]
(
	[IDPosao]            [IDType]  IDENTITY ( 0,1 ) ,
	[Status]             char(1)  NULL ,
	[DatumPocetka]       [DateType]  NOT NULL ,
	[DatumKraja]         [DateType] ,
	[IDNorma]            [IDType] ,
	[IDSprat]            [IDType]
)
go

ALTER TABLE [Posao]
	ADD CONSTRAINT [XPKPosao] PRIMARY KEY  CLUSTERED ([IDPosao] ASC)
go

CREATE TABLE [Rad]
(
	[IDZaposleni]        [IDType] ,
	[IDPosao]            [IDType] ,
	[DatumPocetka]       [DateType]  NOT NULL ,
	[DatumKraja]         [DateType] ,
	[IDRad]              [IDType]  IDENTITY ( 0,1 )
)
go

ALTER TABLE [Rad]
	ADD CONSTRAINT [XPKRad] PRIMARY KEY  CLUSTERED ([IDRad] ASC)
go

CREATE TABLE [Roba]
(
	[Naziv]              varchar(50)  NULL ,
	[Kod]                varchar(50)  NULL ,
	[IDRoba]             [IDType]  IDENTITY ( 0,1 ) ,
	[IDTipRobe]          [IDType]
)
go

ALTER TABLE [Roba]
	ADD CONSTRAINT [XPKRoba] PRIMARY KEY  CLUSTERED ([IDRoba] ASC)
go

CREATE TABLE [Sadrzi]
(
	[IDNorma]            [IDType] ,
	[IDRoba]             [IDType] ,
	[IDSadrzi]           [IDType]  IDENTITY ( 0,1 )
)
go

ALTER TABLE [Sadrzi]
	ADD CONSTRAINT [XPKSadrzi] PRIMARY KEY  CLUSTERED ([IDSadrzi] ASC)
go

CREATE TABLE [SadrziJedinica]
(
	[Broj]               integer  NULL ,
	[IDSadrzi]           [IDType]
)
go

ALTER TABLE [SadrziJedinica]
	ADD CONSTRAINT [XPKSadrziJedinica] PRIMARY KEY  CLUSTERED ([IDSadrzi] ASC)
go

CREATE TABLE [SadrziKolicina]
(
	[Kolicina]           [FloatType] ,
	[IDSadrzi]           [IDType]
)
go

ALTER TABLE [SadrziKolicina]
	ADD CONSTRAINT [XPKSadrziKolicina] PRIMARY KEY  CLUSTERED ([IDSadrzi] ASC)
go

CREATE TABLE [Sef]
(
	[IDZaposleni]        [IDType]
)
go

ALTER TABLE [Sef]
	ADD CONSTRAINT [XPKSef] PRIMARY KEY  CLUSTERED ([IDZaposleni] ASC)
go

CREATE TABLE [Sprat]
(
	[IDSprat]            [IDType]  IDENTITY ( 0,1 ) ,
	[IDObjekat]          [IDType] ,
	[RedniBroj]          integer  NULL
)
go

ALTER TABLE [Sprat]
	ADD CONSTRAINT [XPKSprat] PRIMARY KEY  CLUSTERED ([IDSprat] ASC)
go

CREATE TABLE [TipRobe]
(
	[IDTipRobe]          [IDType]  IDENTITY ( 0,1 ) ,
	[Naziv]              varchar(50)  NULL
)
go

ALTER TABLE [TipRobe]
	ADD CONSTRAINT [XPKTipRobe] PRIMARY KEY  CLUSTERED ([IDTipRobe] ASC)
go

CREATE TABLE [Zaduzio]
(
	[IDZaduzio]          [IDType]  IDENTITY ( 0,1 ) ,
	[DatumZaduzenja]     [DateType]  NOT NULL ,
	[DatumRazduzenja]    [DateType] ,
	[Napomena]           varchar(50)  NULL ,
	[IDMagacin]          [IDType] ,
	[IDZaposleni]        [IDType] ,
	[IDRoba]             [IDType]
)
go

ALTER TABLE [Zaduzio]
	ADD CONSTRAINT [XPKZaduzio] PRIMARY KEY  CLUSTERED ([IDZaduzio] ASC)
go

CREATE TABLE [Zaposleni]
(
	[IDZaposleni]        [IDType]  IDENTITY ( 0,1 ) ,
	[Ime]                varchar(50)  NULL ,
	[Prezime]            varchar(50)  NULL ,
	[JMBG]               [JMBG] ,
	[ZiroRacun]          varchar(50)  NULL ,
	[Email]              varchar(50)  NULL ,
	[BrojTelefona]       varchar(50)  NULL ,
	[ProsecnaOcena]      [FloatType] ,
	[BrojZaduzeneOpreme] integer  NULL ,
	[IsplaceniIznos]     [FloatType] ,
	[IDMagacin]          [IDType]  NULL ,
	[Pol]                [Pol]
	CONSTRAINT [ProveraDaLiJeIspravnogPola_1180827198]
		CHECK  ( Pol='M' OR Pol='Z' )
)
go

ALTER TABLE [Zaposleni]
	ADD CONSTRAINT [XPKZaposleni] PRIMARY KEY  CLUSTERED ([IDZaposleni] ASC)
go


ALTER TABLE [Ima]
	ADD CONSTRAINT [R_5] FOREIGN KEY ([IDMagacin]) REFERENCES [Magacin]([IDMagacin])
		ON DELETE NO ACTION
		ON UPDATE CASCADE
go

ALTER TABLE [Ima]
	ADD CONSTRAINT [R_6] FOREIGN KEY ([IDRoba]) REFERENCES [Roba]([IDRoba])
		ON DELETE NO ACTION
		ON UPDATE CASCADE
go


ALTER TABLE [ImaJedinica]
	ADD CONSTRAINT [R_7] FOREIGN KEY ([IDIma]) REFERENCES [Ima]([IDIma])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go


ALTER TABLE [ImaKolicine]
	ADD CONSTRAINT [R_8] FOREIGN KEY ([IDIma]) REFERENCES [Ima]([IDIma])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go


ALTER TABLE [Magacin]
	ADD CONSTRAINT [R_11] FOREIGN KEY ([IDGradiliste]) REFERENCES [Gradiliste]([IDGradiliste])
		ON DELETE NO ACTION
		ON UPDATE CASCADE
go

ALTER TABLE [Magacin]
	ADD CONSTRAINT [R_15] FOREIGN KEY ([IDZaposleni]) REFERENCES [Sef]([IDZaposleni])
		ON DELETE NO ACTION
		ON UPDATE CASCADE
go


ALTER TABLE [Objekat]
	ADD CONSTRAINT [R_27] FOREIGN KEY ([IDGradiliste]) REFERENCES [Gradiliste]([IDGradiliste])
		ON DELETE NO ACTION
		ON UPDATE CASCADE
go


ALTER TABLE [Ocena]
	ADD CONSTRAINT [R_35] FOREIGN KEY ([IDRad]) REFERENCES [Rad]([IDRad])
		ON DELETE NO ACTION
		ON UPDATE CASCADE
go


ALTER TABLE [Posao]
	ADD CONSTRAINT [R_30] FOREIGN KEY ([IDNorma]) REFERENCES [Norma]([IDNorma])
		ON DELETE NO ACTION
		ON UPDATE CASCADE
go

ALTER TABLE [Posao]
	ADD CONSTRAINT [R_32] FOREIGN KEY ([IDSprat]) REFERENCES [Sprat]([IDSprat])
		ON DELETE NO ACTION
		ON UPDATE CASCADE
go


ALTER TABLE [Rad]
	ADD CONSTRAINT [R_33] FOREIGN KEY ([IDZaposleni]) REFERENCES [Zaposleni]([IDZaposleni])
		ON DELETE NO ACTION
		ON UPDATE CASCADE
go

ALTER TABLE [Rad]
	ADD CONSTRAINT [R_34] FOREIGN KEY ([IDPosao]) REFERENCES [Posao]([IDPosao])
		ON DELETE NO ACTION
		ON UPDATE CASCADE
go


ALTER TABLE [Roba]
	ADD CONSTRAINT [R_44] FOREIGN KEY ([IDTipRobe]) REFERENCES [TipRobe]([IDTipRobe])
		ON DELETE NO ACTION
		ON UPDATE CASCADE
go


ALTER TABLE [Sadrzi]
	ADD CONSTRAINT [R_28] FOREIGN KEY ([IDNorma]) REFERENCES [Norma]([IDNorma])
		ON DELETE NO ACTION
		ON UPDATE CASCADE
go

ALTER TABLE [Sadrzi]
	ADD CONSTRAINT [R_47] FOREIGN KEY ([IDRoba]) REFERENCES [Roba]([IDRoba])
		ON DELETE NO ACTION
		ON UPDATE CASCADE
go


ALTER TABLE [SadrziJedinica]
	ADD CONSTRAINT [R_36] FOREIGN KEY ([IDSadrzi]) REFERENCES [Sadrzi]([IDSadrzi])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go


ALTER TABLE [SadrziKolicina]
	ADD CONSTRAINT [R_37] FOREIGN KEY ([IDSadrzi]) REFERENCES [Sadrzi]([IDSadrzi])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go


ALTER TABLE [Sef]
	ADD CONSTRAINT [R_10] FOREIGN KEY ([IDZaposleni]) REFERENCES [Zaposleni]([IDZaposleni])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go


ALTER TABLE [Sprat]
	ADD CONSTRAINT [R_26] FOREIGN KEY ([IDObjekat]) REFERENCES [Objekat]([IDObjekat])
		ON DELETE NO ACTION
		ON UPDATE CASCADE
go


ALTER TABLE [Zaduzio]
	ADD CONSTRAINT [R_18] FOREIGN KEY ([IDMagacin]) REFERENCES [Magacin]([IDMagacin])
		ON DELETE NO ACTION
		ON UPDATE CASCADE
go

ALTER TABLE [Zaduzio]
	ADD CONSTRAINT [R_22] FOREIGN KEY ([IDZaposleni]) REFERENCES [Zaposleni]([IDZaposleni])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Zaduzio]
	ADD CONSTRAINT [R_48] FOREIGN KEY ([IDRoba]) REFERENCES [Roba]([IDRoba])
		ON DELETE NO ACTION
		ON UPDATE CASCADE
go


ALTER TABLE [Zaposleni]
	ADD CONSTRAINT [R_13] FOREIGN KEY ([IDMagacin]) REFERENCES [Magacin]([IDMagacin])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go



USE [Projekat]
GO

/****** Object:  Trigger [dbo].[CreateObject]    Script Date: 18.05.2017. 16:01:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[CreateObject]
   ON  [dbo].[Objekat]
   AFTER INSERT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DECLARE @cursorInserted CURSOR
	DECLARE @IDGradiliste IdType

	SET @cursorInserted = CURSOR FOR
	SELECT IDGradiliste
	FROM inserted

	OPEN @cursorInserted

	FETCH NEXT FROM @cursorInserted
	INTO @IDGradiliste

	WHILE @@FETCH_STATUS = 0
	BEGIN
		UPDATE Gradiliste
		SET BrojObjekata = BrojObjekata + 1
		WHERE IDGradiliste = @IDGradiliste

		FETCH NEXT FROM @cursorInserted
		INTO @IDGradiliste
	END

	CLOSE @cursorInserted
	DEALLOCATE @cursorInserted


END

GO



USE [Projekat]
GO

/****** Object:  Trigger [dbo].[DeleteObject]    Script Date: 18.05.2017. 16:02:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[DeleteObject]
   ON  [dbo].[Objekat]
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
	DECLARE @IDGradiliste IdType

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

USE [Projekat]
GO

/****** Object:  Trigger [dbo].[CreateFloor]    Script Date: 18.05.2017. 16:02:35 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[CreateFloor]
   ON  [dbo].[Sprat]
   AFTER INSERT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DECLARE @cursorInserted CURSOR
	DECLARE @IDObjekat IdType

	SET @cursorInserted = CURSOR FOR
	SELECT IDObjekat
	FROM inserted

	OPEN @cursorInserted

	FETCH NEXT FROM @cursorInserted
	INTO @IDObjekat

	WHILE @@FETCH_STATUS = 0
	BEGIN
		UPDATE Objekat
		SET BrojSpratova = BrojSpratova + 1
		WHERE IDObjekat = @IDObjekat

		FETCH NEXT FROM @cursorInserted
		INTO @IDObjekat
	END

	CLOSE @cursorInserted
	DEALLOCATE @cursorInserted

END

GO


USE [Projekat]
GO

/****** Object:  Trigger [dbo].[DeleteFloor]    Script Date: 18.05.2017. 16:02:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[DeleteFloor]
   ON  [dbo].[Sprat]
   AFTER DELETE
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


    DECLARE @cursorDeleted CURSOR
	DECLARE @IDObjekat IdType

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


USE [Projekat]
GO

/****** Object:  StoredProcedure [dbo].[InsertIma]    Script Date: 19.05.2017. 2:05:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertIma]
	-- Add the parameters for the stored procedure here
	@IDMagacin IDType,
	@IDRoba IDType
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	BEGIN TRANSACTION
	BEGIN TRY
		INSERT INTO Ima(IDMagacin, IDRoba)
		VALUES (@IDMagacin, @IDRoba)
	END TRY
	BEGIN CATCH
	END CATCH
	IF @@TRANCOUNT > 0
		COMMIT TRAN
END

GO


USE [Projekat]
GO

/****** Object:  StoredProcedure [dbo].[ZaposliUMagacin]    Script Date: 19.05.2017. 2:06:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ZaposliUMagacin]
	-- Add the parameters for the stored procedure here
	@IDZaposleni IDType,
	@IDMagacin IDType

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	BEGIN TRANSACTION
	BEGIN TRY
		UPDATE Zaposleni SET IDMagacin = @IDMagacin WHERE IDZaposleni = @IDZaposleni
	END TRY
	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ErrorNumber
			,ERROR_SEVERITY() AS ErrorSeverity
			,ERROR_STATE() AS ErrorState
			,ERROR_PROCEDURE() AS ErrorProcedure
			,ERROR_LINE() AS ErrorLine
			,ERROR_MESSAGE() AS ErrorMessage;
			IF @@TRANCOUNT > 0
				ROLLBACK TRANSACTION;
			RETURN -1
	END CATCH
	IF @@TRANCOUNT > 0
		COMMIT TRANSACTION;
	RETURN 0
END

GO

USE [Projekat]
GO

/****** Object:  StoredProcedure [dbo].[InsertMagacin]    Script Date: 19.05.2017. 2:06:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertMagacin]
	-- Add the parameters for the stored procedure here
	@IDGradiliste IDType,
	@IDSef IDType,
	@plata FloatType
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @IDMagacinRet IDType

    BEGIN TRANSACTION
	BEGIN TRY
		INSERT INTO Sef(IDZaposleni) VALUES (@IDSef)
		INSERT INTO Magacin(IDGradiliste, IDZaposleni, Plata) VALUES(@IDGradiliste, @IDSef, @plata)
		DECLARE	@return_value int
		SET @IDMagacinRet = SCOPE_IDENTITY()
		EXEC	@return_value = [dbo].[ZaposliUMagacin]
		@IDZaposleni = @IDSef,
		@IDMagacin = @IDMagacinRet

		IF @return_value = -1
		BEGIN
			IF @@TRANCOUNT > 0
				ROLLBACK TRANSACTION
		END


	END TRY
	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ErrorNumber
			,ERROR_SEVERITY() AS ErrorSeverity
			,ERROR_STATE() AS ErrorState
			,ERROR_PROCEDURE() AS ErrorProcedure
			,ERROR_LINE() AS ErrorLine
			,ERROR_MESSAGE() AS ErrorMessage;
			IF @@TRANCOUNT > 0
		BEGIN
			ROLLBACK TRANSACTION;
		END
		RETURN -1;
	END CATCH
	IF @@TRANCOUNT > 0
		COMMIT TRANSACTION;
	RETURN @IDMagacinRet

END

GO
USE [Projekat]
GO


USE [Projekat]
GO

/****** Object:  StoredProcedure [dbo].[InsertImaKolicina]    Script Date: 19.05.2017. 3:17:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertImaKolicina]
	-- Add the parameters for the stored procedure here
	@IDMagacin IDType,
	@IDRoba IDType,
	@kolicina FloatType
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @IDIma IDType

	BEGIN TRANSACTION
		BEGIN TRY
		DECLARE	@return_value int
		EXEC	@return_value = [dbo].[InsertIma]
		@IDMagacin = @IDMagacin,
		@IDRoba= @IDRoba

		IF @return_value = -1
		BEGIN
			THROW -1, 'Something is wrong with execution of InsertIma', 1;
		END
		SET @IDIma = @return_value

		INSERT INTO ImaKolicine(IDIma, Kolicina)
		VALUES (@IDIma, @kolicina)

		END TRY
			BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ErrorNumber
			,ERROR_SEVERITY() AS ErrorSeverity
			,ERROR_STATE() AS ErrorState
			,ERROR_PROCEDURE() AS ErrorProcedure
			,ERROR_LINE() AS ErrorLine
			,ERROR_MESSAGE() AS ErrorMessage;
			IF @@TRANCOUNT > 0
			BEGIN
				ROLLBACK TRANSACTION;
			END
		RETURN -1;
	END CATCH
	IF @@TRANCOUNT > 0
		COMMIT TRANSACTION;
	RETURN @IDIma




END

GO


USE [Projekat]
GO

/****** Object:  StoredProcedure [dbo].[InsertSadrzi]    Script Date: 19.05.2017. 3:17:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertSadrzi]
	-- Add the parameters for the stored procedure here
	@IDRoba IDType,
	@IDNorma IDType
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   -- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @IDSadrzi IDType

    -- Insert statements for procedure here
	BEGIN TRANSACTION
	BEGIN TRY
		INSERT INTO Sadrzi(IDNorma, IDRoba)
		VALUES (@IDNorma, @IDRoba)
		SET @IDSadrzi = SCOPE_IDENTITY()
	END TRY
	BEGIN CATCH
			SELECT
			ERROR_NUMBER() AS ErrorNumber
			,ERROR_SEVERITY() AS ErrorSeverity
			,ERROR_STATE() AS ErrorState
			,ERROR_PROCEDURE() AS ErrorProcedure
			,ERROR_LINE() AS ErrorLine
			,ERROR_MESSAGE() AS ErrorMessage;
			IF @@TRANCOUNT > 0
		BEGIN
			ROLLBACK TRANSACTION;
		END
		RETURN -1;

	END CATCH
	IF @@TRANCOUNT > 0
		COMMIT TRAN
	RETURN @IDSadrzi
END

GO


USE [Projekat]
GO

/****** Object:  StoredProcedure [dbo].[InsertSadrziKolicina]    Script Date: 19.05.2017. 3:17:18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertSadrziKolicina]
	-- Add the parameters for the stored procedure here

	@IDRoba IDType,
	@IDNorma IDType,
	@kolicina FloatType
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @IDSadrzi IDType

	BEGIN TRANSACTION
		BEGIN TRY
		DECLARE	@return_value IDType
		EXEC	@return_value = [dbo].[InsertSadrzi]
		@IDRoba = @IDRoba,
		@IDNorma = @IDNorma

		IF @return_value = -1
		BEGIN
			THROW -1, 'Something is wrong with execution of InsertSadrzi', 1;
		END
		SET @IDSadrzi = @return_value

		INSERT INTO SadrziKolicina(IDSadrzi, Kolicina)
		VALUES (@IDSadrzi, @kolicina)

		END TRY
			BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ErrorNumber
			,ERROR_SEVERITY() AS ErrorSeverity
			,ERROR_STATE() AS ErrorState
			,ERROR_PROCEDURE() AS ErrorProcedure
			,ERROR_LINE() AS ErrorLine
			,ERROR_MESSAGE() AS ErrorMessage;
			IF @@TRANCOUNT > 0
			BEGIN
				ROLLBACK TRANSACTION;
			END
		RETURN -1;
	END CATCH
	IF @@TRANCOUNT > 0
		COMMIT TRANSACTION;
	RETURN @IDSadrzi
END

GO


USE Projekat
CREATE USER popina FOR LOGIN popina
GO

USE Projekat
EXEC sp_addrolemember 'db_datawriter', 'popina'
GO





