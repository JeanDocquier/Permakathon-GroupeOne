USE [master]
GO
/****** Object:  Database [Alpaga]    Script Date: 10-03-20 16:55:50 ******/
CREATE DATABASE [Alpaga]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Alpaga', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLHACKATHON\MSSQL\DATA\Alpaga.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Alpaga_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLHACKATHON\MSSQL\DATA\Alpaga_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Alpaga] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Alpaga].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Alpaga] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Alpaga] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Alpaga] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Alpaga] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Alpaga] SET ARITHABORT OFF 
GO
ALTER DATABASE [Alpaga] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Alpaga] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Alpaga] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Alpaga] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Alpaga] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Alpaga] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Alpaga] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Alpaga] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Alpaga] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Alpaga] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Alpaga] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Alpaga] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Alpaga] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Alpaga] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Alpaga] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Alpaga] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Alpaga] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Alpaga] SET RECOVERY FULL 
GO
ALTER DATABASE [Alpaga] SET  MULTI_USER 
GO
ALTER DATABASE [Alpaga] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Alpaga] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Alpaga] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Alpaga] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Alpaga] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Alpaga', N'ON'
GO
ALTER DATABASE [Alpaga] SET QUERY_STORE = OFF
GO
USE [Alpaga]
GO
/****** Object:  User [AlpagaUser]    Script Date: 10-03-20 16:55:50 ******/
CREATE USER [AlpagaUser] FOR LOGIN [AlpagaUser] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [AlpagaUser]
GO
/****** Object:  Table [dbo].[Achete]    Script Date: 10-03-20 16:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Achete](
	[idPartnaireClient] [int] NOT NULL,
	[idProduit] [int] NOT NULL,
 CONSTRAINT [PK_Achete] PRIMARY KEY CLUSTERED 
(
	[idPartnaireClient] ASC,
	[idProduit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Collabore]    Script Date: 10-03-20 16:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Collabore](
	[idPartnaireClient] [int] NOT NULL,
	[idPermaFungi] [int] NOT NULL,
 CONSTRAINT [PK_Collabore] PRIMARY KEY CLUSTERED 
(
	[idPartnaireClient] ASC,
	[idPermaFungi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Consomation]    Script Date: 10-03-20 16:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Consomation](
	[idConsomation] [int] IDENTITY(1,1) NOT NULL,
	[typeConsomation] [nvarchar](250) NULL,
	[prixConsomation] [float] NULL,
	[idObjectif] [int] NULL,
 CONSTRAINT [PK_Consomation] PRIMARY KEY CLUSTERED 
(
	[idConsomation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Consomme]    Script Date: 10-03-20 16:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Consomme](
	[idMachine] [int] NOT NULL,
	[idConsomation] [int] NOT NULL,
	[dateConsomme] [date] NULL,
 CONSTRAINT [PK_Consomme] PRIMARY KEY CLUSTERED 
(
	[idMachine] ASC,
	[idConsomation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DataWork]    Script Date: 10-03-20 16:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DataWork](
	[idDataWork] [int] IDENTITY(1,1) NOT NULL,
	[jourAbsence] [int] NULL,
	[typeContrat] [nvarchar](250) NULL,
	[salaireBrut] [float] NULL,
	[idUser] [int] NULL,
 CONSTRAINT [PK_DataWork] PRIMARY KEY CLUSTERED 
(
	[idDataWork] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Donner]    Script Date: 10-03-20 16:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Donner](
	[idUser] [int] NOT NULL,
	[idFormation] [int] NOT NULL,
 CONSTRAINT [PK_Donner] PRIMARY KEY CLUSTERED 
(
	[idUser] ASC,
	[idFormation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Formation]    Script Date: 10-03-20 16:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Formation](
	[idFormation] [int] IDENTITY(1,1) NOT NULL,
	[nom] [nvarchar](250) NULL,
	[quantite] [int] NULL,
	[prix] [float] NULL,
	[idObjectif] [int] NULL,
 CONSTRAINT [PK_Formation] PRIMARY KEY CLUSTERED 
(
	[idFormation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Machine]    Script Date: 10-03-20 16:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Machine](
	[idMachine] [int] IDENTITY(1,1) NOT NULL,
	[numeroSerie] [nvarchar](250) NULL,
	[idPermaFungi] [int] NULL,
 CONSTRAINT [PK_machine] PRIMARY KEY CLUSTERED 
(
	[idMachine] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Objectif]    Script Date: 10-03-20 16:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Objectif](
	[idObjectif] [int] IDENTITY(1,1) NOT NULL,
	[prevision] [float] NULL,
	[date] [date] NULL,
 CONSTRAINT [PK_Objectif] PRIMARY KEY CLUSTERED 
(
	[idObjectif] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Offre]    Script Date: 10-03-20 16:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Offre](
	[idPermafungi] [int] NOT NULL,
	[idFormation] [int] NOT NULL,
	[dateOffreFormation] [date] NULL,
 CONSTRAINT [PK_Offre] PRIMARY KEY CLUSTERED 
(
	[idPermafungi] ASC,
	[idFormation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PartnaireClient]    Script Date: 10-03-20 16:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartnaireClient](
	[idPartnaireClient] [int] IDENTITY(1,1) NOT NULL,
	[nom] [nvarchar](250) NULL,
	[adresse] [nvarchar](250) NULL,
	[email] [nvarchar](250) NULL,
 CONSTRAINT [PK_PartnaireClient] PRIMARY KEY CLUSTERED 
(
	[idPartnaireClient] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PermaFungi]    Script Date: 10-03-20 16:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PermaFungi](
	[idPermaFungi] [int] IDENTITY(1,1) NOT NULL,
	[ville] [nvarchar](250) NULL,
	[adresse] [nvarchar](250) NULL,
	[contact] [nvarchar](250) NULL,
	[email] [nvarchar](250) NULL,
 CONSTRAINT [PK_PermaFungi] PRIMARY KEY CLUSTERED 
(
	[idPermaFungi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Produit]    Script Date: 10-03-20 16:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Produit](
	[idProduit] [int] IDENTITY(1,1) NOT NULL,
	[nom] [nvarchar](250) NULL,
	[quantite] [float] NULL,
	[prix] [float] NULL,
	[description] [nvarchar](250) NULL,
	[idObjectif] [int] NULL,
 CONSTRAINT [PK_Produit] PRIMARY KEY CLUSTERED 
(
	[idProduit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 10-03-20 16:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[idUser] [int] IDENTITY(1,1) NOT NULL,
	[nom] [nvarchar](250) NULL,
	[prenom] [nvarchar](250) NULL,
	[email] [nvarchar](250) NULL,
	[motdepasse] [nvarchar](250) NULL,
	[role] [nvarchar](250) NULL,
	[adresse] [nvarchar](250) NULL,
	[telephone] [nvarchar](200) NULL,
	[idPermaFungi] [int] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[idUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vends]    Script Date: 10-03-20 16:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vends](
	[idPermaFungi] [int] NOT NULL,
	[idProduit] [int] NOT NULL,
	[dateVends] [date] NOT NULL,
 CONSTRAINT [PK_Vends] PRIMARY KEY CLUSTERED 
(
	[idPermaFungi] ASC,
	[idProduit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Achete] ([idPartnaireClient], [idProduit]) VALUES (1, 1)
INSERT [dbo].[Achete] ([idPartnaireClient], [idProduit]) VALUES (2, 2)
INSERT [dbo].[Collabore] ([idPartnaireClient], [idPermaFungi]) VALUES (1, 1)
INSERT [dbo].[Collabore] ([idPartnaireClient], [idPermaFungi]) VALUES (2, 2)
SET IDENTITY_INSERT [dbo].[Consomation] ON 

INSERT [dbo].[Consomation] ([idConsomation], [typeConsomation], [prixConsomation], [idObjectif]) VALUES (1, N'energie', 12.25, 1)
INSERT [dbo].[Consomation] ([idConsomation], [typeConsomation], [prixConsomation], [idObjectif]) VALUES (2, N'eau', 45.36, 2)
SET IDENTITY_INSERT [dbo].[Consomation] OFF
INSERT [dbo].[Consomme] ([idMachine], [idConsomation], [dateConsomme]) VALUES (1, 1, CAST(N'2020-02-01' AS Date))
INSERT [dbo].[Consomme] ([idMachine], [idConsomation], [dateConsomme]) VALUES (1, 2, CAST(N'2020-03-01' AS Date))
INSERT [dbo].[Donner] ([idUser], [idFormation]) VALUES (2, 3)
INSERT [dbo].[Donner] ([idUser], [idFormation]) VALUES (4, 3)
SET IDENTITY_INSERT [dbo].[Formation] ON 

INSERT [dbo].[Formation] ([idFormation], [nom], [quantite], [prix], [idObjectif]) VALUES (3, N'sensibilisation', 1, 12, 1)
INSERT [dbo].[Formation] ([idFormation], [nom], [quantite], [prix], [idObjectif]) VALUES (4, N'information', 2, 90, 2)
SET IDENTITY_INSERT [dbo].[Formation] OFF
SET IDENTITY_INSERT [dbo].[Machine] ON 

INSERT [dbo].[Machine] ([idMachine], [numeroSerie], [idPermaFungi]) VALUES (1, N'256', 1)
INSERT [dbo].[Machine] ([idMachine], [numeroSerie], [idPermaFungi]) VALUES (2, N'856', 2)
SET IDENTITY_INSERT [dbo].[Machine] OFF
SET IDENTITY_INSERT [dbo].[Objectif] ON 

INSERT [dbo].[Objectif] ([idObjectif], [prevision], [date]) VALUES (1, 100, CAST(N'2020-01-01' AS Date))
INSERT [dbo].[Objectif] ([idObjectif], [prevision], [date]) VALUES (2, 200, CAST(N'2019-02-12' AS Date))
INSERT [dbo].[Objectif] ([idObjectif], [prevision], [date]) VALUES (3, 1502, CAST(N'2018-03-18' AS Date))
INSERT [dbo].[Objectif] ([idObjectif], [prevision], [date]) VALUES (4, 203, CAST(N'2019-02-03' AS Date))
SET IDENTITY_INSERT [dbo].[Objectif] OFF
INSERT [dbo].[Offre] ([idPermafungi], [idFormation], [dateOffreFormation]) VALUES (1, 3, CAST(N'2020-02-02' AS Date))
INSERT [dbo].[Offre] ([idPermafungi], [idFormation], [dateOffreFormation]) VALUES (2, 4, CAST(N'2020-05-31' AS Date))
SET IDENTITY_INSERT [dbo].[PartnaireClient] ON 

INSERT [dbo].[PartnaireClient] ([idPartnaireClient], [nom], [adresse], [email]) VALUES (1, N'exki', N'1000', N'e@gmail.com')
INSERT [dbo].[PartnaireClient] ([idPartnaireClient], [nom], [adresse], [email]) VALUES (2, N'commune', N'1030', NULL)
SET IDENTITY_INSERT [dbo].[PartnaireClient] OFF
SET IDENTITY_INSERT [dbo].[PermaFungi] ON 

INSERT [dbo].[PermaFungi] ([idPermaFungi], [ville], [adresse], [contact], [email]) VALUES (1, N'bxl', N'jo', N'jo', N'jo')
INSERT [dbo].[PermaFungi] ([idPermaFungi], [ville], [adresse], [contact], [email]) VALUES (2, N'liege', N'rue', N'123', N'g@gmail.com')
SET IDENTITY_INSERT [dbo].[PermaFungi] OFF
SET IDENTITY_INSERT [dbo].[Produit] ON 

INSERT [dbo].[Produit] ([idProduit], [nom], [quantite], [prix], [description], [idObjectif]) VALUES (1, N'champignon', 5, 12, N'bon', 1)
INSERT [dbo].[Produit] ([idProduit], [nom], [quantite], [prix], [description], [idObjectif]) VALUES (2, N'kit', 6, 123, N'tres bon', 2)
SET IDENTITY_INSERT [dbo].[Produit] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([idUser], [nom], [prenom], [email], [motdepasse], [role], [adresse], [telephone], [idPermaFungi]) VALUES (2, N'lol', N'lol', NULL, N'kok', N'kk', N'kkk', N'kkkk', 1)
INSERT [dbo].[User] ([idUser], [nom], [prenom], [email], [motdepasse], [role], [adresse], [telephone], [idPermaFungi]) VALUES (4, N'gena', N'zoto', N'g@gmail.com', N'kuk', N'finance', N'bxl', N'123', 1)
INSERT [dbo].[User] ([idUser], [nom], [prenom], [email], [motdepasse], [role], [adresse], [telephone], [idPermaFungi]) VALUES (5, N'fatima', N'ridani', N'f@gmail.com', N'lol', N'admin', N'wemel', N'321', 1)
SET IDENTITY_INSERT [dbo].[User] OFF
INSERT [dbo].[Vends] ([idPermaFungi], [idProduit], [dateVends]) VALUES (1, 2, CAST(N'2020-02-02' AS Date))
INSERT [dbo].[Vends] ([idPermaFungi], [idProduit], [dateVends]) VALUES (2, 2, CAST(N'2020-03-12' AS Date))
ALTER TABLE [dbo].[Achete]  WITH CHECK ADD  CONSTRAINT [FK_Achete_PartnaireClient] FOREIGN KEY([idPartnaireClient])
REFERENCES [dbo].[PartnaireClient] ([idPartnaireClient])
GO
ALTER TABLE [dbo].[Achete] CHECK CONSTRAINT [FK_Achete_PartnaireClient]
GO
ALTER TABLE [dbo].[Achete]  WITH CHECK ADD  CONSTRAINT [FK_Achete_Produit] FOREIGN KEY([idProduit])
REFERENCES [dbo].[Produit] ([idProduit])
GO
ALTER TABLE [dbo].[Achete] CHECK CONSTRAINT [FK_Achete_Produit]
GO
ALTER TABLE [dbo].[Collabore]  WITH CHECK ADD  CONSTRAINT [FK_Collabore_PartnaireClient] FOREIGN KEY([idPartnaireClient])
REFERENCES [dbo].[PartnaireClient] ([idPartnaireClient])
GO
ALTER TABLE [dbo].[Collabore] CHECK CONSTRAINT [FK_Collabore_PartnaireClient]
GO
ALTER TABLE [dbo].[Collabore]  WITH CHECK ADD  CONSTRAINT [FK_Collabore_PermaFungi] FOREIGN KEY([idPermaFungi])
REFERENCES [dbo].[PermaFungi] ([idPermaFungi])
GO
ALTER TABLE [dbo].[Collabore] CHECK CONSTRAINT [FK_Collabore_PermaFungi]
GO
ALTER TABLE [dbo].[Consomation]  WITH CHECK ADD  CONSTRAINT [FK_Consomation_Objectif] FOREIGN KEY([idObjectif])
REFERENCES [dbo].[Objectif] ([idObjectif])
GO
ALTER TABLE [dbo].[Consomation] CHECK CONSTRAINT [FK_Consomation_Objectif]
GO
ALTER TABLE [dbo].[Consomme]  WITH CHECK ADD  CONSTRAINT [FK_Consomme_Consomation] FOREIGN KEY([idConsomation])
REFERENCES [dbo].[Consomation] ([idConsomation])
GO
ALTER TABLE [dbo].[Consomme] CHECK CONSTRAINT [FK_Consomme_Consomation]
GO
ALTER TABLE [dbo].[Consomme]  WITH CHECK ADD  CONSTRAINT [FK_Consomme_Machine] FOREIGN KEY([idMachine])
REFERENCES [dbo].[Machine] ([idMachine])
GO
ALTER TABLE [dbo].[Consomme] CHECK CONSTRAINT [FK_Consomme_Machine]
GO
ALTER TABLE [dbo].[DataWork]  WITH CHECK ADD  CONSTRAINT [FK_DataWork_User] FOREIGN KEY([idUser])
REFERENCES [dbo].[User] ([idUser])
GO
ALTER TABLE [dbo].[DataWork] CHECK CONSTRAINT [FK_DataWork_User]
GO
ALTER TABLE [dbo].[Donner]  WITH CHECK ADD  CONSTRAINT [FK_Donner_Formation] FOREIGN KEY([idFormation])
REFERENCES [dbo].[Formation] ([idFormation])
GO
ALTER TABLE [dbo].[Donner] CHECK CONSTRAINT [FK_Donner_Formation]
GO
ALTER TABLE [dbo].[Donner]  WITH CHECK ADD  CONSTRAINT [FK_Donner_User] FOREIGN KEY([idUser])
REFERENCES [dbo].[User] ([idUser])
GO
ALTER TABLE [dbo].[Donner] CHECK CONSTRAINT [FK_Donner_User]
GO
ALTER TABLE [dbo].[Formation]  WITH CHECK ADD  CONSTRAINT [FK_Formation_Objectif] FOREIGN KEY([idObjectif])
REFERENCES [dbo].[Objectif] ([idObjectif])
GO
ALTER TABLE [dbo].[Formation] CHECK CONSTRAINT [FK_Formation_Objectif]
GO
ALTER TABLE [dbo].[Machine]  WITH CHECK ADD  CONSTRAINT [FK_Machine_PermaFungi] FOREIGN KEY([idPermaFungi])
REFERENCES [dbo].[PermaFungi] ([idPermaFungi])
GO
ALTER TABLE [dbo].[Machine] CHECK CONSTRAINT [FK_Machine_PermaFungi]
GO
ALTER TABLE [dbo].[Offre]  WITH CHECK ADD  CONSTRAINT [FK_Offre_Formation] FOREIGN KEY([idFormation])
REFERENCES [dbo].[Formation] ([idFormation])
GO
ALTER TABLE [dbo].[Offre] CHECK CONSTRAINT [FK_Offre_Formation]
GO
ALTER TABLE [dbo].[Offre]  WITH CHECK ADD  CONSTRAINT [FK_Offre_PermaFungi] FOREIGN KEY([idPermafungi])
REFERENCES [dbo].[PermaFungi] ([idPermaFungi])
GO
ALTER TABLE [dbo].[Offre] CHECK CONSTRAINT [FK_Offre_PermaFungi]
GO
ALTER TABLE [dbo].[Produit]  WITH CHECK ADD  CONSTRAINT [FK_Produit_Objectif] FOREIGN KEY([idObjectif])
REFERENCES [dbo].[Objectif] ([idObjectif])
GO
ALTER TABLE [dbo].[Produit] CHECK CONSTRAINT [FK_Produit_Objectif]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_PermaFungi] FOREIGN KEY([idPermaFungi])
REFERENCES [dbo].[PermaFungi] ([idPermaFungi])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_PermaFungi]
GO
ALTER TABLE [dbo].[Vends]  WITH CHECK ADD  CONSTRAINT [FK_Vends_PermaFungi] FOREIGN KEY([idPermaFungi])
REFERENCES [dbo].[PermaFungi] ([idPermaFungi])
GO
ALTER TABLE [dbo].[Vends] CHECK CONSTRAINT [FK_Vends_PermaFungi]
GO
ALTER TABLE [dbo].[Vends]  WITH CHECK ADD  CONSTRAINT [FK_Vends_Produit] FOREIGN KEY([idProduit])
REFERENCES [dbo].[Produit] ([idProduit])
GO
ALTER TABLE [dbo].[Vends] CHECK CONSTRAINT [FK_Vends_Produit]
GO
USE [master]
GO
ALTER DATABASE [Alpaga] SET  READ_WRITE 
GO
