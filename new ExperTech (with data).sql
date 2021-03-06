USE [master]
GO
/****** Object:  Database [ExperTech]    Script Date: 10-Sep-20 5:34:12 AM ******/
CREATE DATABASE [ExperTech]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ExperTech', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ExperTech.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ExperTech_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ExperTech_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ExperTech] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ExperTech].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ExperTech] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ExperTech] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ExperTech] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ExperTech] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ExperTech] SET ARITHABORT OFF 
GO
ALTER DATABASE [ExperTech] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ExperTech] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ExperTech] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ExperTech] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ExperTech] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ExperTech] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ExperTech] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ExperTech] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ExperTech] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ExperTech] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ExperTech] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ExperTech] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ExperTech] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ExperTech] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ExperTech] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ExperTech] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ExperTech] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ExperTech] SET RECOVERY FULL 
GO
ALTER DATABASE [ExperTech] SET  MULTI_USER 
GO
ALTER DATABASE [ExperTech] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ExperTech] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ExperTech] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ExperTech] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ExperTech] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ExperTech', N'ON'
GO
USE [ExperTech]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 10-Sep-20 5:34:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Admin](
	[AdminID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Surname] [varchar](100) NOT NULL,
	[ContactNo] [varchar](10) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[UserID] [int] NULL,
	[Deleted] [bit] NOT NULL DEFAULT ((0)),
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[AdminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Basket]    Script Date: 10-Sep-20 5:34:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Basket](
	[BasketID] [int] IDENTITY(1,1) NOT NULL,
	[ClientID] [int] NOT NULL,
 CONSTRAINT [PK_Basket] PRIMARY KEY CLUSTERED 
(
	[BasketID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BasketLine]    Script Date: 10-Sep-20 5:34:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BasketLine](
	[LineID] [int] IDENTITY(1,1) NOT NULL,
	[BasketID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_BasketLine] PRIMARY KEY CLUSTERED 
(
	[LineID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Booking]    Script Date: 10-Sep-20 5:34:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking](
	[BookingID] [int] IDENTITY(1,1) NOT NULL,
	[StatusID] [int] NOT NULL,
	[ClientID] [int] NOT NULL,
	[ReminderID] [int] NOT NULL,
	[SaleID] [int] NULL,
 CONSTRAINT [PK_BookingID] PRIMARY KEY CLUSTERED 
(
	[BookingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BookingLine]    Script Date: 10-Sep-20 5:34:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookingLine](
	[LineID] [int] IDENTITY(1,1) NOT NULL,
	[BookingID] [int] NOT NULL,
	[ServiceID] [int] NOT NULL,
	[OptionID] [int] NULL,
 CONSTRAINT [PK_BookingLine] PRIMARY KEY CLUSTERED 
(
	[LineID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BookingNotes]    Script Date: 10-Sep-20 5:34:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BookingNotes](
	[NotesID] [int] IDENTITY(1,1) NOT NULL,
	[Note] [varchar](100) NOT NULL,
	[BookingID] [int] NOT NULL,
 CONSTRAINT [PK_BookingNotes] PRIMARY KEY CLUSTERED 
(
	[NotesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BookingStatus]    Script Date: 10-Sep-20 5:34:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BookingStatus](
	[StatusID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [varchar](20) NOT NULL,
 CONSTRAINT [PK_BookingStatus] PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Client]    Script Date: 10-Sep-20 5:34:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Client](
	[ClientID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Surname] [varchar](100) NOT NULL,
	[ContactNo] [varchar](10) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[UserID] [int] NULL,
	[Deleted] [bit] NOT NULL DEFAULT ((0)),
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[ClientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ClientPackage]    Script Date: 10-Sep-20 5:34:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientPackage](
	[SaleID] [int] NOT NULL,
	[PackageID] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[ExpiryDate] [date] NOT NULL,
 CONSTRAINT [PK_ClientPackage] PRIMARY KEY CLUSTERED 
(
	[SaleID] ASC,
	[PackageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CompanyInfo]    Script Date: 10-Sep-20 5:34:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CompanyInfo](
	[InfoID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](150) NOT NULL,
	[Address] [varchar](250) NOT NULL,
	[ContactNo] [varchar](10) NOT NULL,
 CONSTRAINT [PK_CompanyInfo] PRIMARY KEY CLUSTERED 
(
	[InfoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Date]    Script Date: 10-Sep-20 5:34:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Date](
	[DateID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NOT NULL,
 CONSTRAINT [PK_Date] PRIMARY KEY CLUSTERED 
(
	[DateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DateRequested]    Script Date: 10-Sep-20 5:34:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DateRequested](
	[RequestedID] [int] IDENTITY(1,1) NOT NULL,
	[BookingID] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[StartTime] [time](7) NOT NULL,
 CONSTRAINT [PK_DateRequested] PRIMARY KEY CLUSTERED 
(
	[RequestedID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee]    Script Date: 10-Sep-20 5:34:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Surname] [varchar](100) NOT NULL,
	[ContactNo] [varchar](10) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[UserID] [int] NULL,
	[Deleted] [bit] NOT NULL DEFAULT ((0)),
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EmployeeSchedule]    Script Date: 10-Sep-20 5:34:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeSchedule](
	[EmployeeID] [int] NOT NULL,
	[TimeID] [int] NOT NULL,
	[DateID] [int] NOT NULL,
	[StatusID] [int] NOT NULL,
	[BookingID] [int] NULL,
 CONSTRAINT [PK_EmployeeSchedule] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC,
	[TimeID] ASC,
	[DateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EmployeeServiceType]    Script Date: 10-Sep-20 5:34:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeServiceType](
	[EmpTypeID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[TypeID] [int] NOT NULL,
 CONSTRAINT [PK_EmployeeServiceType] PRIMARY KEY CLUSTERED 
(
	[EmpTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[InstanceStatus]    Script Date: 10-Sep-20 5:34:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InstanceStatus](
	[StatusID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [varchar](20) NOT NULL,
 CONSTRAINT [PK_InstanceStatus] PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PackageInstance]    Script Date: 10-Sep-20 5:34:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PackageInstance](
	[InstanceID] [int] IDENTITY(1,1) NOT NULL,
	[SaleID] [int] NOT NULL,
	[PackageID] [int] NOT NULL,
	[StatusID] [int] NOT NULL,
	[LineID] [int] NULL,
	[Date] [date] NULL,
 CONSTRAINT [PK_PackageInstance] PRIMARY KEY CLUSTERED 
(
	[InstanceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PaymentType]    Script Date: 10-Sep-20 5:34:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PaymentType](
	[PaymentTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [varchar](25) NOT NULL,
 CONSTRAINT [PK_PaymentType] PRIMARY KEY CLUSTERED 
(
	[PaymentTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Product]    Script Date: 10-Sep-20 5:34:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[SupplierID] [int] NULL,
	[CategoryID] [int] NULL,
	[Name] [varchar](50) NOT NULL,
	[QuantityOnHand] [int] NOT NULL,
	[Description] [varchar](150) NOT NULL,
	[Price] [decimal](6, 2) NOT NULL,
	[Deleted] [bit] NOT NULL DEFAULT ((0)),
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 10-Sep-20 5:34:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Category] [varchar](25) NOT NULL,
 CONSTRAINT [PK_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProductPhoto]    Script Date: 10-Sep-20 5:34:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[ProductPhoto](
	[PhotoID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[Photo] [varchar](max) NOT NULL,
 CONSTRAINT [PK_ProductPhoto] PRIMARY KEY CLUSTERED 
(
	[PhotoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Reminder]    Script Date: 10-Sep-20 5:34:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Reminder](
	[ReminderID] [int] IDENTITY(1,1) NOT NULL,
	[TypeID] [int] NOT NULL,
	[Text] [varchar](100) NOT NULL,
	[NumHours] [int] NOT NULL,
 CONSTRAINT [PK_Reminder] PRIMARY KEY CLUSTERED 
(
	[ReminderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ReminderType]    Script Date: 10-Sep-20 5:34:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ReminderType](
	[TypeID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [varchar](20) NOT NULL,
 CONSTRAINT [PK_ReminderType] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sale]    Script Date: 10-Sep-20 5:34:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sale](
	[SaleID] [int] IDENTITY(1,1) NOT NULL,
	[StatusID] [int] NOT NULL,
	[ReminderID] [int] NULL,
	[PaymentTypeID] [int] NULL,
	[ClientID] [int] NOT NULL,
	[SaleTypeID] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[Payment] [decimal](6, 2) NULL,
 CONSTRAINT [PK_Sale] PRIMARY KEY CLUSTERED 
(
	[SaleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SaleLine]    Script Date: 10-Sep-20 5:34:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SaleLine](
	[LineID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[SaleID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_SaleLine] PRIMARY KEY CLUSTERED 
(
	[LineID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SaleStatus]    Script Date: 10-Sep-20 5:34:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SaleStatus](
	[StatusID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [varchar](15) NULL,
 CONSTRAINT [PK_SaleStatus] PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SaleType]    Script Date: 10-Sep-20 5:34:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SaleType](
	[SaleTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [varchar](50) NOT NULL,
 CONSTRAINT [PK_SaleType] PRIMARY KEY CLUSTERED 
(
	[SaleTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Schedule]    Script Date: 10-Sep-20 5:34:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedule](
	[DateID] [int] NOT NULL,
	[TimeID] [int] NOT NULL,
 CONSTRAINT [PK_Schedule] PRIMARY KEY CLUSTERED 
(
	[DateID] ASC,
	[TimeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ScheduleStatus]    Script Date: 10-Sep-20 5:34:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ScheduleStatus](
	[StatusID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [varchar](20) NOT NULL,
 CONSTRAINT [PK_ScheduleStatus] PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Service]    Script Date: 10-Sep-20 5:34:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Service](
	[ServiceID] [int] IDENTITY(1,1) NOT NULL,
	[TypeID] [int]  NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](240) NULL,
	[Duration] [int] NOT NULL,
	[Deleted] [bit] NOT NULL DEFAULT ((0)),
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[ServiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ServiceOption]    Script Date: 10-Sep-20 5:34:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ServiceOption](
	[OptionID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](25) NOT NULL,
	[Duration] [int] NOT NULL,
	[Deleted] [bit] NOT NULL DEFAULT ((0)),
 CONSTRAINT [PK_ServiceOption] PRIMARY KEY CLUSTERED 
(
	[OptionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ServicePackage]    Script Date: 10-Sep-20 5:34:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ServicePackage](
	[PackageID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceID] [int] NOT NULL,
	[Description] [varchar](50) NOT NULL,
	[Price] [decimal](6, 2) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Duration] [int] NOT NULL,
	[Deleted] [bit] NOT NULL DEFAULT ((0)),
 CONSTRAINT [PK_ServicePackage] PRIMARY KEY CLUSTERED 
(
	[PackageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ServicePhoto]    Script Date: 10-Sep-20 5:34:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[ServicePhoto](
	[PhotoID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceID] [int] NOT NULL,
	[Photo] [varchar](max) NOT NULL,
 CONSTRAINT [PK_ServicePhoto] PRIMARY KEY CLUSTERED 
(
	[PhotoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ServicePrice]    Script Date: 10-Sep-20 5:34:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServicePrice](
	[PriceID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceID] [int] NOT NULL,
	[OptionID] [int] NULL,
	[Price] [decimal](6, 2) NOT NULL,
	[Date] [datetime] NOT NULL,
 CONSTRAINT [PK_ServicePrice] PRIMARY KEY CLUSTERED 
(
	[PriceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ServiceType]    Script Date: 10-Sep-20 5:34:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ServiceType](
	[TypeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](240) NOT NULL,
 CONSTRAINT [PK_ServiceType] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ServiceTypeOption]    Script Date: 10-Sep-20 5:34:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceTypeOption](
	[ServiceID] [int] NOT NULL,
	[OptionID] [int] NOT NULL,
 CONSTRAINT [PK_ServiceTypeOption] PRIMARY KEY CLUSTERED 
(
	[ServiceID] ASC,
	[OptionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SocialMedia]    Script Date: 10-Sep-20 5:34:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SocialMedia](
	[SocialID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Link] [varchar](150) NOT NULL,
 CONSTRAINT [PK_SocialMedia] PRIMARY KEY CLUSTERED 
(
	[SocialID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StockItem]    Script Date: 10-Sep-20 5:34:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StockItem](
	[ItemID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](150) NOT NULL,
	[Price] [decimal](6, 2) NOT NULL,
	[QuantityInStock] [int] NOT NULL,
	[Deleted] [bit] NOT NULL DEFAULT ((0)),
 CONSTRAINT [PK_StockItem] PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StockItemLine]    Script Date: 10-Sep-20 5:34:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockItemLine](
	[LineID] [int] IDENTITY(1,1) NOT NULL,
	[ItemID] [int] NOT NULL,
	[OrderID] [int] NOT NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_StockItemLine] PRIMARY KEY CLUSTERED 
(
	[LineID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StockTake]    Script Date: 10-Sep-20 5:34:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StockTake](
	[StockTakeID] [int] IDENTITY(1,1) NOT NULL,
	[AdminID] [int] NOT NULL,
	[Description] [varchar](50) NOT NULL,
	[Date] [datetime] NOT NULL,
 CONSTRAINT [PK_StockTake] PRIMARY KEY CLUSTERED 
(
	[StockTakeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StockTakeLine]    Script Date: 10-Sep-20 5:34:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockTakeLine](
	[LineID] [int] IDENTITY(1,1) NOT NULL,
	[ItemID] [int] NOT NULL,
	[StockTakeID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_StockTakeLine] PRIMARY KEY CLUSTERED 
(
	[LineID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StockWriteOff]    Script Date: 10-Sep-20 5:34:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StockWriteOff](
	[WriteOffID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](50) NOT NULL,
	[Date] [date] NOT NULL,
 CONSTRAINT [PK_StockWriteOff] PRIMARY KEY CLUSTERED 
(
	[WriteOffID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 10-Sep-20 5:34:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Supplier](
	[SupplierID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[ContactNo] [varchar](10) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Address] [varchar](100) NOT NULL,
	[Deleted] [bit] NOT NULL DEFAULT ((0)),
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SupplierOrder]    Script Date: 10-Sep-20 5:34:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SupplierOrder](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[SupplierID] [int] NULL,
	[Description] [varchar](50) NOT NULL,
	[Price] [decimal](6, 2) NOT NULL,
	[Date] [date] NOT NULL,
 CONSTRAINT [PK_SupplierOrder] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Timeslot]    Script Date: 10-Sep-20 5:34:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Timeslot](
	[TimeID] [int] IDENTITY(1,1) NOT NULL,
	[StartTime] [time](7) NOT NULL,
	[EndTime] [time](7) NOT NULL,
	[Deleted] [bit] NOT NULL DEFAULT ((0)),
 CONSTRAINT [PK_Timeslot] PRIMARY KEY CLUSTERED 
(
	[TimeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 10-Sep-20 5:34:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[RoleID] [int] NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](300) NOT NULL,
	[SessionID] [varchar](100) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 10-Sep-20 5:34:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserRole](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[Role] [varchar](25) NOT NULL,
 CONSTRAINT [PK_UserRole] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[WriteOffLine]    Script Date: 10-Sep-20 5:34:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WriteOffLine](
	[LineID] [int] IDENTITY(1,1) NOT NULL,
	[ItemID] [int] NOT NULL,
	[WriteOffID] [int] NOT NULL,
	[Reason] [varchar](50) NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_WriteOffLine] PRIMARY KEY CLUSTERED 
(
	[LineID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([AdminID], [Name], [Surname], [ContactNo], [Email], [UserID], [Deleted]) VALUES (1, N'Madam', N'Secretary', N'012345689', N'Admin@gmail.com', 2, 0)
SET IDENTITY_INSERT [dbo].[Admin] OFF
SET IDENTITY_INSERT [dbo].[Basket] ON 

INSERT [dbo].[Basket] ([BasketID], [ClientID]) VALUES (1, 1)
INSERT [dbo].[Basket] ([BasketID], [ClientID]) VALUES (2, 2)
INSERT [dbo].[Basket] ([BasketID], [ClientID]) VALUES (3, 4)
SET IDENTITY_INSERT [dbo].[Basket] OFF
SET IDENTITY_INSERT [dbo].[BasketLine] ON 

INSERT [dbo].[BasketLine] ([LineID], [BasketID], [ProductID], [Quantity]) VALUES (1, 1, 3, 2)
SET IDENTITY_INSERT [dbo].[BasketLine] OFF
SET IDENTITY_INSERT [dbo].[Booking] ON 

INSERT [dbo].[Booking] ([BookingID], [StatusID], [ClientID], [ReminderID], [SaleID]) VALUES (1, 1, 1, 2, NULL)
INSERT [dbo].[Booking] ([BookingID], [StatusID], [ClientID], [ReminderID], [SaleID]) VALUES (2, 2, 4, 2, NULL)
INSERT [dbo].[Booking] ([BookingID], [StatusID], [ClientID], [ReminderID], [SaleID]) VALUES (3, 4, 4, 2, NULL)
INSERT [dbo].[Booking] ([BookingID], [StatusID], [ClientID], [ReminderID], [SaleID]) VALUES (4, 5, 1, 2, NULL)
INSERT [dbo].[Booking] ([BookingID], [StatusID], [ClientID], [ReminderID], [SaleID]) VALUES (5, 6, 4, 2, NULL)
SET IDENTITY_INSERT [dbo].[Booking] OFF
SET IDENTITY_INSERT [dbo].[BookingLine] ON 

INSERT [dbo].[BookingLine] ([LineID], [BookingID], [ServiceID], [OptionID]) VALUES (1, 5, 4, NULL)
INSERT [dbo].[BookingLine] ([LineID], [BookingID], [ServiceID], [OptionID]) VALUES (2, 2, 1, 1)
INSERT [dbo].[BookingLine] ([LineID], [BookingID], [ServiceID], [OptionID]) VALUES (6, 3, 2, NULL)
INSERT [dbo].[BookingLine] ([LineID], [BookingID], [ServiceID], [OptionID]) VALUES (7, 1, 4, NULL)
INSERT [dbo].[BookingLine] ([LineID], [BookingID], [ServiceID], [OptionID]) VALUES (8, 4, 1, 3)
SET IDENTITY_INSERT [dbo].[BookingLine] OFF
SET IDENTITY_INSERT [dbo].[BookingStatus] ON 

INSERT [dbo].[BookingStatus] ([StatusID], [Status]) VALUES (1, N'Requested')
INSERT [dbo].[BookingStatus] ([StatusID], [Status]) VALUES (2, N'Advised')
INSERT [dbo].[BookingStatus] ([StatusID], [Status]) VALUES (3, N'Rejected')
INSERT [dbo].[BookingStatus] ([StatusID], [Status]) VALUES (4, N'Confirmed')
INSERT [dbo].[BookingStatus] ([StatusID], [Status]) VALUES (5, N'Cancelled')
INSERT [dbo].[BookingStatus] ([StatusID], [Status]) VALUES (6, N'Completed')
SET IDENTITY_INSERT [dbo].[BookingStatus] OFF
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([ClientID], [Name], [Surname], [ContactNo], [Email], [UserID], [Deleted]) VALUES (1, N'Meneer', N'Secretary', N'0623456789', N'client@gmail.com', 1, 0)
INSERT [dbo].[Client] ([ClientID], [Name], [Surname], [ContactNo], [Email], [UserID], [Deleted]) VALUES (2, N'Piet', N'Myvrou', N'0127389829', N'piet@gmail.com', NULL, 0)
INSERT [dbo].[Client] ([ClientID], [Name], [Surname], [ContactNo], [Email], [UserID], [Deleted]) VALUES (4, N'Lesego', N'Molako', N'0903009000', N'lsgklk@gmain.com', 4, 0)
SET IDENTITY_INSERT [dbo].[Client] OFF
INSERT [dbo].[ClientPackage] ([SaleID], [PackageID], [Date], [ExpiryDate]) VALUES (2, 1, CAST(N'2020-08-23 00:00:00.000' AS DateTime), CAST(N'2020-10-23' AS Date))
SET IDENTITY_INSERT [dbo].[CompanyInfo] ON 

INSERT [dbo].[CompanyInfo] ([InfoID], [Name], [Address], [ContactNo]) VALUES (1, N'Exhilaration Hair & Beauty Salon', N'1908 Clifton Avenue Lyttleton Centurion', N'0785109494')
SET IDENTITY_INSERT [dbo].[CompanyInfo] OFF
SET IDENTITY_INSERT [dbo].[Date] ON 

INSERT [dbo].[Date] ([DateID], [Date]) VALUES (1, CAST(N'2020-09-01' AS Date))
INSERT [dbo].[Date] ([DateID], [Date]) VALUES (2, CAST(N'2020-09-02' AS Date))
INSERT [dbo].[Date] ([DateID], [Date]) VALUES (3, CAST(N'2020-09-03' AS Date))
INSERT [dbo].[Date] ([DateID], [Date]) VALUES (4, CAST(N'2020-09-04' AS Date))
INSERT [dbo].[Date] ([DateID], [Date]) VALUES (5, CAST(N'2020-09-05' AS Date))
INSERT [dbo].[Date] ([DateID], [Date]) VALUES (6, CAST(N'2020-09-06' AS Date))
INSERT [dbo].[Date] ([DateID], [Date]) VALUES (7, CAST(N'2020-09-07' AS Date))
INSERT [dbo].[Date] ([DateID], [Date]) VALUES (8, CAST(N'2020-09-08' AS Date))
INSERT [dbo].[Date] ([DateID], [Date]) VALUES (9, CAST(N'2020-09-09' AS Date))
INSERT [dbo].[Date] ([DateID], [Date]) VALUES (10, CAST(N'2020-09-10' AS Date))
INSERT [dbo].[Date] ([DateID], [Date]) VALUES (11, CAST(N'2020-09-11' AS Date))
INSERT [dbo].[Date] ([DateID], [Date]) VALUES (12, CAST(N'2020-09-12' AS Date))
INSERT [dbo].[Date] ([DateID], [Date]) VALUES (13, CAST(N'2020-09-13' AS Date))
INSERT [dbo].[Date] ([DateID], [Date]) VALUES (14, CAST(N'2020-09-14' AS Date))
INSERT [dbo].[Date] ([DateID], [Date]) VALUES (15, CAST(N'2020-09-15' AS Date))
INSERT [dbo].[Date] ([DateID], [Date]) VALUES (16, CAST(N'2020-09-16' AS Date))
INSERT [dbo].[Date] ([DateID], [Date]) VALUES (17, CAST(N'2020-09-17' AS Date))
INSERT [dbo].[Date] ([DateID], [Date]) VALUES (18, CAST(N'2020-09-18' AS Date))
INSERT [dbo].[Date] ([DateID], [Date]) VALUES (19, CAST(N'2020-09-19' AS Date))
INSERT [dbo].[Date] ([DateID], [Date]) VALUES (20, CAST(N'2020-09-20' AS Date))
INSERT [dbo].[Date] ([DateID], [Date]) VALUES (21, CAST(N'2020-09-21' AS Date))
INSERT [dbo].[Date] ([DateID], [Date]) VALUES (22, CAST(N'2020-09-22' AS Date))
INSERT [dbo].[Date] ([DateID], [Date]) VALUES (23, CAST(N'2020-09-23' AS Date))
INSERT [dbo].[Date] ([DateID], [Date]) VALUES (24, CAST(N'2020-09-24' AS Date))
INSERT [dbo].[Date] ([DateID], [Date]) VALUES (25, CAST(N'2020-09-25' AS Date))
SET IDENTITY_INSERT [dbo].[Date] OFF
SET IDENTITY_INSERT [dbo].[DateRequested] ON 

INSERT [dbo].[DateRequested] ([RequestedID], [BookingID], [Date], [StartTime]) VALUES (1, 1, CAST(N'2020-09-29' AS Date), CAST(N'10:00:00' AS Time))
SET IDENTITY_INSERT [dbo].[DateRequested] OFF
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([EmployeeID], [Name], [Surname], [ContactNo], [Email], [UserID], [Deleted]) VALUES (1, N'Steve ', N'Secretary', N'012345678', N'Employee@gmail.com', 3, 0)
SET IDENTITY_INSERT [dbo].[Employee] OFF
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 1, 15, 2, 5)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 1, 16, 2, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 1, 17, 2, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 1, 18, 2, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 1, 19, 2, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 1, 20, 1, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 1, 21, 1, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 1, 22, 1, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 1, 23, 1, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 1, 24, 1, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 1, 25, 1, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 2, 15, 2, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 2, 16, 2, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 2, 17, 2, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 2, 18, 2, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 2, 19, 2, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 2, 20, 1, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 2, 21, 1, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 2, 22, 1, 2)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 2, 23, 1, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 2, 24, 1, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 2, 25, 1, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 3, 15, 2, 4)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 3, 16, 2, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 3, 17, 2, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 3, 18, 2, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 3, 19, 2, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 3, 20, 1, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 3, 21, 3, 3)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 3, 22, 1, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 3, 23, 1, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 3, 24, 1, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 3, 25, 1, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 4, 15, 2, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 4, 16, 2, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 4, 17, 2, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 4, 18, 2, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 4, 19, 2, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 4, 20, 1, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 4, 21, 1, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 4, 22, 1, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 4, 23, 1, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 4, 24, 1, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 4, 25, 1, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 5, 15, 2, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 5, 16, 1, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 5, 17, 2, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 5, 18, 2, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 5, 19, 2, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 5, 20, 1, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 5, 21, 1, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 5, 22, 1, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 5, 23, 1, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 5, 24, 1, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 5, 25, 1, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 6, 15, 2, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 6, 16, 2, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 6, 17, 2, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 6, 18, 2, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 6, 19, 2, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 6, 20, 1, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 6, 21, 1, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 6, 22, 1, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 6, 23, 1, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 6, 24, 1, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 6, 25, 1, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 7, 15, 2, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 7, 16, 2, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 7, 17, 2, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 7, 18, 2, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 7, 19, 2, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 7, 20, 1, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 7, 21, 1, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 7, 22, 1, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 7, 23, 1, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 7, 24, 1, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 7, 25, 1, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 8, 15, 2, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 8, 16, 2, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 8, 17, 2, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 8, 18, 2, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 8, 19, 2, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 8, 20, 1, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 8, 21, 1, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 8, 22, 1, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 8, 23, 1, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 8, 24, 1, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 8, 25, 1, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 9, 15, 2, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 9, 16, 2, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 9, 17, 2, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 9, 18, 2, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 9, 19, 2, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 9, 20, 1, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 9, 21, 1, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 9, 22, 1, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 9, 23, 1, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 9, 24, 1, NULL)
INSERT [dbo].[EmployeeSchedule] ([EmployeeID], [TimeID], [DateID], [StatusID], [BookingID]) VALUES (1, 9, 25, 1, NULL)
SET IDENTITY_INSERT [dbo].[EmployeeServiceType] ON 

INSERT [dbo].[EmployeeServiceType] ([EmpTypeID], [EmployeeID], [TypeID]) VALUES (1, 1, 1)
SET IDENTITY_INSERT [dbo].[EmployeeServiceType] OFF
SET IDENTITY_INSERT [dbo].[InstanceStatus] ON 

INSERT [dbo].[InstanceStatus] ([StatusID], [Status]) VALUES (1, N'Active')
INSERT [dbo].[InstanceStatus] ([StatusID], [Status]) VALUES (2, N'Used')
SET IDENTITY_INSERT [dbo].[InstanceStatus] OFF
SET IDENTITY_INSERT [dbo].[PackageInstance] ON 

INSERT [dbo].[PackageInstance] ([InstanceID], [SaleID], [PackageID], [StatusID], [LineID], [Date]) VALUES (1, 2, 1, 1, NULL, NULL)
INSERT [dbo].[PackageInstance] ([InstanceID], [SaleID], [PackageID], [StatusID], [LineID], [Date]) VALUES (2, 2, 1, 1, NULL, NULL)
INSERT [dbo].[PackageInstance] ([InstanceID], [SaleID], [PackageID], [StatusID], [LineID], [Date]) VALUES (3, 2, 1, 1, NULL, NULL)
INSERT [dbo].[PackageInstance] ([InstanceID], [SaleID], [PackageID], [StatusID], [LineID], [Date]) VALUES (4, 2, 1, 1, NULL, NULL)
INSERT [dbo].[PackageInstance] ([InstanceID], [SaleID], [PackageID], [StatusID], [LineID], [Date]) VALUES (5, 2, 1, 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[PackageInstance] OFF
SET IDENTITY_INSERT [dbo].[PaymentType] ON 

INSERT [dbo].[PaymentType] ([PaymentTypeID], [Type]) VALUES (1, N'Card')
INSERT [dbo].[PaymentType] ([PaymentTypeID], [Type]) VALUES (2, N'Cash')
SET IDENTITY_INSERT [dbo].[PaymentType] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductID], [SupplierID], [CategoryID], [Name], [QuantityOnHand], [Description], [Price], [Deleted]) VALUES (3, 1, 1, N'Rich Repair Shampoo', 45, N'repairs hair and restores', CAST(500.00 AS Decimal(6, 2)), 0)
INSERT [dbo].[Product] ([ProductID], [SupplierID], [CategoryID], [Name], [QuantityOnHand], [Description], [Price], [Deleted]) VALUES (4, 1, 1, N'Hair Stuff', 90, N'Does stuff', CAST(500.00 AS Decimal(6, 2)), 0)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[ProductCategory] ON 

INSERT [dbo].[ProductCategory] ([CategoryID], [Category]) VALUES (1, N'Hair')
INSERT [dbo].[ProductCategory] ([CategoryID], [Category]) VALUES (2, N'Nails')
SET IDENTITY_INSERT [dbo].[ProductCategory] OFF
SET IDENTITY_INSERT [dbo].[Reminder] ON 

INSERT [dbo].[Reminder] ([ReminderID], [TypeID], [Text], [NumHours]) VALUES (1, 1, N'Your sale is ready for collection"', 24)
INSERT [dbo].[Reminder] ([ReminderID], [TypeID], [Text], [NumHours]) VALUES (2, 2, N'Your Booking is in the next 24 hours', 24)
SET IDENTITY_INSERT [dbo].[Reminder] OFF
SET IDENTITY_INSERT [dbo].[ReminderType] ON 

INSERT [dbo].[ReminderType] ([TypeID], [Type]) VALUES (1, N'Sale')
INSERT [dbo].[ReminderType] ([TypeID], [Type]) VALUES (2, N'Booking')
SET IDENTITY_INSERT [dbo].[ReminderType] OFF
SET IDENTITY_INSERT [dbo].[Sale] ON 

INSERT [dbo].[Sale] ([SaleID], [StatusID], [ReminderID], [PaymentTypeID], [ClientID], [SaleTypeID], [Date], [Payment]) VALUES (1, 1, 1, NULL, 4, 1, CAST(N'2020-08-26 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Sale] ([SaleID], [StatusID], [ReminderID], [PaymentTypeID], [ClientID], [SaleTypeID], [Date], [Payment]) VALUES (2, 2, NULL, 1, 1, 4, CAST(N'2020-08-23 00:00:00.000' AS DateTime), CAST(1500.00 AS Decimal(6, 2)))
INSERT [dbo].[Sale] ([SaleID], [StatusID], [ReminderID], [PaymentTypeID], [ClientID], [SaleTypeID], [Date], [Payment]) VALUES (3, 2, NULL, 2, 4, 2, CAST(N'2020-08-21 00:00:00.000' AS DateTime), CAST(380.00 AS Decimal(6, 2)))
INSERT [dbo].[Sale] ([SaleID], [StatusID], [ReminderID], [PaymentTypeID], [ClientID], [SaleTypeID], [Date], [Payment]) VALUES (4, 1, 1, 2, 4, 1, CAST(N'2020-08-25 00:00:00.000' AS DateTime), CAST(500.00 AS Decimal(6, 2)))
INSERT [dbo].[Sale] ([SaleID], [StatusID], [ReminderID], [PaymentTypeID], [ClientID], [SaleTypeID], [Date], [Payment]) VALUES (5, 1, 1, 2, 1, 1, CAST(N'2020-08-27 00:00:00.000' AS DateTime), CAST(700.00 AS Decimal(6, 2)))
INSERT [dbo].[Sale] ([SaleID], [StatusID], [ReminderID], [PaymentTypeID], [ClientID], [SaleTypeID], [Date], [Payment]) VALUES (6, 1, 1, 1, 1, 1, CAST(N'2020-09-02 00:00:00.000' AS DateTime), CAST(800.00 AS Decimal(6, 2)))
SET IDENTITY_INSERT [dbo].[Sale] OFF
SET IDENTITY_INSERT [dbo].[SaleLine] ON 

INSERT [dbo].[SaleLine] ([LineID], [ProductID], [SaleID], [Quantity]) VALUES (2, 4, 4, 6)
INSERT [dbo].[SaleLine] ([LineID], [ProductID], [SaleID], [Quantity]) VALUES (3, 4, 3, 3)
INSERT [dbo].[SaleLine] ([LineID], [ProductID], [SaleID], [Quantity]) VALUES (4, 3, 4, 4)
INSERT [dbo].[SaleLine] ([LineID], [ProductID], [SaleID], [Quantity]) VALUES (5, 3, 3, 10)
INSERT [dbo].[SaleLine] ([LineID], [ProductID], [SaleID], [Quantity]) VALUES (6, 3, 4, 88)
INSERT [dbo].[SaleLine] ([LineID], [ProductID], [SaleID], [Quantity]) VALUES (7, 4, 3, 83)
SET IDENTITY_INSERT [dbo].[SaleLine] OFF
SET IDENTITY_INSERT [dbo].[SaleStatus] ON 

INSERT [dbo].[SaleStatus] ([StatusID], [Status]) VALUES (1, N'placed')
INSERT [dbo].[SaleStatus] ([StatusID], [Status]) VALUES (2, N'paid')
SET IDENTITY_INSERT [dbo].[SaleStatus] OFF
SET IDENTITY_INSERT [dbo].[SaleType] ON 

INSERT [dbo].[SaleType] ([SaleTypeID], [Type]) VALUES (1, N'Product Purchase')
INSERT [dbo].[SaleType] ([SaleTypeID], [Type]) VALUES (2, N'Booking Payment')
INSERT [dbo].[SaleType] ([SaleTypeID], [Type]) VALUES (4, N'Activate Package')
SET IDENTITY_INSERT [dbo].[SaleType] OFF
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (15, 1)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (15, 2)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (15, 3)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (15, 4)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (15, 5)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (15, 6)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (15, 7)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (15, 8)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (15, 9)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (16, 1)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (16, 2)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (16, 3)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (16, 4)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (16, 5)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (16, 6)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (16, 7)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (16, 8)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (16, 9)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (17, 1)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (17, 2)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (17, 3)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (17, 4)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (17, 5)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (17, 6)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (17, 7)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (17, 8)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (17, 9)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (18, 1)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (18, 2)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (18, 3)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (18, 4)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (18, 5)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (18, 6)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (18, 7)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (18, 8)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (18, 9)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (19, 1)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (19, 2)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (19, 3)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (19, 4)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (19, 5)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (19, 6)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (19, 7)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (19, 8)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (19, 9)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (20, 1)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (20, 2)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (20, 3)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (20, 4)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (20, 5)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (20, 6)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (20, 7)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (20, 8)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (20, 9)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (21, 1)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (21, 2)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (21, 3)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (21, 4)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (21, 5)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (21, 6)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (21, 7)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (21, 8)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (21, 9)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (22, 1)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (22, 2)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (22, 3)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (22, 4)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (22, 5)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (22, 6)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (22, 7)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (22, 8)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (22, 9)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (23, 1)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (23, 2)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (23, 3)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (23, 4)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (23, 5)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (23, 6)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (23, 7)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (23, 8)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (23, 9)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (24, 1)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (24, 2)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (24, 3)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (24, 4)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (24, 5)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (24, 6)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (24, 7)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (24, 8)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (24, 9)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (25, 1)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (25, 2)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (25, 3)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (25, 4)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (25, 5)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (25, 6)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (25, 7)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (25, 8)
INSERT [dbo].[Schedule] ([DateID], [TimeID]) VALUES (25, 9)
SET IDENTITY_INSERT [dbo].[ScheduleStatus] ON 

INSERT [dbo].[ScheduleStatus] ([StatusID], [Status]) VALUES (1, N'Available')
INSERT [dbo].[ScheduleStatus] ([StatusID], [Status]) VALUES (2, N'Not Available')
INSERT [dbo].[ScheduleStatus] ([StatusID], [Status]) VALUES (3, N'Booked')
SET IDENTITY_INSERT [dbo].[ScheduleStatus] OFF
SET IDENTITY_INSERT [dbo].[Service] ON 

INSERT [dbo].[Service] ([ServiceID], [TypeID], [Name], [Description], [Duration], [Deleted]) VALUES (1, 1, N'Wash & Blow', N'wash hair, and blow dry', 30, 0)
INSERT [dbo].[Service] ([ServiceID], [TypeID], [Name], [Description], [Duration], [Deleted]) VALUES (2, 1, N'Extension Installation', N'install extensions', 60, 0)
INSERT [dbo].[Service] ([ServiceID], [TypeID], [Name], [Description], [Duration], [Deleted]) VALUES (3, 1, N'Wash, Cut & Blow', N'wash and blow, hair cut included', 50, 0)
INSERT [dbo].[Service] ([ServiceID], [TypeID], [Name], [Description], [Duration], [Deleted]) VALUES (4, 1, N'Root Color', N'color roots', 45, 0)
INSERT [dbo].[Service] ([ServiceID], [TypeID], [Name], [Description], [Duration], [Deleted]) VALUES (5, 1, N'Hair Cut', N'cutting hair', 34, 0)
INSERT [dbo].[Service] ([ServiceID], [TypeID], [Name], [Description], [Duration], [Deleted]) VALUES (6, 1, N'Wash and Dye', N'something about it', 35, 0)
INSERT [dbo].[Service] ([ServiceID], [TypeID], [Name], [Description], [Duration], [Deleted]) VALUES (8, 1, N'Hair Thing', N'Description', 45, 0)
SET IDENTITY_INSERT [dbo].[Service] OFF
SET IDENTITY_INSERT [dbo].[ServiceOption] ON 

INSERT [dbo].[ServiceOption] ([OptionID], [Name], [Duration], [Deleted]) VALUES (1, N'Short', 5, 0)
INSERT [dbo].[ServiceOption] ([OptionID], [Name], [Duration], [Deleted]) VALUES (3, N'Medium ', 10, 0)
INSERT [dbo].[ServiceOption] ([OptionID], [Name], [Duration], [Deleted]) VALUES (4, N'Long', 15, 0)
INSERT [dbo].[ServiceOption] ([OptionID], [Name], [Duration], [Deleted]) VALUES (7, N'Very Long', 20, 0)
SET IDENTITY_INSERT [dbo].[ServiceOption] OFF
SET IDENTITY_INSERT [dbo].[ServicePackage] ON 

INSERT [dbo].[ServicePackage] ([PackageID], [ServiceID], [Description], [Price], [Quantity], [Duration], [Deleted]) VALUES (1, 1, N'Wash & Blow', CAST(1500.00 AS Decimal(6, 2)), 5, 3, 0)
SET IDENTITY_INSERT [dbo].[ServicePackage] OFF
SET IDENTITY_INSERT [dbo].[ServicePrice] ON 

INSERT [dbo].[ServicePrice] ([PriceID], [ServiceID], [OptionID], [Price], [Date]) VALUES (1, 1, 1, CAST(195.00 AS Decimal(6, 2)), CAST(N'2020-08-21 00:00:00.000' AS DateTime))
INSERT [dbo].[ServicePrice] ([PriceID], [ServiceID], [OptionID], [Price], [Date]) VALUES (2, 1, 3, CAST(215.00 AS Decimal(6, 2)), CAST(N'2020-08-21 00:00:00.000' AS DateTime))
INSERT [dbo].[ServicePrice] ([PriceID], [ServiceID], [OptionID], [Price], [Date]) VALUES (3, 1, 4, CAST(240.00 AS Decimal(6, 2)), CAST(N'2020-08-21 00:00:00.000' AS DateTime))
INSERT [dbo].[ServicePrice] ([PriceID], [ServiceID], [OptionID], [Price], [Date]) VALUES (5, 2, NULL, CAST(850.00 AS Decimal(6, 2)), CAST(N'2020-08-21 00:00:00.000' AS DateTime))
INSERT [dbo].[ServicePrice] ([PriceID], [ServiceID], [OptionID], [Price], [Date]) VALUES (6, 3, 1, CAST(275.00 AS Decimal(6, 2)), CAST(N'2020-08-21 00:00:00.000' AS DateTime))
INSERT [dbo].[ServicePrice] ([PriceID], [ServiceID], [OptionID], [Price], [Date]) VALUES (7, 3, 3, CAST(295.00 AS Decimal(6, 2)), CAST(N'2020-08-21 00:00:00.000' AS DateTime))
INSERT [dbo].[ServicePrice] ([PriceID], [ServiceID], [OptionID], [Price], [Date]) VALUES (8, 3, 4, CAST(320.00 AS Decimal(6, 2)), CAST(N'2020-08-21 00:00:00.000' AS DateTime))
INSERT [dbo].[ServicePrice] ([PriceID], [ServiceID], [OptionID], [Price], [Date]) VALUES (10, 4, NULL, CAST(380.00 AS Decimal(6, 2)), CAST(N'2020-08-21 00:00:00.000' AS DateTime))
INSERT [dbo].[ServicePrice] ([PriceID], [ServiceID], [OptionID], [Price], [Date]) VALUES (17, 4, NULL, CAST(390.00 AS Decimal(6, 2)), CAST(N'2020-09-05 01:53:00.943' AS DateTime))
INSERT [dbo].[ServicePrice] ([PriceID], [ServiceID], [OptionID], [Price], [Date]) VALUES (18, 5, 1, CAST(34.00 AS Decimal(6, 2)), CAST(N'2020-09-09 06:41:12.693' AS DateTime))
INSERT [dbo].[ServicePrice] ([PriceID], [ServiceID], [OptionID], [Price], [Date]) VALUES (19, 5, 3, CAST(44.00 AS Decimal(6, 2)), CAST(N'2020-09-09 06:41:12.713' AS DateTime))
INSERT [dbo].[ServicePrice] ([PriceID], [ServiceID], [OptionID], [Price], [Date]) VALUES (20, 6, NULL, CAST(44.00 AS Decimal(6, 2)), CAST(N'2020-09-09 06:44:07.927' AS DateTime))
INSERT [dbo].[ServicePrice] ([PriceID], [ServiceID], [OptionID], [Price], [Date]) VALUES (23, 8, 3, CAST(34.00 AS Decimal(6, 2)), CAST(N'2020-09-09 08:38:40.987' AS DateTime))
INSERT [dbo].[ServicePrice] ([PriceID], [ServiceID], [OptionID], [Price], [Date]) VALUES (24, 8, 1, CAST(33.00 AS Decimal(6, 2)), CAST(N'2020-09-09 08:38:41.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[ServicePrice] OFF
SET IDENTITY_INSERT [dbo].[ServiceType] ON 

INSERT [dbo].[ServiceType] ([TypeID], [Name], [Description]) VALUES (1, N'Hair', N'cut, styling, coloring, etc...')
SET IDENTITY_INSERT [dbo].[ServiceType] OFF
INSERT [dbo].[ServiceTypeOption] ([ServiceID], [OptionID]) VALUES (1, 1)
INSERT [dbo].[ServiceTypeOption] ([ServiceID], [OptionID]) VALUES (1, 3)
INSERT [dbo].[ServiceTypeOption] ([ServiceID], [OptionID]) VALUES (1, 4)
INSERT [dbo].[ServiceTypeOption] ([ServiceID], [OptionID]) VALUES (3, 1)
INSERT [dbo].[ServiceTypeOption] ([ServiceID], [OptionID]) VALUES (3, 3)
INSERT [dbo].[ServiceTypeOption] ([ServiceID], [OptionID]) VALUES (3, 4)
INSERT [dbo].[ServiceTypeOption] ([ServiceID], [OptionID]) VALUES (5, 1)
INSERT [dbo].[ServiceTypeOption] ([ServiceID], [OptionID]) VALUES (5, 3)
INSERT [dbo].[ServiceTypeOption] ([ServiceID], [OptionID]) VALUES (8, 1)
INSERT [dbo].[ServiceTypeOption] ([ServiceID], [OptionID]) VALUES (8, 3)
SET IDENTITY_INSERT [dbo].[StockItem] ON 

INSERT [dbo].[StockItem] ([ItemID], [Name], [Description], [Price], [QuantityInStock], [Deleted]) VALUES (1, N'Hairdryers', N'Equipment', CAST(80.00 AS Decimal(6, 2)), 2, 0)
INSERT [dbo].[StockItem] ([ItemID], [Name], [Description], [Price], [QuantityInStock], [Deleted]) VALUES (3, N'Shampoo', N'Hair essentials', CAST(100.00 AS Decimal(6, 2)), 5, 0)
SET IDENTITY_INSERT [dbo].[StockItem] OFF
SET IDENTITY_INSERT [dbo].[StockItemLine] ON 

INSERT [dbo].[StockItemLine] ([LineID], [ItemID], [OrderID], [Quantity]) VALUES (1, 1, 1, 3)
INSERT [dbo].[StockItemLine] ([LineID], [ItemID], [OrderID], [Quantity]) VALUES (2, 3, 1, 2)
SET IDENTITY_INSERT [dbo].[StockItemLine] OFF
SET IDENTITY_INSERT [dbo].[StockTake] ON 

INSERT [dbo].[StockTake] ([StockTakeID], [AdminID], [Description], [Date]) VALUES (1, 1, N'Stock Take', CAST(N'2020-08-21 00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[StockTake] OFF
SET IDENTITY_INSERT [dbo].[Supplier] ON 

INSERT [dbo].[Supplier] ([SupplierID], [Name], [ContactNo], [Email], [Address], [Deleted]) VALUES (1, N'ABC Hair Supplies', N'021323232', N'Supplier@gmail.com', N'222 Business Street', 0)
SET IDENTITY_INSERT [dbo].[Supplier] OFF
SET IDENTITY_INSERT [dbo].[SupplierOrder] ON 

INSERT [dbo].[SupplierOrder] ([OrderID], [SupplierID], [Description], [Price], [Date]) VALUES (1, 1, N'Re-stock', CAST(440.00 AS Decimal(6, 2)), CAST(N'2020-08-15' AS Date))
SET IDENTITY_INSERT [dbo].[SupplierOrder] OFF
SET IDENTITY_INSERT [dbo].[Timeslot] ON 

INSERT [dbo].[Timeslot] ([TimeID], [StartTime], [EndTime], [Deleted]) VALUES (1, CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 0)
INSERT [dbo].[Timeslot] ([TimeID], [StartTime], [EndTime], [Deleted]) VALUES (2, CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 0)
INSERT [dbo].[Timeslot] ([TimeID], [StartTime], [EndTime], [Deleted]) VALUES (3, CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 0)
INSERT [dbo].[Timeslot] ([TimeID], [StartTime], [EndTime], [Deleted]) VALUES (4, CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 0)
INSERT [dbo].[Timeslot] ([TimeID], [StartTime], [EndTime], [Deleted]) VALUES (5, CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Timeslot] ([TimeID], [StartTime], [EndTime], [Deleted]) VALUES (6, CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Timeslot] ([TimeID], [StartTime], [EndTime], [Deleted]) VALUES (7, CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Timeslot] ([TimeID], [StartTime], [EndTime], [Deleted]) VALUES (8, CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Timeslot] ([TimeID], [StartTime], [EndTime], [Deleted]) VALUES (9, CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 0)
SET IDENTITY_INSERT [dbo].[Timeslot] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [RoleID], [Username], [Password], [SessionID]) VALUES (1, 1, N'Client', N'Client', NULL)
INSERT [dbo].[User] ([UserID], [RoleID], [Username], [Password], [SessionID]) VALUES (2, 2, N'Admin', N'Admin', NULL)
INSERT [dbo].[User] ([UserID], [RoleID], [Username], [Password], [SessionID]) VALUES (3, 3, N'Employee', N'Employee', NULL)
INSERT [dbo].[User] ([UserID], [RoleID], [Username], [Password], [SessionID]) VALUES (4, 1, N'lesegomolako', N'0D1CD740AB7ECAB4552F30124515D0B0033F4F5BDEE2DEA87F023F978B7F0FE0', N'75b10552-6bcd-4c79-8c4a-3d08a0a0c1ad')
SET IDENTITY_INSERT [dbo].[User] OFF
SET IDENTITY_INSERT [dbo].[UserRole] ON 

INSERT [dbo].[UserRole] ([RoleID], [Role]) VALUES (1, N'Client')
INSERT [dbo].[UserRole] ([RoleID], [Role]) VALUES (2, N'Admin')
INSERT [dbo].[UserRole] ([RoleID], [Role]) VALUES (3, N'Employee')
SET IDENTITY_INSERT [dbo].[UserRole] OFF
ALTER TABLE [dbo].[Admin]  WITH CHECK ADD  CONSTRAINT [FK_Admin_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Admin] CHECK CONSTRAINT [FK_Admin_User]
GO
ALTER TABLE [dbo].[Basket]  WITH CHECK ADD  CONSTRAINT [FK_Basket_Client] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([ClientID])
GO
ALTER TABLE [dbo].[Basket] CHECK CONSTRAINT [FK_Basket_Client]
GO
ALTER TABLE [dbo].[BasketLine]  WITH CHECK ADD  CONSTRAINT [FK_BasketLine_Basket] FOREIGN KEY([BasketID])
REFERENCES [dbo].[Basket] ([BasketID])
GO
ALTER TABLE [dbo].[BasketLine] CHECK CONSTRAINT [FK_BasketLine_Basket]
GO
ALTER TABLE [dbo].[BasketLine]  WITH CHECK ADD  CONSTRAINT [FK_BasketLine_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[BasketLine] CHECK CONSTRAINT [FK_BasketLine_Product]
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK_Booking_BookingStatus] FOREIGN KEY([StatusID])
REFERENCES [dbo].[BookingStatus] ([StatusID])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK_Booking_BookingStatus]
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK_Booking_Client] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([ClientID])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK_Booking_Client]
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK_Booking_Reminder] FOREIGN KEY([ReminderID])
REFERENCES [dbo].[Reminder] ([ReminderID])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK_Booking_Reminder]
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK_Booking_Sale] FOREIGN KEY([SaleID])
REFERENCES [dbo].[Sale] ([SaleID])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK_Booking_Sale]
GO
ALTER TABLE [dbo].[BookingLine]  WITH CHECK ADD  CONSTRAINT [FK_BookingLine_Booking] FOREIGN KEY([BookingID])
REFERENCES [dbo].[Booking] ([BookingID])
GO
ALTER TABLE [dbo].[BookingLine] CHECK CONSTRAINT [FK_BookingLine_Booking]
GO
ALTER TABLE [dbo].[BookingLine]  WITH CHECK ADD  CONSTRAINT [FK_BookingLine_Service] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Service] ([ServiceID])
GO
ALTER TABLE [dbo].[BookingLine] CHECK CONSTRAINT [FK_BookingLine_Service]
GO
ALTER TABLE [dbo].[BookingLine]  WITH CHECK ADD  CONSTRAINT [FK_BookingLine_ServiceTypeOption] FOREIGN KEY([ServiceID], [OptionID])
REFERENCES [dbo].[ServiceTypeOption] ([ServiceID], [OptionID])
GO
ALTER TABLE [dbo].[BookingLine] CHECK CONSTRAINT [FK_BookingLine_ServiceTypeOption]
GO
ALTER TABLE [dbo].[BookingNotes]  WITH CHECK ADD  CONSTRAINT [FK_BookingNotes_Booking] FOREIGN KEY([BookingID])
REFERENCES [dbo].[Booking] ([BookingID])
GO
ALTER TABLE [dbo].[BookingNotes] CHECK CONSTRAINT [FK_BookingNotes_Booking]
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [FK_Client_User]
GO
ALTER TABLE [dbo].[ClientPackage]  WITH CHECK ADD  CONSTRAINT [FK_ClientPackage_Sale] FOREIGN KEY([SaleID])
REFERENCES [dbo].[Sale] ([SaleID])
GO
ALTER TABLE [dbo].[ClientPackage] CHECK CONSTRAINT [FK_ClientPackage_Sale]
GO
ALTER TABLE [dbo].[ClientPackage]  WITH CHECK ADD  CONSTRAINT [FK_ClientPackage_ServicePackage] FOREIGN KEY([PackageID])
REFERENCES [dbo].[ServicePackage] ([PackageID])
GO
ALTER TABLE [dbo].[ClientPackage] CHECK CONSTRAINT [FK_ClientPackage_ServicePackage]
GO
ALTER TABLE [dbo].[DateRequested]  WITH CHECK ADD  CONSTRAINT [FK_DateRequested_Booking] FOREIGN KEY([BookingID])
REFERENCES [dbo].[Booking] ([BookingID])
GO
ALTER TABLE [dbo].[DateRequested] CHECK CONSTRAINT [FK_DateRequested_Booking]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_User]
GO
ALTER TABLE [dbo].[EmployeeSchedule]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeSchedule_Booking] FOREIGN KEY([BookingID])
REFERENCES [dbo].[Booking] ([BookingID])
GO
ALTER TABLE [dbo].[EmployeeSchedule] CHECK CONSTRAINT [FK_EmployeeSchedule_Booking]
GO
ALTER TABLE [dbo].[EmployeeSchedule]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeSchedule_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[EmployeeSchedule] CHECK CONSTRAINT [FK_EmployeeSchedule_Employee]
GO
ALTER TABLE [dbo].[EmployeeSchedule]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeSchedule_Schedule] FOREIGN KEY([DateID], [TimeID])
REFERENCES [dbo].[Schedule] ([DateID], [TimeID])
GO
ALTER TABLE [dbo].[EmployeeSchedule] CHECK CONSTRAINT [FK_EmployeeSchedule_Schedule]
GO
ALTER TABLE [dbo].[EmployeeSchedule]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeSchedule_ScheduleStatus] FOREIGN KEY([StatusID])
REFERENCES [dbo].[ScheduleStatus] ([StatusID])
GO
ALTER TABLE [dbo].[EmployeeSchedule] CHECK CONSTRAINT [FK_EmployeeSchedule_ScheduleStatus]
GO
ALTER TABLE [dbo].[EmployeeServiceType]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeServiceType_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[EmployeeServiceType] CHECK CONSTRAINT [FK_EmployeeServiceType_Employee]
GO
ALTER TABLE [dbo].[EmployeeServiceType]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeServiceType_ServiceType] FOREIGN KEY([TypeID])
REFERENCES [dbo].[ServiceType] ([TypeID])
GO
ALTER TABLE [dbo].[EmployeeServiceType] CHECK CONSTRAINT [FK_EmployeeServiceType_ServiceType]
GO
ALTER TABLE [dbo].[PackageInstance]  WITH CHECK ADD  CONSTRAINT [FK_PackageInstance_BookingLine] FOREIGN KEY([LineID])
REFERENCES [dbo].[BookingLine] ([LineID])
GO
ALTER TABLE [dbo].[PackageInstance] CHECK CONSTRAINT [FK_PackageInstance_BookingLine]
GO
ALTER TABLE [dbo].[PackageInstance]  WITH CHECK ADD  CONSTRAINT [FK_PackageInstance_ClientPackage] FOREIGN KEY([SaleID], [PackageID])
REFERENCES [dbo].[ClientPackage] ([SaleID], [PackageID])
GO
ALTER TABLE [dbo].[PackageInstance] CHECK CONSTRAINT [FK_PackageInstance_ClientPackage]
GO
ALTER TABLE [dbo].[PackageInstance]  WITH CHECK ADD  CONSTRAINT [FK_PackageInstance_InstanceStatus] FOREIGN KEY([StatusID])
REFERENCES [dbo].[InstanceStatus] ([StatusID])
GO
ALTER TABLE [dbo].[PackageInstance] CHECK CONSTRAINT [FK_PackageInstance_InstanceStatus]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductCategory] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[ProductCategory] ([CategoryID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductCategory]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Supplier] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Supplier] ([SupplierID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Supplier]
GO
ALTER TABLE [dbo].[ProductPhoto]  WITH CHECK ADD  CONSTRAINT [FK_ProductPhoto_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[ProductPhoto] CHECK CONSTRAINT [FK_ProductPhoto_Product]
GO
ALTER TABLE [dbo].[Reminder]  WITH CHECK ADD  CONSTRAINT [FK_Reminder_ReminderType] FOREIGN KEY([TypeID])
REFERENCES [dbo].[ReminderType] ([TypeID])
GO
ALTER TABLE [dbo].[Reminder] CHECK CONSTRAINT [FK_Reminder_ReminderType]
GO
ALTER TABLE [dbo].[Sale]  WITH CHECK ADD  CONSTRAINT [FK_Sale_Client] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([ClientID])
GO
ALTER TABLE [dbo].[Sale] CHECK CONSTRAINT [FK_Sale_Client]
GO
ALTER TABLE [dbo].[Sale]  WITH CHECK ADD  CONSTRAINT [FK_Sale_PaymentType] FOREIGN KEY([PaymentTypeID])
REFERENCES [dbo].[PaymentType] ([PaymentTypeID])
GO
ALTER TABLE [dbo].[Sale] CHECK CONSTRAINT [FK_Sale_PaymentType]
GO
ALTER TABLE [dbo].[Sale]  WITH CHECK ADD  CONSTRAINT [FK_Sale_Reminder] FOREIGN KEY([ReminderID])
REFERENCES [dbo].[Reminder] ([ReminderID])
GO
ALTER TABLE [dbo].[Sale] CHECK CONSTRAINT [FK_Sale_Reminder]
GO
ALTER TABLE [dbo].[Sale]  WITH CHECK ADD  CONSTRAINT [FK_Sale_SaleStatus] FOREIGN KEY([StatusID])
REFERENCES [dbo].[SaleStatus] ([StatusID])
GO
ALTER TABLE [dbo].[Sale] CHECK CONSTRAINT [FK_Sale_SaleStatus]
GO
ALTER TABLE [dbo].[Sale]  WITH CHECK ADD  CONSTRAINT [FK_Sale_SaleType] FOREIGN KEY([SaleTypeID])
REFERENCES [dbo].[SaleType] ([SaleTypeID])
GO
ALTER TABLE [dbo].[Sale] CHECK CONSTRAINT [FK_Sale_SaleType]
GO
ALTER TABLE [dbo].[SaleLine]  WITH CHECK ADD  CONSTRAINT [FK_SaleLine_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[SaleLine] CHECK CONSTRAINT [FK_SaleLine_Product]
GO
ALTER TABLE [dbo].[SaleLine]  WITH CHECK ADD  CONSTRAINT [FK_SaleLine_Sale] FOREIGN KEY([SaleID])
REFERENCES [dbo].[Sale] ([SaleID])
GO
ALTER TABLE [dbo].[SaleLine] CHECK CONSTRAINT [FK_SaleLine_Sale]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_Date] FOREIGN KEY([DateID])
REFERENCES [dbo].[Date] ([DateID])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Schedule_Date]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_Timeslot] FOREIGN KEY([TimeID])
REFERENCES [dbo].[Timeslot] ([TimeID])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Schedule_Timeslot]
GO
ALTER TABLE [dbo].[Service]  WITH CHECK ADD  CONSTRAINT [FK_Service_ServiceType] FOREIGN KEY([TypeID])
REFERENCES [dbo].[ServiceType] ([TypeID])
GO
ALTER TABLE [dbo].[Service] CHECK CONSTRAINT [FK_Service_ServiceType]
GO
ALTER TABLE [dbo].[ServicePackage]  WITH CHECK ADD  CONSTRAINT [FK_ServicePackage_Service] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Service] ([ServiceID])
GO
ALTER TABLE [dbo].[ServicePackage] CHECK CONSTRAINT [FK_ServicePackage_Service]
GO
ALTER TABLE [dbo].[ServicePhoto]  WITH CHECK ADD  CONSTRAINT [FK_ServicePhoto_Service] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Service] ([ServiceID])
GO
ALTER TABLE [dbo].[ServicePhoto] CHECK CONSTRAINT [FK_ServicePhoto_Service]
GO
ALTER TABLE [dbo].[ServicePrice]  WITH CHECK ADD  CONSTRAINT [FK_ServicePrice_Service] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Service] ([ServiceID])
GO
ALTER TABLE [dbo].[ServicePrice] CHECK CONSTRAINT [FK_ServicePrice_Service]
GO
ALTER TABLE [dbo].[ServicePrice]  WITH CHECK ADD  CONSTRAINT [FK_ServicePrice_ServiceTypeOption] FOREIGN KEY([ServiceID], [OptionID])
REFERENCES [dbo].[ServiceTypeOption] ([ServiceID], [OptionID])
GO
ALTER TABLE [dbo].[ServicePrice] CHECK CONSTRAINT [FK_ServicePrice_ServiceTypeOption]
GO
ALTER TABLE [dbo].[ServiceTypeOption]  WITH CHECK ADD  CONSTRAINT [FK_ServiceTypeOption_Service] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Service] ([ServiceID])
GO
ALTER TABLE [dbo].[ServiceTypeOption] CHECK CONSTRAINT [FK_ServiceTypeOption_Service]
GO
ALTER TABLE [dbo].[ServiceTypeOption]  WITH CHECK ADD  CONSTRAINT [FK_ServiceTypeOption_ServiceOption] FOREIGN KEY([OptionID])
REFERENCES [dbo].[ServiceOption] ([OptionID])
GO
ALTER TABLE [dbo].[ServiceTypeOption] CHECK CONSTRAINT [FK_ServiceTypeOption_ServiceOption]
GO
ALTER TABLE [dbo].[StockItemLine]  WITH CHECK ADD  CONSTRAINT [FK_StockItemLine_StockItem] FOREIGN KEY([ItemID])
REFERENCES [dbo].[StockItem] ([ItemID])
GO
ALTER TABLE [dbo].[StockItemLine] CHECK CONSTRAINT [FK_StockItemLine_StockItem]
GO
ALTER TABLE [dbo].[StockItemLine]  WITH CHECK ADD  CONSTRAINT [FK_StockItemLine_SupplierOrder] FOREIGN KEY([OrderID])
REFERENCES [dbo].[SupplierOrder] ([OrderID])
GO
ALTER TABLE [dbo].[StockItemLine] CHECK CONSTRAINT [FK_StockItemLine_SupplierOrder]
GO
ALTER TABLE [dbo].[StockTake]  WITH CHECK ADD  CONSTRAINT [FK_StockTake_Admin] FOREIGN KEY([AdminID])
REFERENCES [dbo].[Admin] ([AdminID])
GO
ALTER TABLE [dbo].[StockTake] CHECK CONSTRAINT [FK_StockTake_Admin]
GO
ALTER TABLE [dbo].[StockTakeLine]  WITH CHECK ADD  CONSTRAINT [FK_StockTakeLine_StockItem] FOREIGN KEY([ItemID])
REFERENCES [dbo].[StockItem] ([ItemID])
GO
ALTER TABLE [dbo].[StockTakeLine] CHECK CONSTRAINT [FK_StockTakeLine_StockItem]
GO
ALTER TABLE [dbo].[StockTakeLine]  WITH CHECK ADD  CONSTRAINT [FK_StockTakeLine_StockTake] FOREIGN KEY([StockTakeID])
REFERENCES [dbo].[StockTake] ([StockTakeID])
GO
ALTER TABLE [dbo].[StockTakeLine] CHECK CONSTRAINT [FK_StockTakeLine_StockTake]
GO
ALTER TABLE [dbo].[SupplierOrder]  WITH CHECK ADD  CONSTRAINT [FK_SupplierOrder_Supplier] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Supplier] ([SupplierID])
GO
ALTER TABLE [dbo].[SupplierOrder] CHECK CONSTRAINT [FK_SupplierOrder_Supplier]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_UserRole] FOREIGN KEY([RoleID])
REFERENCES [dbo].[UserRole] ([RoleID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_UserRole]
GO
ALTER TABLE [dbo].[WriteOffLine]  WITH CHECK ADD  CONSTRAINT [FK_WriteOffLine_StockItem] FOREIGN KEY([ItemID])
REFERENCES [dbo].[StockItem] ([ItemID])
GO
ALTER TABLE [dbo].[WriteOffLine] CHECK CONSTRAINT [FK_WriteOffLine_StockItem]
GO
ALTER TABLE [dbo].[WriteOffLine]  WITH CHECK ADD  CONSTRAINT [FK_WriteOffLine_StockWriteOff] FOREIGN KEY([WriteOffID])
REFERENCES [dbo].[StockWriteOff] ([WriteOffID])
GO
ALTER TABLE [dbo].[WriteOffLine] CHECK CONSTRAINT [FK_WriteOffLine_StockWriteOff]
GO
USE [master]
GO
ALTER DATABASE [ExperTech] SET  READ_WRITE 
GO
