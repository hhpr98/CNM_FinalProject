USE [master]
GO
/****** Object:  Database [FakeRealProductSystem]    Script Date: 8/31/2020 8:13:05 PM ******/
CREATE DATABASE [FakeRealProductSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FakeRealProductSystem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\FakeRealProductSystem.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'FakeRealProductSystem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\FakeRealProductSystem_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [FakeRealProductSystem] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FakeRealProductSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FakeRealProductSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FakeRealProductSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FakeRealProductSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FakeRealProductSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FakeRealProductSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [FakeRealProductSystem] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [FakeRealProductSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FakeRealProductSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FakeRealProductSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FakeRealProductSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FakeRealProductSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FakeRealProductSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FakeRealProductSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FakeRealProductSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FakeRealProductSystem] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FakeRealProductSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FakeRealProductSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FakeRealProductSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FakeRealProductSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FakeRealProductSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FakeRealProductSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FakeRealProductSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FakeRealProductSystem] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FakeRealProductSystem] SET  MULTI_USER 
GO
ALTER DATABASE [FakeRealProductSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FakeRealProductSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FakeRealProductSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FakeRealProductSystem] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [FakeRealProductSystem] SET DELAYED_DURABILITY = DISABLED 
GO
USE [FakeRealProductSystem]
GO
/****** Object:  Table [dbo].[Branches]    Script Date: 8/31/2020 8:13:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Branches](
	[br_id] [nvarchar](50) NOT NULL,
	[br_name] [nvarchar](255) NULL,
	[br_headquarter] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[br_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 8/31/2020 8:13:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[pr_id] [nvarchar](50) NOT NULL,
	[pr_name] [nvarchar](255) NULL,
	[pr_branch] [nvarchar](50) NULL,
	[pr_type] [nvarchar](50) NULL,
	[pr_origin] [nvarchar](255) NULL,
	[pr_price] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[pr_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductTypes]    Script Date: 8/31/2020 8:13:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductTypes](
	[ty_id] [nvarchar](50) NOT NULL,
	[ty_name] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ty_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Branches] ([br_id], [br_name], [br_headquarter]) VALUES (N'BR001', N'Apple', N'USA')
INSERT [dbo].[Branches] ([br_id], [br_name], [br_headquarter]) VALUES (N'BR002', N'Samsung', N'Korea')
INSERT [dbo].[Branches] ([br_id], [br_name], [br_headquarter]) VALUES (N'BR003', N'Huawei', N'China')
INSERT [dbo].[Branches] ([br_id], [br_name], [br_headquarter]) VALUES (N'BR004', N'VinSmart', N'VietNam')
INSERT [dbo].[Branches] ([br_id], [br_name], [br_headquarter]) VALUES (N'BR005', N'BKAV', N'VietNam')
INSERT [dbo].[Branches] ([br_id], [br_name], [br_headquarter]) VALUES (N'BR006', N'Xiaomi', N'China')
INSERT [dbo].[Branches] ([br_id], [br_name], [br_headquarter]) VALUES (N'BR007', N'Vivo', N'China')
INSERT [dbo].[Branches] ([br_id], [br_name], [br_headquarter]) VALUES (N'BR008', N'Nokia', N'EU')
INSERT [dbo].[Branches] ([br_id], [br_name], [br_headquarter]) VALUES (N'BR009', N'Khác', N'VietNam')
INSERT [dbo].[Products] ([pr_id], [pr_name], [pr_branch], [pr_type], [pr_origin], [pr_price]) VALUES (N'PR001', N'Iphone 11', N'BR001', N'TY001', N'China', 19000000)
INSERT [dbo].[Products] ([pr_id], [pr_name], [pr_branch], [pr_type], [pr_origin], [pr_price]) VALUES (N'PR002', N'Apple Airpods Pro', N'BR001', N'TY004', N'China', 5000000)
INSERT [dbo].[Products] ([pr_id], [pr_name], [pr_branch], [pr_type], [pr_origin], [pr_price]) VALUES (N'PR003', N'Samsung Galaxy S20 Ultra', N'BR002', N'TY001', N'Korea', 26000000)
INSERT [dbo].[Products] ([pr_id], [pr_name], [pr_branch], [pr_type], [pr_origin], [pr_price]) VALUES (N'PR004', N'Huawei Mate 30 Pro', N'BR003', N'TY001', N'China', 17000000)
INSERT [dbo].[Products] ([pr_id], [pr_name], [pr_branch], [pr_type], [pr_origin], [pr_price]) VALUES (N'PR005', N'Macbook Pro Touch 2020', N'BR001', N'TY002', N'China', 48000000)
INSERT [dbo].[Products] ([pr_id], [pr_name], [pr_branch], [pr_type], [pr_origin], [pr_price]) VALUES (N'PR006', N'Apple Watch Series 3', N'BR001', N'TY003', N'China', 5500000)
INSERT [dbo].[Products] ([pr_id], [pr_name], [pr_branch], [pr_type], [pr_origin], [pr_price]) VALUES (N'PR007', N'Vsmart Active 3', N'BR004', N'TY001', N'VietNam', 4000000)
INSERT [dbo].[Products] ([pr_id], [pr_name], [pr_branch], [pr_type], [pr_origin], [pr_price]) VALUES (N'PR008', N'Vsmart Joy 3', N'BR004', N'TY001', N'VietNam', 3200000)
INSERT [dbo].[Products] ([pr_id], [pr_name], [pr_branch], [pr_type], [pr_origin], [pr_price]) VALUES (N'PR009', N'Vsmart Bee 3', N'BR004', N'TY001', N'VietNam', 1500000)
INSERT [dbo].[Products] ([pr_id], [pr_name], [pr_branch], [pr_type], [pr_origin], [pr_price]) VALUES (N'PR010', N'Bphone B86', N'BR005', N'TY001', N'VietNam', 9000000)
INSERT [dbo].[Products] ([pr_id], [pr_name], [pr_branch], [pr_type], [pr_origin], [pr_price]) VALUES (N'PR011', N'Samsung Galaxy A50s', N'BR002', N'TY001', N'Korean', 8238000)
INSERT [dbo].[ProductTypes] ([ty_id], [ty_name]) VALUES (N'TY001', N'Smartphone')
INSERT [dbo].[ProductTypes] ([ty_id], [ty_name]) VALUES (N'TY002', N'Laptop')
INSERT [dbo].[ProductTypes] ([ty_id], [ty_name]) VALUES (N'TY003', N'Watch')
INSERT [dbo].[ProductTypes] ([ty_id], [ty_name]) VALUES (N'TY004', N'Headphone')
INSERT [dbo].[ProductTypes] ([ty_id], [ty_name]) VALUES (N'TY005', N'Blutooth Device')
INSERT [dbo].[ProductTypes] ([ty_id], [ty_name]) VALUES (N'TY006', N'Sounds')
INSERT [dbo].[ProductTypes] ([ty_id], [ty_name]) VALUES (N'TY007', N'Smart Watch')
INSERT [dbo].[ProductTypes] ([ty_id], [ty_name]) VALUES (N'TY008', N'Khác')
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [fk_product_branch] FOREIGN KEY([pr_branch])
REFERENCES [dbo].[Branches] ([br_id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [fk_product_branch]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [fk_product_producttype] FOREIGN KEY([pr_type])
REFERENCES [dbo].[ProductTypes] ([ty_id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [fk_product_producttype]
GO
USE [master]
GO
ALTER DATABASE [FakeRealProductSystem] SET  READ_WRITE 
GO
