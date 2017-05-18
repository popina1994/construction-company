USE master

DROP DATABASE Projekat
Go

CREATE DATABASE Projekat
Go

Use Projekat
GO

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

CREATE TABLE [Alat]
( 
	[IDRoba]             [IDType] 
)
go

ALTER TABLE [Alat]
	ADD CONSTRAINT [XPKAlat] PRIMARY KEY  CLUSTERED ([IDRoba] ASC)
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
	[IDRoba]             [IDType] 
)
go

ALTER TABLE [Ima]
	ADD CONSTRAINT [XPKIma] PRIMARY KEY  CLUSTERED ([IDMagacin] ASC,[IDRoba] ASC)
go

CREATE TABLE [ImaJedinica]
( 
	[IDMagacin]          [IDType] ,
	[IDRoba]             [IDType] ,
	[Jedinica]           integer  NULL 
)
go

ALTER TABLE [ImaJedinica]
	ADD CONSTRAINT [XPKImaJedinica] PRIMARY KEY  CLUSTERED ([IDMagacin] ASC,[IDRoba] ASC)
go

CREATE TABLE [ImaKolicine]
( 
	[IDMagacin]          [IDType] ,
	[IDRoba]             [IDType] ,
	[Kolicina]           [FloatType] 
)
go

ALTER TABLE [ImaKolicine]
	ADD CONSTRAINT [XPKImaKolicine] PRIMARY KEY  CLUSTERED ([IDMagacin] ASC,[IDRoba] ASC)
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

CREATE TABLE [Materijal]
( 
	[IDRoba]             [IDType] 
)
go

ALTER TABLE [Materijal]
	ADD CONSTRAINT [XPKMaterijal] PRIMARY KEY  CLUSTERED ([IDRoba] ASC)
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
	[IDZaposleni]        [IDType] ,
	[IDPosao]            [IDType] ,
	[Ocena]              integer  NULL 
)
go

ALTER TABLE [Ocena]
	ADD CONSTRAINT [XPKOcena] PRIMARY KEY  CLUSTERED ([IDZaposleni] ASC,[IDPosao] ASC)
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
	[DatumKraja]         [DateType] 
)
go

ALTER TABLE [Rad]
	ADD CONSTRAINT [XPKRad] PRIMARY KEY  CLUSTERED ([IDZaposleni] ASC,[IDPosao] ASC)
go

CREATE TABLE [Roba]
( 
	[Naziv]              varchar(50)  NULL ,
	[Kod]                varchar(50)  NULL ,
	[Tip]                smallint  NULL ,
	[IDRoba]             [IDType]  IDENTITY ( 0,1 ) 
)
go

ALTER TABLE [Roba]
	ADD CONSTRAINT [XPKRoba] PRIMARY KEY  CLUSTERED ([IDRoba] ASC)
go

CREATE TABLE [Sadrzi]
( 
	[IDNorma]            [IDType] ,
	[IDRoba]             [IDType] 
)
go

ALTER TABLE [Sadrzi]
	ADD CONSTRAINT [XPKSadrzi] PRIMARY KEY  CLUSTERED ([IDNorma] ASC,[IDRoba] ASC)
go

CREATE TABLE [SadrziJedinica]
( 
	[Broj]               integer  NULL ,
	[IDNorma]            [IDType] ,
	[IDRoba]             [IDType] 
)
go

ALTER TABLE [SadrziJedinica]
	ADD CONSTRAINT [XPKSadrziJedinica] PRIMARY KEY  CLUSTERED ([IDNorma] ASC,[IDRoba] ASC)
go

CREATE TABLE [SadrziKolicina]
( 
	[Kolicina]           [FloatType] ,
	[IDNorma]            [IDType] ,
	[IDRoba]             [IDType] 
)
go

ALTER TABLE [SadrziKolicina]
	ADD CONSTRAINT [XPKSadrziKolicina] PRIMARY KEY  CLUSTERED ([IDNorma] ASC,[IDRoba] ASC)
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
)
go

ALTER TABLE [Zaposleni]
	ADD CONSTRAINT [XPKZaposleni] PRIMARY KEY  CLUSTERED ([IDZaposleni] ASC)
go


ALTER TABLE [Alat]
	ADD CONSTRAINT [R_16] FOREIGN KEY ([IDRoba]) REFERENCES [Roba]([IDRoba])
		ON DELETE CASCADE
		ON UPDATE CASCADE
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
	ADD CONSTRAINT [R_7] FOREIGN KEY ([IDMagacin],[IDRoba]) REFERENCES [Ima]([IDMagacin],[IDRoba])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go


ALTER TABLE [ImaKolicine]
	ADD CONSTRAINT [R_8] FOREIGN KEY ([IDMagacin],[IDRoba]) REFERENCES [Ima]([IDMagacin],[IDRoba])
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


ALTER TABLE [Materijal]
	ADD CONSTRAINT [R_17] FOREIGN KEY ([IDRoba]) REFERENCES [Roba]([IDRoba])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go


ALTER TABLE [Objekat]
	ADD CONSTRAINT [R_27] FOREIGN KEY ([IDGradiliste]) REFERENCES [Gradiliste]([IDGradiliste])
		ON DELETE NO ACTION
		ON UPDATE CASCADE
go


ALTER TABLE [Ocena]
	ADD CONSTRAINT [R_35] FOREIGN KEY ([IDZaposleni],[IDPosao]) REFERENCES [Rad]([IDZaposleni],[IDPosao])
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


ALTER TABLE [Sadrzi]
	ADD CONSTRAINT [R_28] FOREIGN KEY ([IDNorma]) REFERENCES [Norma]([IDNorma])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Sadrzi]
	ADD CONSTRAINT [R_38] FOREIGN KEY ([IDRoba]) REFERENCES [Materijal]([IDRoba])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [SadrziJedinica]
	ADD CONSTRAINT [R_36] FOREIGN KEY ([IDNorma],[IDRoba]) REFERENCES [Sadrzi]([IDNorma],[IDRoba])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go


ALTER TABLE [SadrziKolicina]
	ADD CONSTRAINT [R_37] FOREIGN KEY ([IDNorma],[IDRoba]) REFERENCES [Sadrzi]([IDNorma],[IDRoba])
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
	ADD CONSTRAINT [R_43] FOREIGN KEY ([IDRoba]) REFERENCES [Materijal]([IDRoba])
		ON DELETE NO ACTION
		ON UPDATE CASCADE
go


ALTER TABLE [Zaposleni]
	ADD CONSTRAINT [R_13] FOREIGN KEY ([IDMagacin]) REFERENCES [Magacin]([IDMagacin])
		ON DELETE NO ACTION
		ON UPDATE NO ACTIOn
go

USE Projekat
CREATE USER popina FOR LOGIN popina

USE Projekat
EXEC sp_addrolemember 'db_datawriter', 'popina'