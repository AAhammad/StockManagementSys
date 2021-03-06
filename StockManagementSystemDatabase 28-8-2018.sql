USE [master]
GO
/****** Object:  Database [StockManagementSystemDB]    Script Date: 8/28/2018 6:00:37 PM ******/
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
/****** Object:  Table [dbo].[Category_tbl]    Script Date: 8/28/2018 6:00:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category_tbl](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Category_tbl] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Company_tbl]    Script Date: 8/28/2018 6:00:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company_tbl](
	[CompanyID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Company_tbl] PRIMARY KEY CLUSTERED 
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Item_tbl]    Script Date: 8/28/2018 6:00:37 PM ******/
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
/****** Object:  Table [dbo].[LogIn_tbl]    Script Date: 8/28/2018 6:00:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogIn_tbl](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_LogIn_tbl] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StockOut_tbl]    Script Date: 8/28/2018 6:00:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockOut_tbl](
	[StockOutID] [int] IDENTITY(1,1) NOT NULL,
	[ItemID] [int] NOT NULL,
	[StockOutQuantity] [int] NOT NULL,
	[Flag] [nvarchar](50) NOT NULL,
	[StockOutDate] [date] NOT NULL,
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
INSERT [dbo].[Category_tbl] ([CategoryID], [CategoryName]) VALUES (1005, N'Education')
INSERT [dbo].[Category_tbl] ([CategoryID], [CategoryName]) VALUES (1006, N'Electronicsss')
INSERT [dbo].[Category_tbl] ([CategoryID], [CategoryName]) VALUES (1007, N'Stationaryyyy')
INSERT [dbo].[Category_tbl] ([CategoryID], [CategoryName]) VALUES (1008, N'Kitchen itemsdf')
INSERT [dbo].[Category_tbl] ([CategoryID], [CategoryName]) VALUES (1010, N'Stati  onary')
SET IDENTITY_INSERT [dbo].[Category_tbl] OFF
SET IDENTITY_INSERT [dbo].[Company_tbl] ON 

INSERT [dbo].[Company_tbl] ([CompanyID], [CompanyName]) VALUES (1, N'Unilever')
INSERT [dbo].[Company_tbl] ([CompanyID], [CompanyName]) VALUES (2, N'RFL')
INSERT [dbo].[Company_tbl] ([CompanyID], [CompanyName]) VALUES (3, N'Walton')
INSERT [dbo].[Company_tbl] ([CompanyID], [CompanyName]) VALUES (4, N'Nova')
INSERT [dbo].[Company_tbl] ([CompanyID], [CompanyName]) VALUES (6, N'Oppo')
INSERT [dbo].[Company_tbl] ([CompanyID], [CompanyName]) VALUES (7, N'Oppooooo')
INSERT [dbo].[Company_tbl] ([CompanyID], [CompanyName]) VALUES (8, N'     Oppo')
SET IDENTITY_INSERT [dbo].[Company_tbl] OFF
SET IDENTITY_INSERT [dbo].[Item_tbl] ON 

INSERT [dbo].[Item_tbl] ([ItemID], [CategoryID], [CompanyID], [ItemName], [ReorderLevel], [AvailableQuantity]) VALUES (1, 1, 1, N'Bucket', 0, 8)
INSERT [dbo].[Item_tbl] ([ItemID], [CategoryID], [CompanyID], [ItemName], [ReorderLevel], [AvailableQuantity]) VALUES (2, 1, 1, N'chair', 5, 2)
INSERT [dbo].[Item_tbl] ([ItemID], [CategoryID], [CompanyID], [ItemName], [ReorderLevel], [AvailableQuantity]) VALUES (3, 1, 1, N'Table', 0, 20)
INSERT [dbo].[Item_tbl] ([ItemID], [CategoryID], [CompanyID], [ItemName], [ReorderLevel], [AvailableQuantity]) VALUES (4, 1, 1, N'Tab', 0, 5)
INSERT [dbo].[Item_tbl] ([ItemID], [CategoryID], [CompanyID], [ItemName], [ReorderLevel], [AvailableQuantity]) VALUES (6, 3, 2, N'Thin cable', 0, 5)
INSERT [dbo].[Item_tbl] ([ItemID], [CategoryID], [CompanyID], [ItemName], [ReorderLevel], [AvailableQuantity]) VALUES (7, 1, 1, N'chairyuyiuy', 0, 0)
INSERT [dbo].[Item_tbl] ([ItemID], [CategoryID], [CompanyID], [ItemName], [ReorderLevel], [AvailableQuantity]) VALUES (8, 4, 2, N'Rak', 0, 0)
INSERT [dbo].[Item_tbl] ([ItemID], [CategoryID], [CompanyID], [ItemName], [ReorderLevel], [AvailableQuantity]) VALUES (9, 1005, 1, N'Book', 10, 0)
INSERT [dbo].[Item_tbl] ([ItemID], [CategoryID], [CompanyID], [ItemName], [ReorderLevel], [AvailableQuantity]) VALUES (10, 1, 1, N' bOOk', 0, 0)
INSERT [dbo].[Item_tbl] ([ItemID], [CategoryID], [CompanyID], [ItemName], [ReorderLevel], [AvailableQuantity]) VALUES (11, 1, 2, N'Mug', 2, 0)
INSERT [dbo].[Item_tbl] ([ItemID], [CategoryID], [CompanyID], [ItemName], [ReorderLevel], [AvailableQuantity]) VALUES (12, 1, 1, N'BOO    k', 0, 0)
SET IDENTITY_INSERT [dbo].[Item_tbl] OFF
SET IDENTITY_INSERT [dbo].[LogIn_tbl] ON 

INSERT [dbo].[LogIn_tbl] ([UserID], [UserName], [Password]) VALUES (1, N'ali', N'ali       ')
INSERT [dbo].[LogIn_tbl] ([UserID], [UserName], [Password]) VALUES (2, N'polash', N'polash    ')
INSERT [dbo].[LogIn_tbl] ([UserID], [UserName], [Password]) VALUES (3, N'zubayer', N'zubayer   ')
INSERT [dbo].[LogIn_tbl] ([UserID], [UserName], [Password]) VALUES (4, N'marufa', N'marufa    ')
SET IDENTITY_INSERT [dbo].[LogIn_tbl] OFF
SET IDENTITY_INSERT [dbo].[StockOut_tbl] ON 

INSERT [dbo].[StockOut_tbl] ([StockOutID], [ItemID], [StockOutQuantity], [Flag], [StockOutDate]) VALUES (5, 3, 2, N'sell', CAST(0x983E0B00 AS Date))
INSERT [dbo].[StockOut_tbl] ([StockOutID], [ItemID], [StockOutQuantity], [Flag], [StockOutDate]) VALUES (6, 6, 2, N'sell', CAST(0x983E0B00 AS Date))
INSERT [dbo].[StockOut_tbl] ([StockOutID], [ItemID], [StockOutQuantity], [Flag], [StockOutDate]) VALUES (7, 1, 1, N'sell', CAST(0x993E0B00 AS Date))
INSERT [dbo].[StockOut_tbl] ([StockOutID], [ItemID], [StockOutQuantity], [Flag], [StockOutDate]) VALUES (8, 1, 2, N'sell', CAST(0x993E0B00 AS Date))
INSERT [dbo].[StockOut_tbl] ([StockOutID], [ItemID], [StockOutQuantity], [Flag], [StockOutDate]) VALUES (9, 2, 5, N'sell', CAST(0x993E0B00 AS Date))
INSERT [dbo].[StockOut_tbl] ([StockOutID], [ItemID], [StockOutQuantity], [Flag], [StockOutDate]) VALUES (10, 2, 5, N'sell', CAST(0x993E0B00 AS Date))
INSERT [dbo].[StockOut_tbl] ([StockOutID], [ItemID], [StockOutQuantity], [Flag], [StockOutDate]) VALUES (11, 1, 2, N'damage', CAST(0x9B3E0B00 AS Date))
INSERT [dbo].[StockOut_tbl] ([StockOutID], [ItemID], [StockOutQuantity], [Flag], [StockOutDate]) VALUES (12, 2, 1, N'lost', CAST(0x9B3E0B00 AS Date))
INSERT [dbo].[StockOut_tbl] ([StockOutID], [ItemID], [StockOutQuantity], [Flag], [StockOutDate]) VALUES (13, 6, 3, N'damage', CAST(0x9B3E0B00 AS Date))
INSERT [dbo].[StockOut_tbl] ([StockOutID], [ItemID], [StockOutQuantity], [Flag], [StockOutDate]) VALUES (14, 1, 5, N'sell', CAST(0x9B3E0B00 AS Date))
INSERT [dbo].[StockOut_tbl] ([StockOutID], [ItemID], [StockOutQuantity], [Flag], [StockOutDate]) VALUES (15, 1, 7, N'sell', CAST(0x9D3E0B00 AS Date))
INSERT [dbo].[StockOut_tbl] ([StockOutID], [ItemID], [StockOutQuantity], [Flag], [StockOutDate]) VALUES (16, 6, 2, N'sell', CAST(0x9D3E0B00 AS Date))
INSERT [dbo].[StockOut_tbl] ([StockOutID], [ItemID], [StockOutQuantity], [Flag], [StockOutDate]) VALUES (17, 3, 5, N'damage', CAST(0x9D3E0B00 AS Date))
INSERT [dbo].[StockOut_tbl] ([StockOutID], [ItemID], [StockOutQuantity], [Flag], [StockOutDate]) VALUES (18, 4, 1, N'damage', CAST(0x9D3E0B00 AS Date))
INSERT [dbo].[StockOut_tbl] ([StockOutID], [ItemID], [StockOutQuantity], [Flag], [StockOutDate]) VALUES (19, 1, 2, N'damage', CAST(0x9D3E0B00 AS Date))
INSERT [dbo].[StockOut_tbl] ([StockOutID], [ItemID], [StockOutQuantity], [Flag], [StockOutDate]) VALUES (20, 6, 1, N'damage', CAST(0x9D3E0B00 AS Date))
INSERT [dbo].[StockOut_tbl] ([StockOutID], [ItemID], [StockOutQuantity], [Flag], [StockOutDate]) VALUES (21, 4, 1, N'Lost', CAST(0x9D3E0B00 AS Date))
INSERT [dbo].[StockOut_tbl] ([StockOutID], [ItemID], [StockOutQuantity], [Flag], [StockOutDate]) VALUES (22, 6, 1, N'Damage', CAST(0x9D3E0B00 AS Date))
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
