

USE [master]
GO

/****** Object:  Database [Projekat]    Script Date: 22.05.2017. 22:48:42 ******/
IF  EXISTS (SELECT name FROM sys.databases WHERE name = N'Projekat')
DROP DATABASE [Projekat]
GO
/****** Object:  Database [Projekat]    Script Date: 22.05.2017. 22:48:42 ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'Projekat')
BEGIN
CREATE DATABASE [Projekat]
 CONTAINMENT = NONE
 ON  PRIMARY
( NAME = N'Projekat', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Projekat.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON
( NAME = N'Projekat_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Projekat_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
END

GO
ALTER DATABASE [Projekat] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Projekat].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Projekat] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [Projekat] SET ANSI_NULLS OFF
GO
ALTER DATABASE [Projekat] SET ANSI_PADDING OFF
GO
ALTER DATABASE [Projekat] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [Projekat] SET ARITHABORT OFF
GO
ALTER DATABASE [Projekat] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [Projekat] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [Projekat] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [Projekat] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [Projekat] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [Projekat] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [Projekat] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [Projekat] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [Projekat] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [Projekat] SET  DISABLE_BROKER
GO
ALTER DATABASE [Projekat] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [Projekat] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [Projekat] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [Projekat] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [Projekat] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [Projekat] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [Projekat] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [Projekat] SET RECOVERY FULL
GO
ALTER DATABASE [Projekat] SET  MULTI_USER
GO
ALTER DATABASE [Projekat] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [Projekat] SET DB_CHAINING OFF
GO
ALTER DATABASE [Projekat] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF )
GO
ALTER DATABASE [Projekat] SET TARGET_RECOVERY_TIME = 0 SECONDS
GO
ALTER DATABASE [Projekat] SET DELAYED_DURABILITY = DISABLED
GO
USE [Projekat]
GO
/****** Object:  UserDefinedDataType [dbo].[DateType]    Script Date: 22.05.2017. 22:48:42 ******/
IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'DateType' AND ss.name = N'dbo')
CREATE TYPE [dbo].[DateType] FROM [datetime] NULL
GO
/****** Object:  UserDefinedDataType [dbo].[FloatType]    Script Date: 22.05.2017. 22:48:42 ******/
IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'FloatType' AND ss.name = N'dbo')
CREATE TYPE [dbo].[FloatType] FROM [decimal](10, 3) NULL
GO
/****** Object:  UserDefinedDataType [dbo].[IDType]    Script Date: 22.05.2017. 22:48:42 ******/
IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'IDType' AND ss.name = N'dbo')
CREATE TYPE [dbo].[IDType] FROM [int] NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[JMBG]    Script Date: 22.05.2017. 22:48:42 ******/
IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'JMBG' AND ss.name = N'dbo')
CREATE TYPE [dbo].[JMBG] FROM [char](13) NULL
GO
/****** Object:  UserDefinedDataType [dbo].[Pol]    Script Date: 22.05.2017. 22:48:42 ******/
IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'Pol' AND ss.name = N'dbo')
CREATE TYPE [dbo].[Pol] FROM [char](1) NULL
GO
/****** Object:  Table [dbo].[Gradiliste]    Script Date: 22.05.2017. 22:48:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Gradiliste]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Gradiliste](
	[IDGradiliste] [dbo].[IDType] IDENTITY(0,1) NOT NULL,
	[Naziv] [varchar](50) NULL,
	[DatumOsnivanja] [dbo].[DateType] NULL,
	[BrojObjekata] [int] NULL,
 CONSTRAINT [XPKGradiliste] PRIMARY KEY CLUSTERED
(
	[IDGradiliste] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ima]    Script Date: 22.05.2017. 22:48:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ima]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Ima](
	[IDMagacin] [dbo].[IDType] NOT NULL,
	[IDRoba] [dbo].[IDType] NOT NULL,
	[IDIma] [dbo].[IDType] IDENTITY(0,1) NOT NULL,
 CONSTRAINT [XPKIma] PRIMARY KEY CLUSTERED
(
	[IDIma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQIDMagIDRob_Ima] UNIQUE NONCLUSTERED
(
	[IDMagacin] ASC,
	[IDRoba] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ImaJedinica]    Script Date: 22.05.2017. 22:48:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ImaJedinica]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ImaJedinica](
	[Jedinica] [int] NULL,
	[IDIma] [dbo].[IDType] NOT NULL,
 CONSTRAINT [XPKImaJedinica] PRIMARY KEY CLUSTERED
(
	[IDIma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ImaKolicine]    Script Date: 22.05.2017. 22:48:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ImaKolicine]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ImaKolicine](
	[Kolicina] [dbo].[FloatType] NULL,
	[IDIma] [dbo].[IDType] NOT NULL,
 CONSTRAINT [XPKImaKolicine] PRIMARY KEY CLUSTERED
(
	[IDIma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Magacin]    Script Date: 22.05.2017. 22:48:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Magacin]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Magacin](
	[IDMagacin] [dbo].[IDType] IDENTITY(0,1) NOT NULL,
	[IDGradiliste] [dbo].[IDType] NOT NULL,
	[IDZaposleni] [dbo].[IDType] NULL,
	[Plata] [dbo].[FloatType] NULL,
 CONSTRAINT [XPKMagacin] PRIMARY KEY CLUSTERED
(
	[IDMagacin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_Gradiliste] UNIQUE NONCLUSTERED
(
	[IDGradiliste] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Norma]    Script Date: 22.05.2017. 22:48:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Norma]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Norma](
	[IDNorma] [dbo].[IDType] IDENTITY(0,1) NOT NULL,
	[Naziv] [varchar](50) NULL,
	[Cena] [dbo].[FloatType] NULL,
	[Plata] [dbo].[FloatType] NULL,
 CONSTRAINT [XPKNorma] PRIMARY KEY CLUSTERED
(
	[IDNorma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Objekat]    Script Date: 22.05.2017. 22:48:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Objekat]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Objekat](
	[IDObjekat] [dbo].[IDType] IDENTITY(0,1) NOT NULL,
	[Naziv] [varchar](50) NULL,
	[BrojSpratova] [int] NULL,
	[IDGradiliste] [dbo].[IDType] NOT NULL,
 CONSTRAINT [XPKObjekat] PRIMARY KEY CLUSTERED
(
	[IDObjekat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ocena]    Script Date: 22.05.2017. 22:48:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ocena]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Ocena](
	[Ocena] [int] NULL,
	[IDRad] [dbo].[IDType] NOT NULL,
 CONSTRAINT [XPKOcena] PRIMARY KEY CLUSTERED
(
	[IDRad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Posao]    Script Date: 22.05.2017. 22:48:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Posao]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Posao](
	[IDPosao] [dbo].[IDType] IDENTITY(0,1) NOT NULL,
	[Status] [char](1) NULL,
	[DatumPocetka] [dbo].[DateType] NOT NULL,
	[DatumKraja] [dbo].[DateType] NULL,
	[IDNorma] [dbo].[IDType] NOT NULL,
	[IDSprat] [dbo].[IDType] NOT NULL,
 CONSTRAINT [XPKPosao] PRIMARY KEY CLUSTERED
(
	[IDPosao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Rad]    Script Date: 22.05.2017. 22:48:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Rad]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Rad](
	[IDZaposleni] [dbo].[IDType] NOT NULL,
	[IDPosao] [dbo].[IDType] NOT NULL,
	[DatumPocetka] [dbo].[DateType] NOT NULL,
	[DatumKraja] [dbo].[DateType] NULL,
	[IDRad] [dbo].[IDType] IDENTITY(0,1) NOT NULL,
 CONSTRAINT [XPKRad] PRIMARY KEY CLUSTERED
(
	[IDRad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_IDPosIDZap] UNIQUE NONCLUSTERED
(
	[IDZaposleni] ASC,
	[IDPosao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Roba]    Script Date: 22.05.2017. 22:48:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Roba]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Roba](
	[Naziv] [varchar](50) NULL,
	[Kod] [varchar](50) NULL,
	[IDRoba] [dbo].[IDType] IDENTITY(0,1) NOT NULL,
	[IDTipRobe] [dbo].[IDType] NOT NULL,
 CONSTRAINT [XPKRoba] PRIMARY KEY CLUSTERED
(
	[IDRoba] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sadrzi]    Script Date: 22.05.2017. 22:48:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sadrzi]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Sadrzi](
	[IDNorma] [dbo].[IDType] NOT NULL,
	[IDRoba] [dbo].[IDType] NOT NULL,
	[IDSadrzi] [dbo].[IDType] IDENTITY(0,1) NOT NULL,
 CONSTRAINT [XPKSadrzi] PRIMARY KEY CLUSTERED
(
	[IDSadrzi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQRobaNorma_Sadrzi] UNIQUE NONCLUSTERED
(
	[IDNorma] ASC,
	[IDRoba] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SadrziJedinica]    Script Date: 22.05.2017. 22:48:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SadrziJedinica]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SadrziJedinica](
	[Broj] [int] NULL,
	[IDSadrzi] [dbo].[IDType] NOT NULL,
 CONSTRAINT [XPKSadrziJedinica] PRIMARY KEY CLUSTERED
(
	[IDSadrzi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SadrziKolicina]    Script Date: 22.05.2017. 22:48:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SadrziKolicina]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SadrziKolicina](
	[Kolicina] [dbo].[FloatType] NULL,
	[IDSadrzi] [dbo].[IDType] NOT NULL,
 CONSTRAINT [XPKSadrziKolicina] PRIMARY KEY CLUSTERED
(
	[IDSadrzi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Sef]    Script Date: 22.05.2017. 22:48:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sef]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Sef](
	[IDZaposleni] [dbo].[IDType] NOT NULL,
 CONSTRAINT [XPKSef] PRIMARY KEY CLUSTERED
(
	[IDZaposleni] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Sprat]    Script Date: 22.05.2017. 22:48:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sprat]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Sprat](
	[IDSprat] [dbo].[IDType] IDENTITY(0,1) NOT NULL,
	[IDObjekat] [dbo].[IDType] NOT NULL,
	[RedniBroj] [int] NULL,
 CONSTRAINT [XPKSprat] PRIMARY KEY CLUSTERED
(
	[IDSprat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[TipRobe]    Script Date: 22.05.2017. 22:48:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TipRobe]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TipRobe](
	[IDTipRobe] [dbo].[IDType] IDENTITY(0,1) NOT NULL,
	[Naziv] [varchar](50) NULL,
 CONSTRAINT [XPKTipRobe] PRIMARY KEY CLUSTERED
(
	[IDTipRobe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Zaduzio]    Script Date: 22.05.2017. 22:48:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Zaduzio]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Zaduzio](
	[IDZaduzio] [dbo].[IDType] IDENTITY(0,1) NOT NULL,
	[DatumZaduzenja] [dbo].[DateType] NOT NULL,
	[DatumRazduzenja] [dbo].[DateType] NULL,
	[Napomena] [varchar](50) NULL,
	[IDMagacin] [dbo].[IDType] NOT NULL,
	[IDZaposleni] [dbo].[IDType] NOT NULL,
	[IDRoba] [dbo].[IDType] NOT NULL,
 CONSTRAINT [XPKZaduzio] PRIMARY KEY CLUSTERED
(
	[IDZaduzio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Zaposleni]    Script Date: 22.05.2017. 22:48:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Zaposleni]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Zaposleni](
	[IDZaposleni] [dbo].[IDType] IDENTITY(0,1) NOT NULL,
	[Ime] [varchar](50) NULL,
	[Prezime] [varchar](50) NULL,
	[JMBG] [dbo].[JMBG] NULL,
	[ZiroRacun] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[BrojTelefona] [varchar](50) NULL,
	[ProsecnaOcena] [dbo].[FloatType] NULL,
	[BrojZaduzeneOpreme] [int] NULL,
	[IsplaceniIznos] [dbo].[FloatType] NULL,
	[IDMagacin] [dbo].[IDType] NULL,
	[Pol] [dbo].[Pol] NULL,
 CONSTRAINT [XPKZaposleni] PRIMARY KEY CLUSTERED
(
	[IDZaposleni] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_5]') AND parent_object_id = OBJECT_ID(N'[dbo].[Ima]'))
ALTER TABLE [dbo].[Ima]  WITH CHECK ADD  CONSTRAINT [R_5] FOREIGN KEY([IDMagacin])
REFERENCES [dbo].[Magacin] ([IDMagacin])
ON UPDATE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_5]') AND parent_object_id = OBJECT_ID(N'[dbo].[Ima]'))
ALTER TABLE [dbo].[Ima] CHECK CONSTRAINT [R_5]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_6]') AND parent_object_id = OBJECT_ID(N'[dbo].[Ima]'))
ALTER TABLE [dbo].[Ima]  WITH CHECK ADD  CONSTRAINT [R_6] FOREIGN KEY([IDRoba])
REFERENCES [dbo].[Roba] ([IDRoba])
ON UPDATE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_6]') AND parent_object_id = OBJECT_ID(N'[dbo].[Ima]'))
ALTER TABLE [dbo].[Ima] CHECK CONSTRAINT [R_6]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_7]') AND parent_object_id = OBJECT_ID(N'[dbo].[ImaJedinica]'))
ALTER TABLE [dbo].[ImaJedinica]  WITH CHECK ADD  CONSTRAINT [R_7] FOREIGN KEY([IDIma])
REFERENCES [dbo].[Ima] ([IDIma])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_7]') AND parent_object_id = OBJECT_ID(N'[dbo].[ImaJedinica]'))
ALTER TABLE [dbo].[ImaJedinica] CHECK CONSTRAINT [R_7]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_8]') AND parent_object_id = OBJECT_ID(N'[dbo].[ImaKolicine]'))
ALTER TABLE [dbo].[ImaKolicine]  WITH CHECK ADD  CONSTRAINT [R_8] FOREIGN KEY([IDIma])
REFERENCES [dbo].[Ima] ([IDIma])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_8]') AND parent_object_id = OBJECT_ID(N'[dbo].[ImaKolicine]'))
ALTER TABLE [dbo].[ImaKolicine] CHECK CONSTRAINT [R_8]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_11]') AND parent_object_id = OBJECT_ID(N'[dbo].[Magacin]'))
ALTER TABLE [dbo].[Magacin]  WITH CHECK ADD  CONSTRAINT [R_11] FOREIGN KEY([IDGradiliste])
REFERENCES [dbo].[Gradiliste] ([IDGradiliste])
ON UPDATE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_11]') AND parent_object_id = OBJECT_ID(N'[dbo].[Magacin]'))
ALTER TABLE [dbo].[Magacin] CHECK CONSTRAINT [R_11]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_15]') AND parent_object_id = OBJECT_ID(N'[dbo].[Magacin]'))
ALTER TABLE [dbo].[Magacin]  WITH CHECK ADD  CONSTRAINT [R_15] FOREIGN KEY([IDZaposleni])
REFERENCES [dbo].[Sef] ([IDZaposleni])
ON UPDATE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_15]') AND parent_object_id = OBJECT_ID(N'[dbo].[Magacin]'))
ALTER TABLE [dbo].[Magacin] CHECK CONSTRAINT [R_15]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_27]') AND parent_object_id = OBJECT_ID(N'[dbo].[Objekat]'))
ALTER TABLE [dbo].[Objekat]  WITH CHECK ADD  CONSTRAINT [R_27] FOREIGN KEY([IDGradiliste])
REFERENCES [dbo].[Gradiliste] ([IDGradiliste])
ON UPDATE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_27]') AND parent_object_id = OBJECT_ID(N'[dbo].[Objekat]'))
ALTER TABLE [dbo].[Objekat] CHECK CONSTRAINT [R_27]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_35]') AND parent_object_id = OBJECT_ID(N'[dbo].[Ocena]'))
ALTER TABLE [dbo].[Ocena]  WITH CHECK ADD  CONSTRAINT [R_35] FOREIGN KEY([IDRad])
REFERENCES [dbo].[Rad] ([IDRad])
ON UPDATE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_35]') AND parent_object_id = OBJECT_ID(N'[dbo].[Ocena]'))
ALTER TABLE [dbo].[Ocena] CHECK CONSTRAINT [R_35]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_30]') AND parent_object_id = OBJECT_ID(N'[dbo].[Posao]'))
ALTER TABLE [dbo].[Posao]  WITH CHECK ADD  CONSTRAINT [R_30] FOREIGN KEY([IDNorma])
REFERENCES [dbo].[Norma] ([IDNorma])
ON UPDATE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_30]') AND parent_object_id = OBJECT_ID(N'[dbo].[Posao]'))
ALTER TABLE [dbo].[Posao] CHECK CONSTRAINT [R_30]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_32]') AND parent_object_id = OBJECT_ID(N'[dbo].[Posao]'))
ALTER TABLE [dbo].[Posao]  WITH CHECK ADD  CONSTRAINT [R_32] FOREIGN KEY([IDSprat])
REFERENCES [dbo].[Sprat] ([IDSprat])
ON UPDATE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_32]') AND parent_object_id = OBJECT_ID(N'[dbo].[Posao]'))
ALTER TABLE [dbo].[Posao] CHECK CONSTRAINT [R_32]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_33]') AND parent_object_id = OBJECT_ID(N'[dbo].[Rad]'))
ALTER TABLE [dbo].[Rad]  WITH CHECK ADD  CONSTRAINT [R_33] FOREIGN KEY([IDZaposleni])
REFERENCES [dbo].[Zaposleni] ([IDZaposleni])
ON UPDATE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_33]') AND parent_object_id = OBJECT_ID(N'[dbo].[Rad]'))
ALTER TABLE [dbo].[Rad] CHECK CONSTRAINT [R_33]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_34]') AND parent_object_id = OBJECT_ID(N'[dbo].[Rad]'))
ALTER TABLE [dbo].[Rad]  WITH CHECK ADD  CONSTRAINT [R_34] FOREIGN KEY([IDPosao])
REFERENCES [dbo].[Posao] ([IDPosao])
ON UPDATE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_34]') AND parent_object_id = OBJECT_ID(N'[dbo].[Rad]'))
ALTER TABLE [dbo].[Rad] CHECK CONSTRAINT [R_34]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_44]') AND parent_object_id = OBJECT_ID(N'[dbo].[Roba]'))
ALTER TABLE [dbo].[Roba]  WITH CHECK ADD  CONSTRAINT [R_44] FOREIGN KEY([IDTipRobe])
REFERENCES [dbo].[TipRobe] ([IDTipRobe])
ON UPDATE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_44]') AND parent_object_id = OBJECT_ID(N'[dbo].[Roba]'))
ALTER TABLE [dbo].[Roba] CHECK CONSTRAINT [R_44]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_28]') AND parent_object_id = OBJECT_ID(N'[dbo].[Sadrzi]'))
ALTER TABLE [dbo].[Sadrzi]  WITH CHECK ADD  CONSTRAINT [R_28] FOREIGN KEY([IDNorma])
REFERENCES [dbo].[Norma] ([IDNorma])
ON UPDATE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_28]') AND parent_object_id = OBJECT_ID(N'[dbo].[Sadrzi]'))
ALTER TABLE [dbo].[Sadrzi] CHECK CONSTRAINT [R_28]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_47]') AND parent_object_id = OBJECT_ID(N'[dbo].[Sadrzi]'))
ALTER TABLE [dbo].[Sadrzi]  WITH CHECK ADD  CONSTRAINT [R_47] FOREIGN KEY([IDRoba])
REFERENCES [dbo].[Roba] ([IDRoba])
ON UPDATE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_47]') AND parent_object_id = OBJECT_ID(N'[dbo].[Sadrzi]'))
ALTER TABLE [dbo].[Sadrzi] CHECK CONSTRAINT [R_47]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_36]') AND parent_object_id = OBJECT_ID(N'[dbo].[SadrziJedinica]'))
ALTER TABLE [dbo].[SadrziJedinica]  WITH CHECK ADD  CONSTRAINT [R_36] FOREIGN KEY([IDSadrzi])
REFERENCES [dbo].[Sadrzi] ([IDSadrzi])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_36]') AND parent_object_id = OBJECT_ID(N'[dbo].[SadrziJedinica]'))
ALTER TABLE [dbo].[SadrziJedinica] CHECK CONSTRAINT [R_36]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_37]') AND parent_object_id = OBJECT_ID(N'[dbo].[SadrziKolicina]'))
ALTER TABLE [dbo].[SadrziKolicina]  WITH CHECK ADD  CONSTRAINT [R_37] FOREIGN KEY([IDSadrzi])
REFERENCES [dbo].[Sadrzi] ([IDSadrzi])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_37]') AND parent_object_id = OBJECT_ID(N'[dbo].[SadrziKolicina]'))
ALTER TABLE [dbo].[SadrziKolicina] CHECK CONSTRAINT [R_37]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_10]') AND parent_object_id = OBJECT_ID(N'[dbo].[Sef]'))
ALTER TABLE [dbo].[Sef]  WITH CHECK ADD  CONSTRAINT [R_10] FOREIGN KEY([IDZaposleni])
REFERENCES [dbo].[Zaposleni] ([IDZaposleni])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_10]') AND parent_object_id = OBJECT_ID(N'[dbo].[Sef]'))
ALTER TABLE [dbo].[Sef] CHECK CONSTRAINT [R_10]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_26]') AND parent_object_id = OBJECT_ID(N'[dbo].[Sprat]'))
ALTER TABLE [dbo].[Sprat]  WITH CHECK ADD  CONSTRAINT [R_26] FOREIGN KEY([IDObjekat])
REFERENCES [dbo].[Objekat] ([IDObjekat])
ON UPDATE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_26]') AND parent_object_id = OBJECT_ID(N'[dbo].[Sprat]'))
ALTER TABLE [dbo].[Sprat] CHECK CONSTRAINT [R_26]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_18]') AND parent_object_id = OBJECT_ID(N'[dbo].[Zaduzio]'))
ALTER TABLE [dbo].[Zaduzio]  WITH CHECK ADD  CONSTRAINT [R_18] FOREIGN KEY([IDMagacin])
REFERENCES [dbo].[Magacin] ([IDMagacin])
ON UPDATE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_18]') AND parent_object_id = OBJECT_ID(N'[dbo].[Zaduzio]'))
ALTER TABLE [dbo].[Zaduzio] CHECK CONSTRAINT [R_18]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_22]') AND parent_object_id = OBJECT_ID(N'[dbo].[Zaduzio]'))
ALTER TABLE [dbo].[Zaduzio]  WITH CHECK ADD  CONSTRAINT [R_22] FOREIGN KEY([IDZaposleni])
REFERENCES [dbo].[Zaposleni] ([IDZaposleni])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_22]') AND parent_object_id = OBJECT_ID(N'[dbo].[Zaduzio]'))
ALTER TABLE [dbo].[Zaduzio] CHECK CONSTRAINT [R_22]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_48]') AND parent_object_id = OBJECT_ID(N'[dbo].[Zaduzio]'))
ALTER TABLE [dbo].[Zaduzio]  WITH CHECK ADD  CONSTRAINT [R_48] FOREIGN KEY([IDRoba])
REFERENCES [dbo].[Roba] ([IDRoba])
ON UPDATE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_48]') AND parent_object_id = OBJECT_ID(N'[dbo].[Zaduzio]'))
ALTER TABLE [dbo].[Zaduzio] CHECK CONSTRAINT [R_48]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_13]') AND parent_object_id = OBJECT_ID(N'[dbo].[Zaposleni]'))
ALTER TABLE [dbo].[Zaposleni]  WITH CHECK ADD  CONSTRAINT [R_13] FOREIGN KEY([IDMagacin])
REFERENCES [dbo].[Magacin] ([IDMagacin])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_13]') AND parent_object_id = OBJECT_ID(N'[dbo].[Zaposleni]'))
ALTER TABLE [dbo].[Zaposleni] CHECK CONSTRAINT [R_13]
GO
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_Ocena]') AND parent_object_id = OBJECT_ID(N'[dbo].[Ocena]'))
ALTER TABLE [dbo].[Ocena]  WITH CHECK ADD  CONSTRAINT [CK_Ocena] CHECK  (([Ocena]>=(1) AND [Ocena]<=(10)))
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_Ocena]') AND parent_object_id = OBJECT_ID(N'[dbo].[Ocena]'))
ALTER TABLE [dbo].[Ocena] CHECK CONSTRAINT [CK_Ocena]
GO
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_Posao]') AND parent_object_id = OBJECT_ID(N'[dbo].[Posao]'))
ALTER TABLE [dbo].[Posao]  WITH CHECK ADD  CONSTRAINT [CK_Posao] CHECK  (([Status]='U' OR [Status]='Z'))
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_Posao]') AND parent_object_id = OBJECT_ID(N'[dbo].[Posao]'))
ALTER TABLE [dbo].[Posao] CHECK CONSTRAINT [CK_Posao]
GO
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_Posao_1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Posao]'))
ALTER TABLE [dbo].[Posao]  WITH CHECK ADD  CONSTRAINT [CK_Posao_1] CHECK  (([DatumKraja] IS NULL OR [DatumPocetka]<=[DatumKraja] AND [Status]='Z'))
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_Posao_1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Posao]'))
ALTER TABLE [dbo].[Posao] CHECK CONSTRAINT [CK_Posao_1]
GO
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_Rad]') AND parent_object_id = OBJECT_ID(N'[dbo].[Rad]'))
ALTER TABLE [dbo].[Rad]  WITH CHECK ADD  CONSTRAINT [CK_Rad] CHECK  (([DatumKraja] IS NULL OR [DatumPocetka]<=[DatumKraja]))
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_Rad]') AND parent_object_id = OBJECT_ID(N'[dbo].[Rad]'))
ALTER TABLE [dbo].[Rad] CHECK CONSTRAINT [CK_Rad]
GO
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[ProveraDaLiJeIspravnogPola_1180827198]') AND parent_object_id = OBJECT_ID(N'[dbo].[Zaposleni]'))
ALTER TABLE [dbo].[Zaposleni]  WITH CHECK ADD  CONSTRAINT [ProveraDaLiJeIspravnogPola_1180827198] CHECK  (([Pol]='M' OR [Pol]='Z'))
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[ProveraDaLiJeIspravnogPola_1180827198]') AND parent_object_id = OBJECT_ID(N'[dbo].[Zaposleni]'))
ALTER TABLE [dbo].[Zaposleni] CHECK CONSTRAINT [ProveraDaLiJeIspravnogPola_1180827198]
GO
/****** Object:  StoredProcedure [dbo].[DeletePosao]    Script Date: 22.05.2017. 22:48:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeletePosao]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[DeletePosao] AS'
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[DeletePosao]
	-- Add the parameters for the stored procedure here
	@IDPosao IDType
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @IDObjekat IDType
	DECLARE @IDGradiliste IDType
	DECLARE @IDMagacin IDType
	DECLARE @IDSprat IDType
	DECLARE @IDNorma IDType
    -- Insert statements for procedure here

	BEGIN TRY
		BEGIN TRANSACTION
		SAVE TRAN ProcDeletePosao
		SELECT @IDSprat = IDSprat, @IDNorma = IDNorma
		FROM Posao
		WHERE IDPosao = @IDPosao

		SELECT @IDObjekat = Sprat.IDObjekat
		FROM Objekat, Sprat
		WHERE Sprat.IDObjekat = Objekat.IDObjekat AND IDSprat = @IDSprat

		SELECT 'Objkeat' = @IDObjekat


		SELECT @IDGradiliste = Objekat.IDGradiliste
		FROM Gradiliste, Objekat
		WHERE Gradiliste.IDGradiliste = Objekat.IDGradiliste AND IDObjekat = @IDObjekat
		SELECT 'Grad' = @IDGradiliste
		SELECT @IDMagacin = IDMagacin
		FROM Magacin, Gradiliste
		WHERE Magacin.IDGradiliste = Gradiliste.IDGradiliste AND Gradiliste.IDGradiliste = @IDGradiliste
		SELECT 'Mag' = @IDMagacin
		-- TO DO : SET magacin, and debug this function
		EXEC	 [dbo].[ReturnMaterijalForNorma]
					@IDNorma = @IDNorma,
					@IDMagacin=@IDMagacin
		DELETE FROM Posao
		WHERE IDPosao = @IDPosao
		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ErrorNumber
			,ERROR_SEVERITY() AS ErrorSeverity
			,ERROR_STATE() AS ErrorState
			,ERROR_PROCEDURE() AS ErrorProcedure
			,ERROR_LINE() AS ErrorLine
			,ERROR_MESSAGE() AS ErrorMessage
		ROLLBACK TRANSACTION ProcDeletePosao;
		THROW;
	END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[InsertIma]    Script Date: 22.05.2017. 22:48:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InsertIma]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[InsertIma] AS'
END
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[InsertIma]
	-- Add the parameters for the stored procedure here
	@IDMagacin IDType,
	@IDRoba IDType
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @IDIma IDType

    -- Insert statements for procedure here

	BEGIN TRY
		BEGIN TRANSACTION
		SAVE TRAN ProcInsertIma
		INSERT INTO Ima(IDMagacin, IDRoba)
		VALUES (@IDMagacin, @IDRoba)
		SET @IDIma = SCOPE_IDENTITY()
		COMMIT TRAN
		RETURN @IDIma
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
		ROLLBACK TRANSACTION ProcInsertIma;
		THROW

	END CATCH

END


GO
/****** Object:  StoredProcedure [dbo].[InsertImaJedinica]    Script Date: 22.05.2017. 22:48:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InsertImaJedinica]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[InsertImaJedinica] AS'
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[InsertImaJedinica]
	-- Add the parameters for the stored procedure here
	@IDMagacin IDType,
	@IDRoba IDType,
	@jedinica int
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @IDIma IDType


		BEGIN TRY
			BEGIN TRANSACTION ProcInsertImaJedinica
			SAVE TRAN ProcInsertImaJedinica;
			IF EXISTS (SELECT * FROM Ima WHERE IDRoba = @IDRoba AND IDMagacin = @IDMagacin)
				BEGIN
					SELECT @IDIma = IDIma FROM Ima WHERE  IDRoba = @IDRoba AND IDMagacin = @IDMagacin
					UPDATE ImaJedinica
					SET Jedinica = Jedinica + @jedinica
					WHERE IDIma = @IDIma
				END
			ELSE
			BEGIN


				DECLARE	@return_value int
				EXEC	@return_value = [dbo].[InsertIma]
				@IDMagacin = @IDMagacin,
				@IDRoba= @IDRoba

				IF @return_value = -1
				BEGIN

					THROW 50000, 'Something is wrong with execution of InsertIma', 1;
				END
				SET @IDIma = @return_value

				INSERT INTO ImaJedinica(IDIma, Jedinica)
				VALUES (@IDIma, @jedinica)
			END

			COMMIT TRANSACTION;
			RETURN @IDIma
		END TRY
			BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ErrorNumber
			,ERROR_SEVERITY() AS ErrorSeverity
			,ERROR_STATE() AS ErrorState
			,ERROR_PROCEDURE() AS ErrorProcedure
			,ERROR_LINE() AS ErrorLine
			,ERROR_MESSAGE() AS ErrorMessage;

		ROLLBACK TRANSACTION ProcInsertImaJedinica;
		THROW;
	END CATCH

END

GO
/****** Object:  StoredProcedure [dbo].[InsertImaKolicina]    Script Date: 22.05.2017. 22:48:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InsertImaKolicina]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[InsertImaKolicina] AS'
END
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[InsertImaKolicina]
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


	BEGIN TRY
		BEGIN TRANSACTION
		SAVE TRAN ProcInsertImaKolicina
		IF EXISTS (SELECT * FROM Ima WHERE IDRoba = @IDRoba AND IDMagacin = @IDMagacin)
				BEGIN
					SELECT @IDIma = IDIma FROM Ima WHERE  IDRoba = @IDRoba AND IDMagacin = @IDMagacin
					UPDATE ImaKolicine
					SET Kolicina = Kolicina+ @kolicina
					WHERE IDIma = @IDIma
				END
			ELSE
		BEGIN
			DECLARE	@return_value int
			EXEC	@return_value = [dbo].[InsertIma]
			@IDMagacin = @IDMagacin,
			@IDRoba= @IDRoba

			IF @return_value = -1
			BEGIN
				THROW -1, 'Something is wrong with execution of InsertIma', 1;
			END
			SET @IDIma = @return_value
			SELECT 'Nesto' = @return_value

			INSERT INTO ImaKolicine(IDIma, Kolicina)
			VALUES (@IDIma, @kolicina)
		END
			COMMIT TRANSACTION;
			RETURN @IDIma
		END TRY
			BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ErrorNumber
			,ERROR_SEVERITY() AS ErrorSeverity
			,ERROR_STATE() AS ErrorState
			,ERROR_PROCEDURE() AS ErrorProcedure
			,ERROR_LINE() AS ErrorLine
			,ERROR_MESSAGE() AS ErrorMessage;

		ROLLBACK TRANSACTION ProcInsertImaKolicina;
		THROW;
	END CATCH



END


GO
/****** Object:  StoredProcedure [dbo].[InsertMagacin]    Script Date: 22.05.2017. 22:48:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InsertMagacin]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[InsertMagacin] AS'
END
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[InsertMagacin]
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


	BEGIN TRY
		BEGIN TRANSACTION
		SAVE TRAN ProcInsertMagacin
		INSERT INTO Sef(IDZaposleni) VALUES (@IDSef)
		INSERT INTO Magacin(IDGradiliste, IDZaposleni, Plata) VALUES(@IDGradiliste, @IDSef, @plata)
		DECLARE	@return_value int
		SET @IDMagacinRet = SCOPE_IDENTITY()
		EXEC	@return_value = [dbo].[ZaposliUMagacin]
		@IDZaposleni = @IDSef,
		@IDMagacin = @IDMagacinRet

		COMMIT TRANSACTION;
		RETURN @IDMagacinRet
	END TRY
	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ErrorNumber
			,ERROR_SEVERITY() AS ErrorSeverity
			,ERROR_STATE() AS ErrorState
			,ERROR_PROCEDURE() AS ErrorProcedure
			,ERROR_LINE() AS ErrorLine
			,ERROR_MESSAGE() AS ErrorMessage;
		ROLLBACK TRANSACTION ProcInsertMagacin;
		THROW:
	END CATCH


END


GO
/****** Object:  StoredProcedure [dbo].[InsertPosao]    Script Date: 22.05.2017. 22:48:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InsertPosao]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[InsertPosao] AS'
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[InsertPosao]
	-- Add the parameters for the stored procedure here
	@IDNorma IDType,
	@IDSprat IDType,
	@DatumPocetka DateType
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @IDPosao IDType
	DECLARE @IDObjekat IDType
	DECLARE @IDGradiliste IDType
	DECLARE @IDMagacin IDType
    -- Insert statements for procedure here

	BEGIN TRY
		BEGIN TRANSACTION
		SAVE TRAN ProcInsertPosao

		SELECT @IDObjekat = Sprat.IDObjekat
		FROM Objekat, Sprat
		WHERE Sprat.IDObjekat = Objekat.IDObjekat AND IDSprat = @IDSprat

		SELECT 'Objkeat' = @IDObjekat


		SELECT @IDGradiliste = Objekat.IDGradiliste
		FROM Gradiliste, Objekat
		WHERE Gradiliste.IDGradiliste = Objekat.IDGradiliste AND IDObjekat = @IDObjekat
		SELECT 'Grad' = @IDGradiliste
		SELECT @IDMagacin = IDMagacin
		FROM Magacin, Gradiliste
		WHERE Magacin.IDGradiliste = Gradiliste.IDGradiliste AND Gradiliste.IDGradiliste = @IDGradiliste
		SELECT 'Mag' = @IDMagacin
		-- TO DO : SET magacin, and debug this function
		EXEC	 [dbo].[TakeMaterijalForNorma]
					@IDNorma = @IDNorma,
					@IDMagacin=@IDMagacin
		INSERT INTO Posao(IDSprat, IDNorma, DatumPocetka, DatumKraja, Status)
		VALUES ( @IDSprat, @IDNorma, @DatumPocetka, NULL, 'U')
		SET @IDPosao = SCOPE_IDENTITY()
		COMMIT TRANSACTION;
		RETURN @IDPosao
	END TRY
	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ErrorNumber
			,ERROR_SEVERITY() AS ErrorSeverity
			,ERROR_STATE() AS ErrorState
			,ERROR_PROCEDURE() AS ErrorProcedure
			,ERROR_LINE() AS ErrorLine
			,ERROR_MESSAGE() AS ErrorMessage
		ROLLBACK TRANSACTION ProcInsertPosao;
		THROW;
	END CATCH


END

GO
/****** Object:  StoredProcedure [dbo].[InsertSadrzi]    Script Date: 22.05.2017. 22:48:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InsertSadrzi]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[InsertSadrzi] AS'
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[InsertSadrzi]
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

	BEGIN TRY
		BEGIN TRANSACTION
		SAVE TRAN ProcInsertSadrzi
		INSERT INTO Sadrzi(IDNorma, IDRoba)
		VALUES (@IDNorma, @IDRoba)
		SET @IDSadrzi = SCOPE_IDENTITY()
		COMMIT TRAN
		RETURN @IDSadrzi
	END TRY
	BEGIN CATCH
			SELECT
			ERROR_NUMBER() AS ErrorNumber
			,ERROR_SEVERITY() AS ErrorSeverity
			,ERROR_STATE() AS ErrorState
			,ERROR_PROCEDURE() AS ErrorProcedure
			,ERROR_LINE() AS ErrorLine
			,ERROR_MESSAGE() AS ErrorMessage;
		ROLLBACK TRANSACTION ProcInsertSadrzi;
		THROW;

	END CATCH


END

GO
/****** Object:  StoredProcedure [dbo].[InsertSadrziJedinica]    Script Date: 22.05.2017. 22:48:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InsertSadrziJedinica]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[InsertSadrziJedinica] AS'
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[InsertSadrziJedinica]
	-- Add the parameters for the stored procedure here
		@IDRoba IDType,
	@IDNorma IDType,
	@jedinica int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @IDSadrzi IDType


	BEGIN TRY
		BEGIN TRANSACTION
		SAVE TRAN ProcInsertSadrziJedinica
		DECLARE	@return_value IDType
		EXEC	@return_value = [dbo].[InsertSadrzi]
		@IDRoba = @IDRoba,
		@IDNorma = @IDNorma

		IF @return_value = -1
		BEGIN
			THROW 50000, 'Something is wrong with execution of InsertSadrzi', 1;
		END
		SET @IDSadrzi = @return_value

		INSERT INTO SadrziJedinica(IDSadrzi, Broj)
		VALUES (@IDSadrzi, @jedinica)
		COMMIT TRANSACTION;
		RETURN @IDSadrzi
	END TRY
	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ErrorNumber
			,ERROR_SEVERITY() AS ErrorSeverity
			,ERROR_STATE() AS ErrorState
			,ERROR_PROCEDURE() AS ErrorProcedure
			,ERROR_LINE() AS ErrorLine
			,ERROR_MESSAGE() AS ErrorMessage;
		ROLLBACK TRANSACTION ProcInsertSadrziJedinica;
		THROW;
	END CATCH

END

GO
/****** Object:  StoredProcedure [dbo].[InsertSadrziKolicina]    Script Date: 22.05.2017. 22:48:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InsertSadrziKolicina]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[InsertSadrziKolicina] AS'
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[InsertSadrziKolicina]
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


	BEGIN TRY
		BEGIN TRANSACTION
		SAVE TRAN ProcInsertSadrziKolicina
		DECLARE	@return_value IDType
		EXEC	@return_value = [dbo].[InsertSadrzi]
		@IDRoba = @IDRoba,
		@IDNorma = @IDNorma

		IF @return_value = -1
		BEGIN
			THROW 50000, 'Something is wrong with execution of InsertSadrzi', 1;
		END
		SET @IDSadrzi = @return_value

		INSERT INTO SadrziKolicina(IDSadrzi, Kolicina)
		VALUES (@IDSadrzi, @kolicina)
		COMMIT TRANSACTION;
		RETURN @IDSadrzi
	END TRY
	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ErrorNumber
			,ERROR_SEVERITY() AS ErrorSeverity
			,ERROR_STATE() AS ErrorState
			,ERROR_PROCEDURE() AS ErrorProcedure
			,ERROR_LINE() AS ErrorLine
			,ERROR_MESSAGE() AS ErrorMessage;
		ROLLBACK TRANSACTION ProcInsertSadrziKolicina;
		THROW
	END CATCH


END

GO
/****** Object:  StoredProcedure [dbo].[IsplatiUSvimMagacinima]    Script Date: 22.05.2017. 22:48:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IsplatiUSvimMagacinima]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[IsplatiUSvimMagacinima] AS'
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[IsplatiUSvimMagacinima]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

     BEGIN TRY
		BEGIN TRANSACTION
        SAVE TRANSACTION ProcIsplatiUSvimMagacinima

		DECLARE @Cursor CURSOR
		DECLARE @IDMagacin IDType


		SET @Cursor = CURSOR FOR
		SELECT IDMagacin
		FROM Magacin
		OPEN @Cursor
		FETCH NEXT FROM @Cursor
		INTO @IDMagacin

		WHILE @@FETCH_STATUS = 0
		BEGIN
			EXEC IsplatiZaposlenogUMagacinu
			@IDMagacin = @IDMagacin;


			FETCH NEXT FROM @Cursor
			INTO @IDMagacin
		END

		CLOSE @Cursor
		DEALLOCATE @Cursor

		COMMIT
	END TRY
	BEGIN CATCH
	SELECT
			ERROR_NUMBER() AS ErrorNumber
			,ERROR_SEVERITY() AS ErrorSeverity
			,ERROR_STATE() AS ErrorState
			,ERROR_PROCEDURE() AS ErrorProcedure
			,ERROR_LINE() AS ErrorLine
			,ERROR_MESSAGE() AS ErrorMessage;
        ROLLBACK TRANSACTION ProcIsplatiUSvimMagacinima;
		throw;
	END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[IsplatiZaposlenogUMagacinu]    Script Date: 22.05.2017. 22:48:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IsplatiZaposlenogUMagacinu]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[IsplatiZaposlenogUMagacinu] AS'
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[IsplatiZaposlenogUMagacinu]
	-- Add the parameters for the stored procedure here
	@IDMagacin IDType
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
		BEGIN TRANSACTION
        SAVE TRANSACTION ProcIsplatiZaposlenogU;

		DECLARE @Plata FloatType
		SELECT @Plata = Plata
		FROM Magacin

		UPDATE Zaposleni
		SET IsplaceniIznos = IsplaceniIznos + @Plata
		WHERE @IDMagacin = IDMagacin

		COMMIT
	END TRY
	BEGIN CATCH
	SELECT
			ERROR_NUMBER() AS ErrorNumber
			,ERROR_SEVERITY() AS ErrorSeverity
			,ERROR_STATE() AS ErrorState
			,ERROR_PROCEDURE() AS ErrorProcedure
			,ERROR_LINE() AS ErrorLine
			,ERROR_MESSAGE() AS ErrorMessage;
        ROLLBACK TRANSACTION ProcIsplatiZaposlenogU;
		throw;
	END CATCH


END

GO
/****** Object:  StoredProcedure [dbo].[IzmeniSefa]    Script Date: 22.05.2017. 22:48:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IzmeniSefa]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[IzmeniSefa] AS'
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[IzmeniSefa]
	-- Add the parameters for the stored procedure here
	@IDMagacin IDType,
	@IDZaposleni IDType
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   	BEGIN TRY
		BEGIN TRANSACTION
        SAVE TRANSACTION ProcTakeMaterijalForNorma;

		DECLARE @OldSef IDType

		SELECT @OldSef = @IDZaposleni
		FROM Magacin
		WHERE @IDMagacin = IDMagacin

		UPDATE Magacin
		SET IDZaposleni = NULL
		WHERE @IDMagacin = @IDMagacin

		DELETE FROM Sef
		WHERE @OldSef = IDZaposleni

		INSERT INTO SEF(IDZaposleni)
		VALUES (@IDZaposleni)

		Exec ZaposliUMagacin @IDZaposleni = @IDZaposleni, @IDMagacin = @IDMagacin

		UPDATE Magacin
		SET IDZaposleni = @IDZaposleni

		COMMIT
	END TRY
	BEGIN CATCH
	SELECT
			ERROR_NUMBER() AS ErrorNumber
			,ERROR_SEVERITY() AS ErrorSeverity
			,ERROR_STATE() AS ErrorState
			,ERROR_PROCEDURE() AS ErrorProcedure
			,ERROR_LINE() AS ErrorLine
			,ERROR_MESSAGE() AS ErrorMessage;
        ROLLBACK TRANSACTION ProcTakeMaterijalForNorma;
		throw;
	END CATCH

END

GO
/****** Object:  StoredProcedure [dbo].[ReturnMaterijalForNorma]    Script Date: 22.05.2017. 22:48:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ReturnMaterijalForNorma]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ReturnMaterijalForNorma] AS'
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[ReturnMaterijalForNorma]
	-- Add the parameters for the stored procedure here
	@IDNorma IDType,
	@IDMagacin IDType
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @Cursor CURSOR
	DECLARE @IDSadrzi IDType
	DECLARE @Jedinica int
	DECLARE @kolicina FloatType
	DECLARE @IDRoba IDType
	-- Insert statements for procedure here
	BEGIN TRY
		BEGIN TRANSACTION
        SAVE TRANSACTION ProcReturnMaterijalForNorma;
		SET @Cursor = CURSOR FOR
		SELECT Sadrzi.IDSadrzi AS IDSadrzi, Broj, IDRoba
		FROM SadrziJedinica, Sadrzi
		WHERE IDNorma = @IDNorma AND Sadrzi.IDSadrzi = SadrziJedinica.IDSadrzi

		OPEN @Cursor

		FETCH NEXT FROM @Cursor
		INTO @IDSadrzi, @Jedinica, @IDRoba
		WHILE @@FETCH_STATUS = 0
		BEGIN
			SELECT 'Roba' = @IDRoba
			SELECT 'Magacin' = @IDMagacin
			DECLARE @IDIma IDType
			SET @IDIma  = -1
			SELECT @IDIma = Ima.Idima
			FROM Ima, ImaJedinica
			WHERE IMa.IDIma = ImaJedinica.IDIma AND IDRoba = @IDRoba AND @IDMagacin = IDMagacin

			EXEC	 [dbo].[InsertImaJedinica]
					@IDMagacin = @IDMagacin,
					@IDRoba = @IDRoba,
					@Jedinica = @Jedinica


			FETCH NEXT FROM @Cursor
			INTO @IDSadrzi, @Jedinica, @IDRoba
		END

		CLOSE @Cursor
		DEALLOCATE @Cursor


		SET @Cursor = CURSOR FOR
		SELECT Sadrzi.IDSadrzi AS IDSadrzi, Kolicina, IDRoba
		FROM SadrziKolicina, Sadrzi
		WHERE IDNorma = @IDNorma AND Sadrzi.IDSadrzi = SadrziKolicina.IDSadrzi

		OPEN @Cursor

		FETCH NEXT FROM @Cursor
		INTO @IDSadrzi, @kolicina, @IDRoba
		WHILE @@FETCH_STATUS = 0
		BEGIN
			SET @IDIma  = -1
			SELECT @IDIma = Ima.Idima
			FROM Ima, ImaKolicine
			WHERE IMa.IDIma = ImaKolicine.IDIma AND IDRoba = @IDRoba AND @IDMagacin = IDMagacin


			EXEC	 [dbo].[InsertImaKolicina]
					@IDMagacin = @IDMagacin,
					@IDRoba = @IDRoba,
					@kolicina=@kolicina


			FETCH NEXT FROM @Cursor
			INTO @IDSadrzi, @kolicina, @IDRoba
		END

		CLOSE @Cursor
		DEALLOCATE @Cursor

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	SELECT
			ERROR_NUMBER() AS ErrorNumber
			,ERROR_SEVERITY() AS ErrorSeverity
			,ERROR_STATE() AS ErrorState
			,ERROR_PROCEDURE() AS ErrorProcedure
			,ERROR_LINE() AS ErrorLine
			,ERROR_MESSAGE() AS ErrorMessage;
        ROLLBACK TRANSACTION ProcReturnMaterijalForNorma;
		throw;
	END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[TakeImaJedinica]    Script Date: 22.05.2017. 22:48:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TakeImaJedinica]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[TakeImaJedinica] AS'
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[TakeImaJedinica]
	-- Add the parameters for the stored procedure here
	@IDIma IDType,
	@Jedinica int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here

	BEGIN TRY
		BEGIN TRANSACTION
		SAVE TRAN ProcTakeImaJedinica

		SELECT 'Ima'=@IDIma

		IF EXISTS (SELECT * FROM ImaJedinica WHERE @IDIma = IDIma)
		BEGIN

			DECLARE @oldJedinica int
			SELECT @oldJedinica = Jedinica FROM ImaJedinica WHERE @IDIma = IDIma;
			IF (@Jedinica > @oldJedinica)
			BEGIN
				THROW 50000, 'Nema dovoljno', 1;
			END
			ELSE IF (@Jedinica = @oldJedinica)
			BEGIN
				DELETE FROM Ima WHERE @IDIma = IDIma
			END
			ELSE
			BEGIN
				UPDATE ImaJedinica
				SET Jedinica = Jedinica - @Jedinica
				WHERE @IDIma = IDIma
			END
		END
		ELSE
			THROW 50000, 'Wrong id' , 1;
		COMMIT TRANSACTION;

	END TRY
	BEGIN CATCH
			SELECT
			ERROR_NUMBER() AS ErrorNumber
			,ERROR_SEVERITY() AS ErrorSeverity
			,ERROR_STATE() AS ErrorState
			,ERROR_PROCEDURE() AS ErrorProcedure
			,ERROR_LINE() AS ErrorLine
			,ERROR_MESSAGE() AS ErrorMessage;
            ROLLBACK TRANSACTION ProcTakeImaJedinica;
		THROW;
	END CATCH

END

GO
/****** Object:  StoredProcedure [dbo].[TakeImaKolicina]    Script Date: 22.05.2017. 22:48:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TakeImaKolicina]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[TakeImaKolicina] AS'
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[TakeImaKolicina]
	-- Add the parameters for the stored procedure here
	@IDIma IDType,
	@kolicina FloatType
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here

	BEGIN TRY
		BEGIN TRANSACTION ProcTakeImaKolicina
		SAVE TRAN ProcTakeImaKolicina
		IF EXISTS (SELECT * FROM ImaKolicine WHERE @IDIma = IDIma)
		BEGIN
			DECLARE @oldKolicina int;
			SELECT @oldKolicina = Kolicina FROM ImaKolicine WHERE @IDIma = IDIma;
			IF (@kolicina > @oldKolicina)
			BEGIN
				THROW 50010, 'Nema dovoljno kolicine', 1;
			END
			ELSE IF (@kolicina = @oldKolicina)
			BEGIN
				DELETE FROM Ima WHERE @IDIma = IDIma
			END
			ELSE
			BEGIN
				UPDATE ImaKolicine
				SET Kolicina = Kolicina - @kolicina
				WHERE @IDIma = IDIma
			END
		END
		ELSE
			THROW 50000, 'Wrong id', 1;

		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ErrorNumber
			,ERROR_SEVERITY() AS ErrorSeverity
			,ERROR_STATE() AS ErrorState
			,ERROR_PROCEDURE() AS ErrorProcedure
			,ERROR_LINE() AS ErrorLine
			,ERROR_MESSAGE() AS ErrorMessage;

			ROLLBACK TRANSACTION ProcTakeImaKolicina;
			THROW;
	END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[TakeMaterijalForNorma]    Script Date: 22.05.2017. 22:48:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TakeMaterijalForNorma]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[TakeMaterijalForNorma] AS'
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[TakeMaterijalForNorma]
	-- Add the parameters for the stored procedure here
	@IDNorma IDType,
	@IDMagacin IDType
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @Cursor CURSOR
	DECLARE @IDSadrzi IDType
	DECLARE @Jedinica int
	DECLARE @kolicina FloatType
	DECLARE @IDRoba IDType

	-- Insert statements for procedure here
	BEGIN TRY
		BEGIN TRANSACTION
        SAVE TRANSACTION ProcTakeMaterijalForNorma;
		SET @Cursor = CURSOR FOR
		SELECT Sadrzi.IDSadrzi AS IDSadrzi, Broj, IDRoba
		FROM SadrziJedinica, Sadrzi
		WHERE IDNorma = @IDNorma AND Sadrzi.IDSadrzi = SadrziJedinica.IDSadrzi

		OPEN @Cursor

		FETCH NEXT FROM @Cursor
		INTO @IDSadrzi, @Jedinica, @IDRoba
		WHILE @@FETCH_STATUS = 0
		BEGIN
			SELECT 'Roba' = @IDRoba
			SELECT 'Magacin' = @IDMagacin
			DECLARE @IDIma IDType
			SET @IDIma  = -1
			SELECT @IDIma = Ima.Idima
			FROM Ima, ImaJedinica
			WHERE IMa.IDIma = ImaJedinica.IDIma AND IDRoba = @IDRoba AND @IDMagacin = IDMagacin

			EXEC	 [dbo].[TakeImaJedinica]
					@IDIma = @IDIma,
					@Jedinica = @Jedinica


			FETCH NEXT FROM @Cursor
			INTO @IDSadrzi, @Jedinica, @IDRoba
		END

		CLOSE @Cursor
		DEALLOCATE @Cursor

		SET @Cursor = CURSOR FOR
		SELECT Sadrzi.IDSadrzi AS IDSadrzi, Kolicina, IDRoba
		FROM SadrziKolicina, Sadrzi
		WHERE IDNorma = @IDNorma AND Sadrzi.IDSadrzi = SadrziKolicina.IDSadrzi

		OPEN @Cursor

		FETCH NEXT FROM @Cursor
		INTO @IDSadrzi, @Kolicina, @IDRoba
		WHILE @@FETCH_STATUS = 0
		BEGIN
			SELECT 'Roba' = @IDRoba
			SELECT 'Magacin' = @IDMagacin

			SET @IDIma  = -1
			SELECT @IDIma = Ima.Idima
			FROM Ima, ImaKolicine
			WHERE IMa.IDIma = ImaKolicine.IDIma AND IDRoba = @IDRoba AND @IDMagacin = IDMagacin

			EXEC	 [dbo].[TakeImaKolicina]
					@IDIma = @IDIma,
					@kolicina= @kolicina


			FETCH NEXT FROM @Cursor
			INTO @IDSadrzi, @Kolicina, @IDRoba
		END

		CLOSE @Cursor
		DEALLOCATE @Cursor



		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	SELECT
			ERROR_NUMBER() AS ErrorNumber
			,ERROR_SEVERITY() AS ErrorSeverity
			,ERROR_STATE() AS ErrorState
			,ERROR_PROCEDURE() AS ErrorProcedure
			,ERROR_LINE() AS ErrorLine
			,ERROR_MESSAGE() AS ErrorMessage;
        ROLLBACK TRANSACTION ProcTakeMaterijalForNorma;
		throw;
	END CATCH

END

GO
/****** Object:  StoredProcedure [dbo].[UzmiRobuIzMagacinPoJed]    Script Date: 22.05.2017. 22:48:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UzmiRobuIzMagacinPoJed]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[UzmiRobuIzMagacinPoJed] AS'
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[UzmiRobuIzMagacinPoJed]
	-- Add the parameters for the stored procedure here
	@IDRoba IDType,
	@IDMagacin IDType,
	@jedinica int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DECLARE @jedinicaIma int
	DECLARE @IDIma IDType
	BEGIN TRY
		BEGIN TRANSACTION
        SAVE TRANSACTION ProcUzmiRobuIzMagacinPoJed;
		SELECT @jedinicaIma = Jedinica, @IDIma = Ima.IDIma
		FROM Ima, ImaJedinica
		WHERE @IDRoba = IDRoba AND @IDMagacin = IDMagacin AND Ima.IDIma = ImaJedinica.IDIma;

		-- If there is more robe than it is needed we just take the amount which we need
		IF @jedinicaIma >= @jedinica
			SET @jedinicaIma = @jedinica

		-- Insert statements for procedure here
		EXEC [TakeImaJedinica] @IDIma = @IDIma, @jedinica = @jedinicaIma
		COMMIT
		RETURN @jedinicaIma
	END TRY
	BEGIN CATCH
	SELECT
			ERROR_NUMBER() AS ErrorNumber
			,ERROR_SEVERITY() AS ErrorSeverity
			,ERROR_STATE() AS ErrorState
			,ERROR_PROCEDURE() AS ErrorProcedure
			,ERROR_LINE() AS ErrorLine
			,ERROR_MESSAGE() AS ErrorMessage;
        ROLLBACK TRANSACTION ProcUzmiRobuIzMagacinPoJed;
		throw;
	END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[UzmiRobuIzMagacinPoKol]    Script Date: 22.05.2017. 22:48:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UzmiRobuIzMagacinPoKol]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[UzmiRobuIzMagacinPoKol] AS'
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[UzmiRobuIzMagacinPoKol]
	-- Add the parameters for the stored procedure here
	@IDRoba IDType,
	@IDMagacin IDType,
	@kolicina FloatType
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @kolicinaIma FLoatType
	DECLARE @IDIma IDType
	BEGIN TRY
		BEGIN TRANSACTION
        SAVE TRANSACTION ProcUzmiRobuIzMagacinPoKol;
		SELECT @kolicinaIma = Kolicina, @IDIma = Ima.IDIma
		FROM Ima, ImaKolicine
		WHERE @IDRoba = IDRoba AND @IDMagacin = IDMagacin AND Ima.IDIma = ImaKolicine.IDIma;

		IF @kolicinaIma >= @kolicina
			SET @kolicinaIma = @kolicina

		-- Insert statements for procedure here
		EXEC [TakeImaKolicina] @IDIma = @IDIma, @kolicina = @kolicinaIma
		COMMIT
		RETURN @kolicinaIma
	END TRY
	BEGIN CATCH
	SELECT
			ERROR_NUMBER() AS ErrorNumber
			,ERROR_SEVERITY() AS ErrorSeverity
			,ERROR_STATE() AS ErrorState
			,ERROR_PROCEDURE() AS ErrorProcedure
			,ERROR_LINE() AS ErrorLine
			,ERROR_MESSAGE() AS ErrorMessage;
        ROLLBACK TRANSACTION ProcUzmiRobuIzMagacinPoKol;
		throw;
	END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[ZaposleniNeRadiUMag]    Script Date: 22.05.2017. 22:48:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ZaposleniNeRadiUMag]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ZaposleniNeRadiUMag] AS'
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[ZaposleniNeRadiUMag]
	@IDZaposleni IDType
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
		BEGIN TRANSACTION
        SAVE TRANSACTION ProcZaposleniNeRadiUMag;
		IF EXISTS(SELECT * FROM Sef WHERE IDZaposleni = @IDZaposleni)
		BEGIN
			DECLARE @IDMagacin IDType
			SELECT @IDMagacin = IDMagacin
			FROM Zaposleni
			WHERE @IDZaposleni = IDZaposleni

			-- Update magacin
			UPDATE Magacin
			SET IDZaposleni = NULL
			WHERE @IDMagacin = IDMagacin

			DELETE FROM Sef WHERE IDZaposleni = @IDZaposleni

		END

		UPDATE Zaposleni
		SET IDMagacin = NULL
		WHERE IDZaposleni = @IDZaposleni

		COMMIT
	END TRY
	BEGIN CATCH
	SELECT
			ERROR_NUMBER() AS ErrorNumber
			,ERROR_SEVERITY() AS ErrorSeverity
			,ERROR_STATE() AS ErrorState
			,ERROR_PROCEDURE() AS ErrorProcedure
			,ERROR_LINE() AS ErrorLine
			,ERROR_MESSAGE() AS ErrorMessage;
        ROLLBACK TRANSACTION ProcZaposleniNeRadiUMag;
		throw;
	END CATCH

END

GO
/****** Object:  StoredProcedure [dbo].[ZaposleniRazduzi]    Script Date: 22.05.2017. 22:48:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ZaposleniRazduzi]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ZaposleniRazduzi] AS'
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[ZaposleniRazduzi]
	-- Add the parameters for the stored procedure here
	@IDZaduzi IDType,
	@DatumRazduzenja DateType
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SET NOCOUNT ON;

	DECLARE @IDIMa IDType
	DECLARE @IDRoba IDType
	DECLARE @IDMagacin IDType
	DECLARE @IDZaposleni IDType
	BEGIN TRY
		BEGIN TRANSACTION
		SAVE TRANSACTION ProcZaposleniRazduzi;

		SELECT @IDRoba = IDRoba, @IDMagacin = IDMagacin, @IDZaposleni = IDZaposleni
		FROM Zaduzio
		WHERE @IDZaduzi = IDZaduzio

		SELECT  @IDIma = IDIma FROM Ima
		WHERE IDRoba = @IDRoba AND IDMagacin = @IDMagacin

		EXEC	[dbo].[InsertImaJedinica]
			@IDMagacin = @IDMagacin,
			@IDRoba = @IDRoba,
			@Jedinica = 1
		UPDATE Zaduzio
		SET DatumRazduzenja = @DatumRazduzenja
		UPDATE Zaposleni
		SET BrojZaduzeneOpreme = BrojZaduzeneOpreme - 1
		WHERE IDZaposleni = @IDZaposleni
		COMMIT TRAN
	END TRY
	BEGIN CATCH
	SELECT
			ERROR_NUMBER() AS ErrorNumber
			,ERROR_SEVERITY() AS ErrorSeverity
			,ERROR_STATE() AS ErrorState
			,ERROR_PROCEDURE() AS ErrorProcedure
			,ERROR_LINE() AS ErrorLine
			,ERROR_MESSAGE() AS ErrorMessage;
        ROLLBACK TRANSACTION ProcZaposleniRazduzi;
		throw;
	END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[ZaposleniZaduzi]    Script Date: 22.05.2017. 22:48:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ZaposleniZaduzi]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ZaposleniZaduzi] AS'
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[ZaposleniZaduzi]
	-- Add the parameters for the stored procedure here
	@IDZaposleni IDType,
	@IDMagacin IDType,
	@IDRoba IDType,
	@DatumZaduzenja DateType,
	@Napomena VARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @IDIMa IDType
	DECLARE @IDZaduzio IDType
	BEGIN TRY
		BEGIN TRANSACTION
		SAVE TRANSACTION ProcZaposleniZaduzi;
		SELECT  @IDIma = IDIma FROM Ima
		WHERE IDRoba = @IDRoba AND IDMagacin = @IDMagacin

		EXEC	[dbo].[TakeImaJedinica]
			@IDIma = @IDIma,
			@Jedinica = 1
		INSERT INTO Zaduzio(IDRoba, IDMagacin, IDZaposleni, DatumZaduzenja, DatumRazduzenja, Napomena)
		VALUES (@IDRoba, @IDMagacin, @IDZaposleni, @DatumZaduzenja, NULL, @Napomena)
		SET @IDZaduzio  = SCOPE_IDENTITY()
		UPDATE Zaposleni
		SET BrojZaduzeneOpreme = BrojZaduzeneOpreme + 1
		WHERE IDZaposleni = @IDZaposleni
		COMMIT TRAN
		RETURN @IDZaduzio
	END TRY
	BEGIN CATCH
	SELECT
			ERROR_NUMBER() AS ErrorNumber
			,ERROR_SEVERITY() AS ErrorSeverity
			,ERROR_STATE() AS ErrorState
			,ERROR_PROCEDURE() AS ErrorProcedure
			,ERROR_LINE() AS ErrorLine
			,ERROR_MESSAGE() AS ErrorMessage;
        ROLLBACK TRANSACTION ProcZaposleniZaduzi;
		throw;
	END CATCH



END

GO
/****** Object:  StoredProcedure [dbo].[ZaposliUMagacin]    Script Date: 22.05.2017. 22:48:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ZaposliUMagacin]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ZaposliUMagacin] AS'
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[ZaposliUMagacin]
	-- Add the parameters for the stored procedure here
	@IDZaposleni IDType,
	@IDMagacin IdType

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	BEGIN TRY
		BEGIN TRANSACTION
		SAVE TRANSACTION ProcZaposliUMagacin
		UPDATE Zaposleni SET IDMagacin = @IDMagacin WHERE IDZaposleni = @IDZaposleni
		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ErrorNumber
			,ERROR_SEVERITY() AS ErrorSeverity
			,ERROR_STATE() AS ErrorState
			,ERROR_PROCEDURE() AS ErrorProcedure
			,ERROR_LINE() AS ErrorLine
			,ERROR_MESSAGE() AS ErrorMessage;

			ROLLBACK TRANSACTION ProcZaposliUMagacin;
			THROW;
	END CATCH


END

GO
/****** Object:  StoredProcedure [dbo].[ZavrsiRadIDajPlateIZavrsiPosao]    Script Date: 22.05.2017. 22:48:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ZavrsiRadIDajPlateIZavrsiPosao]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ZavrsiRadIDajPlateIZavrsiPosao] AS'
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[ZavrsiRadIDajPlateIZavrsiPosao]
	-- Add the parameters for the stored procedure here
	@IDPosao IDType,
	@DatumKraja DateType
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		BEGIN TRANSACTION
        SAVE TRANSACTION ProcZavrsiRadIDajPlate;

		UPDATE Rad
		SET DatumKraja = @DatumKraja
		WHERE (@IDPosao = IDPosao) AND (DatumKraja IS NULL)

		DECLARE @Cursor CURSOR
		DECLARE @IDZaposleni IDType

		SET @Cursor = CURSOR FOR
		SELECT DISTINCT(IDZaposleni)
		FROM Rad
		WHERE @IDPosao = IDPosao

		OPEN @CUrsor
		FETCH NEXT FROM @Cursor
		INTO @IDZaposleni

		WHILE @@FETCH_STATUS = 0
		BEGIN
			DECLARE @Plata FloatType
			DECLARE @BrojDana int
			DECLARE @TrajanjePosla int
			DECLARE @JedinicnaPlata FloatType

			SELECT @BrojDana = SUM(DATEDIFF(DAY, DatumPocetka, DatumKraja + 1))
			FROM Rad
			WHERE IDZaposleni = @IDZaposleni AND @IDPosao = IDPosao

			SELECT @TrajanjePosla = DATEDIFF(DAY, DatumPocetka, @DatumKraja + 1)
			FROM Posao
			WHERE IDPosao = @IDPosao

			SELECT @JedinicnaPlata = Plata
			FROM Norma, Posao
			WHERE @IDPosao = IDPosao AND Norma.IDNorma = Posao.IDNorma

			UPDATE Zaposleni
			SET IsplaceniIznos = IsplaceniIznos + ProsecnaOcena * @BrojDana / @TrajanjePosla * @JedinicnaPlata
			WHERE IDZaposleni = @IDZaposleni

			FETCH NEXT FROM @Cursor
			INTO @IDZaposleni
		END

		CLOSE @Cursor
		DEALLOCATE @Cursor


		UPDATE Posao
		SET DatumKraja = @DatumKraja, Status = 'Z'
		WHERE @IDPosao = IDPosao


		COMMIT
	END TRY
	BEGIN CATCH
	SELECT
			ERROR_NUMBER() AS ErrorNumber
			,ERROR_SEVERITY() AS ErrorSeverity
			,ERROR_STATE() AS ErrorState
			,ERROR_PROCEDURE() AS ErrorProcedure
			,ERROR_LINE() AS ErrorLine
			,ERROR_MESSAGE() AS ErrorMessage;
        ROLLBACK TRANSACTION ProcZavrsiRadIDajPlate;
		throw;
	END CATCH



END

GO
/****** Object:  Trigger [dbo].[TriggerInsertUpdateMagacin]    Script Date: 22.05.2017. 22:48:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[TriggerInsertUpdateMagacin]'))
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[TriggerInsertUpdateMagacin]
   ON  [dbo].[Magacin]
	AFTER UPDATE, INSERT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @CntSefUkupno int
	DECLARE @CntSefRazlicit int

	SELECT @CntSefUkupno = COUNT(IDZaposleni)
	FROM Magacin

	SELECT @CntSefRazlicit = COUNT(DISTINCT IDZaposleni)
	FROM Magacin;

    IF (@CntSefRazlicit != @CntSefUkupno)
	BEGIN
		THROW 50011, ''Sef moze da bude samo na jednom mestu'', 1
	END

END
'
GO
/****** Object:  Trigger [dbo].[CreateObject]    Script Date: 22.05.2017. 22:48:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[CreateObject]'))
EXEC dbo.sp_executesql @statement = N'
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

'
GO
/****** Object:  Trigger [dbo].[DeleteObject]    Script Date: 22.05.2017. 22:48:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[DeleteObject]'))
EXEC dbo.sp_executesql @statement = N'
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

'
GO
/****** Object:  Trigger [dbo].[DeleteOcena]    Script Date: 22.05.2017. 22:48:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[DeleteOcena]'))
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[DeleteOcena]
   ON  [dbo].[Ocena]
   AFTER DELETE
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

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
	FROM deleted

	OPEN @Cursor

	FETCH NEXT FROM @Cursor
	INTO  @IDRad

	WHILE @@FETCH_STATUS = 0
	BEGIN
		SELECT @IDZaposleni = IDZaposleni
		FROM Rad
		WHERE IDRad = @IDRad

		SET @Sum = 0
		SET @CNt = 0

		SELECT @Sum = SUM(Ocena), @Cnt = COUNT(Ocena)
		FROM Ocena, Rad
		WHERE (Ocena.IDRad = Rad.IDRad) AND (Rad.IDZaposleni = @IDZaposleni);
		IF (@Sum IS NULL)
			SET @Sum = 10
		IF (@Cnt IS NULL) OR (@cnt = 0)
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
'
GO
/****** Object:  Trigger [dbo].[InsertOcena]    Script Date: 22.05.2017. 22:48:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[InsertOcena]'))
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[InsertOcena]
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
'
GO
/****** Object:  Trigger [dbo].[TrigerInsertPosao]    Script Date: 22.05.2017. 22:48:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[TrigerInsertPosao]'))
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[TrigerInsertPosao]
   ON  [dbo].[Posao]
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

		IF (@oldStatus = ''Z'' )
			throw 50003, ''Ne moze da se menja zavrsen posao'', 1;

		IF (EXISTS
			(SELECT * FROM Rad
			WHERE IDPosao = @IDPosao
			AND ( (DatumPocetka < @DatumPocetka) OR (DatumPocetka > @DatumKraja) OR (DatumKraja > @DatumKraja) OR (DatumKraja < @DatumPocetka))))
				throw 50004, ''Vreme rada ne moze da bude izvan vremena referenciranog posla'', 1

		FETCH NEXT FROM @Cursor
		INTO @DatumPocetka, @DatumKraja, @Status, @IDPosao
	END
	CLOSE @Cursor
	DEALLOCATE @Cursor

END
'
GO
/****** Object:  Trigger [dbo].[InsertUpdateRad]    Script Date: 22.05.2017. 22:48:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[InsertUpdateRad]'))
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[InsertUpdateRad]
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

		IF @Status =''Z''
			THROW 50002, ''Ne moze se raditi kad je posao vec gotov'', 1;

		IF (@DatumPocetka < @DatumPocetkaP) OR ( (@DatumKraja IS NOT NULL) AND (@DatumKraja <@DatumPocetkaP))
			THROW 50001, ''Datum pocetka/kraja rada je pre datuma pocetka posla'', 1;

		IF EXISTS (SELECT * FROM Rad
			WHERE (((@DatumPocetka >= DatumPocetka) AND (@DatumPocetka <= DatumKraja))
				OR
				((@DatumKraja >= DatumPocetka) AND (@DatumKraja <= DatumKraja)))
					AND IDZaposleni = @IDZaposleni AND @IDRad != IDRad)
			throw 50002, ''Ne mogu dva rada istog radnika da se preklapaju'', 1;

		IF ( (SELECT IDMagacin
				FROM Zaposleni
				WHERE IDZaposleni = @IDZaposleni) IS NOT NULL) AND ( @DatumKraja IS NULL)
			THROW 50010, ''Zaposleni ne moze da radi i u magacinu i na poslu'', 1



		FETCH NEXT FROM @cursorInserted
		INTO @DatumKraja, @DAtumPocetka, @IDPosao, @IDZaposleni, @IDRad
	END

	CLOSE @cursorInserted
	DEALLOCATE @cursorInserted

END
'
GO
/****** Object:  Trigger [dbo].[CreateFloor]    Script Date: 22.05.2017. 22:48:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[CreateFloor]'))
EXEC dbo.sp_executesql @statement = N'
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

'
GO
/****** Object:  Trigger [dbo].[DeleteFloor]    Script Date: 22.05.2017. 22:48:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[DeleteFloor]'))
EXEC dbo.sp_executesql @statement = N'
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

'
GO
/****** Object:  Trigger [dbo].[TrigerUpdateInsertZaposleni]    Script Date: 22.05.2017. 22:48:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[TrigerUpdateInsertZaposleni]'))
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[TrigerUpdateInsertZaposleni]
   ON  [dbo].[Zaposleni]
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
			THROW 50010, ''Zaposleni ne moze da radi i u magacinu i na poslu'', 1
		FETCH NEXT FROM @Cursor
		INTO @IDZaposleni, @IDMagacin
	END


    CLOSE @Cursor
	DEALLOCATE @Cursor

END
'
GO
USE [master]
GO
ALTER DATABASE [Projekat] SET  READ_WRITE
GO
