USE [master]
GO
/****** Object:  Database [FDB09]    Script Date: 2023/10/6 下午 12:38:40 ******/
CREATE DATABASE [FDB09]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FDB09', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQL2022\MSSQL\DATA\FDB09.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FDB09_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQL2022\MSSQL\DATA\FDB09_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [FDB09] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FDB09].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FDB09] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FDB09] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FDB09] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FDB09] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FDB09] SET ARITHABORT OFF 
GO
ALTER DATABASE [FDB09] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FDB09] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FDB09] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FDB09] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FDB09] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FDB09] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FDB09] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FDB09] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FDB09] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FDB09] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FDB09] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FDB09] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FDB09] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FDB09] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FDB09] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FDB09] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FDB09] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FDB09] SET RECOVERY FULL 
GO
ALTER DATABASE [FDB09] SET  MULTI_USER 
GO
ALTER DATABASE [FDB09] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FDB09] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FDB09] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FDB09] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FDB09] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FDB09] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'FDB09', N'ON'
GO
ALTER DATABASE [FDB09] SET QUERY_STORE = ON
GO
ALTER DATABASE [FDB09] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [FDB09]
GO
/****** Object:  User [sa5]    Script Date: 2023/10/6 下午 12:38:40 ******/
CREATE USER [sa5] FOR LOGIN [sa5] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [sa5]
GO
/****** Object:  Table [dbo].[CartItemDetail]    Script Date: 2023/10/6 下午 12:38:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartItemDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CartItemId] [int] NOT NULL,
	[MealId] [int] NOT NULL,
	[Qty] [int] NOT NULL,
 CONSTRAINT [PK_CartItemDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartItems]    Script Date: 2023/10/6 下午 12:38:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CartId] [int] NOT NULL,
 CONSTRAINT [PK_CartItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carts]    Script Date: 2023/10/6 下午 12:38:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MemberAccount] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Carts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 2023/10/6 下午 12:38:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[DisplayOrder] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Meals]    Script Date: 2023/10/6 下午 12:38:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Meals](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Price] [int] NOT NULL,
	[Status] [bit] NOT NULL,
	[Description] [nvarchar](3000) NOT NULL,
	[MealsImage] [nvarchar](50) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_Meals] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Members]    Script Date: 2023/10/6 下午 12:38:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Members](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Account] [nvarchar](50) NOT NULL,
	[EncryptedPassword] [nvarchar](70) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[PhoneNumber] [nchar](10) NOT NULL,
	[HasReservation] [bit] NULL,
	[IsConfirmed] [bit] NULL,
	[ConfirmCode] [varchar](50) NULL,
 CONSTRAINT [PK_Members] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItemDetail]    Script Date: 2023/10/6 下午 12:38:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItemDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderItemId] [int] NOT NULL,
	[MealId] [int] NOT NULL,
	[MealName] [nvarchar](50) NOT NULL,
	[MealPrice] [int] NOT NULL,
	[Qty] [int] NOT NULL,
 CONSTRAINT [PK_OrderItemDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItems]    Script Date: 2023/10/6 下午 12:38:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
 CONSTRAINT [PK_OrderItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 2023/10/6 下午 12:38:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [int] NOT NULL,
	[TableNums] [int] NOT NULL,
	[OrderTime] [datetime] NOT NULL,
	[ReservationTime] [datetime] NOT NULL,
	[AdvancePayment] [int] NOT NULL,
	[Diners] [int] NOT NULL,
	[TotalPrice] [int] NOT NULL,
	[IsCancel] [bit] NULL,
	[IsRefund] [bit] NULL,
	[PhoneNumber] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Table]    Script Date: 2023/10/6 下午 12:38:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Seats] [int] NOT NULL,
	[TableNums] [int] NOT NULL,
 CONSTRAINT [PK_Table] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2023/10/6 下午 12:38:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Account] [nvarchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Enabled] [bit] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CartItemDetail] ON 
GO
INSERT [dbo].[CartItemDetail] ([Id], [CartItemId], [MealId], [Qty]) VALUES (1127, 1034, 1, 1)
GO
INSERT [dbo].[CartItemDetail] ([Id], [CartItemId], [MealId], [Qty]) VALUES (1128, 1034, 7, 1)
GO
INSERT [dbo].[CartItemDetail] ([Id], [CartItemId], [MealId], [Qty]) VALUES (1129, 1034, 3, 1)
GO
INSERT [dbo].[CartItemDetail] ([Id], [CartItemId], [MealId], [Qty]) VALUES (1130, 1034, 5, 1)
GO
INSERT [dbo].[CartItemDetail] ([Id], [CartItemId], [MealId], [Qty]) VALUES (2065, 2018, 1, 1)
GO
INSERT [dbo].[CartItemDetail] ([Id], [CartItemId], [MealId], [Qty]) VALUES (2066, 2018, 1017, 1)
GO
INSERT [dbo].[CartItemDetail] ([Id], [CartItemId], [MealId], [Qty]) VALUES (2067, 2018, 1019, 1)
GO
INSERT [dbo].[CartItemDetail] ([Id], [CartItemId], [MealId], [Qty]) VALUES (2068, 2018, 1021, 1)
GO
INSERT [dbo].[CartItemDetail] ([Id], [CartItemId], [MealId], [Qty]) VALUES (2069, 2019, 1015, 1)
GO
INSERT [dbo].[CartItemDetail] ([Id], [CartItemId], [MealId], [Qty]) VALUES (2070, 2019, 7, 1)
GO
INSERT [dbo].[CartItemDetail] ([Id], [CartItemId], [MealId], [Qty]) VALUES (2071, 2019, 1020, 1)
GO
INSERT [dbo].[CartItemDetail] ([Id], [CartItemId], [MealId], [Qty]) VALUES (2072, 2019, 4, 1)
GO
INSERT [dbo].[CartItemDetail] ([Id], [CartItemId], [MealId], [Qty]) VALUES (2073, 2020, 6, 1)
GO
INSERT [dbo].[CartItemDetail] ([Id], [CartItemId], [MealId], [Qty]) VALUES (2074, 2020, 7, 1)
GO
INSERT [dbo].[CartItemDetail] ([Id], [CartItemId], [MealId], [Qty]) VALUES (2075, 2020, 8, 1)
GO
INSERT [dbo].[CartItemDetail] ([Id], [CartItemId], [MealId], [Qty]) VALUES (2076, 2020, 5, 1)
GO
SET IDENTITY_INSERT [dbo].[CartItemDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[CartItems] ON 
GO
INSERT [dbo].[CartItems] ([Id], [CartId]) VALUES (1034, 20)
GO
INSERT [dbo].[CartItems] ([Id], [CartId]) VALUES (2018, 1008)
GO
INSERT [dbo].[CartItems] ([Id], [CartId]) VALUES (2019, 1008)
GO
INSERT [dbo].[CartItems] ([Id], [CartId]) VALUES (2020, 1008)
GO
SET IDENTITY_INSERT [dbo].[CartItems] OFF
GO
SET IDENTITY_INSERT [dbo].[Carts] ON 
GO
INSERT [dbo].[Carts] ([Id], [MemberAccount]) VALUES (1011, N'Allen')
GO
INSERT [dbo].[Carts] ([Id], [MemberAccount]) VALUES (9, N'Ann')
GO
INSERT [dbo].[Carts] ([Id], [MemberAccount]) VALUES (1009, N'Luca')
GO
INSERT [dbo].[Carts] ([Id], [MemberAccount]) VALUES (20, N'Lunderu')
GO
INSERT [dbo].[Carts] ([Id], [MemberAccount]) VALUES (1008, N'QQQ')
GO
SET IDENTITY_INSERT [dbo].[Carts] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 
GO
INSERT [dbo].[Categories] ([Id], [Name], [DisplayOrder], [CreatedDate], [ModifiedDate]) VALUES (1, N'主菜', 1, CAST(N'2023-09-21T10:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Categories] ([Id], [Name], [DisplayOrder], [CreatedDate], [ModifiedDate]) VALUES (2, N'開胃菜', 2, CAST(N'2023-09-21T10:05:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Categories] ([Id], [Name], [DisplayOrder], [CreatedDate], [ModifiedDate]) VALUES (3, N'配菜', 3, CAST(N'2023-09-21T10:05:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Categories] ([Id], [Name], [DisplayOrder], [CreatedDate], [ModifiedDate]) VALUES (4, N'甜點', 4, CAST(N'2023-09-21T10:07:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Categories] ([Id], [Name], [DisplayOrder], [CreatedDate], [ModifiedDate]) VALUES (5, N'飲料', 5, CAST(N'2023-09-21T10:07:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Categories] ([Id], [Name], [DisplayOrder], [CreatedDate], [ModifiedDate]) VALUES (6, N'酒精', 6, CAST(N'2023-09-21T10:10:00.000' AS DateTime), NULL)
GO
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Meals] ON 
GO
INSERT [dbo].[Meals] ([Id], [Name], [CategoryId], [Price], [Status], [Description], [MealsImage], [CreatedDate], [ModifiedDate]) VALUES (1, N'西班牙海鮮燉飯', 1, 250, 1, N'源自西班牙的烹飪傳統結合了優質的海鮮和香濃的番茄底湯再加入一些特色的香料燉煮而成', N'ting-tian-_79ZJS8pV70-unsplash.jpg', CAST(N'2023-09-21T11:00:00.000' AS DateTime), CAST(N'2023-10-05T14:05:12.663' AS DateTime))
GO
INSERT [dbo].[Meals] ([Id], [Name], [CategoryId], [Price], [Status], [Description], [MealsImage], [CreatedDate], [ModifiedDate]) VALUES (2, N'美式巧達濃湯', 2, 120, 1, N'濃湯', N'AmericanChipotleSoup.jpg', CAST(N'2023-09-21T11:00:00.000' AS DateTime), CAST(N'2023-10-05T13:57:25.413' AS DateTime))
GO
INSERT [dbo].[Meals] ([Id], [Name], [CategoryId], [Price], [Status], [Description], [MealsImage], [CreatedDate], [ModifiedDate]) VALUES (3, N'芒果乳酪塔', 4, 150, 1, N'使用新鮮愛文芒果', N'victoria-druc--R7mf6lQ4P8-unsplash.jpg', CAST(N'2023-09-21T11:00:00.000' AS DateTime), CAST(N'2023-10-05T13:21:14.940' AS DateTime))
GO
INSERT [dbo].[Meals] ([Id], [Name], [CategoryId], [Price], [Status], [Description], [MealsImage], [CreatedDate], [ModifiedDate]) VALUES (4, N'芒果汁', 5, 110, 1, N'台灣本土愛文芒果', N'sam-hojati-lw8GflbJwLc-unsplash.jpg', CAST(N'2023-09-21T11:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Meals] ([Id], [Name], [CategoryId], [Price], [Status], [Description], [MealsImage], [CreatedDate], [ModifiedDate]) VALUES (5, N'水果綜合汁', 5, 110, 1, N'台灣當季水果', N'whitney-wright-TgQkxQc-t_U-unsplash.jpg', CAST(N'2023-09-21T11:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Meals] ([Id], [Name], [CategoryId], [Price], [Status], [Description], [MealsImage], [CreatedDate], [ModifiedDate]) VALUES (6, N'番茄肉醬義大利麵', 1, 220, 1, N'番茄、牛絞肉', N'ben-lei-flFd8L7_B3g-unsplash.jpg', CAST(N'2023-09-21T11:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Meals] ([Id], [Name], [CategoryId], [Price], [Status], [Description], [MealsImage], [CreatedDate], [ModifiedDate]) VALUES (7, N'法式南瓜濃湯佐軟法麵包', 2, 120, 1, N'南瓜', N'kirill-ermakov-17SvN08MV_s-unsplash.jpg', CAST(N'2023-09-21T11:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Meals] ([Id], [Name], [CategoryId], [Price], [Status], [Description], [MealsImage], [CreatedDate], [ModifiedDate]) VALUES (8, N'紅絲絨蛋糕', 4, 120, 1, N'巧克力口味，內餡夾層為奶油乳酪', N'amirali-mirhashemian-EfkMkUXs0fU-unsplash.jpg', CAST(N'2023-09-21T11:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Meals] ([Id], [Name], [CategoryId], [Price], [Status], [Description], [MealsImage], [CreatedDate], [ModifiedDate]) VALUES (9, N'Chardonnay', 6, 250, 1, N'白酒', N'jordon-kaplan-d4aipVIDqYs-unsplash.jpg', CAST(N'2023-09-21T11:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Meals] ([Id], [Name], [CategoryId], [Price], [Status], [Description], [MealsImage], [CreatedDate], [ModifiedDate]) VALUES (10, N'Corvina', 6, 300, 1, N'紅酒', N'bruno-martins-Pfrne_5S_-8-unsplash.jpg', CAST(N'2023-09-21T11:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Meals] ([Id], [Name], [CategoryId], [Price], [Status], [Description], [MealsImage], [CreatedDate], [ModifiedDate]) VALUES (11, N'水牛城辣雞翅', 3, 150, 1, N'台灣土雞', N'atharva-tulsi-Yh9Ut4d3K0A-unsplash.jpg', CAST(N'2023-09-21T11:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Meals] ([Id], [Name], [CategoryId], [Price], [Status], [Description], [MealsImage], [CreatedDate], [ModifiedDate]) VALUES (12, N'義式牛肉丸', 3, 120, 1, N'澳洲牛肉', N'emiliano-vittoriosi-OFismyezPnY-unsplash.jpg', CAST(N'2023-09-21T11:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Meals] ([Id], [Name], [CategoryId], [Price], [Status], [Description], [MealsImage], [CreatedDate], [ModifiedDate]) VALUES (13, N'香煎嫩烤翼板牛排佐薯條', 1, 350, 1, N'澳洲牛肉、舒肥牛排', N'香煎嫩烤翼板牛排佐薯條Flat Iron Steak .jpg', CAST(N'2023-10-04T00:00:00.000' AS DateTime), CAST(N'2023-10-05T13:21:40.433' AS DateTime))
GO
INSERT [dbo].[Meals] ([Id], [Name], [CategoryId], [Price], [Status], [Description], [MealsImage], [CreatedDate], [ModifiedDate]) VALUES (14, N'煙燻番茄醬雙層牛堡', 1, 280, 1, N'漢堡', N'123.jpg', CAST(N'2023-10-04T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Meals] ([Id], [Name], [CategoryId], [Price], [Status], [Description], [MealsImage], [CreatedDate], [ModifiedDate]) VALUES (1015, N'香辣蛤蠣義大利麵', 1, 250, 0, N'台灣朝天椒、台灣蛤蠣', N'aushnsye.xfs.jpg', CAST(N'2023-10-05T13:34:58.773' AS DateTime), CAST(N'2023-10-05T13:49:09.933' AS DateTime))
GO
INSERT [dbo].[Meals] ([Id], [Name], [CategoryId], [Price], [Status], [Description], [MealsImage], [CreatedDate], [ModifiedDate]) VALUES (1016, N'Negroamaro', 6, 420, 0, N'是一種意大利葡萄酒的葡萄品種也是一個來自南部普利亞（Puglia）地區的紅葡萄酒', N'errxiuqv.mlo.jpg', CAST(N'2023-10-05T14:01:47.193' AS DateTime), CAST(N'2023-10-05T14:01:47.193' AS DateTime))
GO
INSERT [dbo].[Meals] ([Id], [Name], [CategoryId], [Price], [Status], [Description], [MealsImage], [CreatedDate], [ModifiedDate]) VALUES (1017, N'義式蔬菜湯', 2, 150, 0, N'當季新鮮蔬菜', N'rvl04jlr.gte.jpg', CAST(N'2023-10-05T14:07:26.547' AS DateTime), CAST(N'2023-10-05T14:07:26.547' AS DateTime))
GO
INSERT [dbo].[Meals] ([Id], [Name], [CategoryId], [Price], [Status], [Description], [MealsImage], [CreatedDate], [ModifiedDate]) VALUES (1018, N'生火腿沙拉佐巴薩米克', 2, 180, 0, N'煙燻生火腿', N'jgnvvkat.2im.jpg', CAST(N'2023-10-05T14:08:33.230' AS DateTime), CAST(N'2023-10-05T14:08:33.230' AS DateTime))
GO
INSERT [dbo].[Meals] ([Id], [Name], [CategoryId], [Price], [Status], [Description], [MealsImage], [CreatedDate], [ModifiedDate]) VALUES (1019, N'水果鬆餅', 4, 210, 0, N'法國藍帶主廚精心調製配方', N'ixnxdqxu.ayu.jpg', CAST(N'2023-10-05T14:10:30.087' AS DateTime), CAST(N'2023-10-05T14:10:30.087' AS DateTime))
GO
INSERT [dbo].[Meals] ([Id], [Name], [CategoryId], [Price], [Status], [Description], [MealsImage], [CreatedDate], [ModifiedDate]) VALUES (1020, N'鮮奶油草莓蛋糕', 4, 160, 0, N'Strawberry Shortcake', N'p5dm4hy0.edr.jpg', CAST(N'2023-10-05T14:11:05.260' AS DateTime), CAST(N'2023-10-05T14:11:05.260' AS DateTime))
GO
INSERT [dbo].[Meals] ([Id], [Name], [CategoryId], [Price], [Status], [Description], [MealsImage], [CreatedDate], [ModifiedDate]) VALUES (1021, N'手打焦糖奶蓋咖啡', 5, 100, 0, N'Dalgona Coffee', N'qvobo2r0.tyy.jpg', CAST(N'2023-10-05T14:12:03.920' AS DateTime), CAST(N'2023-10-05T14:14:06.607' AS DateTime))
GO
INSERT [dbo].[Meals] ([Id], [Name], [CategoryId], [Price], [Status], [Description], [MealsImage], [CreatedDate], [ModifiedDate]) VALUES (1022, N'鮮打柳橙汁', 5, 90, 0, N'Orange Juice', N'ov0tkr3c.kmw.jpg', CAST(N'2023-10-05T14:12:46.963' AS DateTime), CAST(N'2023-10-05T14:12:46.963' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Meals] OFF
GO
SET IDENTITY_INSERT [dbo].[Members] ON 
GO
INSERT [dbo].[Members] ([Id], [Account], [EncryptedPassword], [Name], [Email], [PhoneNumber], [HasReservation], [IsConfirmed], [ConfirmCode]) VALUES (1, N'Allen', N'8DBAEE50312A0837FD5BF7A80B90AAF32DC2D6AB935ED71AB64F27E708C242CE', N'Allen', N'Allen@gmail.com', N'0912123456', NULL, 1, N'03240fe1d2eb41ec932f04ce6a7dc1f8')
GO
INSERT [dbo].[Members] ([Id], [Account], [EncryptedPassword], [Name], [Email], [PhoneNumber], [HasReservation], [IsConfirmed], [ConfirmCode]) VALUES (2, N'Candice', N'8DBAEE50312A0837FD5BF7A80B90AAF32DC2D6AB935ED71AB64F27E708C242CE', N'Candice Chen', N'Camdice@gmail.com', N'0912345678', NULL, 1, N'59938f21fc9943e2998ecd1407ec9236')
GO
INSERT [dbo].[Members] ([Id], [Account], [EncryptedPassword], [Name], [Email], [PhoneNumber], [HasReservation], [IsConfirmed], [ConfirmCode]) VALUES (3, N'Paula', N'8DBAEE50312A0837FD5BF7A80B90AAF32DC2D6AB935ED71AB64F27E708C242CE', N'Paula Kuo', N'Paula@gmail.com', N'0912123456', NULL, 1, N'15aefc277314473fa5431c6467cddd59')
GO
INSERT [dbo].[Members] ([Id], [Account], [EncryptedPassword], [Name], [Email], [PhoneNumber], [HasReservation], [IsConfirmed], [ConfirmCode]) VALUES (4, N'Ken', N'8DBAEE50312A0837FD5BF7A80B90AAF32DC2D6AB935ED71AB64F27E708C242CE', N'Ken', N'Ken@gmail.com', N'0912123456', NULL, 1, N'474d9a1045864a1fb7cb615ee1c7aa39')
GO
INSERT [dbo].[Members] ([Id], [Account], [EncryptedPassword], [Name], [Email], [PhoneNumber], [HasReservation], [IsConfirmed], [ConfirmCode]) VALUES (5, N'Amy', N'8DBAEE50312A0837FD5BF7A80B90AAF32DC2D6AB935ED71AB64F27E708C242CE', N'Amy', N'Amy@gmail.com', N'0912123456', NULL, 1, N'6ab08853e75f4324a914dc4c78929099')
GO
INSERT [dbo].[Members] ([Id], [Account], [EncryptedPassword], [Name], [Email], [PhoneNumber], [HasReservation], [IsConfirmed], [ConfirmCode]) VALUES (6, N'Luca', N'8DBAEE50312A0837FD5BF7A80B90AAF32DC2D6AB935ED71AB64F27E708C242CE', N'Luca', N'Luca@gmail.com', N'0912123456', NULL, 1, N'bc28cf32212a4da8bea466279b6e3c4a')
GO
INSERT [dbo].[Members] ([Id], [Account], [EncryptedPassword], [Name], [Email], [PhoneNumber], [HasReservation], [IsConfirmed], [ConfirmCode]) VALUES (7, N'Inder', N'8DBAEE50312A0837FD5BF7A80B90AAF32DC2D6AB935ED71AB64F27E708C242CE', N'Inder', N'Inder@gmail.com', N'0912123456', NULL, 1, N'aa25627b3d924f038cb87037151c888a')
GO
INSERT [dbo].[Members] ([Id], [Account], [EncryptedPassword], [Name], [Email], [PhoneNumber], [HasReservation], [IsConfirmed], [ConfirmCode]) VALUES (8, N'Kyriaos', N'8DBAEE50312A0837FD5BF7A80B90AAF32DC2D6AB935ED71AB64F27E708C242CE', N'Kyriaos', N'Kyriaos@gmail.com', N'0912123456', NULL, 1, N'e5e567bee45a46ecb9687129473ecac8')
GO
INSERT [dbo].[Members] ([Id], [Account], [EncryptedPassword], [Name], [Email], [PhoneNumber], [HasReservation], [IsConfirmed], [ConfirmCode]) VALUES (9, N'Sensei', N'8DBAEE50312A0837FD5BF7A80B90AAF32DC2D6AB935ED71AB64F27E708C242CE', N'Sensei', N'Sensei@gmail.com', N'0912123456', NULL, 1, N'4f780133cade437aaa1b20c2978dcef8')
GO
INSERT [dbo].[Members] ([Id], [Account], [EncryptedPassword], [Name], [Email], [PhoneNumber], [HasReservation], [IsConfirmed], [ConfirmCode]) VALUES (10, N'Cris', N'8DBAEE50312A0837FD5BF7A80B90AAF32DC2D6AB935ED71AB64F27E708C242CE', N'Cris', N'Cris@gmail.com', N'0912123456', NULL, 1, N'5edb633e219a477680ef9fdbc0a45d0f')
GO
INSERT [dbo].[Members] ([Id], [Account], [EncryptedPassword], [Name], [Email], [PhoneNumber], [HasReservation], [IsConfirmed], [ConfirmCode]) VALUES (11, N'Bruv', N'8DBAEE50312A0837FD5BF7A80B90AAF32DC2D6AB935ED71AB64F27E708C242CE', N'Bruv', N'Bruv@gmail.com', N'0912123456', NULL, 1, N'6fff76d598de4396bfbe5f85e0f9882e')
GO
INSERT [dbo].[Members] ([Id], [Account], [EncryptedPassword], [Name], [Email], [PhoneNumber], [HasReservation], [IsConfirmed], [ConfirmCode]) VALUES (12, N'Lunderu', N'8DBAEE50312A0837FD5BF7A80B90AAF32DC2D6AB935ED71AB64F27E708C242CE', N'Lunderu', N'Lunderu@gmail.com', N'0912123456', NULL, 1, N'3fb55860fcee42bbb601f271d3dc12f5')
GO
INSERT [dbo].[Members] ([Id], [Account], [EncryptedPassword], [Name], [Email], [PhoneNumber], [HasReservation], [IsConfirmed], [ConfirmCode]) VALUES (13, N'Mame', N'8DBAEE50312A0837FD5BF7A80B90AAF32DC2D6AB935ED71AB64F27E708C242CE', N'Mame', N'Mame@gmail.com', N'0912123456', NULL, 1, N'4ffab3fd945447d68660484bd69e14e5')
GO
INSERT [dbo].[Members] ([Id], [Account], [EncryptedPassword], [Name], [Email], [PhoneNumber], [HasReservation], [IsConfirmed], [ConfirmCode]) VALUES (14, N'123123132', N'8DBAEE50312A0837FD5BF7A80B90AAF32DC2D6AB935ED71AB64F27E708C242CE', N'12312313', N'1213132@gfgd', N'13213131  ', NULL, 1, N'a87997dcb9ad48f3a3e233e449a7248f')
GO
INSERT [dbo].[Members] ([Id], [Account], [EncryptedPassword], [Name], [Email], [PhoneNumber], [HasReservation], [IsConfirmed], [ConfirmCode]) VALUES (15, N'5566', N'8DBAEE50312A0837FD5BF7A80B90AAF32DC2D6AB935ED71AB64F27E708C242CE', N'12312313', N'1213132@gfgd', N'13213131  ', NULL, 1, N'383b507d9a294a28967abea87fa0c2fc')
GO
INSERT [dbo].[Members] ([Id], [Account], [EncryptedPassword], [Name], [Email], [PhoneNumber], [HasReservation], [IsConfirmed], [ConfirmCode]) VALUES (16, N'Ann', N'8DBAEE50312A0837FD5BF7A80B90AAF32DC2D6AB935ED71AB64F27E708C242CE', N'Ann', N'Ann@gmail.com', N'0988123789', NULL, 1, N'0fe99b82b83a4f318acb2d07c6fc68ff')
GO
INSERT [dbo].[Members] ([Id], [Account], [EncryptedPassword], [Name], [Email], [PhoneNumber], [HasReservation], [IsConfirmed], [ConfirmCode]) VALUES (17, N'Tom', N'8DBAEE50312A0837FD5BF7A80B90AAF32DC2D6AB935ED71AB64F27E708C242CE', N'Tom', N'Tom@gmail.com', N'0988777456', NULL, 1, N'30aaa04e39124d0e9bc6deed143ed309')
GO
INSERT [dbo].[Members] ([Id], [Account], [EncryptedPassword], [Name], [Email], [PhoneNumber], [HasReservation], [IsConfirmed], [ConfirmCode]) VALUES (1016, N'QQQ', N'8DBAEE50312A0837FD5BF7A80B90AAF32DC2D6AB935ED71AB64F27E708C242CE', N'QQQ', N'QQQ@gmail.com', N'0955123456', NULL, 1, N'f803141d89d246c1a57e2f57863640d5')
GO
INSERT [dbo].[Members] ([Id], [Account], [EncryptedPassword], [Name], [Email], [PhoneNumber], [HasReservation], [IsConfirmed], [ConfirmCode]) VALUES (1017, N'annn', N'8DBAEE50312A0837FD5BF7A80B90AAF32DC2D6AB935ED71AB64F27E708C242CE', N'annn', N'annn@gmail.com', N'0912123445', NULL, 0, N'ef891ee0f5c04333967b1ca15e44e54b')
GO
SET IDENTITY_INSERT [dbo].[Members] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderItemDetail] ON 
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1, 1, 6, N'番茄肉醬義大利麵', 220, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (2, 1, 7, N'法式南瓜濃湯佐軟法麵包', 120, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (3, 1, 3, N'芒果乳酪塔', 150, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (4, 1, 4, N'芒果汁', 110, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (5, 2, 1, N'西班牙海鮮燉飯', 250, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (6, 2, 2, N'美式巧達濃湯', 120, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (7, 2, 3, N'芒果乳酪塔', 150, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (8, 2, 4, N'芒果汁', 110, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (9, 3, 1, N'西班牙海鮮燉飯', 250, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (11, 3, 7, N'法式南瓜濃湯佐軟法麵包', 120, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (12, 3, 3, N'芒果乳酪塔', 150, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (13, 3, 5, N'水果綜合汁', 110, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (14, 4, 6, N'番茄肉醬義大利麵', 220, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (15, 4, 7, N'法式南瓜濃湯佐軟法麵包', 120, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (16, 4, 3, N'芒果乳酪塔', 150, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (17, 4, 4, N'芒果汁', 110, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (18, 5, 6, N'番茄肉醬義大利麵', 220, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (19, 5, 2, N'美式巧達濃湯', 120, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (20, 5, 8, N'紅絲絨蛋糕', 120, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (21, 5, 4, N'芒果汁', 110, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (22, 6, 1, N'西班牙海鮮燉飯', 250, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (24, 6, 7, N'法式南瓜濃湯佐軟法麵包', 120, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (25, 6, 3, N'芒果乳酪塔', 150, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (26, 6, 4, N'芒果汁', 110, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (27, 7, 1, N'西班牙海鮮燉飯', 250, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (28, 7, 7, N'法式南瓜濃湯佐軟法麵包', 120, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (29, 7, 3, N'芒果乳酪塔', 150, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (30, 7, 5, N'水果綜合汁', 110, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (31, 8, 1, N'西班牙海鮮燉飯', 250, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (32, 8, 7, N'法式南瓜濃湯佐軟法麵包', 120, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (33, 8, 3, N'芒果乳酪塔', 150, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (35, 8, 4, N'芒果汁', 110, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (36, 9, 1, N'西班牙海鮮燉飯', 250, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (37, 9, 7, N'法式南瓜濃湯佐軟法麵包', 120, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (38, 9, 3, N'芒果乳酪塔', 150, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (39, 9, 4, N'芒果汁', 110, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (40, 10, 1, N'西班牙海鮮燉飯', 250, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (41, 10, 7, N'法式南瓜濃湯佐軟法麵包', 120, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (42, 10, 3, N'芒果乳酪塔', 150, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (43, 10, 5, N'水果綜合汁', 110, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (44, 11, 1, N'西班牙海鮮燉飯', 250, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (45, 11, 7, N'法式南瓜濃湯佐軟法麵包', 120, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (46, 11, 3, N' 芒果乳酪塔', 150, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (47, 11, 4, N'芒果汁', 110, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (48, 12, 1, N'西班牙海鮮燉飯', 250, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (49, 12, 7, N'法式南瓜濃湯佐軟法麵包', 120, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (50, 12, 3, N'芒果乳酪塔', 150, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (51, 12, 4, N'芒果汁', 110, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (52, 13, 1, N'西班牙海鮮燉飯', 250, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (53, 13, 7, N'法式南瓜濃湯佐軟法麵包', 120, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (54, 13, 3, N'芒果乳酪塔', 150, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (55, 13, 5, N'水果綜合汁', 110, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (56, 14, 1, N'西班牙海鮮燉飯', 250, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (58, 14, 7, N'法式南瓜濃湯佐軟法麵包', 120, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (59, 14, 3, N'芒果乳酪塔', 150, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (60, 14, 4, N'芒果汁', 110, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (61, 15, 1, N'西班牙海鮮燉飯', 250, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (62, 15, 7, N'法式南瓜濃湯佐軟法麵包', 120, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (63, 15, 3, N'芒果乳酪塔', 150, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (64, 15, 4, N'芒果汁', 110, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (65, 16, 1, N'西班牙海鮮燉飯', 250, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (66, 16, 2, N'美式巧達濃湯', 120, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (67, 16, 3, N'芒果乳酪塔', 150, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (68, 16, 4, N'芒果汁', 110, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (69, 17, 1, N'西班牙海鮮燉飯', 250, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (70, 17, 7, N'法式南瓜濃湯佐軟法麵包', 120, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (71, 17, 3, N'芒果乳酪塔', 150, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (72, 17, 4, N'芒果汁', 110, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (73, 18, 1, N'西班牙海鮮燉飯
', 250, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (74, 18, 7, N'法式南瓜濃湯佐軟法麵包', 120, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (75, 18, 8, N'紅絲絨蛋糕', 120, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (76, 18, 5, N'水果綜合汁', 110, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (77, 19, 6, N'番茄肉醬義大利麵', 220, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (78, 19, 7, N'法式南瓜濃湯佐軟法麵包', 120, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (79, 19, 3, N'芒果乳酪塔', 150, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (80, 19, 5, N'水果綜合汁', 110, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (81, 20, 1, N'西班牙海鮮燉飯
', 250, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (82, 20, 2, N'美式巧達濃湯', 120, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (83, 20, 8, N'紅絲絨蛋糕', 120, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (84, 20, 5, N'水果綜合汁', 110, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (85, 21, 6, N'番茄肉醬義大利麵', 220, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (86, 21, 7, N'法式南瓜濃湯佐軟法麵包', 120, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (87, 21, 8, N'紅絲絨蛋糕', 120, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (88, 21, 5, N'水果綜合汁', 110, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (89, 22, 1, N'西班牙海鮮燉飯
', 250, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (90, 22, 2, N'美式巧達濃湯', 120, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (91, 22, 8, N'紅絲絨蛋糕', 120, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (92, 22, 5, N'水果綜合汁', 110, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (93, 23, 1, N'西班牙海鮮燉飯
', 250, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (94, 23, 7, N'法式南瓜濃湯佐軟法麵包', 120, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (95, 23, 8, N'紅絲絨蛋糕', 120, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (96, 23, 5, N'水果綜合汁', 110, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (97, 24, 1, N'西班牙海鮮燉飯
', 250, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (98, 24, 7, N'法式南瓜濃湯佐軟法麵包', 120, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (99, 24, 8, N'紅絲絨蛋糕', 120, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (100, 24, 5, N'水果綜合汁', 110, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (101, 25, 1, N'西班牙海鮮燉飯
', 250, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (102, 25, 7, N'法式南瓜濃湯佐軟法麵包', 120, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (103, 25, 8, N'紅絲絨蛋糕', 120, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (104, 25, 5, N'水果綜合汁', 110, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1089, 1022, 14, N'煙燻番茄醬雙層牛堡', 280, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1090, 1022, 7, N'法式南瓜濃湯佐軟法麵包', 120, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1091, 1022, 8, N'紅絲絨蛋糕', 120, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1092, 1022, 5, N'水果綜合汁', 110, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1093, 1023, 13, N'香煎嫩烤翼板牛排佐薯條', 350, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1094, 1023, 7, N'法式南瓜濃湯佐軟法麵包', 120, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1095, 1023, 8, N'紅絲絨蛋糕', 120, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1096, 1023, 5, N'水果綜合汁', 110, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1097, 1024, 1, N'西班牙海鮮燉飯
', 250, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1098, 1024, 2, N'美式巧達濃湯', 120, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1099, 1024, 3, N'芒果乳酪塔', 150, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1100, 1024, 4, N'芒果汁', 110, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1101, 1025, 1, N'西班牙海鮮燉飯
', 250, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1102, 1025, 2, N'美式巧達濃湯', 120, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1103, 1025, 3, N'芒果乳酪塔', 150, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1104, 1025, 4, N'芒果汁', 110, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1105, 1026, 4, N'芒果汁', 110, 4)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1106, 1026, 12, N'義式牛肉丸', 120, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1107, 1027, 1, N'西班牙海鮮燉飯
', 250, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1108, 1027, 2, N'美式巧達濃湯', 120, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1109, 1027, 3, N'芒果乳酪塔', 150, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1110, 1027, 4, N'芒果汁', 110, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1111, 1028, 1, N'西班牙海鮮燉飯
', 250, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1112, 1028, 2, N'美式巧達濃湯', 120, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1113, 1028, 3, N'芒果乳酪塔', 150, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1114, 1028, 4, N'芒果汁', 110, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1115, 1029, 1, N'西班牙海鮮燉飯
', 250, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1116, 1029, 2, N'美式巧達濃湯', 120, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1117, 1029, 3, N'芒果乳酪塔', 150, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1118, 1029, 4, N'芒果汁', 110, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1119, 1030, 1, N'西班牙海鮮燉飯
', 250, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1120, 1030, 7, N'法式南瓜濃湯佐軟法麵包', 120, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1121, 1030, 3, N'芒果乳酪塔', 150, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1122, 1030, 5, N'水果綜合汁', 110, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1123, 1031, 1, N'西班牙海鮮燉飯
', 250, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1124, 1031, 7, N'法式南瓜濃湯佐軟法麵包', 120, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1125, 1031, 8, N'紅絲絨蛋糕', 120, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1126, 1031, 4, N'芒果汁', 110, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1127, 1032, 6, N'番茄肉醬義大利麵', 220, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1128, 1032, 2, N'美式巧達濃湯', 120, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1129, 1032, 3, N'芒果乳酪塔', 150, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1130, 1032, 5, N'水果綜合汁', 110, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1131, 1033, 12, N'義式牛肉丸', 120, 4)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1132, 1033, 1016, N'Negroamaro', 420, 2)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1133, 1034, 13, N'香煎嫩烤翼板牛排佐薯條', 350, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1134, 1034, 1018, N'生火腿沙拉佐巴薩米克', 180, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1135, 1034, 3, N'芒果乳酪塔', 150, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1136, 1034, 1022, N'鮮打柳橙汁', 90, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1137, 1035, 1, N'西班牙海鮮燉飯', 250, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1138, 1035, 1017, N'義式蔬菜湯', 150, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1139, 1035, 8, N'紅絲絨蛋糕', 120, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1140, 1035, 5, N'水果綜合汁', 110, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1141, 1036, 1, N'西班牙海鮮燉飯', 250, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1142, 1036, 7, N'法式南瓜濃湯佐軟法麵包', 120, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1143, 1036, 3, N'芒果乳酪塔', 150, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1144, 1036, 5, N'水果綜合汁', 110, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1145, 1037, 1, N'西班牙海鮮燉飯', 250, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1146, 1037, 7, N'法式南瓜濃湯佐軟法麵包', 120, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1147, 1037, 3, N'芒果乳酪塔', 150, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1148, 1037, 5, N'水果綜合汁', 110, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1149, 1038, 6, N'番茄肉醬義大利麵', 220, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1150, 1038, 1017, N'義式蔬菜湯', 150, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1151, 1038, 8, N'紅絲絨蛋糕', 120, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1152, 1038, 1021, N'手打焦糖奶蓋咖啡', 100, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1153, 1039, 1, N'西班牙海鮮燉飯', 250, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1154, 1039, 1017, N'義式蔬菜湯', 150, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1155, 1039, 8, N'紅絲絨蛋糕', 120, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1156, 1039, 1021, N'手打焦糖奶蓋咖啡', 100, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1157, 1040, 1, N'西班牙海鮮燉飯', 250, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1158, 1040, 7, N'法式南瓜濃湯佐軟法麵包', 120, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1159, 1040, 8, N'紅絲絨蛋糕', 120, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1160, 1040, 1021, N'手打焦糖奶蓋咖啡', 100, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1161, 1041, 1, N'西班牙海鮮燉飯', 250, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1162, 1041, 7, N'法式南瓜濃湯佐軟法麵包', 120, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1163, 1041, 3, N'芒果乳酪塔', 150, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1164, 1041, 1021, N'手打焦糖奶蓋咖啡', 100, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1165, 1042, 1, N'西班牙海鮮燉飯', 250, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1166, 1042, 1017, N'義式蔬菜湯', 150, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1167, 1042, 3, N'芒果乳酪塔', 150, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1168, 1042, 1021, N'手打焦糖奶蓋咖啡', 100, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1169, 1043, 6, N'番茄肉醬義大利麵', 220, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1170, 1043, 1017, N'義式蔬菜湯', 150, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1171, 1043, 8, N'紅絲絨蛋糕', 120, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1172, 1043, 1021, N'手打焦糖奶蓋咖啡', 100, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1173, 1044, 6, N'番茄肉醬義大利麵', 220, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1174, 1044, 1017, N'義式蔬菜湯', 150, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1175, 1044, 8, N'紅絲絨蛋糕', 120, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1176, 1044, 1021, N'手打焦糖奶蓋咖啡', 100, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1177, 1045, 6, N'番茄肉醬義大利麵', 220, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1178, 1045, 1017, N'義式蔬菜湯', 150, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1179, 1045, 8, N'紅絲絨蛋糕', 120, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (1180, 1045, 1021, N'手打焦糖奶蓋咖啡', 100, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (2127, 2032, 13, N'香煎嫩烤翼板牛排佐薯條', 350, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (2128, 2032, 1017, N'義式蔬菜湯', 150, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (2129, 2032, 1020, N'鮮奶油草莓蛋糕', 160, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (2130, 2032, 1021, N'手打焦糖奶蓋咖啡', 100, 1)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (2131, 2033, 11, N'水牛城辣雞翅', 150, 3)
GO
INSERT [dbo].[OrderItemDetail] ([Id], [OrderItemId], [MealId], [MealName], [MealPrice], [Qty]) VALUES (2132, 2033, 12, N'義式牛肉丸', 120, 1)
GO
SET IDENTITY_INSERT [dbo].[OrderItemDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderItems] ON 
GO
INSERT [dbo].[OrderItems] ([Id], [OrderId]) VALUES (1, 1)
GO
INSERT [dbo].[OrderItems] ([Id], [OrderId]) VALUES (2, 1)
GO
INSERT [dbo].[OrderItems] ([Id], [OrderId]) VALUES (3, 2)
GO
INSERT [dbo].[OrderItems] ([Id], [OrderId]) VALUES (4, 3)
GO
INSERT [dbo].[OrderItems] ([Id], [OrderId]) VALUES (5, 3)
GO
INSERT [dbo].[OrderItems] ([Id], [OrderId]) VALUES (6, 4)
GO
INSERT [dbo].[OrderItems] ([Id], [OrderId]) VALUES (7, 5)
GO
INSERT [dbo].[OrderItems] ([Id], [OrderId]) VALUES (8, 5)
GO
INSERT [dbo].[OrderItems] ([Id], [OrderId]) VALUES (9, 5)
GO
INSERT [dbo].[OrderItems] ([Id], [OrderId]) VALUES (10, 5)
GO
INSERT [dbo].[OrderItems] ([Id], [OrderId]) VALUES (11, 6)
GO
INSERT [dbo].[OrderItems] ([Id], [OrderId]) VALUES (12, 7)
GO
INSERT [dbo].[OrderItems] ([Id], [OrderId]) VALUES (13, 8)
GO
INSERT [dbo].[OrderItems] ([Id], [OrderId]) VALUES (14, 9)
GO
INSERT [dbo].[OrderItems] ([Id], [OrderId]) VALUES (15, 10)
GO
INSERT [dbo].[OrderItems] ([Id], [OrderId]) VALUES (16, 11)
GO
INSERT [dbo].[OrderItems] ([Id], [OrderId]) VALUES (17, 12)
GO
INSERT [dbo].[OrderItems] ([Id], [OrderId]) VALUES (18, 13)
GO
INSERT [dbo].[OrderItems] ([Id], [OrderId]) VALUES (19, 14)
GO
INSERT [dbo].[OrderItems] ([Id], [OrderId]) VALUES (20, 15)
GO
INSERT [dbo].[OrderItems] ([Id], [OrderId]) VALUES (21, 15)
GO
INSERT [dbo].[OrderItems] ([Id], [OrderId]) VALUES (22, 16)
GO
INSERT [dbo].[OrderItems] ([Id], [OrderId]) VALUES (23, 16)
GO
INSERT [dbo].[OrderItems] ([Id], [OrderId]) VALUES (24, 16)
GO
INSERT [dbo].[OrderItems] ([Id], [OrderId]) VALUES (25, 16)
GO
INSERT [dbo].[OrderItems] ([Id], [OrderId]) VALUES (1022, 1016)
GO
INSERT [dbo].[OrderItems] ([Id], [OrderId]) VALUES (1023, 1016)
GO
INSERT [dbo].[OrderItems] ([Id], [OrderId]) VALUES (1024, 1017)
GO
INSERT [dbo].[OrderItems] ([Id], [OrderId]) VALUES (1025, 1017)
GO
INSERT [dbo].[OrderItems] ([Id], [OrderId]) VALUES (1026, 1017)
GO
INSERT [dbo].[OrderItems] ([Id], [OrderId]) VALUES (1027, 1018)
GO
INSERT [dbo].[OrderItems] ([Id], [OrderId]) VALUES (1028, 1018)
GO
INSERT [dbo].[OrderItems] ([Id], [OrderId]) VALUES (1029, 1019)
GO
INSERT [dbo].[OrderItems] ([Id], [OrderId]) VALUES (1030, 1019)
GO
INSERT [dbo].[OrderItems] ([Id], [OrderId]) VALUES (1031, 1020)
GO
INSERT [dbo].[OrderItems] ([Id], [OrderId]) VALUES (1032, 1021)
GO
INSERT [dbo].[OrderItems] ([Id], [OrderId]) VALUES (1033, 1021)
GO
INSERT [dbo].[OrderItems] ([Id], [OrderId]) VALUES (1034, 1022)
GO
INSERT [dbo].[OrderItems] ([Id], [OrderId]) VALUES (1035, 1022)
GO
INSERT [dbo].[OrderItems] ([Id], [OrderId]) VALUES (1036, 1023)
GO
INSERT [dbo].[OrderItems] ([Id], [OrderId]) VALUES (1037, 1024)
GO
INSERT [dbo].[OrderItems] ([Id], [OrderId]) VALUES (1038, 1025)
GO
INSERT [dbo].[OrderItems] ([Id], [OrderId]) VALUES (1039, 1026)
GO
INSERT [dbo].[OrderItems] ([Id], [OrderId]) VALUES (1040, 1027)
GO
INSERT [dbo].[OrderItems] ([Id], [OrderId]) VALUES (1041, 1028)
GO
INSERT [dbo].[OrderItems] ([Id], [OrderId]) VALUES (1042, 1029)
GO
INSERT [dbo].[OrderItems] ([Id], [OrderId]) VALUES (1043, 1030)
GO
INSERT [dbo].[OrderItems] ([Id], [OrderId]) VALUES (1044, 1031)
GO
INSERT [dbo].[OrderItems] ([Id], [OrderId]) VALUES (1045, 1032)
GO
INSERT [dbo].[OrderItems] ([Id], [OrderId]) VALUES (2032, 2021)
GO
INSERT [dbo].[OrderItems] ([Id], [OrderId]) VALUES (2033, 2021)
GO
SET IDENTITY_INSERT [dbo].[OrderItems] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 
GO
INSERT [dbo].[Orders] ([Id], [MemberId], [TableNums], [OrderTime], [ReservationTime], [AdvancePayment], [Diners], [TotalPrice], [IsCancel], [IsRefund], [PhoneNumber]) VALUES (1, 1, 2, CAST(N'2023-09-26T09:06:34.980' AS DateTime), CAST(N'2023-09-28T13:00:00.000' AS DateTime), 123, 1, 1230, 1, 1, N'0912123456')
GO
INSERT [dbo].[Orders] ([Id], [MemberId], [TableNums], [OrderTime], [ReservationTime], [AdvancePayment], [Diners], [TotalPrice], [IsCancel], [IsRefund], [PhoneNumber]) VALUES (2, 1, 2, CAST(N'2023-09-26T11:00:15.337' AS DateTime), CAST(N'2023-09-28T18:00:00.000' AS DateTime), 63, 1, 630, 1, 1, N'0912123456')
GO
INSERT [dbo].[Orders] ([Id], [MemberId], [TableNums], [OrderTime], [ReservationTime], [AdvancePayment], [Diners], [TotalPrice], [IsCancel], [IsRefund], [PhoneNumber]) VALUES (3, 1, 2, CAST(N'2023-09-26T11:15:30.980' AS DateTime), CAST(N'2023-09-28T11:00:00.000' AS DateTime), 117, 2, 1170, 1, 1, N'0912123456')
GO
INSERT [dbo].[Orders] ([Id], [MemberId], [TableNums], [OrderTime], [ReservationTime], [AdvancePayment], [Diners], [TotalPrice], [IsCancel], [IsRefund], [PhoneNumber]) VALUES (4, 1, 2, CAST(N'2023-09-26T11:17:07.610' AS DateTime), CAST(N'2023-09-27T11:00:00.000' AS DateTime), 63, 1, 630, 1, 0, N'0912123456')
GO
INSERT [dbo].[Orders] ([Id], [MemberId], [TableNums], [OrderTime], [ReservationTime], [AdvancePayment], [Diners], [TotalPrice], [IsCancel], [IsRefund], [PhoneNumber]) VALUES (5, 2, 2, CAST(N'2023-09-27T09:19:12.217' AS DateTime), CAST(N'2023-09-28T11:00:00.000' AS DateTime), 252, 1, 2520, 0, 0, N'0912123456')
GO
INSERT [dbo].[Orders] ([Id], [MemberId], [TableNums], [OrderTime], [ReservationTime], [AdvancePayment], [Diners], [TotalPrice], [IsCancel], [IsRefund], [PhoneNumber]) VALUES (6, 2, 2, CAST(N'2023-09-27T09:24:25.167' AS DateTime), CAST(N'2023-09-28T11:00:00.000' AS DateTime), 63, 1, 630, 0, 1, N'0912123456')
GO
INSERT [dbo].[Orders] ([Id], [MemberId], [TableNums], [OrderTime], [ReservationTime], [AdvancePayment], [Diners], [TotalPrice], [IsCancel], [IsRefund], [PhoneNumber]) VALUES (7, 2, 2, CAST(N'2023-09-27T09:26:09.483' AS DateTime), CAST(N'2023-09-28T11:00:00.000' AS DateTime), 63, 1, 630, 0, 1, N'0912123456')
GO
INSERT [dbo].[Orders] ([Id], [MemberId], [TableNums], [OrderTime], [ReservationTime], [AdvancePayment], [Diners], [TotalPrice], [IsCancel], [IsRefund], [PhoneNumber]) VALUES (8, 2, 2, CAST(N'2023-09-27T09:27:44.877' AS DateTime), CAST(N'2023-09-28T11:00:00.000' AS DateTime), 63, 1, 630, 0, 1, N'0912123456')
GO
INSERT [dbo].[Orders] ([Id], [MemberId], [TableNums], [OrderTime], [ReservationTime], [AdvancePayment], [Diners], [TotalPrice], [IsCancel], [IsRefund], [PhoneNumber]) VALUES (9, 2, 2, CAST(N'2023-09-27T09:29:21.520' AS DateTime), CAST(N'2023-09-28T11:00:00.000' AS DateTime), 63, 1, 630, 0, 1, N'0912123456')
GO
INSERT [dbo].[Orders] ([Id], [MemberId], [TableNums], [OrderTime], [ReservationTime], [AdvancePayment], [Diners], [TotalPrice], [IsCancel], [IsRefund], [PhoneNumber]) VALUES (10, 2, 2, CAST(N'2023-09-27T09:42:32.203' AS DateTime), CAST(N'2023-09-28T11:00:00.000' AS DateTime), 63, 1, 630, 0, 1, N'0912123456')
GO
INSERT [dbo].[Orders] ([Id], [MemberId], [TableNums], [OrderTime], [ReservationTime], [AdvancePayment], [Diners], [TotalPrice], [IsCancel], [IsRefund], [PhoneNumber]) VALUES (11, 2, 2, CAST(N'2023-09-27T09:48:38.313' AS DateTime), CAST(N'2023-09-28T11:00:00.000' AS DateTime), 63, 1, 630, 0, 1, N'0912123456')
GO
INSERT [dbo].[Orders] ([Id], [MemberId], [TableNums], [OrderTime], [ReservationTime], [AdvancePayment], [Diners], [TotalPrice], [IsCancel], [IsRefund], [PhoneNumber]) VALUES (12, 1, 2, CAST(N'2023-09-27T10:53:25.437' AS DateTime), CAST(N'2023-09-28T13:00:00.000' AS DateTime), 63, 1, 630, 1, 1, N'0912123456')
GO
INSERT [dbo].[Orders] ([Id], [MemberId], [TableNums], [OrderTime], [ReservationTime], [AdvancePayment], [Diners], [TotalPrice], [IsCancel], [IsRefund], [PhoneNumber]) VALUES (13, 1, 2, CAST(N'2023-09-28T16:33:36.610' AS DateTime), CAST(N'2023-09-30T11:00:00.000' AS DateTime), 60, 1, 600, 1, 1, N'0911222333')
GO
INSERT [dbo].[Orders] ([Id], [MemberId], [TableNums], [OrderTime], [ReservationTime], [AdvancePayment], [Diners], [TotalPrice], [IsCancel], [IsRefund], [PhoneNumber]) VALUES (14, 1, 2, CAST(N'2023-09-28T16:34:29.717' AS DateTime), CAST(N'2023-09-29T11:00:00.000' AS DateTime), 60, 1, 600, 1, 0, N'0911222333')
GO
INSERT [dbo].[Orders] ([Id], [MemberId], [TableNums], [OrderTime], [ReservationTime], [AdvancePayment], [Diners], [TotalPrice], [IsCancel], [IsRefund], [PhoneNumber]) VALUES (15, 1, 2, CAST(N'2023-09-29T15:16:08.347' AS DateTime), CAST(N'2023-09-30T13:00:00.000' AS DateTime), 117, 2, 1170, 1, 0, N'0911222333')
GO
INSERT [dbo].[Orders] ([Id], [MemberId], [TableNums], [OrderTime], [ReservationTime], [AdvancePayment], [Diners], [TotalPrice], [IsCancel], [IsRefund], [PhoneNumber]) VALUES (16, 1, 4, CAST(N'2023-10-04T09:35:38.293' AS DateTime), CAST(N'2023-10-05T11:00:00.000' AS DateTime), 240, 4, 2400, 1, 0, N'0912345687')
GO
INSERT [dbo].[Orders] ([Id], [MemberId], [TableNums], [OrderTime], [ReservationTime], [AdvancePayment], [Diners], [TotalPrice], [IsCancel], [IsRefund], [PhoneNumber]) VALUES (1016, 1, 2, CAST(N'2023-10-05T09:17:02.383' AS DateTime), CAST(N'2023-10-08T11:00:00.000' AS DateTime), 133, 2, 1330, 1, 1, N'0911222333')
GO
INSERT [dbo].[Orders] ([Id], [MemberId], [TableNums], [OrderTime], [ReservationTime], [AdvancePayment], [Diners], [TotalPrice], [IsCancel], [IsRefund], [PhoneNumber]) VALUES (1017, 1, 2, CAST(N'2023-10-05T11:09:12.120' AS DateTime), CAST(N'2023-10-06T11:00:00.000' AS DateTime), 182, 1, 1820, 1, 0, N'0911222333')
GO
INSERT [dbo].[Orders] ([Id], [MemberId], [TableNums], [OrderTime], [ReservationTime], [AdvancePayment], [Diners], [TotalPrice], [IsCancel], [IsRefund], [PhoneNumber]) VALUES (1018, 1, 2, CAST(N'2023-10-05T11:15:20.187' AS DateTime), CAST(N'2023-10-06T13:00:00.000' AS DateTime), 126, 1, 1260, 1, 1, N'0911222333')
GO
INSERT [dbo].[Orders] ([Id], [MemberId], [TableNums], [OrderTime], [ReservationTime], [AdvancePayment], [Diners], [TotalPrice], [IsCancel], [IsRefund], [PhoneNumber]) VALUES (1019, 1, 2, CAST(N'2023-10-05T11:18:57.850' AS DateTime), CAST(N'2023-10-08T13:00:00.000' AS DateTime), 126, 1, 1260, 1, 1, N'0911222333')
GO
INSERT [dbo].[Orders] ([Id], [MemberId], [TableNums], [OrderTime], [ReservationTime], [AdvancePayment], [Diners], [TotalPrice], [IsCancel], [IsRefund], [PhoneNumber]) VALUES (1020, 1, 2, CAST(N'2023-10-05T11:19:57.267' AS DateTime), CAST(N'2023-10-06T11:00:00.000' AS DateTime), 60, 1, 600, 1, 0, N'0911222333')
GO
INSERT [dbo].[Orders] ([Id], [MemberId], [TableNums], [OrderTime], [ReservationTime], [AdvancePayment], [Diners], [TotalPrice], [IsCancel], [IsRefund], [PhoneNumber]) VALUES (1021, 1, 2, CAST(N'2023-10-05T14:35:46.447' AS DateTime), CAST(N'2023-10-06T11:00:00.000' AS DateTime), 192, 1, 1920, 1, 0, N'0911222333')
GO
INSERT [dbo].[Orders] ([Id], [MemberId], [TableNums], [OrderTime], [ReservationTime], [AdvancePayment], [Diners], [TotalPrice], [IsCancel], [IsRefund], [PhoneNumber]) VALUES (1022, 16, 2, CAST(N'2023-10-05T15:17:06.400' AS DateTime), CAST(N'2023-10-07T18:00:00.000' AS DateTime), 140, 2, 1400, 0, 0, N'0988789555')
GO
INSERT [dbo].[Orders] ([Id], [MemberId], [TableNums], [OrderTime], [ReservationTime], [AdvancePayment], [Diners], [TotalPrice], [IsCancel], [IsRefund], [PhoneNumber]) VALUES (1023, 2, 2, CAST(N'2023-10-05T15:55:12.770' AS DateTime), CAST(N'2023-10-08T18:00:00.000' AS DateTime), 63, 1, 630, 0, 0, N'0912345678')
GO
INSERT [dbo].[Orders] ([Id], [MemberId], [TableNums], [OrderTime], [ReservationTime], [AdvancePayment], [Diners], [TotalPrice], [IsCancel], [IsRefund], [PhoneNumber]) VALUES (1024, 3, 2, CAST(N'2023-10-05T15:56:19.330' AS DateTime), CAST(N'2023-10-08T18:00:00.000' AS DateTime), 63, 1, 630, 0, 0, N'0912123456')
GO
INSERT [dbo].[Orders] ([Id], [MemberId], [TableNums], [OrderTime], [ReservationTime], [AdvancePayment], [Diners], [TotalPrice], [IsCancel], [IsRefund], [PhoneNumber]) VALUES (1025, 4, 2, CAST(N'2023-10-05T15:57:01.920' AS DateTime), CAST(N'2023-10-08T18:00:00.000' AS DateTime), 59, 1, 590, 0, 0, N'0912123456')
GO
INSERT [dbo].[Orders] ([Id], [MemberId], [TableNums], [OrderTime], [ReservationTime], [AdvancePayment], [Diners], [TotalPrice], [IsCancel], [IsRefund], [PhoneNumber]) VALUES (1026, 5, 2, CAST(N'2023-10-05T15:57:38.213' AS DateTime), CAST(N'2023-10-08T18:00:00.000' AS DateTime), 62, 1, 620, 0, 0, N'0912123456')
GO
INSERT [dbo].[Orders] ([Id], [MemberId], [TableNums], [OrderTime], [ReservationTime], [AdvancePayment], [Diners], [TotalPrice], [IsCancel], [IsRefund], [PhoneNumber]) VALUES (1027, 6, 2, CAST(N'2023-10-05T15:58:17.527' AS DateTime), CAST(N'2023-10-08T18:00:00.000' AS DateTime), 59, 1, 590, 0, 0, N'0912123456')
GO
INSERT [dbo].[Orders] ([Id], [MemberId], [TableNums], [OrderTime], [ReservationTime], [AdvancePayment], [Diners], [TotalPrice], [IsCancel], [IsRefund], [PhoneNumber]) VALUES (1028, 7, 2, CAST(N'2023-10-05T15:59:01.243' AS DateTime), CAST(N'2023-10-08T18:00:00.000' AS DateTime), 62, 1, 620, 0, 0, N'0912123456')
GO
INSERT [dbo].[Orders] ([Id], [MemberId], [TableNums], [OrderTime], [ReservationTime], [AdvancePayment], [Diners], [TotalPrice], [IsCancel], [IsRefund], [PhoneNumber]) VALUES (1029, 8, 2, CAST(N'2023-10-05T15:59:37.667' AS DateTime), CAST(N'2023-10-08T18:00:00.000' AS DateTime), 65, 1, 650, 0, 0, N'0912123456')
GO
INSERT [dbo].[Orders] ([Id], [MemberId], [TableNums], [OrderTime], [ReservationTime], [AdvancePayment], [Diners], [TotalPrice], [IsCancel], [IsRefund], [PhoneNumber]) VALUES (1030, 9, 2, CAST(N'2023-10-05T16:00:14.383' AS DateTime), CAST(N'2023-10-08T18:00:00.000' AS DateTime), 59, 1, 590, 0, 0, N'0912123456')
GO
INSERT [dbo].[Orders] ([Id], [MemberId], [TableNums], [OrderTime], [ReservationTime], [AdvancePayment], [Diners], [TotalPrice], [IsCancel], [IsRefund], [PhoneNumber]) VALUES (1031, 10, 2, CAST(N'2023-10-05T16:00:50.350' AS DateTime), CAST(N'2023-10-08T18:00:00.000' AS DateTime), 59, 1, 590, 0, 0, N'0912123456')
GO
INSERT [dbo].[Orders] ([Id], [MemberId], [TableNums], [OrderTime], [ReservationTime], [AdvancePayment], [Diners], [TotalPrice], [IsCancel], [IsRefund], [PhoneNumber]) VALUES (1032, 11, 2, CAST(N'2023-10-05T16:01:39.103' AS DateTime), CAST(N'2023-10-08T18:00:00.000' AS DateTime), 59, 1, 590, 0, 0, N'0912123456')
GO
INSERT [dbo].[Orders] ([Id], [MemberId], [TableNums], [OrderTime], [ReservationTime], [AdvancePayment], [Diners], [TotalPrice], [IsCancel], [IsRefund], [PhoneNumber]) VALUES (2021, 1, 2, CAST(N'2023-10-06T12:28:42.723' AS DateTime), CAST(N'2023-10-07T11:00:00.000' AS DateTime), 133, 1, 1330, 1, 0, N'0912123456')
GO
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Table] ON 
GO
INSERT [dbo].[Table] ([Id], [Seats], [TableNums]) VALUES (1, 4, 10)
GO
INSERT [dbo].[Table] ([Id], [Seats], [TableNums]) VALUES (2, 2, 10)
GO
SET IDENTITY_INSERT [dbo].[Table] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([Id], [Account], [Password], [Name], [Enabled]) VALUES (1, N'A1002', N'123', N'John Smith', 0)
GO
INSERT [dbo].[Users] ([Id], [Account], [Password], [Name], [Enabled]) VALUES (2, N'A2056', N'123', N'Jennifer Lee', 0)
GO
INSERT [dbo].[Users] ([Id], [Account], [Password], [Name], [Enabled]) VALUES (3, N'A5230', N'123', N'David Brown', 0)
GO
INSERT [dbo].[Users] ([Id], [Account], [Password], [Name], [Enabled]) VALUES (4, N'Allen', N'123', N'Allen Kuo', 0)
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Carts]    Script Date: 2023/10/6 下午 12:38:41 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Carts] ON [dbo].[Carts]
(
	[MemberAccount] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Members]    Script Date: 2023/10/6 下午 12:38:41 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Members] ON [dbo].[Members]
(
	[Account] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Users]    Script Date: 2023/10/6 下午 12:38:41 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Users] ON [dbo].[Users]
(
	[Account] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Categories] ADD  CONSTRAINT [DF_Categories_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Meals] ADD  CONSTRAINT [DF_Meals_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_OrderTime]  DEFAULT (getdate()) FOR [OrderTime]
GO
ALTER TABLE [dbo].[CartItemDetail]  WITH CHECK ADD  CONSTRAINT [FK_CartItemDetail_CartItems] FOREIGN KEY([CartItemId])
REFERENCES [dbo].[CartItems] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CartItemDetail] CHECK CONSTRAINT [FK_CartItemDetail_CartItems]
GO
ALTER TABLE [dbo].[CartItemDetail]  WITH CHECK ADD  CONSTRAINT [FK_CartItemDetail_Meals] FOREIGN KEY([MealId])
REFERENCES [dbo].[Meals] ([Id])
GO
ALTER TABLE [dbo].[CartItemDetail] CHECK CONSTRAINT [FK_CartItemDetail_Meals]
GO
ALTER TABLE [dbo].[CartItems]  WITH CHECK ADD  CONSTRAINT [FK_CartItems_Carts] FOREIGN KEY([CartId])
REFERENCES [dbo].[Carts] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CartItems] CHECK CONSTRAINT [FK_CartItems_Carts]
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK_Carts_Members] FOREIGN KEY([MemberAccount])
REFERENCES [dbo].[Members] ([Account])
GO
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK_Carts_Members]
GO
ALTER TABLE [dbo].[Meals]  WITH CHECK ADD  CONSTRAINT [FK_Meals_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Meals] CHECK CONSTRAINT [FK_Meals_Categories]
GO
ALTER TABLE [dbo].[OrderItemDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderItemDetail_Meals] FOREIGN KEY([MealId])
REFERENCES [dbo].[Meals] ([Id])
GO
ALTER TABLE [dbo].[OrderItemDetail] CHECK CONSTRAINT [FK_OrderItemDetail_Meals]
GO
ALTER TABLE [dbo].[OrderItemDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderItemDetail_OrderItems] FOREIGN KEY([OrderItemId])
REFERENCES [dbo].[OrderItems] ([Id])
GO
ALTER TABLE [dbo].[OrderItemDetail] CHECK CONSTRAINT [FK_OrderItemDetail_OrderItems]
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderItems_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_OrderItems_Orders]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Members] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Members] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Members]
GO
/****** Object:  StoredProcedure [dbo].[sp_select]    Script Date: 2023/10/6 下午 12:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[sp_select]
as
begin 
	select * from Members
end
GO
/****** Object:  StoredProcedure [dbo].[sp_selectMembers]    Script Date: 2023/10/6 下午 12:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_selectMembers]
AS
BEGIN
    SELECT * FROM Members; -- 这里假设有名为 Members 的表
END
GO
USE [master]
GO
ALTER DATABASE [FDB09] SET  READ_WRITE 
GO
