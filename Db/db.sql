USE [master]
GO
/****** Object:  Database [Backend]    Script Date: 11/28/2016 6:22:59 PM ******/
CREATE DATABASE [Backend]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Backend', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Backend.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Backend_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Backend_log.ldf' , SIZE = 1280KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Backend] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Backend].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Backend] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Backend] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Backend] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Backend] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Backend] SET ARITHABORT OFF 
GO
ALTER DATABASE [Backend] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Backend] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Backend] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Backend] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Backend] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Backend] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Backend] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Backend] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Backend] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Backend] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Backend] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Backend] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Backend] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Backend] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Backend] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Backend] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Backend] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Backend] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Backend] SET  MULTI_USER 
GO
ALTER DATABASE [Backend] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Backend] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Backend] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Backend] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Backend] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Backend]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 11/28/2016 6:23:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Album]    Script Date: 11/28/2016 6:23:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Album](
	[Id] [uniqueidentifier] NOT NULL,
	[Title] [nvarchar](50) NULL,
	[Status] [nvarchar](50) NULL,
	[Label] [nvarchar](50) NULL,
	[NumberOfTracks] [int] NULL,
 CONSTRAINT [PK_Album] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Album_Artist]    Script Date: 11/28/2016 6:23:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Album_Artist](
	[Id] [uniqueidentifier] NOT NULL,
	[AlbumId] [uniqueidentifier] NOT NULL,
	[ArtistId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Album_Artist] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Alias]    Script Date: 11/28/2016 6:23:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alias](
	[Id] [uniqueidentifier] NOT NULL,
	[Text] [nvarchar](50) NULL,
	[ArtistId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Alias] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Artist]    Script Date: 11/28/2016 6:23:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Artist](
	[Id] [uniqueidentifier] NOT NULL,
	[Firstname] [nvarchar](50) NULL,
	[Lastname] [nvarchar](50) NULL,
	[CountryIso] [char](2) NULL,
 CONSTRAINT [PK_Artist] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Country]    Script Date: 11/28/2016 6:23:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Country](
	[Iso] [char](2) NOT NULL,
	[Name] [nvarchar](80) NOT NULL,
	[PrintableName] [nvarchar](80) NOT NULL,
	[Iso3] [char](3) NULL,
	[Numcode] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Iso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201611221420430_InitialCreate', N'Backend.Assessment.Context.BackendContext', 0x1F8B0800000000000400CD57CD6EE33610BE17E83B083CB540568C934B1B48BBC83A4961344E825576EFB4347688F24725A9C07EB61EFA487D850EF56FC9769C34680B5F646AE69B3F7E33A3BFFEF833FAB49622780663B956319984A7240095EA8CAB554C0AB7FCF013F9F4F1FBEFA2EB4CAE836F8DDCB997434D6563F2E45C7E41A94D9F40321B4A9E1A6DF5D285A99694659A9E9D9EFE4C27130A0841102B08A22F85725C42F907FF4EB54A21770513739D81B0F539BE494AD4E08E49B0394B21269F59FA1BA82CBCB416AC95A05C88EA0ED68E04978233F42801B12401534A3BE6D0DF8BAF161267B45A25391E30F1B8C901E5964C58A8E3B8E8C48F0DE9F4CC87443BC5062A2DACD3F2958093F33A4774A8FEA64C93368798C56BCCB6DBF8A8CB4CC6E4D2386E31614353175361BCD8CE3457B5092BDD93602C71D25E10BC47FE77124C0BE10A03B182C219264E8287622178FA2B6C1E356AC7AA10A2EF2A3A8BEFB60EF0E8C1E81C8CDB7C81651DC02C2301DDD6A343C556ADA753053753EEFC8C0477689C2D04B437A19788C46903BF8002C31C640FCC3930CA634099CB91F581AD1B6EACF38F8D49BC7F482912CCD9FA16D4CA3DC504AB852CBAE16BC89AA3DA8FAF8A230551CB990276F879D8F62DFBCF4C4F3512DB6C66561F308E8F47D93E6CAAE4FACB25ED8344B423C2981EBE8B308E05AF0DD4F7BB6D2E23AE6057A9E9626B97B71DAE6013705BA4B324E8BCA87A55D8D07197B3AD5B5D53A455576CBA27DDD33EA339CB734C7EAF9DD6274152F5D2E987E4F5CD45561834B53B7A4CEB6D6B0979C4563078EB6F4A062549AE98630BE64B35CDE4486C50843D096E8C6DE779D845BAB437F2FE79ABD83BA64A539C015A97CC1B8CCF2B94A142EB53DB64478AE5586382991DFD69AA4521D5BE1E7748BBD771FA20BDE3E3B1BA0ED287EA4E8F47EA37843E56FFFC78B496F37DA8F6708C13D1418D8657828EEEC460A60CAFD821820E455AEB2D5107848C6A72BCBCF48CD85289900013F4CC33CF9464631DC8D00B84C9EF622A38C6DB09CC99E24BB0AE1ABB38002667837DE9FFB3BB506B3371D402F3AF6F0EDCE7F4C5DDE0955373B42CA86766D2276676CCEC7FB80BBC1FF278D437D83F48B6FEB18FF786715EE6F91D87F978DC1C33AB0F8CEA8A8031C9163EFECACB76C0BF718E8FDB4144FB5F4AD11558BEEA20FC779382D4F3AC036D64666AA99B1C635C7D8F1A914109E6E05886E9F1612C59EAF0758AC3B05CDFBE3151A0C8B55C403653F785CB0BE767A55C88AD5D38A287ED97CBCAB6CFD17DEEFFD9F70801DDE41802DCABCF051759EBF7CD8EFBB307C2DF949ADBE815AEAF08B7DAB448775A1D0954A7EF0A725C2CB0333C82CC0582D97B95B067788B6FB871DEC28AA59BA6ABEF0779B910DB698FAE385B19266D8DD1E9FBAF7FEA3FFF3FFE0DBDEEBEE230100000, N'6.1.3-40302')
INSERT [dbo].[Album] ([Id], [Title], [Status], [Label], [NumberOfTracks]) VALUES (N'9cc88413-d456-4b96-a0c1-09fa6cc2cf88', N'iTunes Festival: London 2010', N'Official', N'Gentlemen of the Road', 8)
INSERT [dbo].[Album_Artist] ([Id], [AlbumId], [ArtistId]) VALUES (N'7a72f5bb-26ba-41d0-92d7-c6ea2bdacabf', N'9cc88413-d456-4b96-a0c1-09fa6cc2cf88', N'6456a893-c1e9-4e3d-86f7-0008b0a3ac8a')
INSERT [dbo].[Alias] ([Id], [Text], [ArtistId]) VALUES (N'5a8ffd40-be53-403e-9406-068b49882ae4', N'Op Ivy', N'931e1d1f-6b2f-4ff8-9f70-aa537210cd46')
INSERT [dbo].[Alias] ([Id], [Text], [ArtistId]) VALUES (N'daedea71-d7d4-4367-8a5e-0a0cebef0a9f', N'Lady Ga Ga', N'650e7db6-b795-4eb5-a702-5ea2fc46c848')
INSERT [dbo].[Alias] ([Id], [Text], [ArtistId]) VALUES (N'a259e4ed-9365-4639-be0e-1044da11f62b', N'The Transplants', N'29f3e1bf-aec1-4d0a-9ef3-0cb95e8a3699')
INSERT [dbo].[Alias] ([Id], [Text], [ArtistId]) VALUES (N'4a7048ca-8fdd-41d2-8e41-1d7cfe8e913e', N'Stefani Joanne Angelina Germanotta', N'650e7db6-b795-4eb5-a702-5ea2fc46c848')
INSERT [dbo].[Alias] ([Id], [Text], [ArtistId]) VALUES (N'9bbfee7a-f8fc-4e4c-bc98-241e64af3e13', N'Elton Jphn', N'b83bc61f-8451-4a5d-8b8e-7e9ed295e822')
INSERT [dbo].[Alias] ([Id], [Text], [ArtistId]) VALUES (N'fea1c55d-4a44-4599-86d8-5887aa40bab0', N'Mott The Hoppie', N'435f1441-0f43-479d-92db-a506449a686b')
INSERT [dbo].[Alias] ([Id], [Text], [ArtistId]) VALUES (N'111775ae-75d0-43a3-9e28-59164934961d', N'Johhny Cash', N'18fa2fd5-3ef2-4496-ba9f-6dae655b2a4f')
INSERT [dbo].[Alias] ([Id], [Text], [ArtistId]) VALUES (N'efbe660f-06cc-4f3e-a11a-5e5ba590b6c1', N'Mogwa', N'd700b3f5-45af-4d02-95ed-57d301bda93e')
INSERT [dbo].[Alias] ([Id], [Text], [ArtistId]) VALUES (N'32c2344f-eab3-4c5c-827d-70603f179063', N'John William Coltrane', N'b625448e-bf4a-41c3-a421-72ad46cdb831')
INSERT [dbo].[Alias] ([Id], [Text], [ArtistId]) VALUES (N'269296c1-4edc-4680-b68e-75d8fb3ab38b', N'Jonny Cash', N'18fa2fd5-3ef2-4496-ba9f-6dae655b2a4f')
INSERT [dbo].[Alias] ([Id], [Text], [ArtistId]) VALUES (N'ea9ac1c1-4294-4194-ab11-8ba2b27a4ecb', N'Megadeath', N'a9044915-8be3-4c7e-b11f-9e2d2ea0a91e')
INSERT [dbo].[Alias] ([Id], [Text], [ArtistId]) VALUES (N'4e2c61d6-129a-465b-9b92-9b6c8003b3c6', N'????', N'24f8d8a5-269b-475c-a1cb-792990b0b2ee')
INSERT [dbo].[Alias] ([Id], [Text], [ArtistId]) VALUES (N'964032ae-14ae-4839-87a1-a12ac878c68b', N'John Anthony Frusciante', N'f1571db1-c672-4a54-a2cf-aaa329f26f0b')
INSERT [dbo].[Alias] ([Id], [Text], [ArtistId]) VALUES (N'394f0f6d-e464-463c-8c20-a5c98b1bbaab', N'E. John', N'b83bc61f-8451-4a5d-8b8e-7e9ed295e822')
INSERT [dbo].[Alias] ([Id], [Text], [ArtistId]) VALUES (N'aa976efd-2e1a-435b-9bc0-b6beaa27f1e0', N'Elthon John', N'b83bc61f-8451-4a5d-8b8e-7e9ed295e822')
INSERT [dbo].[Alias] ([Id], [Text], [ArtistId]) VALUES (N'3d25509c-cc3e-4b5b-ba02-bcc0969e0416', N'Jack Hody Johnson', N'6456a893-c1e9-4e3d-86f7-0008b0a3ac8a')
INSERT [dbo].[Alias] ([Id], [Text], [ArtistId]) VALUES (N'066fc8d9-e59a-4f8c-94fe-c1eac50a2e2c', N'John Coltraine', N'b625448e-bf4a-41c3-a421-72ad46cdb831')
INSERT [dbo].[Alias] ([Id], [Text], [ArtistId]) VALUES (N'7e36268d-d060-4bfe-8993-c44ce8d39daf', N'John Elton', N'b83bc61f-8451-4a5d-8b8e-7e9ed295e822')
INSERT [dbo].[Alias] ([Id], [Text], [ArtistId]) VALUES (N'6c7a93a7-a919-499a-a04e-cf2dac822653', N'Mott The Hopple', N'435f1441-0f43-479d-92db-a506449a686b')
INSERT [dbo].[Alias] ([Id], [Text], [ArtistId]) VALUES (N'21e6aa07-5ff7-4f3a-b02c-e3f0ab878b90', N'Metalica,????', N'65f4f0c5-ef9e-490c-aee3-909e7ae6b2ab')
INSERT [dbo].[Alias] ([Id], [Text], [ArtistId]) VALUES (N'dee0e5fb-dc02-4b9e-ac50-e47800c99fdc', N'Reginald Kenneth Dwight', N'b83bc61f-8451-4a5d-8b8e-7e9ed295e822')
INSERT [dbo].[Artist] ([Id], [Firstname], [Lastname], [CountryIso]) VALUES (N'6456a893-c1e9-4e3d-86f7-0008b0a3ac8a', N'Jack', N'Johnson', N'US')
INSERT [dbo].[Artist] ([Id], [Firstname], [Lastname], [CountryIso]) VALUES (N'144ef525-85e9-40c3-8335-02c32d0861f3', N'John', N'Mayer', N'US')
INSERT [dbo].[Artist] ([Id], [Firstname], [Lastname], [CountryIso]) VALUES (N'29f3e1bf-aec1-4d0a-9ef3-0cb95e8a3699', N'Transplants', NULL, N'US')
INSERT [dbo].[Artist] ([Id], [Firstname], [Lastname], [CountryIso]) VALUES (N'd700b3f5-45af-4d02-95ed-57d301bda93e', N'Mogwai
', NULL, N'GB')
INSERT [dbo].[Artist] ([Id], [Firstname], [Lastname], [CountryIso]) VALUES (N'650e7db6-b795-4eb5-a702-5ea2fc46c848', N'Lady Gaga
', NULL, N'US')
INSERT [dbo].[Artist] ([Id], [Firstname], [Lastname], [CountryIso]) VALUES (N'18fa2fd5-3ef2-4496-ba9f-6dae655b2a4f', N'Johnny', N'Cash', N'US')
INSERT [dbo].[Artist] ([Id], [Firstname], [Lastname], [CountryIso]) VALUES (N'b625448e-bf4a-41c3-a421-72ad46cdb831', N'John', N'Coltrane', N'US')
INSERT [dbo].[Artist] ([Id], [Firstname], [Lastname], [CountryIso]) VALUES (N'24f8d8a5-269b-475c-a1cb-792990b0b2ee', N'Rancid', NULL, N'US')
INSERT [dbo].[Artist] ([Id], [Firstname], [Lastname], [CountryIso]) VALUES (N'b83bc61f-8451-4a5d-8b8e-7e9ed295e822', N'Elton', N'John', N'GB')
INSERT [dbo].[Artist] ([Id], [Firstname], [Lastname], [CountryIso]) VALUES (N'65f4f0c5-ef9e-490c-aee3-909e7ae6b2ab', N'Metallica
', NULL, N'US')
INSERT [dbo].[Artist] ([Id], [Firstname], [Lastname], [CountryIso]) VALUES (N'a9044915-8be3-4c7e-b11f-9e2d2ea0a91e', N'Megadeth
', NULL, N'US')
INSERT [dbo].[Artist] ([Id], [Firstname], [Lastname], [CountryIso]) VALUES (N'435f1441-0f43-479d-92db-a506449a686b', N'Mott the Hoople
', NULL, N'GB')
INSERT [dbo].[Artist] ([Id], [Firstname], [Lastname], [CountryIso]) VALUES (N'931e1d1f-6b2f-4ff8-9f70-aa537210cd46', N'Operation Ivy', NULL, N'US')
INSERT [dbo].[Artist] ([Id], [Firstname], [Lastname], [CountryIso]) VALUES (N'f1571db1-c672-4a54-a2cf-aaa329f26f0b', N'John', N'Frusciante', N'US')
INSERT [dbo].[Artist] ([Id], [Firstname], [Lastname], [CountryIso]) VALUES (N'c44e9c22-ef82-4a77-9bcd-af6c958446d6', N'Mumford & Sons
', NULL, N'GB')
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'AD', N'ANDORRA', N'Andorra', N'AND', 20)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'AE', N'UNITED ARAB EMIRATES', N'United Arab Emirates', N'ARE', 784)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'AF', N'AFGHANISTAN', N'Afghanistan', N'AFG', 4)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'AG', N'ANTIGUA AND BARBUDA', N'Antigua and Barbuda', N'ATG', 28)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'AI', N'ANGUILLA', N'Anguilla', N'AIA', 660)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'AL', N'ALBANIA', N'Albania', N'ALB', 8)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'AM', N'ARMENIA', N'Armenia', N'ARM', 51)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'AN', N'NETHERLANDS ANTILLES', N'Netherlands Antilles', N'ANT', 530)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'AO', N'ANGOLA', N'Angola', N'AGO', 24)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'AQ', N'ANTARCTICA', N'Antarctica', NULL, NULL)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'AR', N'ARGENTINA', N'Argentina', N'ARG', 32)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'AS', N'AMERICAN SAMOA', N'American Samoa', N'ASM', 16)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'AT', N'AUSTRIA', N'Austria', N'AUT', 40)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'AU', N'AUSTRALIA', N'Australia', N'AUS', 36)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'AW', N'ARUBA', N'Aruba', N'ABW', 533)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'AZ', N'AZERBAIJAN', N'Azerbaijan', N'AZE', 31)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'BA', N'BOSNIA AND HERZEGOVINA', N'Bosnia and Herzegovina', N'BIH', 70)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'BB', N'BARBADOS', N'Barbados', N'BRB', 52)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'BD', N'BANGLADESH', N'Bangladesh', N'BGD', 50)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'BE', N'BELGIUM', N'Belgium', N'BEL', 56)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'BF', N'BURKINA FASO', N'Burkina Faso', N'BFA', 854)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'BG', N'BULGARIA', N'Bulgaria', N'BGR', 100)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'BH', N'BAHRAIN', N'Bahrain', N'BHR', 48)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'BI', N'BURUNDI', N'Burundi', N'BDI', 108)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'BJ', N'BENIN', N'Benin', N'BEN', 204)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'BM', N'BERMUDA', N'Bermuda', N'BMU', 60)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'BN', N'BRUNEI DARUSSALAM', N'Brunei Darussalam', N'BRN', 96)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'BO', N'BOLIVIA', N'Bolivia', N'BOL', 68)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'BR', N'BRAZIL', N'Brazil', N'BRA', 76)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'BS', N'BAHAMAS', N'Bahamas', N'BHS', 44)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'BT', N'BHUTAN', N'Bhutan', N'BTN', 64)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'BV', N'BOUVET ISLAND', N'Bouvet Island', NULL, NULL)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'BW', N'BOTSWANA', N'Botswana', N'BWA', 72)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'BY', N'BELARUS', N'Belarus', N'BLR', 112)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'BZ', N'BELIZE', N'Belize', N'BLZ', 84)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'CA', N'CANADA', N'Canada', N'CAN', 124)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'CC', N'COCOS (KEELING) ISLANDS', N'Cocos (Keeling) Islands', NULL, NULL)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'CD', N'CONGO, THE DEMOCRATIC REPUBLIC OF THE', N'Congo, the Democratic Republic of the', N'COD', 180)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'CF', N'CENTRAL AFRICAN REPUBLIC', N'Central African Republic', N'CAF', 140)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'CG', N'CONGO', N'Congo', N'COG', 178)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'CH', N'SWITZERLAND', N'Switzerland', N'CHE', 756)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'CI', N'COTE D''IVOIRE', N'Cote D''Ivoire', N'CIV', 384)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'CK', N'COOK ISLANDS', N'Cook Islands', N'COK', 184)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'CL', N'CHILE', N'Chile', N'CHL', 152)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'CM', N'CAMEROON', N'Cameroon', N'CMR', 120)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'CN', N'CHINA', N'China', N'CHN', 156)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'CO', N'COLOMBIA', N'Colombia', N'COL', 170)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'CR', N'COSTA RICA', N'Costa Rica', N'CRI', 188)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'CS', N'SERBIA AND MONTENEGRO', N'Serbia and Montenegro', NULL, NULL)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'CU', N'CUBA', N'Cuba', N'CUB', 192)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'CV', N'CAPE VERDE', N'Cape Verde', N'CPV', 132)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'CX', N'CHRISTMAS ISLAND', N'Christmas Island', NULL, NULL)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'CY', N'CYPRUS', N'Cyprus', N'CYP', 196)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'CZ', N'CZECH REPUBLIC', N'Czech Republic', N'CZE', 203)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'DE', N'GERMANY', N'Germany', N'DEU', 276)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'DJ', N'DJIBOUTI', N'Djibouti', N'DJI', 262)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'DK', N'DENMARK', N'Denmark', N'DNK', 208)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'DM', N'DOMINICA', N'Dominica', N'DMA', 212)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'DO', N'DOMINICAN REPUBLIC', N'Dominican Republic', N'DOM', 214)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'DZ', N'ALGERIA', N'Algeria', N'DZA', 12)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'EC', N'ECUADOR', N'Ecuador', N'ECU', 218)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'EE', N'ESTONIA', N'Estonia', N'EST', 233)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'EG', N'EGYPT', N'Egypt', N'EGY', 818)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'EH', N'WESTERN SAHARA', N'Western Sahara', N'ESH', 732)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'ER', N'ERITREA', N'Eritrea', N'ERI', 232)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'ES', N'SPAIN', N'Spain', N'ESP', 724)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'ET', N'ETHIOPIA', N'Ethiopia', N'ETH', 231)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'FI', N'FINLAND', N'Finland', N'FIN', 246)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'FJ', N'FIJI', N'Fiji', N'FJI', 242)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'FK', N'FALKLAND ISLANDS (MALVINAS)', N'Falkland Islands (Malvinas)', N'FLK', 238)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'FM', N'MICRONESIA, FEDERATED STATES OF', N'Micronesia, Federated States of', N'FSM', 583)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'FO', N'FAROE ISLANDS', N'Faroe Islands', N'FRO', 234)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'FR', N'FRANCE', N'France', N'FRA', 250)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'GA', N'GABON', N'Gabon', N'GAB', 266)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'GB', N'UNITED KINGDOM', N'United Kingdom', N'GBR', 826)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'GD', N'GRENADA', N'Grenada', N'GRD', 308)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'GE', N'GEORGIA', N'Georgia', N'GEO', 268)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'GF', N'FRENCH GUIANA', N'French Guiana', N'GUF', 254)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'GH', N'GHANA', N'Ghana', N'GHA', 288)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'GI', N'GIBRALTAR', N'Gibraltar', N'GIB', 292)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'GL', N'GREENLAND', N'Greenland', N'GRL', 304)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'GM', N'GAMBIA', N'Gambia', N'GMB', 270)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'GN', N'GUINEA', N'Guinea', N'GIN', 324)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'GP', N'GUADELOUPE', N'Guadeloupe', N'GLP', 312)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'GQ', N'EQUATORIAL GUINEA', N'Equatorial Guinea', N'GNQ', 226)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'GR', N'GREECE', N'Greece', N'GRC', 300)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'GS', N'SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS', N'South Georgia and the South Sandwich Islands', NULL, NULL)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'GT', N'GUATEMALA', N'Guatemala', N'GTM', 320)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'GU', N'GUAM', N'Guam', N'GUM', 316)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'GW', N'GUINEA-BISSAU', N'Guinea-Bissau', N'GNB', 624)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'GY', N'GUYANA', N'Guyana', N'GUY', 328)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'HK', N'HONG KONG', N'Hong Kong', N'HKG', 344)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'HM', N'HEARD ISLAND AND MCDONALD ISLANDS', N'Heard Island and Mcdonald Islands', NULL, NULL)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'HN', N'HONDURAS', N'Honduras', N'HND', 340)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'HR', N'CROATIA', N'Croatia', N'HRV', 191)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'HT', N'HAITI', N'Haiti', N'HTI', 332)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'HU', N'HUNGARY', N'Hungary', N'HUN', 348)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'ID', N'INDONESIA', N'Indonesia', N'IDN', 360)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'IE', N'IRELAND', N'Ireland', N'IRL', 372)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'IL', N'ISRAEL', N'Israel', N'ISR', 376)
GO
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'IN', N'INDIA', N'India', N'IND', 356)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'IO', N'BRITISH INDIAN OCEAN TERRITORY', N'British Indian Ocean Territory', NULL, NULL)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'IQ', N'IRAQ', N'Iraq', N'IRQ', 368)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'IR', N'IRAN, ISLAMIC REPUBLIC OF', N'Iran, Islamic Republic of', N'IRN', 364)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'IS', N'ICELAND', N'Iceland', N'ISL', 352)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'IT', N'ITALY', N'Italy', N'ITA', 380)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'JM', N'JAMAICA', N'Jamaica', N'JAM', 388)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'JO', N'JORDAN', N'Jordan', N'JOR', 400)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'JP', N'JAPAN', N'Japan', N'JPN', 392)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'KE', N'KENYA', N'Kenya', N'KEN', 404)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'KG', N'KYRGYZSTAN', N'Kyrgyzstan', N'KGZ', 417)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'KH', N'CAMBODIA', N'Cambodia', N'KHM', 116)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'KI', N'KIRIBATI', N'Kiribati', N'KIR', 296)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'KM', N'COMOROS', N'Comoros', N'COM', 174)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'KN', N'SAINT KITTS AND NEVIS', N'Saint Kitts and Nevis', N'KNA', 659)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'KP', N'KOREA, DEMOCRATIC PEOPLE''S REPUBLIC OF', N'Korea, Democratic People''s Republic of', N'PRK', 408)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'KR', N'KOREA, REPUBLIC OF', N'Korea, Republic of', N'KOR', 410)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'KW', N'KUWAIT', N'Kuwait', N'KWT', 414)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'KY', N'CAYMAN ISLANDS', N'Cayman Islands', N'CYM', 136)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'KZ', N'KAZAKHSTAN', N'Kazakhstan', N'KAZ', 398)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'LA', N'LAO PEOPLE''S DEMOCRATIC REPUBLIC', N'Lao People''s Democratic Republic', N'LAO', 418)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'LB', N'LEBANON', N'Lebanon', N'LBN', 422)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'LC', N'SAINT LUCIA', N'Saint Lucia', N'LCA', 662)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'LI', N'LIECHTENSTEIN', N'Liechtenstein', N'LIE', 438)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'LK', N'SRI LANKA', N'Sri Lanka', N'LKA', 144)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'LR', N'LIBERIA', N'Liberia', N'LBR', 430)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'LS', N'LESOTHO', N'Lesotho', N'LSO', 426)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'LT', N'LITHUANIA', N'Lithuania', N'LTU', 440)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'LU', N'LUXEMBOURG', N'Luxembourg', N'LUX', 442)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'LV', N'LATVIA', N'Latvia', N'LVA', 428)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'LY', N'LIBYAN ARAB JAMAHIRIYA', N'Libyan Arab Jamahiriya', N'LBY', 434)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'MA', N'MOROCCO', N'Morocco', N'MAR', 504)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'MC', N'MONACO', N'Monaco', N'MCO', 492)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'MD', N'MOLDOVA, REPUBLIC OF', N'Moldova, Republic of', N'MDA', 498)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'MG', N'MADAGASCAR', N'Madagascar', N'MDG', 450)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'MH', N'MARSHALL ISLANDS', N'Marshall Islands', N'MHL', 584)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'MK', N'MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF', N'Macedonia, the Former Yugoslav Republic of', N'MKD', 807)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'ML', N'MALI', N'Mali', N'MLI', 466)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'MM', N'MYANMAR', N'Myanmar', N'MMR', 104)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'MN', N'MONGOLIA', N'Mongolia', N'MNG', 496)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'MO', N'MACAO', N'Macao', N'MAC', 446)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'MP', N'NORTHERN MARIANA ISLANDS', N'Northern Mariana Islands', N'MNP', 580)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'MQ', N'MARTINIQUE', N'Martinique', N'MTQ', 474)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'MR', N'MAURITANIA', N'Mauritania', N'MRT', 478)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'MS', N'MONTSERRAT', N'Montserrat', N'MSR', 500)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'MT', N'MALTA', N'Malta', N'MLT', 470)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'MU', N'MAURITIUS', N'Mauritius', N'MUS', 480)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'MV', N'MALDIVES', N'Maldives', N'MDV', 462)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'MW', N'MALAWI', N'Malawi', N'MWI', 454)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'MX', N'MEXICO', N'Mexico', N'MEX', 484)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'MY', N'MALAYSIA', N'Malaysia', N'MYS', 458)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'MZ', N'MOZAMBIQUE', N'Mozambique', N'MOZ', 508)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'NA', N'NAMIBIA', N'Namibia', N'NAM', 516)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'NC', N'NEW CALEDONIA', N'New Caledonia', N'NCL', 540)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'NE', N'NIGER', N'Niger', N'NER', 562)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'NF', N'NORFOLK ISLAND', N'Norfolk Island', N'NFK', 574)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'NG', N'NIGERIA', N'Nigeria', N'NGA', 566)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'NI', N'NICARAGUA', N'Nicaragua', N'NIC', 558)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'NL', N'NETHERLANDS', N'Netherlands', N'NLD', 528)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'NO', N'NORWAY', N'Norway', N'NOR', 578)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'NP', N'NEPAL', N'Nepal', N'NPL', 524)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'NR', N'NAURU', N'Nauru', N'NRU', 520)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'NU', N'NIUE', N'Niue', N'NIU', 570)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'NZ', N'NEW ZEALAND', N'New Zealand', N'NZL', 554)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'OM', N'OMAN', N'Oman', N'OMN', 512)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'PA', N'PANAMA', N'Panama', N'PAN', 591)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'PE', N'PERU', N'Peru', N'PER', 604)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'PF', N'FRENCH POLYNESIA', N'French Polynesia', N'PYF', 258)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'PG', N'PAPUA NEW GUINEA', N'Papua New Guinea', N'PNG', 598)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'PH', N'PHILIPPINES', N'Philippines', N'PHL', 608)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'PK', N'PAKISTAN', N'Pakistan', N'PAK', 586)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'PL', N'POLAND', N'Poland', N'POL', 616)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'PM', N'SAINT PIERRE AND MIQUELON', N'Saint Pierre and Miquelon', N'SPM', 666)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'PN', N'PITCAIRN', N'Pitcairn', N'PCN', 612)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'PR', N'PUERTO RICO', N'Puerto Rico', N'PRI', 630)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'PS', N'PALESTINIAN TERRITORY, OCCUPIED', N'Palestinian Territory, Occupied', NULL, NULL)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'PT', N'PORTUGAL', N'Portugal', N'PRT', 620)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'PW', N'PALAU', N'Palau', N'PLW', 585)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'PY', N'PARAGUAY', N'Paraguay', N'PRY', 600)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'QA', N'QATAR', N'Qatar', N'QAT', 634)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'RE', N'REUNION', N'Reunion', N'REU', 638)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'RO', N'ROMANIA', N'Romania', N'ROM', 642)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'RU', N'RUSSIAN FEDERATION', N'Russian Federation', N'RUS', 643)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'RW', N'RWANDA', N'Rwanda', N'RWA', 646)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'SA', N'SAUDI ARABIA', N'Saudi Arabia', N'SAU', 682)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'SB', N'SOLOMON ISLANDS', N'Solomon Islands', N'SLB', 90)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'SC', N'SEYCHELLES', N'Seychelles', N'SYC', 690)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'SD', N'SUDAN', N'Sudan', N'SDN', 736)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'SE', N'SWEDEN', N'Sweden', N'SWE', 752)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'SG', N'SINGAPORE', N'Singapore', N'SGP', 702)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'SH', N'SAINT HELENA', N'Saint Helena', N'SHN', 654)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'SI', N'SLOVENIA', N'Slovenia', N'SVN', 705)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'SJ', N'SVALBARD AND JAN MAYEN', N'Svalbard and Jan Mayen', N'SJM', 744)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'SK', N'SLOVAKIA', N'Slovakia', N'SVK', 703)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'SL', N'SIERRA LEONE', N'Sierra Leone', N'SLE', 694)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'SM', N'SAN MARINO', N'San Marino', N'SMR', 674)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'SN', N'SENEGAL', N'Senegal', N'SEN', 686)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'SO', N'SOMALIA', N'Somalia', N'SOM', 706)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'SR', N'SURIName', N'SuriName', N'SUR', 740)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'ST', N'SAO TOME AND PRINCIPE', N'Sao Tome and Principe', N'STP', 678)
GO
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'SV', N'EL SALVADOR', N'El Salvador', N'SLV', 222)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'SY', N'SYRIAN ARAB REPUBLIC', N'Syrian Arab Republic', N'SYR', 760)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'SZ', N'SWAZILAND', N'Swaziland', N'SWZ', 748)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'TC', N'TURKS AND CAICOS ISLANDS', N'Turks and Caicos Islands', N'TCA', 796)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'TD', N'CHAD', N'Chad', N'TCD', 148)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'TF', N'FRENCH SOUTHERN TERRITORIES', N'French Southern Territories', NULL, NULL)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'TG', N'TOGO', N'Togo', N'TGO', 768)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'TH', N'THAILAND', N'Thailand', N'THA', 764)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'TJ', N'TAJIKISTAN', N'Tajikistan', N'TJK', 762)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'TK', N'TOKELAU', N'Tokelau', N'TKL', 772)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'TL', N'TIMOR-LESTE', N'Timor-Leste', NULL, NULL)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'TM', N'TURKMENISTAN', N'Turkmenistan', N'TKM', 795)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'TN', N'TUNISIA', N'Tunisia', N'TUN', 788)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'TO', N'TONGA', N'Tonga', N'TON', 776)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'TR', N'TURKEY', N'Turkey', N'TUR', 792)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'TT', N'TRINIDAD AND TOBAGO', N'Trinidad and Tobago', N'TTO', 780)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'TV', N'TUVALU', N'Tuvalu', N'TUV', 798)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'TW', N'TAIWAN, PROVINCE OF CHINA', N'Taiwan, Province of China', N'TWN', 158)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'TZ', N'TANZANIA, UNITED REPUBLIC OF', N'Tanzania, United Republic of', N'TZA', 834)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'UA', N'UKRAINE', N'Ukraine', N'UKR', 804)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'UG', N'UGANDA', N'Uganda', N'UGA', 800)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'UM', N'UNITED STATES MINOR OUTLYING ISLANDS', N'United States Minor Outlying Islands', NULL, NULL)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'US', N'UNITED STATES', N'United States', N'USA', 840)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'UY', N'URUGUAY', N'Uruguay', N'URY', 858)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'UZ', N'UZBEKISTAN', N'Uzbekistan', N'UZB', 860)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'VA', N'HOLY SEE (VATICAN CITY STATE)', N'Holy See (Vatican City State)', N'VAT', 336)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'VC', N'SAINT VINCENT AND THE GRENADINES', N'Saint Vincent and the Grenadines', N'VCT', 670)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'VE', N'VENEZUELA', N'Venezuela', N'VEN', 862)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'VG', N'VIRGIN ISLANDS, BRITISH', N'Virgin Islands, British', N'VGB', 92)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'VI', N'VIRGIN ISLANDS, U.S.', N'Virgin Islands, U.s.', N'VIR', 850)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'VN', N'VIET NAM', N'Viet Nam', N'VNM', 704)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'VU', N'VANUATU', N'Vanuatu', N'VUT', 548)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'WF', N'WALLIS AND FUTUNA', N'Wallis and Futuna', N'WLF', 876)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'WS', N'SAMOA', N'Samoa', N'WSM', 882)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'YE', N'YEMEN', N'Yemen', N'YEM', 887)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'YT', N'MAYOTTE', N'Mayotte', NULL, NULL)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'ZA', N'SOUTH AFRICA', N'South Africa', N'ZAF', 710)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'ZM', N'ZAMBIA', N'Zambia', N'ZMB', 894)
INSERT [dbo].[Country] ([Iso], [Name], [PrintableName], [Iso3], [Numcode]) VALUES (N'ZW', N'ZIMBABWE', N'Zimbabwe', N'ZWE', 716)
ALTER TABLE [dbo].[Album_Artist]  WITH CHECK ADD  CONSTRAINT [FK_Album_Artist_Album] FOREIGN KEY([AlbumId])
REFERENCES [dbo].[Album] ([Id])
GO
ALTER TABLE [dbo].[Album_Artist] CHECK CONSTRAINT [FK_Album_Artist_Album]
GO
ALTER TABLE [dbo].[Album_Artist]  WITH CHECK ADD  CONSTRAINT [FK_Album_Artist_Artist] FOREIGN KEY([ArtistId])
REFERENCES [dbo].[Artist] ([Id])
GO
ALTER TABLE [dbo].[Album_Artist] CHECK CONSTRAINT [FK_Album_Artist_Artist]
GO
ALTER TABLE [dbo].[Alias]  WITH CHECK ADD  CONSTRAINT [FK_Alias_Artist] FOREIGN KEY([ArtistId])
REFERENCES [dbo].[Artist] ([Id])
GO
ALTER TABLE [dbo].[Alias] CHECK CONSTRAINT [FK_Alias_Artist]
GO
ALTER TABLE [dbo].[Artist]  WITH CHECK ADD  CONSTRAINT [FK_Artist_Country] FOREIGN KEY([CountryIso])
REFERENCES [dbo].[Country] ([Iso])
GO
ALTER TABLE [dbo].[Artist] CHECK CONSTRAINT [FK_Artist_Country]
GO
/****** Object:  StoredProcedure [dbo].[GetArtists]    Script Date: 11/28/2016 6:23:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetArtists]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM Artist
END

GO
USE [master]
GO
ALTER DATABASE [Backend] SET  READ_WRITE 
GO
