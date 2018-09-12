USE [master]
GO
/****** Object:  Database [StockManagementSystemDB]    Script Date: 8/8/2018 2:05:36 AM ******/
CREATE DATABASE [StockManagementSystemDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StockManagementSystemDB', FILENAME = N'G:\BITM 2018\code\Project Stock Management System\database\StockManagementSystemDB.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'StockManagementSystemDB_log', FILENAME = N'G:\BITM 2018\code\Project Stock Management System\database\StockManagementSystemDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [StockManagementSystemDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StockManagementSystemDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StockManagementSystemDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StockManagementSystemDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StockManagementSystemDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StockManagementSystemDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StockManagementSystemDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [StockManagementSystemDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [StockManagementSystemDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [StockManagementSystemDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StockManagementSystemDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StockManagementSystemDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StockManagementSystemDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StockManagementSystemDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StockManagementSystemDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StockManagementSystemDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StockManagementSystemDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StockManagementSystemDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [StockManagementSystemDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StockManagementSystemDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StockManagementSystemDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StockManagementSystemDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StockManagementSystemDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StockManagementSystemDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StockManagementSystemDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StockManagementSystemDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [StockManagementSystemDB] SET  MULTI_USER 
GO
ALTER DATABASE [StockManagementSystemDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StockManagementSystemDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StockManagementSystemDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StockManagementSystemDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [StockManagementSystemDB]
GO
/****** Object:  Table [dbo].[Category_tbl]    Script Date: 8/8/2018 2:05:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category_tbl](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category_tbl] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Company_tbl]    Script Date: 8/8/2018 2:05:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company_tbl](
	[CompanyID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Company_tbl] PRIMARY KEY CLUSTERED 
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Item_tbl]    Script Date: 8/8/2018 2:05:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item_tbl](
	[ItemID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [int] NULL,
	[CompanyID] [int] NULL,
	[ItemName] [nvarchar](50) NULL,
	[ReorderLevel] [int] NULL,
	[AvailableQuantity] [int] NULL,
 CONSTRAINT [PK_Item_tbl] PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StockOut_tbl]    Script Date: 8/8/2018 2:05:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockOut_tbl](
	[StockOutID] [int] IDENTITY(1,1) NOT NULL,
	[ItemID] [int] NOT NULL,
	[StockOutQuantity] [int] NOT NULL,
	[Flag] [nvarchar](50) NOT NULL,
	[StockOutDate] [datetime] NOT NULL,
 CONSTRAINT [PK_StockOut_tbl] PRIMARY KEY CLUSTERED 
(
	[StockOutID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Category_tbl] ON 

INSERT [dbo].[Category_tbl] ([CategoryID], [CategoryName]) VALUES (1, N'Stationary')
INSERT [dbo].[Category_tbl] ([CategoryID], [CategoryName]) VALUES (2, N'Cosmetics')
INSERT [dbo].[Category_tbl] ([CategoryID], [CategoryName]) VALUES (3, N'Electronics')
INSERT [dbo].[Category_tbl] ([CategoryID], [CategoryName]) VALUES (4, N'Kitchen items')
SET IDENTITY_INSERT [dbo].[Category_tbl] OFF
SET IDENTITY_INSERT [dbo].[Company_tbl] ON 

INSERT [dbo].[Company_tbl] ([CompanyID], [CompanyName]) VALUES (1, N'Unilever')
INSERT [dbo].[Company_tbl] ([CompanyID], [CompanyName]) VALUES (2, N'RFL')
INSERT [dbo].[Company_tbl] ([CompanyID], [CompanyName]) VALUES (3, N'Walton')
INSERT [dbo].[Company_tbl] ([CompanyID], [CompanyName]) VALUES (4, N'Nova')
INSERT [dbo].[Company_tbl] ([CompanyID], [CompanyName]) VALUES (6, N'Oppo')
SET IDENTITY_INSERT [dbo].[Company_tbl] OFF
SET IDENTITY_INSERT [dbo].[Item_tbl] ON 

INSERT [dbo].[Item_tbl] ([ItemID], [CategoryID], [CompanyID], [ItemName], [ReorderLevel], [AvailableQuantity]) VALUES (1, 1, 1, N'Bucket', 0, 5)
INSERT [dbo].[Item_tbl] ([ItemID], [CategoryID], [CompanyID], [ItemName], [ReorderLevel], [AvailableQuantity]) VALUES (2, 1, 1, N'chair', 5, 3)
INSERT [dbo].[Item_tbl] ([ItemID], [CategoryID], [CompanyID], [ItemName], [ReorderLevel], [AvailableQuantity]) VALUES (3, 1, 1, N'Table', 0, 5)
INSERT [dbo].[Item_tbl] ([ItemID], [CategoryID], [CompanyID], [ItemName], [ReorderLevel], [AvailableQuantity]) VALUES (4, 1, 1, N'Tab', 0, 3)
INSERT [dbo].[Item_tbl] ([ItemID], [CategoryID], [CompanyID], [ItemName], [ReorderLevel], [AvailableQuantity]) VALUES (6, 3, 2, N'Thin cable', 0, 12)
SET IDENTITY_INSERT [dbo].[Item_tbl] OFF
SET IDENTITY_INSERT [dbo].[StockOut_tbl] ON 

INSERT [dbo].[StockOut_tbl] ([StockOutID], [ItemID], [StockOutQuantity], [Flag], [StockOutDate]) VALUES (1, 1, 5, N'sell', CAST(0x0000A935000DDA18 AS DateTime))
INSERT [dbo].[StockOut_tbl] ([StockOutID], [ItemID], [StockOutQuantity], [Flag], [StockOutDate]) VALUES (2, 6, 5, N'sell', CAST(0x0000A935000DDB44 AS DateTime))
INSERT [dbo].[StockOut_tbl] ([StockOutID], [ItemID], [StockOutQuantity], [Flag], [StockOutDate]) VALUES (3, 6, 5, N'sell', CAST(0x0000A935000FD32C AS DateTime))
INSERT [dbo].[StockOut_tbl] ([StockOutID], [ItemID], [StockOutQuantity], [Flag], [StockOutDate]) VALUES (4, 1, 5, N'sell', CAST(0x0000A9350010647C AS DateTime))
INSERT [dbo].[StockOut_tbl] ([StockOutID], [ItemID], [StockOutQuantity], [Flag], [StockOutDate]) VALUES (5, 1, 5, N'sell', CAST(0x0000A935001170D8 AS DateTime))
INSERT [dbo].[StockOut_tbl] ([StockOutID], [ItemID], [StockOutQuantity], [Flag], [StockOutDate]) VALUES (6, 1, 5, N'sell', CAST(0x0000A935001236E4 AS DateTime))
INSERT [dbo].[StockOut_tbl] ([StockOutID], [ItemID], [StockOutQuantity], [Flag], [StockOutDate]) VALUES (7, 1, 5, N'sell', CAST(0x0000A935001287C0 AS DateTime))
INSERT [dbo].[StockOut_tbl] ([StockOutID], [ItemID], [StockOutQuantity], [Flag], [StockOutDate]) VALUES (8, 1, 5, N'sell', CAST(0x0000A93500145578 AS DateTime))
INSERT [dbo].[StockOut_tbl] ([StockOutID], [ItemID], [StockOutQuantity], [Flag], [StockOutDate]) VALUES (9, 1, 5, N'damage', CAST(0x0000A93500146388 AS DateTime))
INSERT [dbo].[StockOut_tbl] ([StockOutID], [ItemID], [StockOutQuantity], [Flag], [StockOutDate]) VALUES (10, 2, 5, N'damage', CAST(0x0000A93500146388 AS DateTime))
INSERT [dbo].[StockOut_tbl] ([StockOutID], [ItemID], [StockOutQuantity], [Flag], [StockOutDate]) VALUES (11, 1, 5, N'sell', CAST(0x0000A9350014E218 AS DateTime))
INSERT [dbo].[StockOut_tbl] ([StockOutID], [ItemID], [StockOutQuantity], [Flag], [StockOutDate]) VALUES (12, 6, 5, N'damage', CAST(0x0000A9350014F4D8 AS DateTime))
INSERT [dbo].[StockOut_tbl] ([StockOutID], [ItemID], [StockOutQuantity], [Flag], [StockOutDate]) VALUES (13, 4, 5, N'damage', CAST(0x0000A9350016C740 AS DateTime))
INSERT [dbo].[StockOut_tbl] ([StockOutID], [ItemID], [StockOutQuantity], [Flag], [StockOutDate]) VALUES (14, 4, 5, N'lost', CAST(0x0000A93500170688 AS DateTime))
INSERT [dbo].[StockOut_tbl] ([StockOutID], [ItemID], [StockOutQuantity], [Flag], [StockOutDate]) VALUES (15, 4, 2, N'lost', CAST(0x0000A935001A7DA4 AS DateTime))
INSERT [dbo].[StockOut_tbl] ([StockOutID], [ItemID], [StockOutQuantity], [Flag], [StockOutDate]) VALUES (16, 1, 5, N'sell', CAST(0x0000A936000AA370 AS DateTime))
SET IDENTITY_INSERT [dbo].[StockOut_tbl] OFF
ALTER TABLE [dbo].[Item_tbl] ADD  CONSTRAINT [DF_Item_tbl_AvailableQuantity]  DEFAULT ((0)) FOR [AvailableQuantity]
GO
ALTER TABLE [dbo].[Item_tbl]  WITH CHECK ADD  CONSTRAINT [FK_Item_tbl_Category_tbl] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category_tbl] ([CategoryID])
GO
ALTER TABLE [dbo].[Item_tbl] CHECK CONSTRAINT [FK_Item_tbl_Category_tbl]
GO
ALTER TABLE [dbo].[Item_tbl]  WITH CHECK ADD  CONSTRAINT [FK_Item_tbl_Company_tbl] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[Company_tbl] ([CompanyID])
GO
ALTER TABLE [dbo].[Item_tbl] CHECK CONSTRAINT [FK_Item_tbl_Company_tbl]
GO
ALTER TABLE [dbo].[StockOut_tbl]  WITH CHECK ADD  CONSTRAINT [FK_StockOut_tbl_Item_tbl] FOREIGN KEY([ItemID])
REFERENCES [dbo].[Item_tbl] ([ItemID])
GO
ALTER TABLE [dbo].[StockOut_tbl] CHECK CONSTRAINT [FK_StockOut_tbl_Item_tbl]
GO
USE [master]
GO
ALTER DATABASE [StockManagementSystemDB] SET  READ_WRITE 
GO
