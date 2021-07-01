USE [master]
GO
/****** Object:  Database [MRP]    Script Date: 2021-07-01 오전 9:11:28 ******/
CREATE DATABASE [MRP]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MRP', FILENAME = N'D:\Data\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MRP.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MRP_log', FILENAME = N'D:\Data\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MRP_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MRP] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MRP].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MRP] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MRP] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MRP] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MRP] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MRP] SET ARITHABORT OFF 
GO
ALTER DATABASE [MRP] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MRP] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MRP] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MRP] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MRP] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MRP] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MRP] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MRP] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MRP] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MRP] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MRP] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MRP] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MRP] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MRP] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MRP] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MRP] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MRP] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MRP] SET RECOVERY FULL 
GO
ALTER DATABASE [MRP] SET  MULTI_USER 
GO
ALTER DATABASE [MRP] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MRP] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MRP] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MRP] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MRP] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MRP] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'MRP', N'ON'
GO
ALTER DATABASE [MRP] SET QUERY_STORE = OFF
GO
USE [MRP]
GO
/****** Object:  Table [dbo].[Process]    Script Date: 2021-07-01 오전 9:11:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Process](
	[PrcIdx] [int] IDENTITY(1,1) NOT NULL,
	[SchIdx] [int] NOT NULL,
	[PrcCd] [char](14) NOT NULL,
	[PrcDate] [date] NOT NULL,
	[PrcLoadTime] [int] NULL,
	[PrcStartTime] [time](7) NULL,
	[PrcEndTime] [time](7) NULL,
	[PrcFacilityID] [char](8) NULL,
	[PrcResult] [bit] NOT NULL,
	[RegDate] [datetime] NULL,
	[RegID] [varchar](20) NULL,
	[ModDate] [datetime] NULL,
	[ModID] [varchar](20) NULL,
 CONSTRAINT [PK_Process] PRIMARY KEY CLUSTERED 
(
	[PrcIdx] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UK_Process_PrcCD] UNIQUE NONCLUSTERED 
(
	[PrcCd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Process_DEV]    Script Date: 2021-07-01 오전 9:11:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Process_DEV](
	[PrcIdx] [int] IDENTITY(1,1) NOT NULL,
	[SchIdx] [int] NOT NULL,
	[PrcCd] [char](14) NOT NULL,
	[PrcDate] [datetime] NOT NULL,
	[PrcLoadTime] [int] NULL,
	[PrcStartTime] [time](7) NULL,
	[PrcEndTime] [time](7) NULL,
	[PrcFacilityID] [char](8) NULL,
	[PrcResult] [bit] NOT NULL,
	[RegDate] [datetime] NULL,
	[RegID] [varchar](20) NULL,
	[ModDate] [datetime] NULL,
	[ModID] [varchar](20) NULL,
 CONSTRAINT [PK_Process_DEV] PRIMARY KEY CLUSTERED 
(
	[PrcIdx] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UK_Process_PrcCD_DEV] UNIQUE NONCLUSTERED 
(
	[PrcCd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Schedules]    Script Date: 2021-07-01 오전 9:11:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedules](
	[SchIdx] [int] IDENTITY(1,1) NOT NULL,
	[PlantCode] [char](8) NOT NULL,
	[SchDate] [date] NOT NULL,
	[SchLoadTime] [int] NOT NULL,
	[SchStartTime] [time](7) NULL,
	[SchEndTime] [time](7) NULL,
	[SchFacilityID] [char](8) NULL,
	[SchAmount] [int] NULL,
	[RegDate] [datetime] NULL,
	[RegID] [varchar](20) NULL,
	[ModDate] [datetime] NULL,
	[ModID] [varchar](20) NULL,
 CONSTRAINT [PK_Schedules] PRIMARY KEY CLUSTERED 
(
	[SchIdx] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Settings]    Script Date: 2021-07-01 오전 9:11:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Settings](
	[BasicCode] [char](8) NOT NULL,
	[CodeName] [nvarchar](100) NOT NULL,
	[CodeDesc] [nvarchar](max) NULL,
	[RegDate] [datetime] NULL,
	[RegID] [varchar](20) NULL,
	[ModDate] [datetime] NULL,
	[ModID] [varchar](20) NULL,
 CONSTRAINT [PK_Settings] PRIMARY KEY CLUSTERED 
(
	[BasicCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Process]  WITH NOCHECK ADD  CONSTRAINT [FK_Process_Schedules] FOREIGN KEY([SchIdx])
REFERENCES [dbo].[Schedules] ([SchIdx])
GO
ALTER TABLE [dbo].[Process] NOCHECK CONSTRAINT [FK_Process_Schedules]
GO
ALTER TABLE [dbo].[Process]  WITH NOCHECK ADD  CONSTRAINT [FK_Process_Settings] FOREIGN KEY([PrcFacilityID])
REFERENCES [dbo].[Settings] ([BasicCode])
GO
ALTER TABLE [dbo].[Process] NOCHECK CONSTRAINT [FK_Process_Settings]
GO
ALTER TABLE [dbo].[Schedules]  WITH NOCHECK ADD  CONSTRAINT [FK_Schedules_Settings] FOREIGN KEY([PlantCode])
REFERENCES [dbo].[Settings] ([BasicCode])
GO
ALTER TABLE [dbo].[Schedules] NOCHECK CONSTRAINT [FK_Schedules_Settings]
GO
ALTER TABLE [dbo].[Schedules]  WITH NOCHECK ADD  CONSTRAINT [FK_Schedules_Settings1] FOREIGN KEY([SchFacilityID])
REFERENCES [dbo].[Settings] ([BasicCode])
GO
ALTER TABLE [dbo].[Schedules] NOCHECK CONSTRAINT [FK_Schedules_Settings1]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'공정계획 순번' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Schedules', @level2type=N'COLUMN',@level2name=N'SchIdx'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'공장코드' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Schedules', @level2type=N'COLUMN',@level2name=N'PlantCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'공정계획일' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Schedules', @level2type=N'COLUMN',@level2name=N'SchDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'로드타임(초)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Schedules', @level2type=N'COLUMN',@level2name=N'SchLoadTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'시작시간(계획)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Schedules', @level2type=N'COLUMN',@level2name=N'SchStartTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'종료시간(계획)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Schedules', @level2type=N'COLUMN',@level2name=N'SchEndTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'생산설비ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Schedules', @level2type=N'COLUMN',@level2name=N'SchFacilityID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'목표수량(계획)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Schedules', @level2type=N'COLUMN',@level2name=N'SchAmount'
GO
USE [master]
GO
ALTER DATABASE [MRP] SET  READ_WRITE 
GO
