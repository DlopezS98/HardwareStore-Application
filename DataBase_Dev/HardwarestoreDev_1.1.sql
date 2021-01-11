USE [master]
GO
/****** Object:  Database [HardwareStore_Dev]    Script Date: 11/1/2021 16:06:44 ******/
CREATE DATABASE [HardwareStore_Dev]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HardwareStore_Dev', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\HardwareStore_Dev.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HardwareStore_Dev_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\HardwareStore_Dev_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [HardwareStore_Dev] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HardwareStore_Dev].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HardwareStore_Dev] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HardwareStore_Dev] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HardwareStore_Dev] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HardwareStore_Dev] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HardwareStore_Dev] SET ARITHABORT OFF 
GO
ALTER DATABASE [HardwareStore_Dev] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HardwareStore_Dev] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HardwareStore_Dev] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HardwareStore_Dev] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HardwareStore_Dev] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HardwareStore_Dev] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HardwareStore_Dev] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HardwareStore_Dev] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HardwareStore_Dev] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HardwareStore_Dev] SET  ENABLE_BROKER 
GO
ALTER DATABASE [HardwareStore_Dev] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HardwareStore_Dev] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HardwareStore_Dev] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HardwareStore_Dev] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HardwareStore_Dev] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HardwareStore_Dev] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HardwareStore_Dev] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HardwareStore_Dev] SET RECOVERY FULL 
GO
ALTER DATABASE [HardwareStore_Dev] SET  MULTI_USER 
GO
ALTER DATABASE [HardwareStore_Dev] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HardwareStore_Dev] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HardwareStore_Dev] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HardwareStore_Dev] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HardwareStore_Dev] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'HardwareStore_Dev', N'ON'
GO
ALTER DATABASE [HardwareStore_Dev] SET QUERY_STORE = OFF
GO
USE [HardwareStore_Dev]
GO
/****** Object:  User [DlopezS98]    Script Date: 11/1/2021 16:06:45 ******/
CREATE USER [DlopezS98] FOR LOGIN [DlopezS98] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 11/1/2021 16:06:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brands](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Initials] [nvarchar](10) NOT NULL,
	[Code]  AS (upper(concat([Initials],'00'+CONVERT([varchar],[Id])))),
	[Deleted] [bit] NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
 CONSTRAINT [PK_BRANDS] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 11/1/2021 16:06:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Initials] [nvarchar](10) NOT NULL,
	[Code]  AS (upper(concat([Initials],'00'+CONVERT([varchar],[Id])))),
	[Description] [nvarchar](250) NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_CATEGORIES] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Configurations]    Script Date: 11/1/2021 16:06:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Configurations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ContactInfoId] [int] NOT NULL,
	[BusinessName] [nvarchar](80) NOT NULL,
	[OwnerName] [nvarchar](50) NOT NULL,
	[RucNumber] [nvarchar](255) NOT NULL,
	[Address] [nvarchar](350) NULL,
	[Description] [nvarchar](250) NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](80) NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [nvarchar](80) NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_CONFIGURATIONS] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContactInfo]    Script Date: 11/1/2021 16:06:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmailAddress1] [nvarchar](80) NOT NULL,
	[EmailAddress2] [nvarchar](80) NULL,
	[PhoneNumber1] [nvarchar](15) NOT NULL,
	[PhoneNumber2] [nvarchar](15) NULL,
	[FixedLineNumber1] [nvarchar](15) NULL,
	[FixedLineNumber2] [nvarchar](15) NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](80) NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [nvarchar](80) NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_CONTACTINFORMATION] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CurrencyExchange]    Script Date: 11/1/2021 16:06:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CurrencyExchange](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LocalId] [int] NOT NULL,
	[ForeignId] [int] NOT NULL,
	[Sale] [float] NOT NULL,
	[Purchase] [float] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](80) NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [nvarchar](80) NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PKCURRENCYEXCHANGE] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 11/1/2021 16:06:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PersonId] [int] NULL,
	[Initials] [nvarchar](10) NOT NULL,
	[Code]  AS (upper(concat_ws('',[Initials],(0),[Id],isnull([PersonId],(0)),'-',format([CreatedAt],'ddMMyyy','vi')))),
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](80) NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [nvarchar](80) NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_CUSTOMERS] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetailProductStocks]    Script Date: 11/1/2021 16:06:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetailProductStocks](
	[Code]  AS (concat_ws('',[ProductDetailCode],'-',[WarehouseId],[ProductStocksId],[TargetUnitId],[UnitConversionId])),
	[ProductStocksId] [int] NOT NULL,
	[WarehouseId] [int] NOT NULL,
	[ProductDetailCode] [nvarchar](255) NOT NULL,
	[TargetUnitId] [int] NOT NULL,
	[UnitConversionId] [int] NOT NULL,
	[UnitsPurchased] [int] NOT NULL,
	[ConversionQuantity] [float] NOT NULL,
	[PurchasePrice] [float] NOT NULL,
	[SalePrice] [float] NOT NULL,
	[Available] [bit] NOT NULL,
 CONSTRAINT [PK_DETAILPRODUCTSTOCKS] PRIMARY KEY CLUSTERED 
(
	[WarehouseId] ASC,
	[ProductStocksId] ASC,
	[ProductDetailCode] ASC,
	[TargetUnitId] ASC,
	[UnitConversionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 11/1/2021 16:06:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PersonId] [int] NOT NULL,
	[Initials] [nvarchar](10) NOT NULL,
	[Code]  AS (upper(concat_ws('',[Initials],(0),[Id],[PersonId],'-',format([CreatedAt],'ddMMyyyy','vi')))),
	[Position] [nvarchar](50) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](80) NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [nvarchar](80) NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_EMPLOYEES] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ForeignCurrencies]    Script Date: 11/1/2021 16:06:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ForeignCurrencies](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[Symbol] [nvarchar](5) NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_FOREIGNCURRENCIES] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LocalCurrencies]    Script Date: 11/1/2021 16:06:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LocalCurrencies](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[Symbol] [nvarchar](5) NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_LOCALCURRENCIES] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialsTypes]    Script Date: 11/1/2021 16:06:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialsTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](250) NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_MATERIALSTYPES] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MeasureUnits]    Script Date: 11/1/2021 16:06:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MeasureUnits](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UnitTypeId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Abbrevation] [nvarchar](5) NOT NULL,
	[Code]  AS (upper(concat_ws('',[Abbrevation],'00',[Id],'-00'+[UnitTypeId]))),
	[Description] [nvarchar](250) NULL,
	[BaseUnit] [bit] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_MEASUREUNITS] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PendingTransfers]    Script Date: 11/1/2021 16:06:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PendingTransfers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code]  AS (concat_ws('',[ProductStocksId],[TargetWarehouseId],'-',[ProductDetailCode],'-',[SourceWarehouseId],[TargetUnitId],[UnitConversionId])),
	[ProductStocksId] [int] NOT NULL,
	[TargetWarehouseId] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](80) NOT NULL,
	[UpdatedBy] [nvarchar](80) NOT NULL,
	[TransferStatus] [bit] NOT NULL,
	[ProductDetailCode] [nvarchar](255) NOT NULL,
	[SourceWarehouseId] [int] NOT NULL,
	[TargetUnitId] [int] NOT NULL,
	[UnitConversionId] [int] NOT NULL,
	[UnitsPurchased] [int] NOT NULL,
	[ConversionQuantity] [float] NOT NULL,
	[PurchasePrice] [float] NOT NULL,
	[SalePrice] [float] NOT NULL,
 CONSTRAINT [PK_PENDINGTRANFERS] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Persons]    Script Date: 11/1/2021 16:06:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persons](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[FullName]  AS (concat_ws('',[FirstName],' ',[LastName])),
	[EmailAddress] [nvarchar](80) NOT NULL,
	[Address] [nvarchar](250) NULL,
	[CardId] [nvarchar](20) NULL,
	[PhoneNumber] [nvarchar](12) NULL,
 CONSTRAINT [PK_PERSONS] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductDetails]    Script Date: 11/1/2021 16:06:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[BrandId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[MaterialTypeId] [int] NOT NULL,
	[Code]  AS (upper(concat_ws('',(0),[Id],[ProductId],[BrandId],[CategoryId],[MaterialTypeId],'-',format([CreatedAt],'ddMMyyyy','vi')))),
	[DefaultCode] [nvarchar](max) NULL,
	[Dimensions] [nvarchar](250) NULL,
	[ExpiryDate] [datetime] NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](80) NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [nvarchar](80) NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_PRODUCTDETAILS] PRIMARY KEY CLUSTERED 
(
	[Id] ASC,
	[ProductId] ASC,
	[BrandId] ASC,
	[CategoryId] ASC,
	[MaterialTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 11/1/2021 16:06:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](80) NOT NULL,
	[Initials] [nvarchar](10) NULL,
	[MeasureUnitId] [int] NOT NULL,
	[Code]  AS (upper(concat_ws('',[Initials],(0),[Id],[MeasureUnitId]))),
	[Description] [nvarchar](350) NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_PRODUCTS] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductStocks]    Script Date: 11/1/2021 16:06:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductStocks](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SupplierId] [int] NOT NULL,
	[LotNumber]  AS (upper(concat_ws('',(0),[Id],[SupplierId],'-0',[Quantity],'-',format([CreatedAt],'ddMMyyyy','vi')))),
	[Quantity] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](80) NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [nvarchar](80) NOT NULL,
	[Available] [bit] NOT NULL,
 CONSTRAINT [PK_PRODUCTSTOCKS] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductTransfers]    Script Date: 11/1/2021 16:06:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductTransfers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductStocksId] [int] NOT NULL,
	[TargetWarehouseId] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](80) NOT NULL,
	[UpdatedBy] [nvarchar](80) NOT NULL,
	[TransferStatus] [bit] NOT NULL,
 CONSTRAINT [PK_PRODUCTTRANSFERS] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PurchaseDetails]    Script Date: 11/1/2021 16:06:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseDetails](
	[PurchaseInvoiceId] [int] NOT NULL,
	[ProductDetailCode] [nvarchar](255) NOT NULL,
	[WarehouseId] [int] NOT NULL,
	[TargetUnitId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[PurchasePrice] [float] NOT NULL,
	[Subtotal] [float] NOT NULL,
	[Tax] [float] NOT NULL,
	[Discount] [int] NOT NULL,
	[Total] [float] NOT NULL,
 CONSTRAINT [PK_PURCHASEDETAILS] PRIMARY KEY CLUSTERED 
(
	[PurchaseInvoiceId] ASC,
	[ProductDetailCode] ASC,
	[WarehouseId] ASC,
	[TargetUnitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PurchaseInvoices]    Script Date: 11/1/2021 16:06:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseInvoices](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[VendorCode] [nvarchar](255) NOT NULL,
	[InvoiceNumber]  AS (concat_ws('',(0),[Id],'-',[SupplierInvoiceNumber],'-',format([CreatedAt],'ddMMyyyy','vi'))),
	[SupplierInvoiceNumber] [nvarchar](255) NOT NULL,
	[Tax] [float] NOT NULL,
	[Subtotal] [float] NOT NULL,
	[Discount] [int] NOT NULL,
	[TotalAmount] [float] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](80) NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [nvarchar](80) NOT NULL,
 CONSTRAINT [PK_PURCHASEINVOICE] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RemovedProducts]    Script Date: 11/1/2021 16:06:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RemovedProducts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductStocksId] [int] NOT NULL,
	[LotNumber] [nvarchar](max) NOT NULL,
	[StocksDetailCode] [nvarchar](max) NOT NULL,
	[UnitQuantity] [int] NOT NULL,
	[ConversionQuantity] [float] NOT NULL,
	[Title] [nvarchar](80) NOT NULL,
	[Description] [nvarchar](450) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](80) NOT NULL,
 CONSTRAINT [PK_REMOVEDPRODUCTS] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 11/1/2021 16:06:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](450) NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_ROLES] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalesDetails]    Script Date: 11/1/2021 16:06:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesDetails](
	[SaleInvoiceId] [int] NOT NULL,
	[ProductDetailCode] [nvarchar](255) NOT NULL,
	[WarehouseId] [int] NOT NULL,
	[TargetUnitId] [int] NOT NULL,
	[UnitConversionId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[Subtotal] [float] NOT NULL,
	[Tax] [float] NOT NULL,
	[Discount] [float] NOT NULL,
	[Total] [float] NOT NULL,
 CONSTRAINT [PK_SALEDETAILS] PRIMARY KEY CLUSTERED 
(
	[SaleInvoiceId] ASC,
	[ProductDetailCode] ASC,
	[WarehouseId] ASC,
	[TargetUnitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalesInvoices]    Script Date: 11/1/2021 16:06:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesInvoices](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceNumber]  AS (concat_ws('',(0),[Id],isnull([CustomerId],(0)),'-',format([CreatedAt],'ddMMyyyy','vi'))),
	[CustomerId] [int] NULL,
	[CustomerInvoice] [nvarchar](80) NULL,
	[CurrencyExchangeId] [int] NOT NULL,
	[Tax] [float] NOT NULL,
	[Subtotal] [float] NOT NULL,
	[Discount] [int] NOT NULL,
	[TotalAmount] [float] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](80) NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [nvarchar](80) NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_SALESINVOICES] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 11/1/2021 16:06:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Code]  AS (upper(concat_ws('',left([Name],(3)),(0),[Id],'-',format([CreatedAt],'ddMMyyyy','vi')))),
	[Email] [nvarchar](80) NOT NULL,
	[Address] [nvarchar](250) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](80) NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [nvarchar](80) NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_SUPPLIERS] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransfersDetails]    Script Date: 11/1/2021 16:06:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransfersDetails](
	[ProductTransferId] [int] NOT NULL,
	[ProductStocksId] [int] NOT NULL,
	[ProductDetailCode] [nvarchar](255) NOT NULL,
	[SourceWarehouseId] [int] NOT NULL,
	[TargetUnitId] [int] NOT NULL,
	[UnitConversionId] [int] NOT NULL,
	[UnitsPurchased] [int] NOT NULL,
	[ConversionQuantity] [float] NOT NULL,
	[PurchasePrice] [float] NOT NULL,
	[SalePrice] [float] NOT NULL,
 CONSTRAINT [PK_TRASNFERDETAILS] PRIMARY KEY CLUSTERED 
(
	[ProductTransferId] ASC,
	[SourceWarehouseId] ASC,
	[ProductStocksId] ASC,
	[ProductDetailCode] ASC,
	[TargetUnitId] ASC,
	[UnitConversionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UnitConversion]    Script Date: 11/1/2021 16:06:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UnitConversion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Unit] [int] NOT NULL,
	[IdMeasureUnitFrom] [int] NOT NULL,
	[IdMeasureUnitTo] [int] NOT NULL,
	[ConversionNameFrom] [nvarchar](50) NOT NULL,
	[ConversionNameTo] [nvarchar](50) NOT NULL,
	[ConversionValue] [float] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_UNITCONVERSION] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UnitTypes]    Script Date: 11/1/2021 16:06:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UnitTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Code]  AS (upper(concat(left([Name],(3)),'00'+CONVERT([varchar],[Id])))),
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PKUNITTYPES] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 11/1/2021 16:06:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](80) NOT NULL,
	[UpdatedBy] [nvarchar](80) NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_USERROLES] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 11/1/2021 16:06:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[Code]  AS (upper(concat_ws('',left([UserName],(3)),(0),[Id],[EmployeeId],'-',format([CreatedAt],'ddMMyyyy','vi')))),
	[UserName] [nvarchar](80) NOT NULL,
	[Password] [nvarchar](80) NOT NULL,
	[ImageUrl] [nvarchar](250) NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](80) NOT NULL,
	[UpdatedBy] [nvarchar](80) NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_USERS] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vendors]    Script Date: 11/1/2021 16:06:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vendors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PersonId] [int] NOT NULL,
	[SupplierId] [int] NOT NULL,
	[Code]  AS (upper(concat_ws('',(0),[Id],[SupplierId],[PersonId],'-',format([CreatedAt],'ddMMyyyy','vi')))),
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](80) NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [nvarchar](80) NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_VENDORS] PRIMARY KEY CLUSTERED 
(
	[Id] ASC,
	[PersonId] ASC,
	[SupplierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Warehouses]    Script Date: 11/1/2021 16:06:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Warehouses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Code]  AS (upper(concat(left([Name],(2)),'00'+CONVERT([varchar],[Id])))),
	[Description] [nvarchar](250) NULL,
	[Location] [nvarchar](80) NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](80) NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [nvarchar](80) NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_WAREHOUSES] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Brands] ON 

INSERT [dbo].[Brands] ([Id], [Name], [Initials], [Deleted], [CreatedAt], [UpdatedAt]) VALUES (1, N'Black and Decker', N'BAD', 0, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Brands] ([Id], [Name], [Initials], [Deleted], [CreatedAt], [UpdatedAt]) VALUES (4, N'Makita', N'M', 0, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Brands] ([Id], [Name], [Initials], [Deleted], [CreatedAt], [UpdatedAt]) VALUES (5, N'Cela', N'C', 0, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Brands] ([Id], [Name], [Initials], [Deleted], [CreatedAt], [UpdatedAt]) VALUES (6, N'Evans', N'E', 0, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Brands] ([Id], [Name], [Initials], [Deleted], [CreatedAt], [UpdatedAt]) VALUES (7, N'Lincoln Electric', N'LE', 0, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Brands] ([Id], [Name], [Initials], [Deleted], [CreatedAt], [UpdatedAt]) VALUES (8, N'Trupper', N'T', 0, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Brands] ([Id], [Name], [Initials], [Deleted], [CreatedAt], [UpdatedAt]) VALUES (9, N'Karcher', N'K', 0, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Brands] ([Id], [Name], [Initials], [Deleted], [CreatedAt], [UpdatedAt]) VALUES (10, N'Cemento Canal', N'CC', 0, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Brands] ([Id], [Name], [Initials], [Deleted], [CreatedAt], [UpdatedAt]) VALUES (11, N'Sherwin Willians', N'SW', 0, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Brands] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name], [Initials], [Description], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (1, N'Herramientas manuales y Electricas', N'HMYE', NULL, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Categories] ([Id], [Name], [Initials], [Description], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (2, N'Tuberias', N'T', NULL, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Categories] ([Id], [Name], [Initials], [Description], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (3, N'Insumo Electrico', N'IE', NULL, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Categories] ([Id], [Name], [Initials], [Description], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (4, N'Cables y accesorios', N'CYA', NULL, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Categories] ([Id], [Name], [Initials], [Description], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (5, N'Pinturas y accesorios', N'PYA', NULL, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Categories] ([Id], [Name], [Initials], [Description], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (6, N'Iluminacion', N'I', NULL, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Categories] ([Id], [Name], [Initials], [Description], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (7, N'Construccion', N'C', NULL, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Categories] ([Id], [Name], [Initials], [Description], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (8, N'Diluyentes', N'D', NULL, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([Id], [PersonId], [Initials], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [Deleted]) VALUES (1, 4, N'JL', CAST(N'2020-01-10T00:00:00.000' AS DateTime), N'01dlopezs98@gmail.com', CAST(N'2020-01-10T00:00:00.000' AS DateTime), N'01dlopezs98@gmail.com', 0)
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([Id], [PersonId], [Initials], [Position], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [Deleted]) VALUES (1, 3, N'CRAP', N'Vendedor', CAST(N'2020-01-10T00:00:00.000' AS DateTime), N'01dlopezs98@gmail.com', CAST(N'2020-01-10T00:00:00.000' AS DateTime), N'01dlopezs98@gmail.com', 0)
INSERT [dbo].[Employees] ([Id], [PersonId], [Initials], [Position], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [Deleted]) VALUES (2, 1, N'DALS', N'Sys Admin', CAST(N'2020-01-10T00:00:00.000' AS DateTime), N'01dlopezs98@gmail.com', CAST(N'2020-01-10T00:00:00.000' AS DateTime), N'01dlopezs98@gmail.com', 0)
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO
SET IDENTITY_INSERT [dbo].[MaterialsTypes] ON 

INSERT [dbo].[MaterialsTypes] ([Id], [Name], [Description], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (1, N'Hierro', NULL, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[MaterialsTypes] ([Id], [Name], [Description], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (2, N'Plastico', NULL, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[MaterialsTypes] ([Id], [Name], [Description], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (3, N'Polvo', NULL, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[MaterialsTypes] ([Id], [Name], [Description], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (5, N'Liquido', NULL, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[MaterialsTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[MeasureUnits] ON 

INSERT [dbo].[MeasureUnits] ([Id], [UnitTypeId], [Name], [Abbrevation], [Description], [BaseUnit], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (1, 2, N'Libra', N'lb', NULL, 1, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[MeasureUnits] ([Id], [UnitTypeId], [Name], [Abbrevation], [Description], [BaseUnit], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (2, 2, N'Gramo', N'g', NULL, 0, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[MeasureUnits] ([Id], [UnitTypeId], [Name], [Abbrevation], [Description], [BaseUnit], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (3, 2, N'Onza', N'oz', NULL, 0, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[MeasureUnits] ([Id], [UnitTypeId], [Name], [Abbrevation], [Description], [BaseUnit], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (4, 3, N'Galon', N'gal', NULL, 0, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[MeasureUnits] ([Id], [UnitTypeId], [Name], [Abbrevation], [Description], [BaseUnit], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (5, 3, N'Litro', N'lt', NULL, 1, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[MeasureUnits] ([Id], [UnitTypeId], [Name], [Abbrevation], [Description], [BaseUnit], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (6, 3, N'Cuarto', N'qt', NULL, 0, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[MeasureUnits] ([Id], [UnitTypeId], [Name], [Abbrevation], [Description], [BaseUnit], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (7, 3, N'Onza', N'onza', NULL, 0, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[MeasureUnits] ([Id], [UnitTypeId], [Name], [Abbrevation], [Description], [BaseUnit], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (8, 1, N'Metro', N'm', NULL, 1, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[MeasureUnits] ([Id], [UnitTypeId], [Name], [Abbrevation], [Description], [BaseUnit], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (9, 1, N'Centimetro', N'cm', NULL, 0, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[MeasureUnits] ([Id], [UnitTypeId], [Name], [Abbrevation], [Description], [BaseUnit], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (10, 1, N'Yarda', N'yd', NULL, 0, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[MeasureUnits] ([Id], [UnitTypeId], [Name], [Abbrevation], [Description], [BaseUnit], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (11, 1, N'Pie', N'ft', NULL, 0, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[MeasureUnits] ([Id], [UnitTypeId], [Name], [Abbrevation], [Description], [BaseUnit], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (12, 1, N'Pulgada', N'inch', NULL, 0, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[MeasureUnits] OFF
GO
SET IDENTITY_INSERT [dbo].[Persons] ON 

INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [EmailAddress], [Address], [CardId], [PhoneNumber]) VALUES (1, N'Danny', N'Lopez', N'01dlopezs98@gmail.com', N'San Marcos', N'041-011098-1001L', N'88744533')
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [EmailAddress], [Address], [CardId], [PhoneNumber]) VALUES (2, N'Carlos', N'Chavez', N'davidchavez@gmail.com', N'Jinotepe', N'041-051299-1001G', N'85645233')
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [EmailAddress], [Address], [CardId], [PhoneNumber]) VALUES (3, N'Carlos', N'Aguirres', N'aguirre@gmail.com', N'Diriamba', N'042-011299-1002G', N'54877799')
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [EmailAddress], [Address], [CardId], [PhoneNumber]) VALUES (4, N'Jose', N'Lopez', N'lopez@gmail.com', N'Managua', N'043-011295-1004M', N'65545888')
SET IDENTITY_INSERT [dbo].[Persons] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductDetails] ON 

INSERT [dbo].[ProductDetails] ([Id], [ProductId], [BrandId], [CategoryId], [MaterialTypeId], [DefaultCode], [Dimensions], [ExpiryDate], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [Deleted]) VALUES (1, 3, 10, 7, 3, N'CM2256686', N'Ninguna', CAST(N'2025-12-01T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), N'01dlopezs98@gmail.com', CAST(N'2020-01-10T00:00:00.000' AS DateTime), N'01dlopezs98@gmail.com', 0)
INSERT [dbo].[ProductDetails] ([Id], [ProductId], [BrandId], [CategoryId], [MaterialTypeId], [DefaultCode], [Dimensions], [ExpiryDate], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [Deleted]) VALUES (3, 1, 11, 2, 2, N'TB48557744', N'1/2 (12 MM)', NULL, CAST(N'2020-01-10T00:00:00.000' AS DateTime), N'01dlopezs98@gmail.com', CAST(N'2020-01-10T00:00:00.000' AS DateTime), N'01dlopezs98@gmail.com', 0)
INSERT [dbo].[ProductDetails] ([Id], [ProductId], [BrandId], [CategoryId], [MaterialTypeId], [DefaultCode], [Dimensions], [ExpiryDate], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [Deleted]) VALUES (4, 2, 11, 5, 5, N'PA544830058', N'Ninguna', CAST(N'2025-01-05T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), N'01dlopezs98@gmail.com', CAST(N'2020-01-10T00:00:00.000' AS DateTime), N'01dlopezs98@gmail.com', 0)
INSERT [dbo].[ProductDetails] ([Id], [ProductId], [BrandId], [CategoryId], [MaterialTypeId], [DefaultCode], [Dimensions], [ExpiryDate], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [Deleted]) VALUES (6, 4, 4, 8, 5, N'ZN87461666', N'Ninguna', CAST(N'2028-12-01T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), N'01dlopezs98@gmail.com', CAST(N'2020-01-10T00:00:00.000' AS DateTime), N'01dlopezs98@gmail.com', 0)
SET IDENTITY_INSERT [dbo].[ProductDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [Initials], [MeasureUnitId], [Description], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (1, N'Tubos', N'TB', 8, NULL, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Products] ([Id], [Name], [Initials], [MeasureUnitId], [Description], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (2, N'Pintura Acrilica', N'PA', 4, NULL, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Products] ([Id], [Name], [Initials], [MeasureUnitId], [Description], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (3, N'Cemento', N'C', 1, NULL, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Products] ([Id], [Name], [Initials], [MeasureUnitId], [Description], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (4, N'Zener', N'Z', 4, NULL, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([Id], [Name], [Description], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (1, N'Administrator', NULL, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Roles] ([Id], [Name], [Description], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (2, N'Sale Administrator', NULL, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Roles] ([Id], [Name], [Description], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (3, N'Report Admin', NULL, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Suppliers] ON 

INSERT [dbo].[Suppliers] ([Id], [Name], [Email], [Address], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [Deleted]) VALUES (1, N'Sherwin Willians', N'sherwin@info.com', N'Managua', CAST(N'2020-01-10T00:00:00.000' AS DateTime), N'01dlopezs98@gmail.com', CAST(N'2020-01-10T00:00:00.000' AS DateTime), N'01dlopezs98@gmail.com', 0)
INSERT [dbo].[Suppliers] ([Id], [Name], [Email], [Address], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [Deleted]) VALUES (2, N'DevStack Inc', N'devstack00@devs.inc', N'San Marcos', CAST(N'2020-01-10T00:00:00.000' AS DateTime), N'01dlopezs98@gmail.com', CAST(N'2020-01-10T00:00:00.000' AS DateTime), N'01dlopezs98@gmail.com', 0)
SET IDENTITY_INSERT [dbo].[Suppliers] OFF
GO
SET IDENTITY_INSERT [dbo].[UnitConversion] ON 

INSERT [dbo].[UnitConversion] ([Id], [Unit], [IdMeasureUnitFrom], [IdMeasureUnitTo], [ConversionNameFrom], [ConversionNameTo], [ConversionValue], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (1, 1, 1, 1, N'Libra', N'Libra', 1, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[UnitConversion] ([Id], [Unit], [IdMeasureUnitFrom], [IdMeasureUnitTo], [ConversionNameFrom], [ConversionNameTo], [ConversionValue], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (2, 1, 1, 2, N'Libra', N'Gramo', 453.59, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[UnitConversion] ([Id], [Unit], [IdMeasureUnitFrom], [IdMeasureUnitTo], [ConversionNameFrom], [ConversionNameTo], [ConversionValue], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (3, 1, 1, 3, N'Libra', N'Onza', 16, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[UnitConversion] ([Id], [Unit], [IdMeasureUnitFrom], [IdMeasureUnitTo], [ConversionNameFrom], [ConversionNameTo], [ConversionValue], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (5, 1, 2, 2, N'Gramo', N'Gramo', 1, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[UnitConversion] ([Id], [Unit], [IdMeasureUnitFrom], [IdMeasureUnitTo], [ConversionNameFrom], [ConversionNameTo], [ConversionValue], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (6, 1, 2, 1, N'Gramo', N'Libra', 0.0022, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[UnitConversion] ([Id], [Unit], [IdMeasureUnitFrom], [IdMeasureUnitTo], [ConversionNameFrom], [ConversionNameTo], [ConversionValue], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (7, 1, 2, 3, N'Gramo', N'Onza', 0.04, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[UnitConversion] ([Id], [Unit], [IdMeasureUnitFrom], [IdMeasureUnitTo], [ConversionNameFrom], [ConversionNameTo], [ConversionValue], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (8, 1, 3, 3, N'Onza', N'Onza', 1, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[UnitConversion] ([Id], [Unit], [IdMeasureUnitFrom], [IdMeasureUnitTo], [ConversionNameFrom], [ConversionNameTo], [ConversionValue], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (9, 1, 3, 1, N'Onza', N'Libra', 0.06, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[UnitConversion] ([Id], [Unit], [IdMeasureUnitFrom], [IdMeasureUnitTo], [ConversionNameFrom], [ConversionNameTo], [ConversionValue], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (10, 1, 3, 2, N'Onza', N'Gramo', 28.35, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[UnitConversion] ([Id], [Unit], [IdMeasureUnitFrom], [IdMeasureUnitTo], [ConversionNameFrom], [ConversionNameTo], [ConversionValue], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (11, 1, 4, 4, N'Galon', N'Galon', 1, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[UnitConversion] ([Id], [Unit], [IdMeasureUnitFrom], [IdMeasureUnitTo], [ConversionNameFrom], [ConversionNameTo], [ConversionValue], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (12, 1, 4, 5, N'Galon', N'Litro', 3.78541, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[UnitConversion] ([Id], [Unit], [IdMeasureUnitFrom], [IdMeasureUnitTo], [ConversionNameFrom], [ConversionNameTo], [ConversionValue], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (13, 1, 4, 6, N'Galon', N'Cuarto', 4, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[UnitConversion] ([Id], [Unit], [IdMeasureUnitFrom], [IdMeasureUnitTo], [ConversionNameFrom], [ConversionNameTo], [ConversionValue], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (14, 1, 4, 7, N'Galon', N'Onza', 128, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[UnitConversion] ([Id], [Unit], [IdMeasureUnitFrom], [IdMeasureUnitTo], [ConversionNameFrom], [ConversionNameTo], [ConversionValue], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (15, 1, 5, 5, N'Litro', N'Litro', 1, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[UnitConversion] ([Id], [Unit], [IdMeasureUnitFrom], [IdMeasureUnitTo], [ConversionNameFrom], [ConversionNameTo], [ConversionValue], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (16, 1, 5, 4, N'Litro', N'Galon', 0.264172, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[UnitConversion] ([Id], [Unit], [IdMeasureUnitFrom], [IdMeasureUnitTo], [ConversionNameFrom], [ConversionNameTo], [ConversionValue], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (17, 1, 5, 6, N'Litro', N'Cuarto', 1.05669, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[UnitConversion] ([Id], [Unit], [IdMeasureUnitFrom], [IdMeasureUnitTo], [ConversionNameFrom], [ConversionNameTo], [ConversionValue], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (18, 1, 5, 7, N'Litro', N'Onza', 33.814, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[UnitConversion] ([Id], [Unit], [IdMeasureUnitFrom], [IdMeasureUnitTo], [ConversionNameFrom], [ConversionNameTo], [ConversionValue], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (19, 1, 6, 6, N'Cuarto', N'Cuarto', 1, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[UnitConversion] ([Id], [Unit], [IdMeasureUnitFrom], [IdMeasureUnitTo], [ConversionNameFrom], [ConversionNameTo], [ConversionValue], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (20, 1, 6, 4, N'Cuarto', N'Galon', 0.25, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[UnitConversion] ([Id], [Unit], [IdMeasureUnitFrom], [IdMeasureUnitTo], [ConversionNameFrom], [ConversionNameTo], [ConversionValue], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (21, 1, 6, 5, N'Cuarto', N'Litro', 0.946353, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[UnitConversion] ([Id], [Unit], [IdMeasureUnitFrom], [IdMeasureUnitTo], [ConversionNameFrom], [ConversionNameTo], [ConversionValue], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (22, 1, 6, 7, N'Cuarto', N'Onza', 32, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[UnitConversion] ([Id], [Unit], [IdMeasureUnitFrom], [IdMeasureUnitTo], [ConversionNameFrom], [ConversionNameTo], [ConversionValue], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (23, 1, 7, 7, N'Onza', N'Onza', 1, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[UnitConversion] ([Id], [Unit], [IdMeasureUnitFrom], [IdMeasureUnitTo], [ConversionNameFrom], [ConversionNameTo], [ConversionValue], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (24, 1, 7, 4, N'Onza', N'Galon', 0.0065, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[UnitConversion] ([Id], [Unit], [IdMeasureUnitFrom], [IdMeasureUnitTo], [ConversionNameFrom], [ConversionNameTo], [ConversionValue], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (25, 1, 7, 5, N'Onza', N'Litro', 0.0295735, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[UnitConversion] ([Id], [Unit], [IdMeasureUnitFrom], [IdMeasureUnitTo], [ConversionNameFrom], [ConversionNameTo], [ConversionValue], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (27, 1, 7, 6, N'Onza', N'Cuarto', 0.026, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[UnitConversion] ([Id], [Unit], [IdMeasureUnitFrom], [IdMeasureUnitTo], [ConversionNameFrom], [ConversionNameTo], [ConversionValue], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (28, 1, 8, 8, N'Metro', N'Metro', 1, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[UnitConversion] ([Id], [Unit], [IdMeasureUnitFrom], [IdMeasureUnitTo], [ConversionNameFrom], [ConversionNameTo], [ConversionValue], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (29, 1, 8, 9, N'Metro', N'Centimetro', 100, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[UnitConversion] ([Id], [Unit], [IdMeasureUnitFrom], [IdMeasureUnitTo], [ConversionNameFrom], [ConversionNameTo], [ConversionValue], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (30, 1, 8, 10, N'Metro', N'Yarda', 0.914, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[UnitConversion] ([Id], [Unit], [IdMeasureUnitFrom], [IdMeasureUnitTo], [ConversionNameFrom], [ConversionNameTo], [ConversionValue], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (31, 1, 8, 11, N'Metro', N'Pie', 3.37, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[UnitConversion] ([Id], [Unit], [IdMeasureUnitFrom], [IdMeasureUnitTo], [ConversionNameFrom], [ConversionNameTo], [ConversionValue], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (32, 1, 8, 12, N'Metro', N'Pulgada', 39.37, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[UnitConversion] ([Id], [Unit], [IdMeasureUnitFrom], [IdMeasureUnitTo], [ConversionNameFrom], [ConversionNameTo], [ConversionValue], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (33, 1, 9, 8, N'Centimetro', N'Metro', 0.01, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[UnitConversion] ([Id], [Unit], [IdMeasureUnitFrom], [IdMeasureUnitTo], [ConversionNameFrom], [ConversionNameTo], [ConversionValue], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (34, 1, 9, 9, N'Centimetro', N'Centimetro', 1, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[UnitConversion] ([Id], [Unit], [IdMeasureUnitFrom], [IdMeasureUnitTo], [ConversionNameFrom], [ConversionNameTo], [ConversionValue], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (35, 1, 9, 10, N'Centimetro', N'Yarda', 0.01, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[UnitConversion] ([Id], [Unit], [IdMeasureUnitFrom], [IdMeasureUnitTo], [ConversionNameFrom], [ConversionNameTo], [ConversionValue], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (39, 1, 9, 11, N'Centimetro', N'Pie', 0.032, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[UnitConversion] ([Id], [Unit], [IdMeasureUnitFrom], [IdMeasureUnitTo], [ConversionNameFrom], [ConversionNameTo], [ConversionValue], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (40, 1, 9, 12, N'Centimetro', N'Pulgada', 0.39, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[UnitConversion] ([Id], [Unit], [IdMeasureUnitFrom], [IdMeasureUnitTo], [ConversionNameFrom], [ConversionNameTo], [ConversionValue], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (41, 1, 10, 8, N'Yarda', N'Metro', 0.91, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[UnitConversion] ([Id], [Unit], [IdMeasureUnitFrom], [IdMeasureUnitTo], [ConversionNameFrom], [ConversionNameTo], [ConversionValue], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (43, 1, 10, 9, N'Yarda', N'Centimetro', 91.44, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[UnitConversion] ([Id], [Unit], [IdMeasureUnitFrom], [IdMeasureUnitTo], [ConversionNameFrom], [ConversionNameTo], [ConversionValue], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (44, 1, 10, 10, N'Yarda', N'Yarda', 1, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[UnitConversion] ([Id], [Unit], [IdMeasureUnitFrom], [IdMeasureUnitTo], [ConversionNameFrom], [ConversionNameTo], [ConversionValue], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (46, 1, 10, 11, N'Yarda', N'Pie', 3, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[UnitConversion] ([Id], [Unit], [IdMeasureUnitFrom], [IdMeasureUnitTo], [ConversionNameFrom], [ConversionNameTo], [ConversionValue], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (47, 1, 10, 12, N'Yarda', N'Pulgada', 36, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[UnitConversion] ([Id], [Unit], [IdMeasureUnitFrom], [IdMeasureUnitTo], [ConversionNameFrom], [ConversionNameTo], [ConversionValue], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (48, 1, 11, 8, N'Pie', N'Metro', 0.3, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[UnitConversion] ([Id], [Unit], [IdMeasureUnitFrom], [IdMeasureUnitTo], [ConversionNameFrom], [ConversionNameTo], [ConversionValue], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (49, 1, 11, 9, N'Pie', N'Centimetro', 30.48, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[UnitConversion] OFF
GO
SET IDENTITY_INSERT [dbo].[UnitTypes] ON 

INSERT [dbo].[UnitTypes] ([Id], [Name], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (1, N'Longitud', CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[UnitTypes] ([Id], [Name], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (2, N'Masa', CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[UnitTypes] ([Id], [Name], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (3, N'Volumen', CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[UnitTypes] ([Id], [Name], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (4, N'Area', CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[UnitTypes] OFF
GO
INSERT [dbo].[UserRoles] ([UserId], [RoleId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [Deleted]) VALUES (1, 1, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), N'01dlopezs98@gmail.com', N'01dlopezs98@gmail.com', 0)
INSERT [dbo].[UserRoles] ([UserId], [RoleId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [Deleted]) VALUES (2, 2, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), N'01dlopezs98@gmail.com', N'01dlopezs98@gmail.com', 0)
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [EmployeeId], [UserName], [Password], [ImageUrl], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [Deleted]) VALUES (1, 2, N'01dlopezs98@gmail.com', N'Aldahir1998', NULL, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), N'01dlopezs98@gmail.com', N'01dlopezs98@gmail.com', 0)
INSERT [dbo].[Users] ([Id], [EmployeeId], [UserName], [Password], [ImageUrl], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [Deleted]) VALUES (2, 1, N'aguirre@gmail.com', N'Password', NULL, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), N'01dlopezs98@gmail.com', N'01dlopezs98@gmail.com', 0)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[Vendors] ON 

INSERT [dbo].[Vendors] ([Id], [PersonId], [SupplierId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [Deleted]) VALUES (1, 2, 2, CAST(N'2020-01-10T00:00:00.000' AS DateTime), N'01dlopezs98@gmail.com', CAST(N'2020-01-10T00:00:00.000' AS DateTime), N'01dlopezs98@gmail.com', 0)
INSERT [dbo].[Vendors] ([Id], [PersonId], [SupplierId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [Deleted]) VALUES (3, 3, 1, CAST(N'2020-01-10T00:00:00.000' AS DateTime), N'01dlopezs98@gmail.com', CAST(N'2020-01-10T00:00:00.000' AS DateTime), N'01dlopezs98@gmail.com', 0)
SET IDENTITY_INSERT [dbo].[Vendors] OFF
GO
SET IDENTITY_INSERT [dbo].[Warehouses] ON 

INSERT [dbo].[Warehouses] ([Id], [Name], [Description], [Location], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [Deleted]) VALUES (1, N'Exhibicion', N'Some description', N'local', CAST(N'2020-01-10T00:00:00.000' AS DateTime), N'01dlopezs98@gmail.com', CAST(N'2020-01-10T00:00:00.000' AS DateTime), N'01dlopezs98@gmail.com', 0)
INSERT [dbo].[Warehouses] ([Id], [Name], [Description], [Location], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [Deleted]) VALUES (2, N'Bodega 1', N'Some description', N'other local', CAST(N'2020-01-10T00:00:00.000' AS DateTime), N'01dlopezs98@gmail.com', CAST(N'2020-01-10T00:00:00.000' AS DateTime), N'01dlopezs98@gmail.com', 0)
INSERT [dbo].[Warehouses] ([Id], [Name], [Description], [Location], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [Deleted]) VALUES (3, N'Bodega 2', N'Some description', N'Other local', CAST(N'2020-01-10T00:00:00.000' AS DateTime), N'01dlopezs98@gmail.com', CAST(N'2020-01-10T00:00:00.000' AS DateTime), N'01dlopezs98@gmail.com', 0)
SET IDENTITY_INSERT [dbo].[Warehouses] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__PendingT__A25C5AA799CA170A]    Script Date: 11/1/2021 16:06:48 ******/
ALTER TABLE [dbo].[PendingTransfers] ADD UNIQUE NONCLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Persons__49A14740D86593E7]    Script Date: 11/1/2021 16:06:48 ******/
ALTER TABLE [dbo].[Persons] ADD UNIQUE NONCLUSTERED 
(
	[EmailAddress] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__C9F28456D2010A09]    Script Date: 11/1/2021 16:06:48 ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Configurations]  WITH CHECK ADD  CONSTRAINT [FK_CONFIG_CONTACTINFO] FOREIGN KEY([ContactInfoId])
REFERENCES [dbo].[ContactInfo] ([Id])
GO
ALTER TABLE [dbo].[Configurations] CHECK CONSTRAINT [FK_CONFIG_CONTACTINFO]
GO
ALTER TABLE [dbo].[CurrencyExchange]  WITH CHECK ADD  CONSTRAINT [FK_CE_FOREIGNCURRENCIES] FOREIGN KEY([ForeignId])
REFERENCES [dbo].[ForeignCurrencies] ([Id])
GO
ALTER TABLE [dbo].[CurrencyExchange] CHECK CONSTRAINT [FK_CE_FOREIGNCURRENCIES]
GO
ALTER TABLE [dbo].[CurrencyExchange]  WITH CHECK ADD  CONSTRAINT [FK_CE_LOCALCURRENCIES] FOREIGN KEY([LocalId])
REFERENCES [dbo].[LocalCurrencies] ([Id])
GO
ALTER TABLE [dbo].[CurrencyExchange] CHECK CONSTRAINT [FK_CE_LOCALCURRENCIES]
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_CS_PERSONS] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Persons] ([Id])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_CS_PERSONS]
GO
ALTER TABLE [dbo].[DetailProductStocks]  WITH CHECK ADD  CONSTRAINT [FK_DPS_MEASUREUNITS] FOREIGN KEY([TargetUnitId])
REFERENCES [dbo].[MeasureUnits] ([Id])
GO
ALTER TABLE [dbo].[DetailProductStocks] CHECK CONSTRAINT [FK_DPS_MEASUREUNITS]
GO
ALTER TABLE [dbo].[DetailProductStocks]  WITH CHECK ADD  CONSTRAINT [FK_DPS_UNITCONVERSION] FOREIGN KEY([UnitConversionId])
REFERENCES [dbo].[UnitConversion] ([Id])
GO
ALTER TABLE [dbo].[DetailProductStocks] CHECK CONSTRAINT [FK_DPS_UNITCONVERSION]
GO
ALTER TABLE [dbo].[DetailProductStocks]  WITH CHECK ADD  CONSTRAINT [FKDPS_PRODUCTSTOCKS] FOREIGN KEY([ProductStocksId])
REFERENCES [dbo].[ProductStocks] ([Id])
GO
ALTER TABLE [dbo].[DetailProductStocks] CHECK CONSTRAINT [FKDPS_PRODUCTSTOCKS]
GO
ALTER TABLE [dbo].[DetailProductStocks]  WITH CHECK ADD  CONSTRAINT [FKDPS_WAREHOUSES] FOREIGN KEY([WarehouseId])
REFERENCES [dbo].[Warehouses] ([Id])
GO
ALTER TABLE [dbo].[DetailProductStocks] CHECK CONSTRAINT [FKDPS_WAREHOUSES]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_EMP_PERSONS] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Persons] ([Id])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_EMP_PERSONS]
GO
ALTER TABLE [dbo].[MeasureUnits]  WITH CHECK ADD  CONSTRAINT [FK_MU_UNITTYPE] FOREIGN KEY([UnitTypeId])
REFERENCES [dbo].[UnitTypes] ([Id])
GO
ALTER TABLE [dbo].[MeasureUnits] CHECK CONSTRAINT [FK_MU_UNITTYPE]
GO
ALTER TABLE [dbo].[ProductDetails]  WITH CHECK ADD  CONSTRAINT [FK_PD_BRANDS] FOREIGN KEY([BrandId])
REFERENCES [dbo].[Brands] ([Id])
GO
ALTER TABLE [dbo].[ProductDetails] CHECK CONSTRAINT [FK_PD_BRANDS]
GO
ALTER TABLE [dbo].[ProductDetails]  WITH CHECK ADD  CONSTRAINT [FK_PD_CATEGORIES] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[ProductDetails] CHECK CONSTRAINT [FK_PD_CATEGORIES]
GO
ALTER TABLE [dbo].[ProductDetails]  WITH CHECK ADD  CONSTRAINT [FK_PD_MATERIALSTYPES] FOREIGN KEY([MaterialTypeId])
REFERENCES [dbo].[MaterialsTypes] ([Id])
GO
ALTER TABLE [dbo].[ProductDetails] CHECK CONSTRAINT [FK_PD_MATERIALSTYPES]
GO
ALTER TABLE [dbo].[ProductDetails]  WITH CHECK ADD  CONSTRAINT [FK_PD_PRODUCTS] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[ProductDetails] CHECK CONSTRAINT [FK_PD_PRODUCTS]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_PROD_MSU] FOREIGN KEY([MeasureUnitId])
REFERENCES [dbo].[MeasureUnits] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_PROD_MSU]
GO
ALTER TABLE [dbo].[ProductStocks]  WITH CHECK ADD  CONSTRAINT [FK_PS_SUPPLIERS] FOREIGN KEY([SupplierId])
REFERENCES [dbo].[Suppliers] ([Id])
GO
ALTER TABLE [dbo].[ProductStocks] CHECK CONSTRAINT [FK_PS_SUPPLIERS]
GO
ALTER TABLE [dbo].[ProductTransfers]  WITH CHECK ADD  CONSTRAINT [FK_PT_PRODUCTSTOCKS] FOREIGN KEY([ProductStocksId])
REFERENCES [dbo].[ProductStocks] ([Id])
GO
ALTER TABLE [dbo].[ProductTransfers] CHECK CONSTRAINT [FK_PT_PRODUCTSTOCKS]
GO
ALTER TABLE [dbo].[ProductTransfers]  WITH CHECK ADD  CONSTRAINT [FK_PT_WAREHOUSES] FOREIGN KEY([TargetWarehouseId])
REFERENCES [dbo].[Warehouses] ([Id])
GO
ALTER TABLE [dbo].[ProductTransfers] CHECK CONSTRAINT [FK_PT_WAREHOUSES]
GO
ALTER TABLE [dbo].[PurchaseDetails]  WITH CHECK ADD  CONSTRAINT [FK_PD_MEASUREUNITS] FOREIGN KEY([TargetUnitId])
REFERENCES [dbo].[MeasureUnits] ([Id])
GO
ALTER TABLE [dbo].[PurchaseDetails] CHECK CONSTRAINT [FK_PD_MEASUREUNITS]
GO
ALTER TABLE [dbo].[PurchaseDetails]  WITH CHECK ADD  CONSTRAINT [FK_PD_WAREHOUSEID] FOREIGN KEY([WarehouseId])
REFERENCES [dbo].[Warehouses] ([Id])
GO
ALTER TABLE [dbo].[PurchaseDetails] CHECK CONSTRAINT [FK_PD_WAREHOUSEID]
GO
ALTER TABLE [dbo].[PurchaseDetails]  WITH CHECK ADD  CONSTRAINT [FKPD_PURCHASEINVOICES] FOREIGN KEY([PurchaseInvoiceId])
REFERENCES [dbo].[PurchaseInvoices] ([Id])
GO
ALTER TABLE [dbo].[PurchaseDetails] CHECK CONSTRAINT [FKPD_PURCHASEINVOICES]
GO
ALTER TABLE [dbo].[RemovedProducts]  WITH CHECK ADD  CONSTRAINT [FK_RP_PRODUCTSTOCKS] FOREIGN KEY([ProductStocksId])
REFERENCES [dbo].[ProductStocks] ([Id])
GO
ALTER TABLE [dbo].[RemovedProducts] CHECK CONSTRAINT [FK_RP_PRODUCTSTOCKS]
GO
ALTER TABLE [dbo].[SalesDetails]  WITH CHECK ADD  CONSTRAINT [FK_SD_MEASUREUNITS] FOREIGN KEY([TargetUnitId])
REFERENCES [dbo].[MeasureUnits] ([Id])
GO
ALTER TABLE [dbo].[SalesDetails] CHECK CONSTRAINT [FK_SD_MEASUREUNITS]
GO
ALTER TABLE [dbo].[SalesDetails]  WITH CHECK ADD  CONSTRAINT [FK_SD_SALESINVOICES] FOREIGN KEY([SaleInvoiceId])
REFERENCES [dbo].[SalesInvoices] ([Id])
GO
ALTER TABLE [dbo].[SalesDetails] CHECK CONSTRAINT [FK_SD_SALESINVOICES]
GO
ALTER TABLE [dbo].[SalesDetails]  WITH CHECK ADD  CONSTRAINT [FK_SD_UNITCONVERSION] FOREIGN KEY([UnitConversionId])
REFERENCES [dbo].[UnitConversion] ([Id])
GO
ALTER TABLE [dbo].[SalesDetails] CHECK CONSTRAINT [FK_SD_UNITCONVERSION]
GO
ALTER TABLE [dbo].[SalesDetails]  WITH CHECK ADD  CONSTRAINT [FK_SD_WAREHOUSES] FOREIGN KEY([WarehouseId])
REFERENCES [dbo].[Warehouses] ([Id])
GO
ALTER TABLE [dbo].[SalesDetails] CHECK CONSTRAINT [FK_SD_WAREHOUSES]
GO
ALTER TABLE [dbo].[SalesInvoices]  WITH CHECK ADD  CONSTRAINT [FK_SI_CURRENCYEXCHANGE] FOREIGN KEY([CurrencyExchangeId])
REFERENCES [dbo].[CurrencyExchange] ([Id])
GO
ALTER TABLE [dbo].[SalesInvoices] CHECK CONSTRAINT [FK_SI_CURRENCYEXCHANGE]
GO
ALTER TABLE [dbo].[SalesInvoices]  WITH CHECK ADD  CONSTRAINT [FK_SI_CUSTOMERS] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([Id])
GO
ALTER TABLE [dbo].[SalesInvoices] CHECK CONSTRAINT [FK_SI_CUSTOMERS]
GO
ALTER TABLE [dbo].[TransfersDetails]  WITH CHECK ADD  CONSTRAINT [FK_TD_PRODUCTTRANFERS] FOREIGN KEY([ProductTransferId])
REFERENCES [dbo].[ProductTransfers] ([Id])
GO
ALTER TABLE [dbo].[TransfersDetails] CHECK CONSTRAINT [FK_TD_PRODUCTTRANFERS]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UR_ROLES] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UR_ROLES]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UR_USERS] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UR_USERS]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FKUSERS_EMPLOYEES] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employees] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FKUSERS_EMPLOYEES]
GO
ALTER TABLE [dbo].[Vendors]  WITH CHECK ADD  CONSTRAINT [FK_VENDORS_PERSONS] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Persons] ([Id])
GO
ALTER TABLE [dbo].[Vendors] CHECK CONSTRAINT [FK_VENDORS_PERSONS]
GO
ALTER TABLE [dbo].[Vendors]  WITH CHECK ADD  CONSTRAINT [FK_VENDORS_SUPPLIERS] FOREIGN KEY([SupplierId])
REFERENCES [dbo].[Suppliers] ([Id])
GO
ALTER TABLE [dbo].[Vendors] CHECK CONSTRAINT [FK_VENDORS_SUPPLIERS]
GO
/****** Object:  StoredProcedure [dbo].[Sp_CreateDetailProductStocks]    Script Date: 11/1/2021 16:06:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_CreateDetailProductStocks]
@WarehouseId INT,
@ProductDetailCode NVARCHAR(255),
@TargetUnitId INT,
@UnitsPurchased INT,
@PurchasePrice FLOAT,
@SalePrice FLOAT
AS
	BEGIN
		BEGIN TRY
			DECLARE @BaseUnitMeasureId INT, @UnitConversionId INT, @ConversionQuantity FLOAT, 
					@Available BIT, @ProductStocksId INT, @ConversionValue FLOAT, @NewSalePrice FLOAT;
			SET @ProductStocksId = IDENT_CURRENT('[dbo].[ProductStocks]');
			SET @BaseUnitMeasureId = (	SELECT [dbo].[Products].[MeasureUnitId] FROM [dbo].[ProductDetails]
										INNER JOIN [dbo].[Products] ON [dbo].[ProductDetails].[ProductId] = [dbo].[Products].[Id]
										WHERE [dbo].[ProductDetails].[Code] = @ProductDetailCode	);
			SET @UnitConversionId = (SELECT Id FROM [dbo].[UnitConversion] WHERE IdMeasureUnitFrom = @BaseUnitMeasureId AND IdMeasureUnitTo = @BaseUnitMeasureId);
			SET @ConversionValue = (SELECT ConversionValue FROM [dbo].[UnitConversion] WHERE Id = @UnitConversionId);
			SET @Available = 1;

			SET @ConversionQuantity = (@UnitsPurchased * @ConversionValue);
			SET @NewSalePrice = (@SalePrice / @ConversionQuantity); 

			INSERT INTO [dbo].[DetailProductStocks]
						VALUES (@ProductStocksId, @WarehouseId, @ProductDetailCode, @TargetUnitId, @UnitConversionId, 
								@UnitsPurchased, @ConversionQuantity, @PurchasePrice, @NewSalePrice, @Available);
		END TRY
		BEGIN CATCH
			SELECT ERROR_MESSAGE() AS ErrorMessage, ERROR_STATE() AS ErrorState;
		END CATCH
	END
GO
/****** Object:  StoredProcedure [dbo].[Sp_CreateProductStocks]    Script Date: 11/1/2021 16:06:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_CreateProductStocks]
@SupplierId INT,
@Quantity INT,
@UserName NVARCHAR(80)
AS
	BEGIN
		DECLARE @Date DATETIME;
		SET @Date = CURRENT_TIMESTAMP;

		INSERT INTO [dbo].[ProductStocks] 
					(SupplierId, Quantity, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy)
			VALUES	(@SupplierId, @Quantity, @Date, @UserName, @Date, @UserName);
	END
GO
/****** Object:  StoredProcedure [dbo].[Sp_CreatePurchaseDetails]    Script Date: 11/1/2021 16:06:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[Sp_CreatePurchaseDetails]
@ProductDetailCode NVARCHAR(255),
@WarehouseId INT,
@TargetUnitId INT,
@Quantity INT,
@PurchasePrice FLOAT,
@Subtotal FLOAT,
@Tax FLOAT,
@Discount INT,
@Total FLOAT
AS
	BEGIN
		DECLARE @PurchaseInvoiceId INT;
		SET @PurchaseInvoiceId = IDENT_CURRENT('[dbo].[PurchaseInvoices]');

		INSERT INTO [dbo].[PurchaseDetails]
					VALUES (@PurchaseInvoiceId, @ProductDetailCode, @WarehouseId, @TargetUnitId, 
							@Quantity, @PurchasePrice, @Subtotal, @Tax, @Discount, @Total);
	END
GO
/****** Object:  StoredProcedure [dbo].[Sp_CreatePurchaseInvoices]    Script Date: 11/1/2021 16:06:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_CreatePurchaseInvoices]
@VendorCode NVARCHAR(255),
@SupplierInvoiceNumber NVARCHAR(255),
@Tax FLOAT,
@Subtotal FLOAT,
@Discount INT,
@TotalAmount FLOAT,
@UserName NVARCHAR(80)
AS
	BEGIN
		DECLARE @Date DATETIME, @Deleted BIT;
		SET @Date = CURRENT_TIMESTAMP; SET @Deleted = 0;

		INSERT	INTO [dbo].[PurchaseInvoices] 
						(VendorCode, SupplierInvoiceNumber, Tax, Subtotal, Discount, TotalAmount, Deleted, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy)
				VALUES	(@VendorCode, @SupplierInvoiceNumber, @Tax, @Subtotal, @Discount, @TotalAmount, @Deleted, @Date, @UserName, @Date, @UserName);
	END
GO
/****** Object:  StoredProcedure [dbo].[Sp_ListProductsDetails]    Script Date: 11/1/2021 16:06:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_ListProductsDetails]
@Deleted BIT = NULL,
@Search NVARCHAR(80)
AS
	BEGIN
		SELECT	ProductDetails.Id, Products.Name ProductName, MeasureUnits.Name MeasureUnit, MeasureUnits.Abbrevation, Brands.Name BrandName, Categories.Name CategoryName, MaterialsTypes.Name MaterialName, 
				ProductDetails.Code, DefaultCode, Dimensions, ISNULL(CONVERT(VARCHAR, ExpiryDate, 106), '00-000-0000') ExpirationDate, CONVERT(VARCHAR, ProductDetails.CreatedAt, 106) CreatedAt, CreatedBy, CONVERT(VARCHAR , ProductDetails.UpdatedAt, 106) UpdatedAt, UpdatedBy, 
				Status = CASE ProductDetails.Deleted
					WHEN 0 THEN 'Activo'
					WHEN 1 THEN 'Inactivo'
				END
				INTO #PRODUCTDETAILS
				FROM [dbo].[ProductDetails]
		INNER JOIN [dbo].[Products] ON [dbo].[ProductDetails].[ProductId] = [dbo].[Products].[Id]
		INNER JOIN [dbo].[Brands] ON [dbo].[ProductDetails].[BrandId] = [dbo].[Brands].[Id]
		INNER JOIN [dbo].[Categories] ON [dbo].[ProductDetails].[CategoryId] = [dbo].[Categories].[Id]
		INNER JOIN [dbo].[MaterialsTypes] ON [dbo].[ProductDetails].[MaterialTypeId] = [dbo].[MaterialsTypes].[Id]
		INNER JOIN [dbo].[MeasureUnits] ON [dbo].[Products].[MeasureUnitId] = [dbo].[MeasureUnits].[Id]
		WHERE ProductDetails.Deleted = ISNULL(@Deleted, 0);

		SELECT * FROM #PRODUCTDETAILS WHERE
				 ProductName LIKE '%' + @Search + '%' OR BrandName LIKE @Search + '%' OR CategoryName LIKE '%' + @Search + '%' OR MaterialName LIKE @Search + '%'
				 OR Code LIKE @Search + '%' OR DefaultCode LIKE @Search + '%' OR Dimensions LIKE @Search + '%';
		DROP TABLE #PRODUCTDETAILS;
	END
GO
USE [master]
GO
ALTER DATABASE [HardwareStore_Dev] SET  READ_WRITE 
GO
