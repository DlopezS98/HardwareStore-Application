USE [master]
GO
/****** Object:  Database [HardwareStore_Dev]    Script Date: 15/2/2021 14:33:02 ******/
CREATE DATABASE [HardwareStore_Dev]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HardwareStore_Dev', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.DLOPEZS98\MSSQL\DATA\HardwareStore_Dev.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HardwareStore_Dev_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.DLOPEZS98\MSSQL\DATA\HardwareStore_Dev_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
/****** Object:  User [DlopezS98]    Script Date: 15/2/2021 14:33:03 ******/
CREATE USER [DlopezS98] FOR LOGIN [DlopezS98] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [DlopezS98]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [DlopezS98]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [DlopezS98]
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 15/2/2021 14:33:03 ******/
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
/****** Object:  Table [dbo].[Categories]    Script Date: 15/2/2021 14:33:04 ******/
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
/****** Object:  Table [dbo].[Configurations]    Script Date: 15/2/2021 14:33:04 ******/
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
/****** Object:  Table [dbo].[ContactInfo]    Script Date: 15/2/2021 14:33:04 ******/
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
/****** Object:  Table [dbo].[CurrencyExchange]    Script Date: 15/2/2021 14:33:04 ******/
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
/****** Object:  Table [dbo].[Customers]    Script Date: 15/2/2021 14:33:04 ******/
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
/****** Object:  Table [dbo].[DetailProductStocks]    Script Date: 15/2/2021 14:33:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetailProductStocks](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductStocksId] [int] NOT NULL,
	[WarehouseId] [int] NOT NULL,
	[ProductDetailCode] [nvarchar](255) NOT NULL,
	[TargetUnitId] [int] NOT NULL,
	[UnitConversionId] [int] NULL,
	[ExpirationDate] [datetime] NULL,
	[Code]  AS (concat_ws('',[ProductDetailCode],'-',[Id],[WarehouseId],[ProductStocksId],[TargetUnitId])),
	[OriginalQuantity] [int] NOT NULL,
	[Quantity] [float] NOT NULL,
	[ConversionQuantity] [float] NULL,
	[PurchasePrice] [float] NOT NULL,
	[SalePrice] [float] NOT NULL,
	[SalePriceByUnitBase] [float] NULL,
	[Available] [bit] NOT NULL,
 CONSTRAINT [PK_DetailProductStocks_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC,
	[ProductStocksId] ASC,
	[WarehouseId] ASC,
	[ProductDetailCode] ASC,
	[TargetUnitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 15/2/2021 14:33:04 ******/
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
/****** Object:  Table [dbo].[ForeignCurrencies]    Script Date: 15/2/2021 14:33:04 ******/
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
/****** Object:  Table [dbo].[LocalCurrencies]    Script Date: 15/2/2021 14:33:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LocalCurrencies](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[Symbol] [nvarchar](5) NOT NULL,
	[Deleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_LOCALCURRENCIES] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialsTypes]    Script Date: 15/2/2021 14:33:04 ******/
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
/****** Object:  Table [dbo].[MeasureUnits]    Script Date: 15/2/2021 14:33:04 ******/
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
/****** Object:  Table [dbo].[PendingTransfers]    Script Date: 15/2/2021 14:33:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PendingTransfers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code]  AS (upper(concat_ws('',(0),[Id],[ProductStocksId],[WarehouseId],'-',[StocksCode]))),
	[ProductStocksId] [int] NOT NULL,
	[LotNumber] [nvarchar](255) NOT NULL,
	[StocksCode] [nvarchar](255) NOT NULL,
	[ProductDetailCode] [nvarchar](255) NOT NULL,
	[WarehouseId] [int] NOT NULL,
	[PurchasedUnitId] [int] NOT NULL,
	[TargetWarehouseId] [int] NULL,
	[UnitBaseId] [int] NOT NULL,
	[UnitTypeId] [int] NOT NULL,
	[TargetUnitId] [int] NOT NULL,
	[UnitQuantity] [int] NOT NULL,
	[UnitConversionId] [int] NOT NULL,
	[ConversionQuantity] [float] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](80) NOT NULL,
	[UpdatedBy] [nvarchar](80) NOT NULL,
	[TransferStatus] [int] NOT NULL,
 CONSTRAINT [PK_PENDING_TRASNFERS] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Persons]    Script Date: 15/2/2021 14:33:04 ******/
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
/****** Object:  Table [dbo].[ProductDetails]    Script Date: 15/2/2021 14:33:04 ******/
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
/****** Object:  Table [dbo].[Products]    Script Date: 15/2/2021 14:33:04 ******/
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
/****** Object:  Table [dbo].[ProductStocks]    Script Date: 15/2/2021 14:33:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductStocks](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SupplierId] [int] NOT NULL,
	[LotNumber]  AS (upper(concat_ws('',(0),[Id],[SupplierId],'-0',[Quantity],'-',format([CreatedAt],'ddMMyyyy','vi')))),
	[Quantity] [int] NOT NULL,
	[TotalAmount] [float] NOT NULL,
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
/****** Object:  Table [dbo].[ProductTransfers]    Script Date: 15/2/2021 14:33:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductTransfers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code]  AS (upper(concat_ws('',(0),[Id],[TotalProducts],'-',format([CreatedAt],'ddMMyyyy','vi')))),
	[TotalProducts] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](80) NOT NULL,
	[UpdatedBy] [nvarchar](80) NOT NULL,
	[TranferStatus] [int] NOT NULL,
 CONSTRAINT [PK_PRODUCTTRANSFERS] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PurchaseDetails]    Script Date: 15/2/2021 14:33:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
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
	[Id] ASC,
	[PurchaseInvoiceId] ASC,
	[ProductDetailCode] ASC,
	[WarehouseId] ASC,
	[TargetUnitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PurchaseInvoices]    Script Date: 15/2/2021 14:33:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseInvoices](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SupplierId] [int] NOT NULL,
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
/****** Object:  Table [dbo].[RemovedProducts]    Script Date: 15/2/2021 14:33:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RemovedProducts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductStocksId] [int] NOT NULL,
	[LotNumber] [nvarchar](max) NOT NULL,
	[StocksDetailCode] [nvarchar](max) NOT NULL,
	[MeasureUnitId] [int] NOT NULL,
	[UnitQuantity] [int] NOT NULL,
	[UnitBaseId] [int] NOT NULL,
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
/****** Object:  Table [dbo].[Roles]    Script Date: 15/2/2021 14:33:04 ******/
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
/****** Object:  Table [dbo].[SalesDetails]    Script Date: 15/2/2021 14:33:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SaleInvoiceId] [int] NOT NULL,
	[StockLotNumber] [nvarchar](255) NOT NULL,
	[ProductDetailCode] [nvarchar](255) NOT NULL,
	[WarehouseId] [int] NOT NULL,
	[SaleUnitId] [int] NOT NULL,
	[PurchasedUnitId] [int] NOT NULL,
	[UnitConversionId] [int] NOT NULL,
	[ConversionValue] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[Subtotal] [float] NOT NULL,
	[Tax] [float] NOT NULL,
	[Discount] [int] NOT NULL,
	[Total] [float] NOT NULL,
 CONSTRAINT [PK_SALEDETAILS] PRIMARY KEY CLUSTERED 
(
	[Id] ASC,
	[SaleInvoiceId] ASC,
	[ProductDetailCode] ASC,
	[WarehouseId] ASC,
	[SaleUnitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalesInvoices]    Script Date: 15/2/2021 14:33:04 ******/
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
	[Payment] [float] NULL,
	[PaymentChange] [float] NULL,
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
/****** Object:  Table [dbo].[Suppliers]    Script Date: 15/2/2021 14:33:04 ******/
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
/****** Object:  Table [dbo].[TranferStatus]    Script Date: 15/2/2021 14:33:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TranferStatus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_TranferStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransfersDetails]    Script Date: 15/2/2021 14:33:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransfersDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductTransferId] [int] NOT NULL,
	[ProductStocksId] [int] NOT NULL,
	[LotNumber] [nvarchar](255) NOT NULL,
	[StocksCode] [nvarchar](255) NOT NULL,
	[TargetWarehouseId] [int] NOT NULL,
	[UnitBaseId] [int] NOT NULL,
	[TargetUnitId] [int] NOT NULL,
	[UnitQuantity] [int] NOT NULL,
	[UnitConversionId] [int] NOT NULL,
	[ConversionQuantity] [float] NOT NULL,
 CONSTRAINT [PK_TransfersDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UnitConversions]    Script Date: 15/2/2021 14:33:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UnitConversions](
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
/****** Object:  Table [dbo].[UnitTypes]    Script Date: 15/2/2021 14:33:04 ******/
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
/****** Object:  Table [dbo].[UserRoles]    Script Date: 15/2/2021 14:33:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](80) NOT NULL,
	[UpdatedBy] [nvarchar](80) NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_USERROLES] PRIMARY KEY CLUSTERED 
(
	[Id] ASC,
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 15/2/2021 14:33:04 ******/
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
/****** Object:  Table [dbo].[Vendors]    Script Date: 15/2/2021 14:33:04 ******/
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
/****** Object:  Table [dbo].[Warehouses]    Script Date: 15/2/2021 14:33:04 ******/
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
SET IDENTITY_INSERT [dbo].[CurrencyExchange] ON 

INSERT [dbo].[CurrencyExchange] ([Id], [LocalId], [ForeignId], [Sale], [Purchase], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [Deleted]) VALUES (1, 1, 1, 1, 1, CAST(N'2020-01-26T00:00:00.000' AS DateTime), N'01dlopezs98@gmail.com', CAST(N'2020-01-26T00:00:00.000' AS DateTime), N'01dlopezs98@gmail.com', 0)
INSERT [dbo].[CurrencyExchange] ([Id], [LocalId], [ForeignId], [Sale], [Purchase], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [Deleted]) VALUES (2, 1, 2, 34.8, 34.6, CAST(N'2020-01-26T00:00:00.000' AS DateTime), N'01dlopezs98@gmail.com', CAST(N'2020-01-26T00:00:00.000' AS DateTime), N'01dlopezs98@gmail.com', 0)
INSERT [dbo].[CurrencyExchange] ([Id], [LocalId], [ForeignId], [Sale], [Purchase], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [Deleted]) VALUES (4, 1, 4, 43, 42.33, CAST(N'2020-01-26T00:00:00.000' AS DateTime), N'01dlopezs98@gmail.com', CAST(N'2020-01-26T00:00:00.000' AS DateTime), N'01dlopezs98@gmail.com', 0)
SET IDENTITY_INSERT [dbo].[CurrencyExchange] OFF
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([Id], [PersonId], [Initials], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [Deleted]) VALUES (1, 4, N'JL', CAST(N'2020-01-10T00:00:00.000' AS DateTime), N'01dlopezs98@gmail.com', CAST(N'2020-01-10T00:00:00.000' AS DateTime), N'01dlopezs98@gmail.com', 0)
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[DetailProductStocks] ON 

INSERT [dbo].[DetailProductStocks] ([Id], [ProductStocksId], [WarehouseId], [ProductDetailCode], [TargetUnitId], [UnitConversionId], [ExpirationDate], [OriginalQuantity], [Quantity], [ConversionQuantity], [PurchasePrice], [SalePrice], [SalePriceByUnitBase], [Available]) VALUES (1, 2, 1, N'0311122-10012020', 8, 28, CAST(N'2021-01-27T22:38:32.900' AS DateTime), 500, 488.476, 488.476, 14, 19.6, 19.6, 1)
INSERT [dbo].[DetailProductStocks] ([Id], [ProductStocksId], [WarehouseId], [ProductDetailCode], [TargetUnitId], [UnitConversionId], [ExpirationDate], [OriginalQuantity], [Quantity], [ConversionQuantity], [PurchasePrice], [SalePrice], [SalePriceByUnitBase], [Available]) VALUES (2, 2, 1, N'0421155-10012020', 5, 15, CAST(N'2027-11-25T00:00:00.000' AS DateTime), 500, 490, 490, 15, 21, 21, 1)
INSERT [dbo].[DetailProductStocks] ([Id], [ProductStocksId], [WarehouseId], [ProductDetailCode], [TargetUnitId], [UnitConversionId], [ExpirationDate], [OriginalQuantity], [Quantity], [ConversionQuantity], [PurchasePrice], [SalePrice], [SalePriceByUnitBase], [Available]) VALUES (3, 3, 2, N'0421155-10012020', 5, 15, CAST(N'2021-02-04T09:29:29.007' AS DateTime), 5, 5, 5, 0, 0, 0, 1)
INSERT [dbo].[DetailProductStocks] ([Id], [ProductStocksId], [WarehouseId], [ProductDetailCode], [TargetUnitId], [UnitConversionId], [ExpirationDate], [OriginalQuantity], [Quantity], [ConversionQuantity], [PurchasePrice], [SalePrice], [SalePriceByUnitBase], [Available]) VALUES (4, 4, 1, N'0131073-10012020', 1, 1, CAST(N'2021-02-10T00:55:25.883' AS DateTime), 200, 150, 150, 35, 49, 49, 1)
INSERT [dbo].[DetailProductStocks] ([Id], [ProductStocksId], [WarehouseId], [ProductDetailCode], [TargetUnitId], [UnitConversionId], [ExpirationDate], [OriginalQuantity], [Quantity], [ConversionQuantity], [PurchasePrice], [SalePrice], [SalePriceByUnitBase], [Available]) VALUES (5, 4, 1, N'064485-10012020', 4, 13, CAST(N'2025-11-12T00:00:00.000' AS DateTime), 30, 30, 120, 85, 119, 29.75, 1)
INSERT [dbo].[DetailProductStocks] ([Id], [ProductStocksId], [WarehouseId], [ProductDetailCode], [TargetUnitId], [UnitConversionId], [ExpirationDate], [OriginalQuantity], [Quantity], [ConversionQuantity], [PurchasePrice], [SalePrice], [SalePriceByUnitBase], [Available]) VALUES (6, 4, 2, N'0311122-10012020', 8, 28, CAST(N'2021-02-10T00:56:49.287' AS DateTime), 500, 500, 500, 45, 63, 63, 1)
SET IDENTITY_INSERT [dbo].[DetailProductStocks] OFF
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([Id], [PersonId], [Initials], [Position], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [Deleted]) VALUES (1, 3, N'CRAP', N'Vendedor', CAST(N'2020-01-10T00:00:00.000' AS DateTime), N'01dlopezs98@gmail.com', CAST(N'2020-01-10T00:00:00.000' AS DateTime), N'01dlopezs98@gmail.com', 0)
INSERT [dbo].[Employees] ([Id], [PersonId], [Initials], [Position], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [Deleted]) VALUES (2, 1, N'DALS', N'Sys Admin', CAST(N'2020-01-10T00:00:00.000' AS DateTime), N'01dlopezs98@gmail.com', CAST(N'2020-01-10T00:00:00.000' AS DateTime), N'01dlopezs98@gmail.com', 0)
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO
SET IDENTITY_INSERT [dbo].[ForeignCurrencies] ON 

INSERT [dbo].[ForeignCurrencies] ([Id], [Name], [Symbol], [Deleted]) VALUES (1, N'Cordoba', N'C$', 0)
INSERT [dbo].[ForeignCurrencies] ([Id], [Name], [Symbol], [Deleted]) VALUES (2, N'Dolar', N'$', 0)
INSERT [dbo].[ForeignCurrencies] ([Id], [Name], [Symbol], [Deleted]) VALUES (4, N'Euro', N'€', 0)
SET IDENTITY_INSERT [dbo].[ForeignCurrencies] OFF
GO
SET IDENTITY_INSERT [dbo].[LocalCurrencies] ON 

INSERT [dbo].[LocalCurrencies] ([Id], [Name], [Symbol], [Deleted], [IsActive]) VALUES (1, N'Cordoba', N'C$', 0, 1)
INSERT [dbo].[LocalCurrencies] ([Id], [Name], [Symbol], [Deleted], [IsActive]) VALUES (2, N'Dolar', N'$', 0, 0)
INSERT [dbo].[LocalCurrencies] ([Id], [Name], [Symbol], [Deleted], [IsActive]) VALUES (3, N'Euro', N'€', 0, 0)
SET IDENTITY_INSERT [dbo].[LocalCurrencies] OFF
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
SET IDENTITY_INSERT [dbo].[PendingTransfers] ON 

INSERT [dbo].[PendingTransfers] ([Id], [ProductStocksId], [LotNumber], [StocksCode], [ProductDetailCode], [WarehouseId], [PurchasedUnitId], [TargetWarehouseId], [UnitBaseId], [UnitTypeId], [TargetUnitId], [UnitQuantity], [UnitConversionId], [ConversionQuantity], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [TransferStatus]) VALUES (1, 2, N'022-02-27012021', N'0421155-10012020-2125', N'0421155-10012020', 1, 5, 1, 5, 3, 5, 1, 15, 1, CAST(N'2021-02-04T00:46:04.953' AS DateTime), CAST(N'2021-02-06T23:19:51.937' AS DateTime), N'01dlopezs98@gmail.com', N'01dlopezs98@gmail.com', 1)
INSERT [dbo].[PendingTransfers] ([Id], [ProductStocksId], [LotNumber], [StocksCode], [ProductDetailCode], [WarehouseId], [PurchasedUnitId], [TargetWarehouseId], [UnitBaseId], [UnitTypeId], [TargetUnitId], [UnitQuantity], [UnitConversionId], [ConversionQuantity], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [TransferStatus]) VALUES (2, 2, N'022-02-27012021', N'0421155-10012020-2125', N'0421155-10012020', 1, 5, 1, 5, 3, 5, 1, 15, 1, CAST(N'2021-02-04T00:46:28.770' AS DateTime), CAST(N'2021-02-04T04:26:48.520' AS DateTime), N'01dlopezs98@gmail.com', N'01dlopezs98@gmail.com', 1)
INSERT [dbo].[PendingTransfers] ([Id], [ProductStocksId], [LotNumber], [StocksCode], [ProductDetailCode], [WarehouseId], [PurchasedUnitId], [TargetWarehouseId], [UnitBaseId], [UnitTypeId], [TargetUnitId], [UnitQuantity], [UnitConversionId], [ConversionQuantity], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [TransferStatus]) VALUES (3, 2, N'022-02-27012021', N'0311122-10012020-1128', N'0311122-10012020', 1, 8, 2, 8, 1, 8, 4, 28, 4, CAST(N'2021-02-04T02:31:49.910' AS DateTime), CAST(N'2021-02-07T18:12:07.527' AS DateTime), N'01dlopezs98@gmail.com', N'01dlopezs98@gmail.com', 2)
INSERT [dbo].[PendingTransfers] ([Id], [ProductStocksId], [LotNumber], [StocksCode], [ProductDetailCode], [WarehouseId], [PurchasedUnitId], [TargetWarehouseId], [UnitBaseId], [UnitTypeId], [TargetUnitId], [UnitQuantity], [UnitConversionId], [ConversionQuantity], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [TransferStatus]) VALUES (4, 3, N'033-01-04022021', N'0421155-10012020-3235', N'0421155-10012020', 2, 5, 1, 5, 3, 5, 2, 15, 2, CAST(N'2021-02-07T15:39:36.490' AS DateTime), CAST(N'2021-02-07T18:12:08.113' AS DateTime), N'01dlopezs98@gmail.com', N'01dlopezs98@gmail.com', 2)
INSERT [dbo].[PendingTransfers] ([Id], [ProductStocksId], [LotNumber], [StocksCode], [ProductDetailCode], [WarehouseId], [PurchasedUnitId], [TargetWarehouseId], [UnitBaseId], [UnitTypeId], [TargetUnitId], [UnitQuantity], [UnitConversionId], [ConversionQuantity], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [TransferStatus]) VALUES (5, 3, N'033-01-04022021', N'0421155-10012020-3235', N'0421155-10012020', 2, 5, 3, 5, 3, 5, 1, 15, 1, CAST(N'2021-02-07T15:40:46.093' AS DateTime), CAST(N'2021-02-07T18:12:08.127' AS DateTime), N'01dlopezs98@gmail.com', N'01dlopezs98@gmail.com', 2)
INSERT [dbo].[PendingTransfers] ([Id], [ProductStocksId], [LotNumber], [StocksCode], [ProductDetailCode], [WarehouseId], [PurchasedUnitId], [TargetWarehouseId], [UnitBaseId], [UnitTypeId], [TargetUnitId], [UnitQuantity], [UnitConversionId], [ConversionQuantity], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [TransferStatus]) VALUES (6, 3, N'033-01-04022021', N'0421155-10012020-3235', N'0421155-10012020', 2, 5, 3, 5, 3, 5, 2, 15, 2, CAST(N'2021-02-10T00:42:13.370' AS DateTime), CAST(N'2021-02-10T09:02:27.003' AS DateTime), N'01dlopezs98@gmail.com', N'01dlopezs98@gmail.com', 2)
INSERT [dbo].[PendingTransfers] ([Id], [ProductStocksId], [LotNumber], [StocksCode], [ProductDetailCode], [WarehouseId], [PurchasedUnitId], [TargetWarehouseId], [UnitBaseId], [UnitTypeId], [TargetUnitId], [UnitQuantity], [UnitConversionId], [ConversionQuantity], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [TransferStatus]) VALUES (7, 4, N'043-03-10022021', N'0131073-10012020-4141', N'0131073-10012020', 1, 1, 4, 1, 2, 1, 5, 1, 5, CAST(N'2021-02-10T09:01:30.740' AS DateTime), CAST(N'2021-02-10T09:02:27.777' AS DateTime), N'01dlopezs98@gmail.com', N'01dlopezs98@gmail.com', 2)
SET IDENTITY_INSERT [dbo].[PendingTransfers] OFF
GO
SET IDENTITY_INSERT [dbo].[Persons] ON 

INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [EmailAddress], [Address], [CardId], [PhoneNumber]) VALUES (1, N'Danny', N'Lopez', N'01dlopezs98@gmail.com', N'San Marcos', N'041-011098-1001L', N'88744533')
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [EmailAddress], [Address], [CardId], [PhoneNumber]) VALUES (2, N'Carlos', N'Chavez', N'davidchavez@gmail.com', N'Jinotepe', N'041-051299-1001G', N'85645233')
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [EmailAddress], [Address], [CardId], [PhoneNumber]) VALUES (3, N'Carlos', N'Aguirres', N'aguirre@gmail.com', N'Diriamba', N'042-011299-1002G', N'54877799')
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [EmailAddress], [Address], [CardId], [PhoneNumber]) VALUES (4, N'Jose', N'Lopez', N'lopez@gmail.com', N'Managua', N'043-011295-1004M', N'65545888')
SET IDENTITY_INSERT [dbo].[Persons] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductDetails] ON 

INSERT [dbo].[ProductDetails] ([Id], [ProductId], [BrandId], [CategoryId], [MaterialTypeId], [DefaultCode], [Dimensions], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [Deleted]) VALUES (1, 3, 10, 7, 3, N'CM2256686', N'Ninguna', CAST(N'2020-01-10T00:00:00.000' AS DateTime), N'01dlopezs98@gmail.com', CAST(N'2020-01-10T00:00:00.000' AS DateTime), N'01dlopezs98@gmail.com', 0)
INSERT [dbo].[ProductDetails] ([Id], [ProductId], [BrandId], [CategoryId], [MaterialTypeId], [DefaultCode], [Dimensions], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [Deleted]) VALUES (3, 1, 11, 2, 2, N'TB48557744', N'1/2 (12 MM)', CAST(N'2020-01-10T00:00:00.000' AS DateTime), N'01dlopezs98@gmail.com', CAST(N'2020-01-10T00:00:00.000' AS DateTime), N'01dlopezs98@gmail.com', 0)
INSERT [dbo].[ProductDetails] ([Id], [ProductId], [BrandId], [CategoryId], [MaterialTypeId], [DefaultCode], [Dimensions], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [Deleted]) VALUES (4, 2, 11, 5, 5, N'PA544830058', N'Ninguna', CAST(N'2020-01-10T00:00:00.000' AS DateTime), N'01dlopezs98@gmail.com', CAST(N'2020-01-10T00:00:00.000' AS DateTime), N'01dlopezs98@gmail.com', 0)
INSERT [dbo].[ProductDetails] ([Id], [ProductId], [BrandId], [CategoryId], [MaterialTypeId], [DefaultCode], [Dimensions], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [Deleted]) VALUES (6, 4, 4, 8, 5, N'ZN87461666', N'Ninguna', CAST(N'2020-01-10T00:00:00.000' AS DateTime), N'01dlopezs98@gmail.com', CAST(N'2020-01-10T00:00:00.000' AS DateTime), N'01dlopezs98@gmail.com', 0)
SET IDENTITY_INSERT [dbo].[ProductDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [Initials], [MeasureUnitId], [Description], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (1, N'Tubos', N'TB', 8, NULL, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Products] ([Id], [Name], [Initials], [MeasureUnitId], [Description], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (2, N'Pintura Acrilica', N'PA', 5, NULL, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Products] ([Id], [Name], [Initials], [MeasureUnitId], [Description], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (3, N'Cemento', N'C', 1, NULL, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Products] ([Id], [Name], [Initials], [MeasureUnitId], [Description], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (4, N'Zener', N'Z', 6, NULL, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductStocks] ON 

INSERT [dbo].[ProductStocks] ([Id], [SupplierId], [Quantity], [TotalAmount], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [Available]) VALUES (2, 2, 2, 19584, CAST(N'2021-01-27T22:47:54.217' AS DateTime), N'01dlopezs98@gmail.com', CAST(N'2021-01-27T22:47:54.217' AS DateTime), N'01dlopezs98@gmail.com', 1)
INSERT [dbo].[ProductStocks] ([Id], [SupplierId], [Quantity], [TotalAmount], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [Available]) VALUES (3, 3, 1, 0, CAST(N'2021-02-04T09:30:10.470' AS DateTime), N'01dlopezs98@gmail.com', CAST(N'2021-02-04T09:30:10.470' AS DateTime), N'01dlopezs98@gmail.com', 1)
INSERT [dbo].[ProductStocks] ([Id], [SupplierId], [Quantity], [TotalAmount], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [Available]) VALUES (4, 3, 3, 22435, CAST(N'2021-02-10T00:57:59.193' AS DateTime), N'01dlopezs98@gmail.com', CAST(N'2021-02-10T00:57:59.193' AS DateTime), N'01dlopezs98@gmail.com', 1)
SET IDENTITY_INSERT [dbo].[ProductStocks] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductTransfers] ON 

INSERT [dbo].[ProductTransfers] ([Id], [TotalProducts], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [TranferStatus]) VALUES (2, 3, CAST(N'2021-02-07T18:12:07.333' AS DateTime), CAST(N'2021-02-07T18:12:07.333' AS DateTime), N'01dlopezs98@gmail.com', N'01dlopezs98@gmail.com', 2)
INSERT [dbo].[ProductTransfers] ([Id], [TotalProducts], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [TranferStatus]) VALUES (4, 2, CAST(N'2021-02-10T09:02:26.780' AS DateTime), CAST(N'2021-02-10T09:02:26.780' AS DateTime), N'01dlopezs98@gmail.com', N'01dlopezs98@gmail.com', 2)
SET IDENTITY_INSERT [dbo].[ProductTransfers] OFF
GO
SET IDENTITY_INSERT [dbo].[PurchaseDetails] ON 

INSERT [dbo].[PurchaseDetails] ([Id], [PurchaseInvoiceId], [ProductDetailCode], [WarehouseId], [TargetUnitId], [Quantity], [PurchasePrice], [Subtotal], [Tax], [Discount], [Total]) VALUES (1, 2, N'0311122-10012020', 1, 8, 500, 14, 15000, 16, 5, 14250)
INSERT [dbo].[PurchaseDetails] ([Id], [PurchaseInvoiceId], [ProductDetailCode], [WarehouseId], [TargetUnitId], [Quantity], [PurchasePrice], [Subtotal], [Tax], [Discount], [Total]) VALUES (2, 2, N'0421155-10012020', 1, 5, 500, 15, 7500, 0, 0, 7500)
INSERT [dbo].[PurchaseDetails] ([Id], [PurchaseInvoiceId], [ProductDetailCode], [WarehouseId], [TargetUnitId], [Quantity], [PurchasePrice], [Subtotal], [Tax], [Discount], [Total]) VALUES (3, 3, N'0421155-10012020', 2, 5, 5, 0, 0, 0, 5, 0)
INSERT [dbo].[PurchaseDetails] ([Id], [PurchaseInvoiceId], [ProductDetailCode], [WarehouseId], [TargetUnitId], [Quantity], [PurchasePrice], [Subtotal], [Tax], [Discount], [Total]) VALUES (4, 4, N'0131073-10012020', 1, 1, 200, 35, 7000, 0, 0, 7000)
INSERT [dbo].[PurchaseDetails] ([Id], [PurchaseInvoiceId], [ProductDetailCode], [WarehouseId], [TargetUnitId], [Quantity], [PurchasePrice], [Subtotal], [Tax], [Discount], [Total]) VALUES (5, 4, N'064485-10012020', 1, 4, 30, 85, 2550, 0, 0, 2550)
INSERT [dbo].[PurchaseDetails] ([Id], [PurchaseInvoiceId], [ProductDetailCode], [WarehouseId], [TargetUnitId], [Quantity], [PurchasePrice], [Subtotal], [Tax], [Discount], [Total]) VALUES (6, 4, N'0311122-10012020', 2, 8, 500, 45, 22500, 0, 0, 22500)
SET IDENTITY_INSERT [dbo].[PurchaseDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[PurchaseInvoices] ON 

INSERT [dbo].[PurchaseInvoices] ([Id], [SupplierId], [SupplierInvoiceNumber], [Tax], [Subtotal], [Discount], [TotalAmount], [Deleted], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (2, 2, N'021000-27012021WJAN', 10, 21750, 10, 19584, 0, CAST(N'2021-01-27T22:47:54.180' AS DateTime), N'01dlopezs98@gmail.com', CAST(N'2021-01-27T22:47:54.180' AS DateTime), N'01dlopezs98@gmail.com')
INSERT [dbo].[PurchaseInvoices] ([Id], [SupplierId], [SupplierInvoiceNumber], [Tax], [Subtotal], [Discount], [TotalAmount], [Deleted], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (3, 3, N'ASUHIDNW93003', 0, 0, 10, 0, 0, CAST(N'2021-02-04T09:30:10.410' AS DateTime), N'01dlopezs98@gmail.com', CAST(N'2021-02-04T09:30:10.410' AS DateTime), N'01dlopezs98@gmail.com')
INSERT [dbo].[PurchaseInvoices] ([Id], [SupplierId], [SupplierInvoiceNumber], [Tax], [Subtotal], [Discount], [TotalAmount], [Deleted], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (4, 3, N'379GUQW009427W', 0, 32050, 30, 22435, 0, CAST(N'2021-02-10T00:57:59.127' AS DateTime), N'01dlopezs98@gmail.com', CAST(N'2021-02-10T00:57:59.127' AS DateTime), N'01dlopezs98@gmail.com')
SET IDENTITY_INSERT [dbo].[PurchaseInvoices] OFF
GO
SET IDENTITY_INSERT [dbo].[RemovedProducts] ON 

INSERT [dbo].[RemovedProducts] ([Id], [ProductStocksId], [LotNumber], [StocksDetailCode], [MeasureUnitId], [UnitQuantity], [UnitBaseId], [ConversionQuantity], [Title], [Description], [CreatedAt], [CreatedBy]) VALUES (1, 2, N'', N'0421155-10012020-2125', 5, 2, 5, 2, N'Titulo prueba', N'Descripción', CAST(N'2021-01-31T23:08:22.833' AS DateTime), N'01dlopezs98@gmail.com')
INSERT [dbo].[RemovedProducts] ([Id], [ProductStocksId], [LotNumber], [StocksDetailCode], [MeasureUnitId], [UnitQuantity], [UnitBaseId], [ConversionQuantity], [Title], [Description], [CreatedAt], [CreatedBy]) VALUES (2, 2, N'022-02-27012021', N'0421155-10012020-2125', 5, 2, 5, 2, N'Test 1', N'Test description', CAST(N'2021-01-31T23:20:48.063' AS DateTime), N'01dlopezs98@gmail.com')
INSERT [dbo].[RemovedProducts] ([Id], [ProductStocksId], [LotNumber], [StocksDetailCode], [MeasureUnitId], [UnitQuantity], [UnitBaseId], [ConversionQuantity], [Title], [Description], [CreatedAt], [CreatedBy]) VALUES (3, 2, N'022-02-27012021', N'0421155-10012020-2125', 5, 6, 5, 6, N'test', N'descripcion', CAST(N'2021-02-01T00:01:29.530' AS DateTime), N'01dlopezs98@gmail.com')
SET IDENTITY_INSERT [dbo].[RemovedProducts] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([Id], [Name], [Description], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (1, N'Administrator', NULL, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Roles] ([Id], [Name], [Description], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (2, N'Sale Administrator', NULL, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Roles] ([Id], [Name], [Description], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (3, N'Report Admin', NULL, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[SalesDetails] ON 

INSERT [dbo].[SalesDetails] ([Id], [SaleInvoiceId], [StockLotNumber], [ProductDetailCode], [WarehouseId], [SaleUnitId], [PurchasedUnitId], [UnitConversionId], [ConversionValue], [Quantity], [Price], [Subtotal], [Tax], [Discount], [Total]) VALUES (1, 2, N'022-02-27012021', N'0311122-10012020', 1, 11, 8, 48, 1.524, 5, 5.9737884791222191, 29.868942395611096, 0, 0, 29.868942395611096)
INSERT [dbo].[SalesDetails] ([Id], [SaleInvoiceId], [StockLotNumber], [ProductDetailCode], [WarehouseId], [SaleUnitId], [PurchasedUnitId], [UnitConversionId], [ConversionValue], [Quantity], [Price], [Subtotal], [Tax], [Discount], [Total]) VALUES (2, 3, N'022-02-27012021', N'0311122-10012020', 1, 8, 8, 28, 5, 5, 19.6, 98, 0, 0, 98)
INSERT [dbo].[SalesDetails] ([Id], [SaleInvoiceId], [StockLotNumber], [ProductDetailCode], [WarehouseId], [SaleUnitId], [PurchasedUnitId], [UnitConversionId], [ConversionValue], [Quantity], [Price], [Subtotal], [Tax], [Discount], [Total]) VALUES (3, 4, N'022-02-27012021', N'0311122-10012020', 1, 8, 8, 28, 5, 5, 19.6, 98, 0, 5, 93.1)
INSERT [dbo].[SalesDetails] ([Id], [SaleInvoiceId], [StockLotNumber], [ProductDetailCode], [WarehouseId], [SaleUnitId], [PurchasedUnitId], [UnitConversionId], [ConversionValue], [Quantity], [Price], [Subtotal], [Tax], [Discount], [Total]) VALUES (4, 5, N'043-03-10022021', N'0131073-10012020', 1, 1, 1, 1, 50, 50, 49, 2450, 0, 0, 2450)
SET IDENTITY_INSERT [dbo].[SalesDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[SalesInvoices] ON 

INSERT [dbo].[SalesInvoices] ([Id], [CustomerId], [CustomerInvoice], [CurrencyExchangeId], [Payment], [PaymentChange], [Tax], [Subtotal], [Discount], [TotalAmount], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [Deleted]) VALUES (2, NULL, N'Danny Aldahir López Sánchez', 2, 0, 0, 0, 29.8689423956111, 2, 29.2715635476989, CAST(N'2021-01-27T22:55:40.727' AS DateTime), N'01dlopezs98@gmail.com', CAST(N'2021-01-27T22:55:40.727' AS DateTime), N'01dlopezs98@gmail.com', 0)
INSERT [dbo].[SalesInvoices] ([Id], [CustomerId], [CustomerInvoice], [CurrencyExchangeId], [Payment], [PaymentChange], [Tax], [Subtotal], [Discount], [TotalAmount], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [Deleted]) VALUES (3, 1, N'Jose Lopez', 1, 100, 2, 0, 98, 0, 98, CAST(N'2021-02-01T21:36:56.007' AS DateTime), N'01dlopezs98@gmail.com', CAST(N'2021-02-01T21:36:56.007' AS DateTime), N'01dlopezs98@gmail.com', 0)
INSERT [dbo].[SalesInvoices] ([Id], [CustomerId], [CustomerInvoice], [CurrencyExchangeId], [Payment], [PaymentChange], [Tax], [Subtotal], [Discount], [TotalAmount], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [Deleted]) VALUES (4, 1, N'Jose Lopez', 2, 10, 252.9, 0, 93.1, 0, 93.1, CAST(N'2021-02-04T09:27:37.003' AS DateTime), N'01dlopezs98@gmail.com', CAST(N'2021-02-04T09:27:37.003' AS DateTime), N'01dlopezs98@gmail.com', 0)
INSERT [dbo].[SalesInvoices] ([Id], [CustomerId], [CustomerInvoice], [CurrencyExchangeId], [Payment], [PaymentChange], [Tax], [Subtotal], [Discount], [TotalAmount], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [Deleted]) VALUES (5, NULL, N'Carlos Rubén Aguirre', 2, 70, 94.5, 0, 2450, 5, 2327.5, CAST(N'2021-02-10T01:01:15.050' AS DateTime), N'01dlopezs98@gmail.com', CAST(N'2021-02-10T01:01:15.050' AS DateTime), N'01dlopezs98@gmail.com', 0)
SET IDENTITY_INSERT [dbo].[SalesInvoices] OFF
GO
SET IDENTITY_INSERT [dbo].[Suppliers] ON 

INSERT [dbo].[Suppliers] ([Id], [Name], [Email], [Address], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [Deleted]) VALUES (1, N'Sherwin Willians', N'sherwin@info.com', N'Managua', CAST(N'2020-01-10T00:00:00.000' AS DateTime), N'01dlopezs98@gmail.com', CAST(N'2020-01-10T00:00:00.000' AS DateTime), N'01dlopezs98@gmail.com', 0)
INSERT [dbo].[Suppliers] ([Id], [Name], [Email], [Address], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [Deleted]) VALUES (2, N'DevStack Inc', N'devstack00@devs.inc', N'San Marcos', CAST(N'2020-01-10T00:00:00.000' AS DateTime), N'01dlopezs98@gmail.com', CAST(N'2020-01-10T00:00:00.000' AS DateTime), N'01dlopezs98@gmail.com', 0)
INSERT [dbo].[Suppliers] ([Id], [Name], [Email], [Address], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [Deleted]) VALUES (3, N'Ace Hardware', N'acehardware@info.com', N'Managua', CAST(N'2021-01-17T19:48:03.043' AS DateTime), N'01dlopezs98@gmail.com', CAST(N'2021-01-17T19:48:03.043' AS DateTime), N'01dlopezs98@gmail.com', 0)
INSERT [dbo].[Suppliers] ([Id], [Name], [Email], [Address], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [Deleted]) VALUES (4, N'Supplier test', N'supplier@info.com', N'San Marcos', CAST(N'2021-01-17T20:02:30.707' AS DateTime), N'01dlopezs98@gmail.com', CAST(N'2021-01-17T20:02:30.707' AS DateTime), N'01dlopezs98@gmail.com', 0)
INSERT [dbo].[Suppliers] ([Id], [Name], [Email], [Address], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [Deleted]) VALUES (5, N'Supplier Test 2', N'SupplierTest2@info.com', N'Jinotepe', CAST(N'2021-01-17T20:26:23.580' AS DateTime), N'01dlopezs98@gmail.com', CAST(N'2021-01-17T20:26:23.580' AS DateTime), N'01dlopezs98@gmail.com', 0)
INSERT [dbo].[Suppliers] ([Id], [Name], [Email], [Address], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [Deleted]) VALUES (6, N'Supplier 3', N'01dlopezs98@gmail.com', N'direccion', CAST(N'2021-02-04T09:07:39.603' AS DateTime), N'01dlopezs98@gmail.com', CAST(N'2021-02-04T09:07:39.603' AS DateTime), N'01dlopezs98@gmail.com', 0)
SET IDENTITY_INSERT [dbo].[Suppliers] OFF
GO
SET IDENTITY_INSERT [dbo].[TranferStatus] ON 

INSERT [dbo].[TranferStatus] ([Id], [Name], [Active]) VALUES (1, N'Canceled', 1)
INSERT [dbo].[TranferStatus] ([Id], [Name], [Active]) VALUES (2, N'Done', 1)
INSERT [dbo].[TranferStatus] ([Id], [Name], [Active]) VALUES (3, N'Pending', 1)
SET IDENTITY_INSERT [dbo].[TranferStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[TransfersDetails] ON 

INSERT [dbo].[TransfersDetails] ([Id], [ProductTransferId], [ProductStocksId], [LotNumber], [StocksCode], [TargetWarehouseId], [UnitBaseId], [TargetUnitId], [UnitQuantity], [UnitConversionId], [ConversionQuantity]) VALUES (1, 2, 2, N'022-02-27012021', N'0311122-10012020-1128', 2, 8, 8, 4, 4, 4)
INSERT [dbo].[TransfersDetails] ([Id], [ProductTransferId], [ProductStocksId], [LotNumber], [StocksCode], [TargetWarehouseId], [UnitBaseId], [TargetUnitId], [UnitQuantity], [UnitConversionId], [ConversionQuantity]) VALUES (2, 2, 3, N'033-01-04022021', N'0421155-10012020-3235', 1, 5, 5, 2, 2, 2)
INSERT [dbo].[TransfersDetails] ([Id], [ProductTransferId], [ProductStocksId], [LotNumber], [StocksCode], [TargetWarehouseId], [UnitBaseId], [TargetUnitId], [UnitQuantity], [UnitConversionId], [ConversionQuantity]) VALUES (3, 2, 3, N'033-01-04022021', N'0421155-10012020-3235', 3, 5, 5, 1, 1, 1)
INSERT [dbo].[TransfersDetails] ([Id], [ProductTransferId], [ProductStocksId], [LotNumber], [StocksCode], [TargetWarehouseId], [UnitBaseId], [TargetUnitId], [UnitQuantity], [UnitConversionId], [ConversionQuantity]) VALUES (4, 4, 3, N'033-01-04022021', N'0421155-10012020-3235', 3, 5, 5, 2, 2, 2)
INSERT [dbo].[TransfersDetails] ([Id], [ProductTransferId], [ProductStocksId], [LotNumber], [StocksCode], [TargetWarehouseId], [UnitBaseId], [TargetUnitId], [UnitQuantity], [UnitConversionId], [ConversionQuantity]) VALUES (5, 4, 4, N'043-03-10022021', N'0131073-10012020-4141', 4, 1, 1, 5, 5, 5)
SET IDENTITY_INSERT [dbo].[TransfersDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[UnitConversions] ON 

INSERT [dbo].[UnitConversions] ([Id], [Unit], [IdMeasureUnitFrom], [IdMeasureUnitTo], [ConversionNameFrom], [ConversionNameTo], [ConversionValue], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (1, 1, 1, 1, N'Libra', N'Libra', 1, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[UnitConversions] ([Id], [Unit], [IdMeasureUnitFrom], [IdMeasureUnitTo], [ConversionNameFrom], [ConversionNameTo], [ConversionValue], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (2, 1, 1, 2, N'Libra', N'Gramo', 453.59, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[UnitConversions] ([Id], [Unit], [IdMeasureUnitFrom], [IdMeasureUnitTo], [ConversionNameFrom], [ConversionNameTo], [ConversionValue], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (3, 1, 1, 3, N'Libra', N'Onza', 16, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[UnitConversions] ([Id], [Unit], [IdMeasureUnitFrom], [IdMeasureUnitTo], [ConversionNameFrom], [ConversionNameTo], [ConversionValue], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (5, 1, 2, 2, N'Gramo', N'Gramo', 1, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[UnitConversions] ([Id], [Unit], [IdMeasureUnitFrom], [IdMeasureUnitTo], [ConversionNameFrom], [ConversionNameTo], [ConversionValue], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (6, 1, 2, 1, N'Gramo', N'Libra', 0.0022, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[UnitConversions] ([Id], [Unit], [IdMeasureUnitFrom], [IdMeasureUnitTo], [ConversionNameFrom], [ConversionNameTo], [ConversionValue], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (7, 1, 2, 3, N'Gramo', N'Onza', 0.04, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[UnitConversions] ([Id], [Unit], [IdMeasureUnitFrom], [IdMeasureUnitTo], [ConversionNameFrom], [ConversionNameTo], [ConversionValue], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (8, 1, 3, 3, N'Onza', N'Onza', 1, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[UnitConversions] ([Id], [Unit], [IdMeasureUnitFrom], [IdMeasureUnitTo], [ConversionNameFrom], [ConversionNameTo], [ConversionValue], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (9, 1, 3, 1, N'Onza', N'Libra', 0.06, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[UnitConversions] ([Id], [Unit], [IdMeasureUnitFrom], [IdMeasureUnitTo], [ConversionNameFrom], [ConversionNameTo], [ConversionValue], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (10, 1, 3, 2, N'Onza', N'Gramo', 28.35, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[UnitConversions] ([Id], [Unit], [IdMeasureUnitFrom], [IdMeasureUnitTo], [ConversionNameFrom], [ConversionNameTo], [ConversionValue], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (11, 1, 4, 4, N'Galon', N'Galon', 1, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[UnitConversions] ([Id], [Unit], [IdMeasureUnitFrom], [IdMeasureUnitTo], [ConversionNameFrom], [ConversionNameTo], [ConversionValue], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (12, 1, 4, 5, N'Galon', N'Litro', 4.546, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[UnitConversions] ([Id], [Unit], [IdMeasureUnitFrom], [IdMeasureUnitTo], [ConversionNameFrom], [ConversionNameTo], [ConversionValue], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (13, 1, 4, 6, N'Galon', N'Cuarto', 4, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[UnitConversions] ([Id], [Unit], [IdMeasureUnitFrom], [IdMeasureUnitTo], [ConversionNameFrom], [ConversionNameTo], [ConversionValue], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (14, 1, 4, 7, N'Galon', N'Onza', 128, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[UnitConversions] ([Id], [Unit], [IdMeasureUnitFrom], [IdMeasureUnitTo], [ConversionNameFrom], [ConversionNameTo], [ConversionValue], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (15, 1, 5, 5, N'Litro', N'Litro', 1, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[UnitConversions] ([Id], [Unit], [IdMeasureUnitFrom], [IdMeasureUnitTo], [ConversionNameFrom], [ConversionNameTo], [ConversionValue], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (16, 1, 5, 4, N'Litro', N'Galon', 0.219969, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[UnitConversions] ([Id], [Unit], [IdMeasureUnitFrom], [IdMeasureUnitTo], [ConversionNameFrom], [ConversionNameTo], [ConversionValue], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (17, 1, 5, 6, N'Litro', N'Cuarto', 0.879877, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[UnitConversions] ([Id], [Unit], [IdMeasureUnitFrom], [IdMeasureUnitTo], [ConversionNameFrom], [ConversionNameTo], [ConversionValue], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (18, 1, 5, 7, N'Litro', N'Onza', 33.814, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[UnitConversions] ([Id], [Unit], [IdMeasureUnitFrom], [IdMeasureUnitTo], [ConversionNameFrom], [ConversionNameTo], [ConversionValue], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (19, 1, 6, 6, N'Cuarto', N'Cuarto', 1, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[UnitConversions] ([Id], [Unit], [IdMeasureUnitFrom], [IdMeasureUnitTo], [ConversionNameFrom], [ConversionNameTo], [ConversionValue], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (20, 1, 6, 4, N'Cuarto', N'Galon', 0.25, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[UnitConversions] ([Id], [Unit], [IdMeasureUnitFrom], [IdMeasureUnitTo], [ConversionNameFrom], [ConversionNameTo], [ConversionValue], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (21, 1, 6, 5, N'Cuarto', N'Litro', 1.13652, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[UnitConversions] ([Id], [Unit], [IdMeasureUnitFrom], [IdMeasureUnitTo], [ConversionNameFrom], [ConversionNameTo], [ConversionValue], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (22, 1, 6, 7, N'Cuarto', N'Onza', 32, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[UnitConversions] ([Id], [Unit], [IdMeasureUnitFrom], [IdMeasureUnitTo], [ConversionNameFrom], [ConversionNameTo], [ConversionValue], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (23, 1, 7, 7, N'Onza', N'Onza', 1, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[UnitConversions] ([Id], [Unit], [IdMeasureUnitFrom], [IdMeasureUnitTo], [ConversionNameFrom], [ConversionNameTo], [ConversionValue], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (24, 1, 7, 4, N'Onza', N'Galon', 0.0065, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[UnitConversions] ([Id], [Unit], [IdMeasureUnitFrom], [IdMeasureUnitTo], [ConversionNameFrom], [ConversionNameTo], [ConversionValue], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (25, 1, 7, 5, N'Onza', N'Litro', 0.0295735, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[UnitConversions] ([Id], [Unit], [IdMeasureUnitFrom], [IdMeasureUnitTo], [ConversionNameFrom], [ConversionNameTo], [ConversionValue], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (27, 1, 7, 6, N'Onza', N'Cuarto', 0.026, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[UnitConversions] ([Id], [Unit], [IdMeasureUnitFrom], [IdMeasureUnitTo], [ConversionNameFrom], [ConversionNameTo], [ConversionValue], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (28, 1, 8, 8, N'Metro', N'Metro', 1, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[UnitConversions] ([Id], [Unit], [IdMeasureUnitFrom], [IdMeasureUnitTo], [ConversionNameFrom], [ConversionNameTo], [ConversionValue], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (29, 1, 8, 9, N'Metro', N'Centimetro', 100, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[UnitConversions] ([Id], [Unit], [IdMeasureUnitFrom], [IdMeasureUnitTo], [ConversionNameFrom], [ConversionNameTo], [ConversionValue], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (30, 1, 8, 10, N'Metro', N'Yarda', 0.914, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[UnitConversions] ([Id], [Unit], [IdMeasureUnitFrom], [IdMeasureUnitTo], [ConversionNameFrom], [ConversionNameTo], [ConversionValue], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (31, 1, 8, 11, N'Metro', N'Pie', 3.281, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[UnitConversions] ([Id], [Unit], [IdMeasureUnitFrom], [IdMeasureUnitTo], [ConversionNameFrom], [ConversionNameTo], [ConversionValue], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (32, 1, 8, 12, N'Metro', N'Pulgada', 39.37, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[UnitConversions] ([Id], [Unit], [IdMeasureUnitFrom], [IdMeasureUnitTo], [ConversionNameFrom], [ConversionNameTo], [ConversionValue], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (33, 1, 9, 8, N'Centimetro', N'Metro', 0.01, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[UnitConversions] ([Id], [Unit], [IdMeasureUnitFrom], [IdMeasureUnitTo], [ConversionNameFrom], [ConversionNameTo], [ConversionValue], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (34, 1, 9, 9, N'Centimetro', N'Centimetro', 1, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[UnitConversions] ([Id], [Unit], [IdMeasureUnitFrom], [IdMeasureUnitTo], [ConversionNameFrom], [ConversionNameTo], [ConversionValue], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (35, 1, 9, 10, N'Centimetro', N'Yarda', 0.01, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[UnitConversions] ([Id], [Unit], [IdMeasureUnitFrom], [IdMeasureUnitTo], [ConversionNameFrom], [ConversionNameTo], [ConversionValue], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (39, 1, 9, 11, N'Centimetro', N'Pie', 0.032, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[UnitConversions] ([Id], [Unit], [IdMeasureUnitFrom], [IdMeasureUnitTo], [ConversionNameFrom], [ConversionNameTo], [ConversionValue], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (40, 1, 9, 12, N'Centimetro', N'Pulgada', 0.39, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[UnitConversions] ([Id], [Unit], [IdMeasureUnitFrom], [IdMeasureUnitTo], [ConversionNameFrom], [ConversionNameTo], [ConversionValue], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (41, 1, 10, 8, N'Yarda', N'Metro', 0.91, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[UnitConversions] ([Id], [Unit], [IdMeasureUnitFrom], [IdMeasureUnitTo], [ConversionNameFrom], [ConversionNameTo], [ConversionValue], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (43, 1, 10, 9, N'Yarda', N'Centimetro', 91.44, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[UnitConversions] ([Id], [Unit], [IdMeasureUnitFrom], [IdMeasureUnitTo], [ConversionNameFrom], [ConversionNameTo], [ConversionValue], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (44, 1, 10, 10, N'Yarda', N'Yarda', 1, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[UnitConversions] ([Id], [Unit], [IdMeasureUnitFrom], [IdMeasureUnitTo], [ConversionNameFrom], [ConversionNameTo], [ConversionValue], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (46, 1, 10, 11, N'Yarda', N'Pie', 3, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[UnitConversions] ([Id], [Unit], [IdMeasureUnitFrom], [IdMeasureUnitTo], [ConversionNameFrom], [ConversionNameTo], [ConversionValue], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (47, 1, 10, 12, N'Yarda', N'Pulgada', 36, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[UnitConversions] ([Id], [Unit], [IdMeasureUnitFrom], [IdMeasureUnitTo], [ConversionNameFrom], [ConversionNameTo], [ConversionValue], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (48, 1, 11, 8, N'Pie', N'Metro', 0.3048, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[UnitConversions] ([Id], [Unit], [IdMeasureUnitFrom], [IdMeasureUnitTo], [ConversionNameFrom], [ConversionNameTo], [ConversionValue], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (49, 1, 11, 9, N'Pie', N'Centimetro', 30.48, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[UnitConversions] OFF
GO
SET IDENTITY_INSERT [dbo].[UnitTypes] ON 

INSERT [dbo].[UnitTypes] ([Id], [Name], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (1, N'Longitud', CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[UnitTypes] ([Id], [Name], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (2, N'Masa', CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[UnitTypes] ([Id], [Name], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (3, N'Volumen', CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[UnitTypes] ([Id], [Name], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (4, N'Area', CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[UnitTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[UserRoles] ON 

INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [Deleted]) VALUES (1, 1, 1, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), N'01dlopezs98@gmail.com', N'01dlopezs98@gmail.com', 0)
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [Deleted]) VALUES (2, 2, 2, CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), N'01dlopezs98@gmail.com', N'01dlopezs98@gmail.com', 0)
SET IDENTITY_INSERT [dbo].[UserRoles] OFF
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
INSERT [dbo].[Warehouses] ([Id], [Name], [Description], [Location], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [Deleted]) VALUES (4, N'Almacén #243', N'Descripción del almacén', N'Casa', CAST(N'2021-01-17T19:34:57.760' AS DateTime), N'01dlopezs98@gmail.com', CAST(N'2021-01-17T19:34:57.813' AS DateTime), N'01dlopezs98@gmail.com', 0)
INSERT [dbo].[Warehouses] ([Id], [Name], [Description], [Location], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [Deleted]) VALUES (5, N'Bodega', N'Descripción', N'Ubicacion', CAST(N'2021-01-17T20:27:00.317' AS DateTime), N'01dlopezs98@gmail.com', CAST(N'2021-01-17T20:27:00.317' AS DateTime), N'01dlopezs98@gmail.com', 0)
SET IDENTITY_INSERT [dbo].[Warehouses] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Persons__49A14740EF1225EB]    Script Date: 15/2/2021 14:33:05 ******/
ALTER TABLE [dbo].[Persons] ADD UNIQUE NONCLUSTERED 
(
	[EmailAddress] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__C9F28456C2AF2E65]    Script Date: 15/2/2021 14:33:05 ******/
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
REFERENCES [dbo].[UnitConversions] ([Id])
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
ALTER TABLE [dbo].[PurchaseInvoices]  WITH CHECK ADD  CONSTRAINT [FK_PI_SUPPLIERS] FOREIGN KEY([SupplierId])
REFERENCES [dbo].[Suppliers] ([Id])
GO
ALTER TABLE [dbo].[PurchaseInvoices] CHECK CONSTRAINT [FK_PI_SUPPLIERS]
GO
ALTER TABLE [dbo].[RemovedProducts]  WITH CHECK ADD  CONSTRAINT [FK_RP_PRODUCTSTOCKS] FOREIGN KEY([ProductStocksId])
REFERENCES [dbo].[ProductStocks] ([Id])
GO
ALTER TABLE [dbo].[RemovedProducts] CHECK CONSTRAINT [FK_RP_PRODUCTSTOCKS]
GO
ALTER TABLE [dbo].[SalesDetails]  WITH CHECK ADD  CONSTRAINT [FK_SD_MEASUREUNITS] FOREIGN KEY([SaleUnitId])
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
REFERENCES [dbo].[UnitConversions] ([Id])
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
/****** Object:  StoredProcedure [dbo].[Sp_CreateDetailProductStocks]    Script Date: 15/2/2021 14:33:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_CreateDetailProductStocks]
@WarehouseId INT,
@ProductDetailCode NVARCHAR(255),
-- Unidad destino o unidad compra...
@TargetUnitId INT,
@Quantity FLOAT,
@PurchasePrice FLOAT,
-- Precio por unidad...
@SalePrice FLOAT,
--@SalePriceByUnitBase FLOAT,
@ExpirationDate DATETIME
AS
	BEGIN
		BEGIN TRY
			DECLARE @BaseUnitMeasureId INT, @Available BIT, @ProductStocksId INT, 
					@UnitConversionId INT, @ConversionValue FLOAT, @ConversionQuantity FLOAT, @SalePriceByUnitBase FLOAT;
			SET @ProductStocksId = IDENT_CURRENT('[dbo].[ProductStocks]');
			-- Unidad de medida base (origen)
			SET @BaseUnitMeasureId = (	SELECT [dbo].[Products].[MeasureUnitId] FROM [dbo].[ProductDetails]
										INNER JOIN [dbo].[Products] ON [dbo].[ProductDetails].[ProductId] = [dbo].[Products].[Id]
										WHERE [dbo].[ProductDetails].[Code] = @ProductDetailCode	);
			SET @Available = 1;
			-- Id de la Conversion de las unidades
			SET @UnitConversionId = (SELECT Id FROM UnitConversions WHERE IdMeasureUnitFrom = @TargetUnitId AND IdMeasureUnitTo = @BaseUnitMeasureId);
			-- Valor de la conversión
			SET @ConversionValue = (SELECT ConversionValue FROM UnitConversions WHERE Id = @UnitConversionId);
			-- Obtener el valor de la conversión multiplicado por la cantidad de compra
			SET @ConversionQuantity = @Quantity * @ConversionValue;
			--Precio por unidad base del producto
			SET @SalePriceByUnitBase = @SalePrice / @ConversionValue;
			INSERT INTO [dbo].[DetailProductStocks]
								(ProductStocksId, WarehouseId, ProductDetailCode, TargetUnitId, UnitConversionId, ExpirationDate, Quantity, OriginalQuantity, ConversionQuantity, PurchasePrice, SalePrice, SalePriceByUnitBase, Available)
						VALUES (@ProductStocksId, @WarehouseId, @ProductDetailCode, @TargetUnitId, @UnitConversionId, @ExpirationDate, 
								@Quantity, @Quantity, @ConversionQuantity, @PurchasePrice, @SalePrice, @SalePriceByUnitBase, @Available);
		END TRY
		BEGIN CATCH
			SELECT ERROR_MESSAGE() AS ErrorMessage, ERROR_STATE() AS ErrorState;
		END CATCH
	END
GO
/****** Object:  StoredProcedure [dbo].[Sp_CreatePendingTransfers]    Script Date: 15/2/2021 14:33:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_CreatePendingTransfers]
@ProductStocksId INT,
@LotNumber NVARCHAR(255),
@StocksCode NVARCHAR(255),
@ProductDetailCode NVARCHAR(255),
@WarehouseId INT, --Bodega origen
@TargetWarehouseId INT, --Bodega destino del producto
@TargetUnitId INT, --Nueva unidad medida
@PurchasedUnitId INT,
@UnitQuantity INT, --Cantidad de unidades a trasnferir
@UserName NVARCHAR(80),
@UnitTypeId INT
AS
BEGIN
	DECLARE @UnitBaseId INT, @Deleted BIT, @UnitConversionId INT, --id conversion respecto a la unidad base, 
			@ConversionValue FLOAT, @ConversionQuantity FLOAT, @Date DATETIME;
	SET @Deleted = 0; SET @Date = CURRENT_TIMESTAMP;
	SET @UnitBaseId = (SELECT [dbo].[Products].[MeasureUnitId] FROM [dbo].[ProductDetails]
						INNER JOIN [dbo].[Products] ON [dbo].[ProductDetails].[ProductId] = [dbo].[Products].[Id]
						WHERE [dbo].[ProductDetails].[Code] = @ProductDetailCode);
	SET @UnitConversionId = (SELECT Id FROM UnitConversions WHERE IdMeasureUnitFrom = @TargetUnitId AND IdMeasureUnitTo = @UnitBaseId);
	SET @ConversionValue = (SELECT ConversionValue FROM UnitConversions WHERE Id = @UnitConversionId);
	SET @ConversionQuantity = @UnitQuantity * @ConversionValue;

	INSERT INTO [dbo].[PendingTransfers] 
		   (ProductStocksId, LotNumber, StocksCode, ProductDetailCode, WarehouseId, TargetWarehouseId, 
			UnitBaseId, TargetUnitId, UnitQuantity, UnitConversionId, ConversionQuantity, CreatedAt, UpdatedAt, 
			CreatedBy, UpdatedBy, TransferStatus, PurchasedUnitId, UnitTypeId)
	 VALUES(@ProductStocksId, @LotNumber, @StocksCode, @ProductDetailCode, @WarehouseId, @TargetWarehouseId,
			@UnitBaseId, @TargetUnitId, @UnitQuantity, @UnitConversionId, @ConversionQuantity, @Date, @Date,
			@UserName, @UserName, 3, @PurchasedUnitId, @UnitTypeId);
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_CreatePerson]    Script Date: 15/2/2021 14:33:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_CreatePerson]
@FirstName NVARCHAR(50),
@LastName NVARCHAR(50),
@EmailAddress NVARCHAR(80),
@Address NVARCHAR(250),
@CardId NVARCHAR(20),
@PhoneNumber NVARCHAR(12)
AS
BEGIN
	INSERT INTO [dbo].[Persons] 
					(FirstName, LastName, EmailAddress, Address, CardId, PhoneNumber)
			Values	(@FirstName, @LastName, @EmailAddress, @Address, @CardId, @PhoneNumber);

	RETURN SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_CreateProductStocks]    Script Date: 15/2/2021 14:33:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_CreateProductStocks]
@SupplierId INT,
@Quantity INT,
@UserName NVARCHAR(80),
@TotalAmount FLOAT
AS
	BEGIN
		DECLARE @Date DATETIME, @Available BIT;
		SET @Date = CURRENT_TIMESTAMP;
		SET @Available = 1;

		INSERT INTO [dbo].[ProductStocks] 
					(SupplierId, Quantity, TotalAmount, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Available)
			VALUES	(@SupplierId, @Quantity, @TotalAmount, @Date, @UserName, @Date, @UserName, @Available);
	END
GO
/****** Object:  StoredProcedure [dbo].[Sp_CreateProductTransfers]    Script Date: 15/2/2021 14:33:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_CreateProductTransfers]
@TotalProducts INT,
@CreatedBy NVARCHAR(80),
@UpdatedBy NVARCHAR(80),
@TransferStatus INT
AS
BEGIN
	INSERT INTO ProductTransfers 
				(TotalProducts, CreatedAt, UpdatedAt, CreatedBy, UpdatedBy, TranferStatus)
		VALUES	(@TotalProducts, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, @CreatedBy, @UpdatedBy, @TransferStatus);
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_CreatePurchaseDetails]    Script Date: 15/2/2021 14:33:05 ******/
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
/****** Object:  StoredProcedure [dbo].[Sp_CreatePurchaseInvoices]    Script Date: 15/2/2021 14:33:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_CreatePurchaseInvoices]
@SupplierId INT,
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
						(SupplierId, SupplierInvoiceNumber, Tax, Subtotal, Discount, TotalAmount, Deleted, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy)
				VALUES	(@SupplierId, @SupplierInvoiceNumber, @Tax, @Subtotal, @Discount, @TotalAmount, @Deleted, @Date, @UserName, @Date, @UserName);
	END
GO
/****** Object:  StoredProcedure [dbo].[Sp_CreateSaleDetailInvoice]    Script Date: 15/2/2021 14:33:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_CreateSaleDetailInvoice]
@StockLotNumber NVARCHAR(255),
@ProductDetailCode NVARCHAR(255),
@WarehouseId INT,
@SaleUnitId INT, --Id de las unidades vendidas...
@PurchasedUnitId INT, -- .. unidades compradas
@UnitConversionId INT,
@ConversionValue FLOAT,
@Quantity INT,
@Price FLOAT,
@Subtotal FLOAT,
@Tax FLOAT,
@Discount INT,
@Total FLOAT
AS
BEGIN
	DECLARE @SaleInvoiceId INT;
	SET @SaleInvoiceId = IDENT_CURRENT('[dbo].[SalesInvoices]');
	INSERT INTO [dbo].[SalesDetails] 
	VALUES (@SaleInvoiceId, @StockLotNumber, @ProductDetailCode, @WarehouseId, @SaleUnitId, @PurchasedUnitId, @UnitConversionId, 
			@ConversionValue, @Quantity, @Price, @Subtotal, @Tax, @Discount, @Total);
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_CreateSaleInvoice]    Script Date: 15/2/2021 14:33:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Sp_CreateSaleInvoice]
@CustomerId INT = NUll,
@CustomerInvoice NVARCHAR(80),
@CurrencyExchangeId INT,
@Payment FLOAT,
@PaymentChange FLOAT,
@Tax FLOAT,
@Subtotal FLOAT,
@Discount INT,
@TotalAmount FLOAT,
@UserName NVARCHAR(80)
AS
BEGIN
	DECLARE @Date DATETIME, @Deleted BIT
	SET @Date = CURRENT_TIMESTAMP; SET @Deleted = 0;
	INSERT INTO [dbo].[SalesInvoices] (CustomerId, CustomerInvoice, CurrencyExchangeId, Payment, PaymentChange, Tax, Subtotal, Discount, TotalAmount, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy, Deleted)
							   VALUES (@CustomerId, @CustomerInvoice, @CurrencyExchangeId, @Payment, @PaymentChange, @Tax, @Subtotal, @Discount, @TotalAmount, @Date, @UserName, @Date, @UserName, @Deleted);
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_CreateTransferDetails]    Script Date: 15/2/2021 14:33:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_CreateTransferDetails]
@ProductStocksId INT,
@LotNumber NVARCHAR(255),
@StocksCode NVARCHAR(255),
@TargetWarehouseId INT,
@UnitBaseId INT,
@TargetUnitId INT,
@UnitQuantity INT,
@UnitConversionId INT,
@ConversionQuantity FLOAT
AS
BEGIN
	DECLARE @ProductTransferId INT;
	SET @ProductTransferId = IDENT_CURRENT('ProductTransfers');
	INSERT INTO TransfersDetails 
	VALUES	(@ProductTransferId, @ProductStocksId, @LotNumber, @StocksCode, @TargetWarehouseId, @UnitBaseId, 
			 @TargetUnitId, @UnitQuantity, @UnitConversionId, @ConversionQuantity);
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetInvoiceDetails]    Script Date: 15/2/2021 14:33:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Sp_GetInvoiceDetails]
@InvoiceId INT
AS
BEGIN
	SELECT	PurchaseDetails.Id, PurchaseInvoiceId, ProductDetailCode, 
			(	SELECT Name FROM ProductDetails INNER JOIN Products ON ProductDetails.ProductId = Products.Id
				WHERE ProductDetails.Code = ProductDetailCode) ProductName, 
			Warehouses.Name WarehouseName, MeasureUnits.Name MeasureUnit, Quantity, PurchasePrice, Subtotal, Tax, Discount, Total 
	FROM PurchaseDetails
	INNER JOIN Warehouses ON PurchaseDetails.WarehouseId = Warehouses.Id
	INNER JOIN MeasureUnits ON PurchaseDetails.TargetUnitId = MeasureUnits.Id
	WHERE PurchaseInvoiceId = @InvoiceId
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_ListPendingTransfer]    Script Date: 15/2/2021 14:33:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_ListPendingTransfer]
@Search NVARCHAR(255),
@TransferStatus INT
AS
BEGIN
	SELECT	PendingTransfers.Id, PendingTransfers.Code, ProductStocksId, Suppliers.Name SupplierName, PendingTransfers.LotNumber, StocksCode, ProductDetailCode, 
			Products.Name ProductName, WarehouseId, wh_source.Name SourceWarehouse, TargetWarehouseId, wh_target.Name TargetWarehouse, UnitBaseId, msu_base.Name UnitBaseName, 
			TargetUnitId, msu_target.Name TargetUnitName, UnitQuantity, UnitConversionId, ConversionQuantity, CONVERT(VARCHAR, PendingTransfers.CreatedAt, 106) CreatedAt,
			CONVERT(VARCHAR, PendingTransfers.UpdatedAt, 106) UpdatedAt, PendingTransfers.CreatedBy, PendingTransfers.UpdatedBy, PendingTransfers.TransferStatus, PurchasedUnitId
			INTO #PENDINGTRANSFERS
	FROM PendingTransfers
	INNER JOIN ProductStocks ON PendingTransfers.ProductStocksId = ProductStocks.Id
	INNER JOIN Suppliers ON ProductStocks.SupplierId = Suppliers.Id
	INNER JOIN ProductDetails ON PendingTransfers.ProductDetailCode = ProductDetails.Code
	INNER JOIN Products ON ProductDetails.ProductId = Products.Id
	INNER JOIN Warehouses AS wh_source ON PendingTransfers.WarehouseId = wh_source.Id
	INNER JOIN Warehouses AS wh_target ON PendingTransfers.TargetWarehouseId = wh_target.Id
	INNER JOIN MeasureUnits AS msu_base ON PendingTransfers.UnitBaseId = msu_base.Id
	INNER JOIN MeasureUnits AS msu_target ON PendingTransfers.TargetUnitId = msu_target.Id
	WHERE Products.Name LIKE @Search + '%' OR wh_source.Name LIKE @Search + '%' OR wh_target.Name LIKE @Search + '%' OR 
	PendingTransfers.LotNumber LIKE '%'+ @Search + '%' OR ProductDetailCode LIKE '%' + @Search + '%'
	ORDER BY PendingTransfers.CreatedAt DESC;

	IF(@TransferStatus != 0)
		SELECT * FROM #PENDINGTRANSFERS WHERE TransferStatus = @TransferStatus 
	ELSE 
		SELECT * FROM #PENDINGTRANSFERS

	DROP TABLE #PENDINGTRANSFERS
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_ListProductsDetails]    Script Date: 15/2/2021 14:33:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_ListProductsDetails]
@Deleted BIT = NULL,
@Search NVARCHAR(80)
AS
	BEGIN
		SELECT	ProductDetails.Id, Products.Name ProductName, Products.MeasureUnitId, MeasureUnits.Name MeasureUnit, MeasureUnits.UnitTypeId, MeasureUnits.Abbrevation, Brands.Name BrandName, Categories.Name CategoryName, MaterialsTypes.Name MaterialName, 
				ProductDetails.Code, DefaultCode, Dimensions, CONVERT(VARCHAR, ProductDetails.CreatedAt, 106) CreatedAt, CreatedBy, CONVERT(VARCHAR , ProductDetails.UpdatedAt, 106) UpdatedAt, UpdatedBy, 
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
/****** Object:  StoredProcedure [dbo].[Sp_ListProductStocks]    Script Date: 15/2/2021 14:33:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_ListProductStocks]
@Search NVARCHAR(255),
@Available BIT = NULL,
@StartDate DATETIME = NULL,
@EndDate DATETIME = NULL
AS
BEGIN
	SELECT	LotNumber, Suppliers.Name SupplierName, Quantity, TotalAmount, CONVERT(VARCHAR, ProductStocks.CreatedAt, 106) CreatedAt, ProductStocks.CreatedBy, 
			CONVERT(VARCHAR, ProductStocks.UpdatedAt, 106) UpdatedAt, ProductStocks.UpdatedBy, 
			Available = CASE(Available)
							WHEN 1 THEN 'Disponible'
							WHEN 0 THEN 'Agotado'
						END
			INTO #PRODUCTSTOCKS FROM ProductStocks
			INNER JOIN Suppliers ON ProductStocks.SupplierId = Suppliers.Id
			WHERE Available = ISNULL(@Available, 1) AND ProductStocks.CreatedAt BETWEEN ISNULL(@StartDate, '1998-10-01') AND ISNULL(@EndDate, CURRENT_TIMESTAMP);

			SELECT * FROM #PRODUCTSTOCKS
			WHERE LotNumber LIKE '%' + @Search + '%' OR SupplierName LIKE '%' + @Search + '%'
			ORDER BY CreatedAt DESC

			DROP TABLE #PRODUCTSTOCKS
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_ListProductStocksDetails]    Script Date: 15/2/2021 14:33:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_ListProductStocksDetails]
@LotNumber NVARCHAR(255),
@Search NVARCHAR(255),
@WarehouseId INT = NULL
AS
BEGIN
	SELECT	ProductStocksId, LotNumber, Suppliers.Name SupplierName, DetailProductStocks.Code StocksCode, WarehouseId, Warehouses.Name WarehouseName, DetailProductStocks.ProductDetailCode, Products.Name ProductName, Brands.Name BrandName,
			TargetUnitId PurchaseUnitId, mu_stocksdetails.Name PurchaseUnitName, Products.MeasureUnitId UnitBaseId, mu_prod.Name UnitBaseName, mu_stocksdetails.UnitTypeId, ConversionQuantity ConversionValue, Categories.Name CategoryName, 
			MaterialsTypes.Name MaterialName, Dimensions, OriginalQuantity, DetailProductStocks.Quantity StocksQuantity, PurchasePrice, SalePrice, ROUND(SalePriceByUnitBase, 2) SalePriceByUnitBase, CONVERT(VARCHAR, ExpirationDate, 106) ExpirationDate,
			Available = CASE(DetailProductStocks.Available)
							WHEN 1 THEN 'Disponible'
							WHEN 2 THEN 'Agotado'
						END
				INTO #STOCKSDETAILS
			FROM DetailProductStocks
			INNER JOIN ProductStocks ON DetailProductStocks.ProductStocksId = ProductStocks.Id
			INNER JOIN ProductDetails ON DetailProductStocks.ProductDetailCode = ProductDetails.Code
			INNER JOIN Warehouses ON DetailProductStocks.WarehouseId = Warehouses.Id
			INNER JOIN MeasureUnits as mu_stocksdetails ON DetailProductStocks.TargetUnitId = mu_stocksdetails.Id
			INNER JOIN Products ON ProductDetails.ProductId = Products.Id
			INNER JOIN Brands ON ProductDetails.BrandId = Brands.Id
			INNER JOIN Categories ON ProductDetails.CategoryId = Categories.Id
			INNER JOIN MaterialsTypes ON ProductDetails.MaterialTypeId = MaterialsTypes.Id
			INNER JOIN MeasureUnits as mu_prod ON Products.MeasureUnitId = mu_prod.Id
			INNER JOIN Suppliers ON ProductStocks.SupplierId = Suppliers.Id
	WHERE	DetailProductStocks.Code LIKE '%' + @Search + '%' OR Warehouses.Name LIKE @Search + '%' OR ProductDetailCode LIKE '%' + @Search + '%' OR Products.Name LIKE '%'+ @Search +'%' OR
			Brands.Name LIKE @Search + '%' OR Categories.Name LIKE @Search + '%' OR ProductDetails.Dimensions LIKE '%' + @Search + '%'
	
			IF(ISNULL(@WarehouseId, 0) <> 0)
				BEGIN
					SELECT * FROM #STOCKSDETAILS Where WarehouseId = @WarehouseId AND LotNumber = @LotNumber;
				END
			ELSE IF(@LotNumber <> '0')
				SELECT * FROM #STOCKSDETAILS WHERE LotNumber = @LotNumber;
			ELSE IF (@LotNumber = '0')
				SELECT * FROM #STOCKSDETAILS;

			DROP TABLE #STOCKSDETAILS
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_ListProductsTransfer]    Script Date: 15/2/2021 14:33:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[Sp_ListProductsTransfer]
@Search NVARCHAR(255),
@StartDate DATE = NULL,
@EndDate DATE = NULL
AS
BEGIN
	SELECT	Id, Code, TotalProducts, CONVERT(VARCHAR, CreatedAt, 106) CreatedAt, CONVERT(VARCHAR, UpdatedAt, 106) UpdatedAt, 
			CreatedBy, UpdatedBy, TranferStatus
			INTO #PRODUCTSTRANSFERS
	FROM ProductTransfers
	WHERE CreatedAt BETWEEN ISNULL(@StartDate, '1998-10-01') AND ISNULL(@EndDate, DATEADD(DAY, 1, CURRENT_TIMESTAMP));

	SELECT * FROM #PRODUCTSTRANSFERS
	WHERE Code LIKE '%' + @Search + '%' OR CreatedBy LIKE @Search + '%';

	DROP TABLE #PRODUCTSTRANSFERS
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_ListPurchaseInvoices]    Script Date: 15/2/2021 14:33:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_ListPurchaseInvoices]
@StartDate DATE = NULL,
@EndDate DATE = NULL,
@Search NVARCHAR(MAX)
AS
BEGIN
	SELECT	PurchaseInvoices.Id, Suppliers.Name SupplierName, SupplierInvoiceNumber, InvoiceNumber, Tax, Subtotal, Discount, TotalAmount, 
			CONVERT(VARCHAR, PurchaseInvoices.CreatedAt, 106) CreationDate, PurchaseInvoices.CreatedBy , CONVERT(VARCHAR, PurchaseInvoices.UpdatedAt, 106) UpdateDate, PurchaseInvoices.UpdatedBy
	INTO #INVOICES FROM PurchaseInvoices INNER JOIN Suppliers ON PurchaseInvoices.SupplierId = Suppliers.Id
	WHERE PurchaseInvoices.CreatedAt BETWEEN ISNULL(@StartDate, '01-10-1998') AND ISNULL(@EndDate, CURRENT_TIMESTAMP);

	SELECT * FROM #INVOICES WHERE 
	SupplierName LIKE @Search + '%' OR InvoiceNumber LIKE '%' + @Search + '%' OR CreatedBy LIKE @Search + '%' OR SupplierInvoiceNumber LIKE '%' + @Search + '%'
	ORDER BY CreationDate DESC

	DROP TABLE #INVOICES;
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_ListRemovedProducts]    Script Date: 15/2/2021 14:33:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_ListRemovedProducts]
@StartDate DATE = NULL,
@EndDate DATE = NULL,
@Search NVARCHAR(255)
AS
BEGIN
	SELECT	RemovedProducts.Id, Warehouses.Name WarehouseName, Products.Name ProductName, Title, RemovedProducts.Description, RemovedProducts.ProductStocksId, DetailProductStocks.ProductDetailCode, 
			LotNumber, StocksDetailCode, msu_removed.Name MeasureUnitName, RemovedProducts.MeasureUnitId, UnitQuantity, 
			msu_base.Name UnitBaseName, UnitBaseId, RemovedProducts.ConversionQuantity, RemovedProducts.CreatedAt, RemovedProducts.CreatedBy
		INTO #REMOVEDPRODUCTS
	FROM RemovedProducts
	INNER JOIN DetailProductStocks ON RemovedProducts.StocksDetailCode = DetailProductStocks.Code
	INNER JOIN ProductDetails ON DetailProductStocks.ProductDetailCode = ProductDetails.Code
	INNER JOIN Products ON ProductDetails.ProductId = Products.Id
	INNER JOIN Warehouses ON DetailProductStocks.WarehouseId = Warehouses.Id
	INNER JOIN MeasureUnits AS msu_removed ON RemovedProducts.MeasureUnitId = msu_removed.Id
	INNER JOIN MeasureUnits AS msu_base ON RemovedProducts.UnitBaseId = msu_base.Id
	WHERE RemovedProducts.CreatedAt BETWEEN ISNULL(@StartDate, '1998-10-01') AND ISNULL(@EndDate, CURRENT_TIMESTAMP);

	SELECT * FROM #REMOVEDPRODUCTS 
	WHERE	LotNumber LIKE '%' + @Search + '%' OR WarehouseName LIKE @Search + '%' OR ProductName LIKE @Search + '%' OR Title LIKE '%'+ @Search + '%' OR
			CreatedBy LIKE @Search + '%' ORDER BY CreatedAt DESC;

	DROP TABLE #REMOVEDPRODUCTS;
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_ListSaleInvoices]    Script Date: 15/2/2021 14:33:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Danny López
-- Create date: 27-01-2021
-- Description:	Sales Transaction List
-- =============================================
CREATE PROCEDURE [dbo].[Sp_ListSaleInvoices] 
	-- Add the parameters for the stored procedure here
	@Search nvarchar(255), 
	@StartDate DATE = NULL,
	@EndDate DATE = NULL
AS
BEGIN
	SELECT	SalesInvoices.Id, InvoiceNumber, CustomerInvoice CustomerName, ForeignCurrencies.Name ForeignCurrency, 
			ForeignCurrencies.Symbol ForeignSymbol, CurrencyExchange.Sale CurrencySale, CurrencyExchange.Purchase CurrencyPurchase, 
			LocalCurrencies.Name LocalCurrency, LocalCurrencies.Symbol LocalSymbol, Payment, PaymentChange, Tax, 
			Subtotal, Discount, TotalAmount, 
			CONVERT(VARCHAR, SalesInvoices.CreatedAt, 106) CreatedAt, SalesInvoices.CreatedBy,  
			CONVERT(VARCHAR, SalesInvoices.UpdatedAt, 106) UpdatedAt, SalesInvoices.UpdatedBy
			INTO #SALEINVOICES
	FROM SalesInvoices
	INNER JOIN CurrencyExchange ON SalesInvoices.CurrencyExchangeId = CurrencyExchange.Id
	INNER JOIN ForeignCurrencies ON CurrencyExchange.ForeignId = ForeignCurrencies.Id
	INNER JOIN LocalCurrencies ON CurrencyExchange.LocalId = LocalCurrencies.Id
	WHERE SalesInvoices.CreatedAt BETWEEN ISNULL(@StartDate, '01-10-1998') AND ISNULL(@EndDate, CURRENT_TIMESTAMP)
	ORDER BY SalesInvoices.CreatedAt DESC

	SELECT * FROM #SALEINVOICES WHERE InvoiceNumber 
		LIKE '%' + @Search + '%' OR CustomerName LIKE '%'+ @Search +'%' OR CreatedBy LIKE '%'+ @Search +'%'

	DROP TABLE #SALEINVOICES
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_ListSalesDetails]    Script Date: 15/2/2021 14:33:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Sp_ListSalesDetails]
@InvoiceId INT
AS
BEGIN
	SELECT	InvoiceNumber, SalesDetails.Id, StockLotNumber, ProductDetailCode, Warehouses.Name WarehouseName, msu_sale.Name SaleUnitName, msu_purchase.Name PurchasedUnitName,  
			ConversionValue, Quantity, Price, SalesDetails.Subtotal, SalesDetails.Tax, SalesDetails.Discount, Total
	FROM SalesDetails
	INNER JOIN SalesInvoices ON SalesDetails.SaleInvoiceId = SalesInvoices.Id
	INNER JOIN Warehouses ON SalesDetails.WarehouseId = Warehouses.Id
	INNER JOIN MeasureUnits AS msu_sale ON SalesDetails.SaleUnitId = msu_sale.Id
	INNER JOIN MeasureUnits AS msu_purchase ON SalesDetails.PurchasedUnitId = msu_purchase.Id
	WHERE SalesDetails.SaleInvoiceId = @InvoiceId
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_ListSuppliers]    Script Date: 15/2/2021 14:33:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_ListSuppliers]
@Search NVARCHAR(300)
AS
BEGIN
	SELECT * FROM Suppliers 
	WHERE	Name LIKE '%' + @Search + '%' OR Code LIKE '%' + @Search + '%' OR Email LIKE '%' + @Search + '%' OR
			Address LIKE '%' + @Search + '%' AND Deleted = 0
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_ListTransferDetails]    Script Date: 15/2/2021 14:33:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_ListTransferDetails] 
@TransferId INT, 
@Search NVARCHAR(255)
AS
BEGIN
	SELECT	TransfersDetails.Id, ProductTransfers.Code, ProductTransferId, TransfersDetails.ProductStocksId, Suppliers.Name SupplierName, TransfersDetails.LotNumber, StocksCode, ProductDetailCode, 
			Products.Name ProductName, WarehouseId, wh_source.Name SourceWarehouse, TargetWarehouseId, wh_target.Name TargetWarehouse, UnitBaseId, msu_base.Name UnitBaseName, 
			TransfersDetails.TargetUnitId, msu_target.Name TargetUnitName, UnitQuantity, TransfersDetails.UnitConversionId, TransfersDetails.ConversionQuantity
			INTO #TRANSFERDETAILS
	FROM TransfersDetails
	INNER JOIN ProductTransfers ON TransfersDetails.ProductTransferId = ProductTransfers.Id
	INNER JOIN ProductStocks ON TransfersDetails.ProductStocksId = ProductStocks.Id
	INNER JOIN Suppliers ON ProductStocks.SupplierId = Suppliers.Id
	INNER JOIN DetailProductStocks ON TransfersDetails.StocksCode = DetailProductStocks.Code
	INNER JOIN ProductDetails ON DetailProductStocks.ProductDetailCode = ProductDetails.Code
	INNER JOIN Products ON ProductDetails.ProductId = Products.Id
	INNER JOIN Warehouses AS wh_source ON DetailProductStocks.WarehouseId = wh_source.Id
	INNER JOIN Warehouses AS wh_target ON TransfersDetails.TargetWarehouseId = wh_target.Id
	INNER JOIN MeasureUnits AS msu_base ON TransfersDetails.UnitBaseId = msu_base.Id
	INNER JOIN MeasureUnits AS msu_target ON TransfersDetails.TargetUnitId = msu_target.Id
	WHERE ProductTransferId = @TransferId	

	SELECT * FROM #TRANSFERDETAILS
	WHERE ProductName LIKE @Search + '%' OR SourceWarehouse LIKE @Search + '%' OR TargetWarehouse LIKE @Search + '%' OR 
	LotNumber LIKE '%'+ @Search + '%' OR ProductDetailCode LIKE '%' + @Search + '%' OR SupplierName LIKE @Search + '%'

	DROP TABLE #TRANSFERDETAILS
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_ListUsers]    Script Date: 15/2/2021 14:33:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_ListUsers]
@Search NVARCHAR(255),
@RoleId INT
AS
BEGIN
	SELECT UserRoles.Id, UserId, RoleId, Roles.Name Role, Employees.Id EmployeeId, Persons.FullName FullName, 
	Persons.EmailAddress, Users.UserName UserName, Users.ImageUrl Image 
	INTO #USERROLES
	FROM UserRoles
	INNER JOIN Users ON UserRoles.UserId = Users.Id
	INNER JOIN Roles ON UserRoles.RoleId = Roles.Id
	INNER JOIN Employees ON Users.EmployeeId = Employees.Id
	INNER JOIN Persons ON Employees.PersonId = Persons.Id
	WHERE Roles.Name LIKE @Search + '%' OR FullName LIKE '%' + @Search + '%' OR EmailAddress LIKE @Search + '%'
	OR UserName LIKE @Search + '%' AND UserRoles.Deleted = 0
	ORDER BY UserRoles.CreatedAt DESC

	IF(@RoleId <> 0)
		SELECT * FROM #USERROLES WHERE RoleId = @RoleId
	ELSE
		SELECT * FROM #USERROLES

	DROP TABLE #USERROLES
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_UpdatePendingTransfer]    Script Date: 15/2/2021 14:33:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_UpdatePendingTransfer]
@Code VARCHAR(MAX),
@TargetWarehouseId INT,
@TargetUnitId INT,
@UnitQuantity INT,
@UserName NVARCHAR(80)
AS
BEGIN
	DECLARE @UnitBaseId INT, @UnitConversionId INT, --id conversion respecto a la unidad base, 
			@ConversionValue FLOAT, @ConversionQuantity FLOAT, @Date DATETIME;

	SET @UnitBaseId = (SELECT UnitBaseId  FROM PendingTransfers WHERE Code = @Code);
	SET @UnitConversionId = (SELECT Id FROM UnitConversions WHERE IdMeasureUnitFrom = @TargetUnitId AND IdMeasureUnitTo = @UnitBaseId);
	SET @ConversionValue = (SELECT ConversionValue FROM UnitConversions WHERE Id = @UnitConversionId);
	SET @ConversionQuantity = @UnitQuantity * @ConversionValue;
	UPDATE PendingTransfers
	SET TargetWarehouseId = @TargetWarehouseId,
		TargetUnitId = @TargetUnitId,
		UnitQuantity = @UnitQuantity,
		UnitConversionId = @UnitConversionId,
		ConversionQuantity = @ConversionQuantity,
		UpdatedBy = @UserName,
		UpdatedAt = CURRENT_TIMESTAMP
	WHERE Code = @Code
END
GO
USE [master]
GO
ALTER DATABASE [HardwareStore_Dev] SET  READ_WRITE 
GO
