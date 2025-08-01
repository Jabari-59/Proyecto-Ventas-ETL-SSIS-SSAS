USE [master]
GO
/****** Object:  Database [DWH Ventas]    Script Date: 7/9/2025 1:52:49 AM ******/
CREATE DATABASE [DWH Ventas]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DWH Ventas', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\DWH Ventas.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DWH Ventas_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\DWH Ventas_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [DWH Ventas] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DWH Ventas].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DWH Ventas] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DWH Ventas] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DWH Ventas] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DWH Ventas] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DWH Ventas] SET ARITHABORT OFF 
GO
ALTER DATABASE [DWH Ventas] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DWH Ventas] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DWH Ventas] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DWH Ventas] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DWH Ventas] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DWH Ventas] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DWH Ventas] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DWH Ventas] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DWH Ventas] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DWH Ventas] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DWH Ventas] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DWH Ventas] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DWH Ventas] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DWH Ventas] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DWH Ventas] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DWH Ventas] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DWH Ventas] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DWH Ventas] SET RECOVERY FULL 
GO
ALTER DATABASE [DWH Ventas] SET  MULTI_USER 
GO
ALTER DATABASE [DWH Ventas] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DWH Ventas] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DWH Ventas] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DWH Ventas] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DWH Ventas] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DWH Ventas] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DWH Ventas', N'ON'
GO
ALTER DATABASE [DWH Ventas] SET QUERY_STORE = ON
GO
ALTER DATABASE [DWH Ventas] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [DWH Ventas]
GO
/****** Object:  Table [dbo].[DimDivisa]    Script Date: 7/9/2025 1:52:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimDivisa](
	[IDDivisa] [int] NULL,
	[EtiquetaDivisa] [int] NULL,
	[NombreDivisa] [varchar](5) NULL,
	[DescripcionDivisa] [varchar](25) NULL,
	[Valor] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimFecha]    Script Date: 7/9/2025 1:52:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimFecha](
	[FechaID] [date] NULL,
	[Anio] [int] NULL,
	[Trimestre] [nvarchar](7) NULL,
	[Semestre] [nvarchar](7) NULL,
	[Mes] [nvarchar](7) NULL,
	[Dia] [nvarchar](10) NULL,
	[DiaSemana] [int] NULL,
	[NombreDia] [nvarchar](20) NULL,
	[NumSemana] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimProducto]    Script Date: 7/9/2025 1:52:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimProducto](
	[IDProducto] [int] NULL,
	[NombreProducto] [nvarchar](500) NULL,
	[SubCategoria] [nvarchar](50) NULL,
	[Categoria] [nvarchar](50) NULL,
	[Marca] [nvarchar](50) NULL,
	[Color] [nvarchar](20) NULL,
	[CostoUnitario] [money] NULL,
	[PrecioUnitario] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimPromocion]    Script Date: 7/9/2025 1:52:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimPromocion](
	[IDPromocion] [int] NULL,
	[NombrePromocion] [varchar](50) NULL,
	[PorcentajeDescuento] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimTienda]    Script Date: 7/9/2025 1:52:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimTienda](
	[IDTienda] [int] NULL,
	[TipoTienda] [nvarchar](15) NULL,
	[NombreTienda] [nvarchar](50) NULL,
	[Estado] [nvarchar](15) NULL,
	[CantidadEmpleados] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[THVentas]    Script Date: 7/9/2025 1:52:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[THVentas](
	[IDVenta] [int] NULL,
	[IDFecha] [date] NULL,
	[IDCanal] [int] NULL,
	[IdTienda] [int] NULL,
	[IDProducto] [int] NULL,
	[IDPromocion] [int] NULL,
	[IDDivisa] [int] NULL,
	[PrecioUnitario] [money] NULL,
	[CantidadVenta] [int] NULL,
	[CostoTotal] [money] NULL,
	[MontoTotal] [money] NULL
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [DWH Ventas] SET  READ_WRITE 
GO
