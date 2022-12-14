USE [master]
GO
/****** Object:  Database [TimeKeeping]    Script Date: 8/25/2022 3:22:24 PM ******/
CREATE DATABASE [TimeKeeping]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TimeKeeping', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TimeKeeping.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TimeKeeping_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TimeKeeping_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TimeKeeping] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TimeKeeping].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TimeKeeping] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TimeKeeping] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TimeKeeping] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TimeKeeping] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TimeKeeping] SET ARITHABORT OFF 
GO
ALTER DATABASE [TimeKeeping] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TimeKeeping] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TimeKeeping] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TimeKeeping] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TimeKeeping] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TimeKeeping] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TimeKeeping] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TimeKeeping] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TimeKeeping] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TimeKeeping] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TimeKeeping] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TimeKeeping] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TimeKeeping] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TimeKeeping] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TimeKeeping] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TimeKeeping] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TimeKeeping] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TimeKeeping] SET RECOVERY FULL 
GO
ALTER DATABASE [TimeKeeping] SET  MULTI_USER 
GO
ALTER DATABASE [TimeKeeping] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TimeKeeping] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TimeKeeping] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TimeKeeping] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TimeKeeping] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TimeKeeping] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'TimeKeeping', N'ON'
GO
ALTER DATABASE [TimeKeeping] SET QUERY_STORE = OFF
GO
USE [TimeKeeping]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 8/25/2022 3:22:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[eid] [int] IDENTITY(1,1) NOT NULL,
	[ename] [varchar](150) NOT NULL,
	[pid] [int] NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[eid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Holiday]    Script Date: 8/25/2022 3:22:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Holiday](
	[hid] [int] IDENTITY(1,1) NOT NULL,
	[tid] [int] NOT NULL,
	[from] [date] NOT NULL,
	[to] [date] NOT NULL,
 CONSTRAINT [PK_Holiday] PRIMARY KEY CLUSTERED 
(
	[hid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HolidayType]    Script Date: 8/25/2022 3:22:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HolidayType](
	[tid] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](150) NOT NULL,
 CONSTRAINT [PK_HolidayType] PRIMARY KEY CLUSTERED 
(
	[tid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Position]    Script Date: 8/25/2022 3:22:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Position](
	[pid] [int] NOT NULL,
	[pname] [varchar](150) NOT NULL,
	[salary] [float] NOT NULL,
 CONSTRAINT [PK_Position] PRIMARY KEY CLUSTERED 
(
	[pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Request]    Script Date: 8/25/2022 3:22:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Request](
	[rid] [int] IDENTITY(1,1) NOT NULL,
	[eid] [int] NOT NULL,
	[from] [date] NOT NULL,
	[to] [date] NOT NULL,
	[tid] [int] NOT NULL,
 CONSTRAINT [PK_Request] PRIMARY KEY CLUSTERED 
(
	[rid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TimeSheet]    Script Date: 8/25/2022 3:22:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeSheet](
	[tid] [int] IDENTITY(1,1) NOT NULL,
	[eid] [int] NOT NULL,
	[checkin] [datetime] NOT NULL,
	[checkout] [datetime] NOT NULL,
 CONSTRAINT [PK_TimeSheet] PRIMARY KEY CLUSTERED 
(
	[tid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Type]    Script Date: 8/25/2022 3:22:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type](
	[tid] [int] IDENTITY(1,1) NOT NULL,
	[tname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[tid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([eid], [ename], [pid]) VALUES (1, N'Lai The Dat', 1)
INSERT [dbo].[Employee] ([eid], [ename], [pid]) VALUES (2, N'Tran Huu Viet Anh', 2)
INSERT [dbo].[Employee] ([eid], [ename], [pid]) VALUES (3, N'Ngo Van Long', 2)
INSERT [dbo].[Employee] ([eid], [ename], [pid]) VALUES (4, N'Nguyen Lan Anh', 3)
INSERT [dbo].[Employee] ([eid], [ename], [pid]) VALUES (5, N'Nguyen Van Phuong', 4)
INSERT [dbo].[Employee] ([eid], [ename], [pid]) VALUES (6, N'Nguyen Huu Dai', 4)
INSERT [dbo].[Employee] ([eid], [ename], [pid]) VALUES (7, N'Tran Trung Dinh', 4)
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[Holiday] ON 

INSERT [dbo].[Holiday] ([hid], [tid], [from], [to]) VALUES (1, 1, CAST(N'2022-01-31' AS Date), CAST(N'2022-02-06' AS Date))
INSERT [dbo].[Holiday] ([hid], [tid], [from], [to]) VALUES (2, 2, CAST(N'2022-04-09' AS Date), CAST(N'2022-04-11' AS Date))
INSERT [dbo].[Holiday] ([hid], [tid], [from], [to]) VALUES (3, 3, CAST(N'2022-04-30' AS Date), CAST(N'2022-05-03' AS Date))
INSERT [dbo].[Holiday] ([hid], [tid], [from], [to]) VALUES (4, 4, CAST(N'2022-09-01' AS Date), CAST(N'2022-09-04' AS Date))
SET IDENTITY_INSERT [dbo].[Holiday] OFF
GO
SET IDENTITY_INSERT [dbo].[HolidayType] ON 

INSERT [dbo].[HolidayType] ([tid], [name]) VALUES (1, N'Tet Nguyen Dan')
INSERT [dbo].[HolidayType] ([tid], [name]) VALUES (2, N'Gio to hung vuong')
INSERT [dbo].[HolidayType] ([tid], [name]) VALUES (3, N'Giai phong mien Nam, Quoc te lao dong')
INSERT [dbo].[HolidayType] ([tid], [name]) VALUES (4, N'Quoc Khanh')
SET IDENTITY_INSERT [dbo].[HolidayType] OFF
GO
INSERT [dbo].[Position] ([pid], [pname], [salary]) VALUES (1, N'Manager', 1000)
INSERT [dbo].[Position] ([pid], [pname], [salary]) VALUES (2, N'Engineer', 600)
INSERT [dbo].[Position] ([pid], [pname], [salary]) VALUES (3, N'Accountant', 450)
INSERT [dbo].[Position] ([pid], [pname], [salary]) VALUES (4, N'Employee', 300)
GO
SET IDENTITY_INSERT [dbo].[Request] ON 

INSERT [dbo].[Request] ([rid], [eid], [from], [to], [tid]) VALUES (1, 1, CAST(N'2022-08-15' AS Date), CAST(N'2022-08-16' AS Date), 1)
INSERT [dbo].[Request] ([rid], [eid], [from], [to], [tid]) VALUES (3, 1, CAST(N'2022-08-11' AS Date), CAST(N'2022-08-11' AS Date), 2)
INSERT [dbo].[Request] ([rid], [eid], [from], [to], [tid]) VALUES (4, 2, CAST(N'2022-08-22' AS Date), CAST(N'2022-08-25' AS Date), 1)
INSERT [dbo].[Request] ([rid], [eid], [from], [to], [tid]) VALUES (6, 6, CAST(N'2022-08-31' AS Date), CAST(N'2022-08-31' AS Date), 2)
INSERT [dbo].[Request] ([rid], [eid], [from], [to], [tid]) VALUES (7, 7, CAST(N'2022-09-06' AS Date), CAST(N'2022-09-06' AS Date), 4)
INSERT [dbo].[Request] ([rid], [eid], [from], [to], [tid]) VALUES (8, 5, CAST(N'2022-09-05' AS Date), CAST(N'2022-09-05' AS Date), 4)
INSERT [dbo].[Request] ([rid], [eid], [from], [to], [tid]) VALUES (10, 4, CAST(N'2022-09-26' AS Date), CAST(N'2022-09-30' AS Date), 3)
INSERT [dbo].[Request] ([rid], [eid], [from], [to], [tid]) VALUES (11, 3, CAST(N'2022-09-07' AS Date), CAST(N'2022-09-09' AS Date), 1)
INSERT [dbo].[Request] ([rid], [eid], [from], [to], [tid]) VALUES (12, 2, CAST(N'2022-09-13' AS Date), CAST(N'2022-09-13' AS Date), 2)
INSERT [dbo].[Request] ([rid], [eid], [from], [to], [tid]) VALUES (13, 1, CAST(N'2022-09-19' AS Date), CAST(N'2022-09-20' AS Date), 4)
INSERT [dbo].[Request] ([rid], [eid], [from], [to], [tid]) VALUES (14, 3, CAST(N'2022-08-04' AS Date), CAST(N'2022-08-04' AS Date), 1)
INSERT [dbo].[Request] ([rid], [eid], [from], [to], [tid]) VALUES (15, 4, CAST(N'2022-08-22' AS Date), CAST(N'2022-08-22' AS Date), 4)
SET IDENTITY_INSERT [dbo].[Request] OFF
GO
SET IDENTITY_INSERT [dbo].[TimeSheet] ON 

INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (301, 1, CAST(N'2022-08-01T08:01:00.000' AS DateTime), CAST(N'2022-08-01T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (303, 1, CAST(N'2022-08-03T08:00:00.000' AS DateTime), CAST(N'2022-08-03T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (304, 1, CAST(N'2022-08-04T08:00:00.000' AS DateTime), CAST(N'2022-08-04T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (305, 1, CAST(N'2022-08-05T08:00:00.000' AS DateTime), CAST(N'2022-08-05T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (308, 1, CAST(N'2022-08-08T08:00:00.000' AS DateTime), CAST(N'2022-08-08T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (309, 1, CAST(N'2022-08-09T09:10:00.000' AS DateTime), CAST(N'2022-08-09T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (310, 1, CAST(N'2022-08-10T08:00:00.000' AS DateTime), CAST(N'2022-08-10T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (311, 1, CAST(N'2022-08-11T08:00:00.000' AS DateTime), CAST(N'2022-08-11T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (312, 1, CAST(N'2022-08-12T08:00:00.000' AS DateTime), CAST(N'2022-08-12T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (313, 1, CAST(N'2022-08-13T08:00:00.000' AS DateTime), CAST(N'2022-08-13T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (314, 1, CAST(N'2022-08-14T08:00:00.000' AS DateTime), CAST(N'2022-08-14T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (317, 1, CAST(N'2022-08-17T08:00:00.000' AS DateTime), CAST(N'2022-08-17T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (318, 1, CAST(N'2022-08-18T08:00:00.000' AS DateTime), CAST(N'2022-08-18T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (319, 1, CAST(N'2022-08-19T08:00:00.000' AS DateTime), CAST(N'2022-08-19T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (320, 1, CAST(N'2022-08-20T08:00:00.000' AS DateTime), CAST(N'2022-08-20T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (321, 1, CAST(N'2022-08-21T08:00:00.000' AS DateTime), CAST(N'2022-08-21T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (322, 1, CAST(N'2022-08-22T08:00:00.000' AS DateTime), CAST(N'2022-08-22T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (323, 1, CAST(N'2022-08-23T08:00:00.000' AS DateTime), CAST(N'2022-08-23T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (324, 1, CAST(N'2022-08-24T08:00:00.000' AS DateTime), CAST(N'2022-08-24T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (325, 1, CAST(N'2022-08-25T08:00:00.000' AS DateTime), CAST(N'2022-08-25T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (326, 1, CAST(N'2022-08-26T08:00:00.000' AS DateTime), CAST(N'2022-08-26T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (329, 1, CAST(N'2022-08-29T08:30:00.000' AS DateTime), CAST(N'2022-08-29T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (330, 1, CAST(N'2022-08-30T08:00:00.000' AS DateTime), CAST(N'2022-08-30T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (331, 1, CAST(N'2022-08-31T08:00:00.000' AS DateTime), CAST(N'2022-08-31T17:01:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (456, 2, CAST(N'2022-08-01T08:00:00.000' AS DateTime), CAST(N'2022-08-01T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (457, 2, CAST(N'2022-08-02T08:00:00.000' AS DateTime), CAST(N'2022-08-02T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (458, 2, CAST(N'2022-08-03T08:00:00.000' AS DateTime), CAST(N'2022-08-03T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (459, 2, CAST(N'2022-08-04T08:00:00.000' AS DateTime), CAST(N'2022-08-04T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (460, 2, CAST(N'2022-08-05T08:00:00.000' AS DateTime), CAST(N'2022-08-05T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (463, 2, CAST(N'2022-08-08T08:00:00.000' AS DateTime), CAST(N'2022-08-08T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (464, 2, CAST(N'2022-08-09T08:00:00.000' AS DateTime), CAST(N'2022-08-09T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (465, 2, CAST(N'2022-08-10T08:00:00.000' AS DateTime), CAST(N'2022-08-10T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (467, 2, CAST(N'2022-08-12T08:00:00.000' AS DateTime), CAST(N'2022-08-12T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (468, 2, CAST(N'2022-08-13T08:00:00.000' AS DateTime), CAST(N'2022-08-13T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (470, 2, CAST(N'2022-08-15T08:00:00.000' AS DateTime), CAST(N'2022-08-15T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (471, 2, CAST(N'2022-08-16T08:00:00.000' AS DateTime), CAST(N'2022-08-16T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (472, 2, CAST(N'2022-08-17T08:00:00.000' AS DateTime), CAST(N'2022-08-17T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (473, 2, CAST(N'2022-08-18T08:00:00.000' AS DateTime), CAST(N'2022-08-18T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (474, 2, CAST(N'2022-08-19T08:00:00.000' AS DateTime), CAST(N'2022-08-19T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (481, 2, CAST(N'2022-08-26T08:00:00.000' AS DateTime), CAST(N'2022-08-26T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (483, 2, CAST(N'2022-08-28T08:00:00.000' AS DateTime), CAST(N'2022-08-28T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (484, 2, CAST(N'2022-08-29T08:00:00.000' AS DateTime), CAST(N'2022-08-29T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (485, 2, CAST(N'2022-08-30T08:00:00.000' AS DateTime), CAST(N'2022-08-30T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (486, 2, CAST(N'2022-08-31T08:00:00.000' AS DateTime), CAST(N'2022-08-31T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (488, 3, CAST(N'2022-08-02T08:00:00.000' AS DateTime), CAST(N'2022-08-02T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (489, 3, CAST(N'2022-08-03T08:00:00.000' AS DateTime), CAST(N'2022-08-03T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (491, 3, CAST(N'2022-08-05T08:00:00.000' AS DateTime), CAST(N'2022-08-05T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (494, 3, CAST(N'2022-08-08T08:00:00.000' AS DateTime), CAST(N'2022-08-08T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (495, 3, CAST(N'2022-08-09T08:00:00.000' AS DateTime), CAST(N'2022-08-09T16:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (496, 3, CAST(N'2022-08-10T08:00:00.000' AS DateTime), CAST(N'2022-08-10T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (497, 3, CAST(N'2022-08-11T08:00:00.000' AS DateTime), CAST(N'2022-08-11T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (498, 3, CAST(N'2022-08-12T08:00:00.000' AS DateTime), CAST(N'2022-08-12T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (501, 3, CAST(N'2022-08-15T08:00:00.000' AS DateTime), CAST(N'2022-08-15T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (502, 3, CAST(N'2022-08-16T08:00:00.000' AS DateTime), CAST(N'2022-08-16T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (503, 3, CAST(N'2022-08-17T08:37:00.000' AS DateTime), CAST(N'2022-08-17T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (504, 3, CAST(N'2022-08-18T08:00:00.000' AS DateTime), CAST(N'2022-08-18T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (505, 3, CAST(N'2022-08-19T08:00:00.000' AS DateTime), CAST(N'2022-08-19T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (508, 3, CAST(N'2022-08-22T08:00:00.000' AS DateTime), CAST(N'2022-08-22T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (509, 3, CAST(N'2022-08-23T08:00:00.000' AS DateTime), CAST(N'2022-08-23T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (510, 3, CAST(N'2022-08-24T08:00:00.000' AS DateTime), CAST(N'2022-08-24T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (511, 3, CAST(N'2022-08-25T08:00:00.000' AS DateTime), CAST(N'2022-08-25T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (512, 3, CAST(N'2022-08-26T08:00:00.000' AS DateTime), CAST(N'2022-08-26T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (515, 3, CAST(N'2022-08-29T08:00:00.000' AS DateTime), CAST(N'2022-08-29T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (516, 3, CAST(N'2022-08-30T08:00:00.000' AS DateTime), CAST(N'2022-08-30T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (517, 3, CAST(N'2022-08-31T08:00:00.000' AS DateTime), CAST(N'2022-08-31T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (518, 4, CAST(N'2022-08-01T08:00:00.000' AS DateTime), CAST(N'2022-08-01T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (519, 4, CAST(N'2022-08-02T08:00:00.000' AS DateTime), CAST(N'2022-08-02T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (520, 4, CAST(N'2022-08-03T08:00:00.000' AS DateTime), CAST(N'2022-08-03T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (521, 4, CAST(N'2022-08-04T08:00:00.000' AS DateTime), CAST(N'2022-08-04T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (522, 4, CAST(N'2022-08-05T08:00:00.000' AS DateTime), CAST(N'2022-08-05T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (525, 4, CAST(N'2022-08-08T08:00:00.000' AS DateTime), CAST(N'2022-08-08T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (526, 4, CAST(N'2022-08-09T08:00:00.000' AS DateTime), CAST(N'2022-08-09T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (527, 4, CAST(N'2022-08-10T08:00:00.000' AS DateTime), CAST(N'2022-08-10T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (528, 4, CAST(N'2022-08-11T08:00:00.000' AS DateTime), CAST(N'2022-08-11T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (529, 4, CAST(N'2022-08-12T09:00:00.000' AS DateTime), CAST(N'2022-08-12T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (532, 4, CAST(N'2022-08-15T08:00:00.000' AS DateTime), CAST(N'2022-08-15T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (533, 4, CAST(N'2022-08-16T08:00:00.000' AS DateTime), CAST(N'2022-08-16T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (534, 4, CAST(N'2022-08-17T08:00:00.000' AS DateTime), CAST(N'2022-08-17T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (535, 4, CAST(N'2022-08-18T08:00:00.000' AS DateTime), CAST(N'2022-08-18T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (536, 4, CAST(N'2022-08-19T08:00:00.000' AS DateTime), CAST(N'2022-08-19T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (540, 4, CAST(N'2022-08-23T08:00:00.000' AS DateTime), CAST(N'2022-08-23T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (541, 4, CAST(N'2022-08-24T08:00:00.000' AS DateTime), CAST(N'2022-08-24T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (542, 4, CAST(N'2022-08-25T08:00:00.000' AS DateTime), CAST(N'2022-08-25T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (543, 4, CAST(N'2022-08-26T08:00:00.000' AS DateTime), CAST(N'2022-08-26T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (546, 4, CAST(N'2022-08-29T08:00:00.000' AS DateTime), CAST(N'2022-08-29T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (547, 4, CAST(N'2022-08-30T08:00:00.000' AS DateTime), CAST(N'2022-08-30T16:30:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (548, 4, CAST(N'2022-08-31T08:00:00.000' AS DateTime), CAST(N'2022-08-31T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (549, 5, CAST(N'2022-08-01T08:00:00.000' AS DateTime), CAST(N'2022-08-01T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (550, 5, CAST(N'2022-08-02T08:11:00.000' AS DateTime), CAST(N'2022-08-02T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (551, 5, CAST(N'2022-08-03T08:00:00.000' AS DateTime), CAST(N'2022-08-03T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (552, 5, CAST(N'2022-08-04T08:00:00.000' AS DateTime), CAST(N'2022-08-04T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (553, 5, CAST(N'2022-08-05T08:00:00.000' AS DateTime), CAST(N'2022-08-05T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (556, 5, CAST(N'2022-08-08T08:00:00.000' AS DateTime), CAST(N'2022-08-08T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (557, 5, CAST(N'2022-08-09T08:00:00.000' AS DateTime), CAST(N'2022-08-09T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (558, 5, CAST(N'2022-08-10T08:00:00.000' AS DateTime), CAST(N'2022-08-10T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (559, 5, CAST(N'2022-08-11T08:00:00.000' AS DateTime), CAST(N'2022-08-11T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (560, 5, CAST(N'2022-08-12T08:00:00.000' AS DateTime), CAST(N'2022-08-12T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (563, 5, CAST(N'2022-08-15T08:00:00.000' AS DateTime), CAST(N'2022-08-15T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (564, 5, CAST(N'2022-08-16T08:00:00.000' AS DateTime), CAST(N'2022-08-16T17:00:00.000' AS DateTime))
GO
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (565, 5, CAST(N'2022-08-17T08:00:00.000' AS DateTime), CAST(N'2022-08-17T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (566, 5, CAST(N'2022-08-18T08:00:00.000' AS DateTime), CAST(N'2022-08-18T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (567, 5, CAST(N'2022-08-19T08:00:00.000' AS DateTime), CAST(N'2022-08-19T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (570, 5, CAST(N'2022-08-22T08:00:00.000' AS DateTime), CAST(N'2022-08-22T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (572, 5, CAST(N'2022-08-24T08:00:00.000' AS DateTime), CAST(N'2022-08-24T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (573, 5, CAST(N'2022-08-25T08:00:00.000' AS DateTime), CAST(N'2022-08-25T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (574, 5, CAST(N'2022-08-26T08:00:00.000' AS DateTime), CAST(N'2022-08-26T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (577, 5, CAST(N'2022-08-29T08:00:00.000' AS DateTime), CAST(N'2022-08-29T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (578, 5, CAST(N'2022-08-30T08:00:00.000' AS DateTime), CAST(N'2022-08-30T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (579, 5, CAST(N'2022-08-31T08:00:00.000' AS DateTime), CAST(N'2022-08-31T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (580, 6, CAST(N'2022-08-01T08:00:00.000' AS DateTime), CAST(N'2022-08-01T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (581, 6, CAST(N'2022-08-02T08:00:00.000' AS DateTime), CAST(N'2022-08-02T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (582, 6, CAST(N'2022-08-03T08:00:00.000' AS DateTime), CAST(N'2022-08-03T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (583, 6, CAST(N'2022-08-04T08:00:00.000' AS DateTime), CAST(N'2022-08-04T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (584, 6, CAST(N'2022-08-05T08:00:00.000' AS DateTime), CAST(N'2022-08-05T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (585, 6, CAST(N'2022-08-06T08:00:00.000' AS DateTime), CAST(N'2022-08-06T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (587, 6, CAST(N'2022-08-08T08:00:00.000' AS DateTime), CAST(N'2022-08-08T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (588, 6, CAST(N'2022-08-09T08:00:00.000' AS DateTime), CAST(N'2022-08-09T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (590, 6, CAST(N'2022-08-11T08:00:00.000' AS DateTime), CAST(N'2022-08-11T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (591, 6, CAST(N'2022-08-12T08:00:00.000' AS DateTime), CAST(N'2022-08-12T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (594, 6, CAST(N'2022-08-15T08:00:00.000' AS DateTime), CAST(N'2022-08-15T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (595, 6, CAST(N'2022-08-16T08:00:00.000' AS DateTime), CAST(N'2022-08-16T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (596, 6, CAST(N'2022-08-17T08:00:00.000' AS DateTime), CAST(N'2022-08-17T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (597, 6, CAST(N'2022-08-18T08:00:00.000' AS DateTime), CAST(N'2022-08-18T16:25:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (598, 6, CAST(N'2022-08-19T08:00:00.000' AS DateTime), CAST(N'2022-08-19T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (599, 6, CAST(N'2022-08-20T08:00:00.000' AS DateTime), CAST(N'2022-08-20T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (601, 6, CAST(N'2022-08-22T08:00:00.000' AS DateTime), CAST(N'2022-08-22T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (602, 6, CAST(N'2022-08-23T08:00:00.000' AS DateTime), CAST(N'2022-08-23T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (603, 6, CAST(N'2022-08-24T08:00:00.000' AS DateTime), CAST(N'2022-08-24T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (604, 6, CAST(N'2022-08-25T08:00:00.000' AS DateTime), CAST(N'2022-08-25T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (605, 6, CAST(N'2022-08-26T08:00:00.000' AS DateTime), CAST(N'2022-08-26T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (608, 6, CAST(N'2022-08-29T08:00:00.000' AS DateTime), CAST(N'2022-08-29T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (609, 6, CAST(N'2022-08-30T08:00:00.000' AS DateTime), CAST(N'2022-08-30T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (614, 1, CAST(N'2022-09-04T08:00:00.000' AS DateTime), CAST(N'2022-09-04T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (615, 1, CAST(N'2022-09-05T08:00:00.000' AS DateTime), CAST(N'2022-09-05T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (616, 1, CAST(N'2022-09-06T08:00:00.000' AS DateTime), CAST(N'2022-09-06T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (617, 1, CAST(N'2022-09-07T08:00:00.000' AS DateTime), CAST(N'2022-09-07T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (618, 1, CAST(N'2022-09-08T08:00:00.000' AS DateTime), CAST(N'2022-09-08T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (619, 1, CAST(N'2022-09-09T08:00:00.000' AS DateTime), CAST(N'2022-09-09T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (620, 1, CAST(N'2022-09-10T08:00:00.000' AS DateTime), CAST(N'2022-09-10T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (622, 1, CAST(N'2022-09-12T08:00:00.000' AS DateTime), CAST(N'2022-09-12T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (623, 1, CAST(N'2022-09-13T08:00:00.000' AS DateTime), CAST(N'2022-09-13T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (624, 1, CAST(N'2022-09-14T08:00:00.000' AS DateTime), CAST(N'2022-09-14T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (625, 1, CAST(N'2022-09-15T08:00:00.000' AS DateTime), CAST(N'2022-09-15T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (626, 1, CAST(N'2022-09-16T08:00:00.000' AS DateTime), CAST(N'2022-09-16T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (627, 1, CAST(N'2022-09-17T08:00:00.000' AS DateTime), CAST(N'2022-09-17T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (631, 1, CAST(N'2022-09-21T08:00:00.000' AS DateTime), CAST(N'2022-09-21T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (632, 1, CAST(N'2022-09-22T08:00:00.000' AS DateTime), CAST(N'2022-09-22T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (633, 1, CAST(N'2022-09-23T08:00:00.000' AS DateTime), CAST(N'2022-09-23T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (634, 1, CAST(N'2022-09-24T08:00:00.000' AS DateTime), CAST(N'2022-09-24T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (636, 1, CAST(N'2022-09-26T08:00:00.000' AS DateTime), CAST(N'2022-09-26T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (637, 1, CAST(N'2022-09-27T08:00:00.000' AS DateTime), CAST(N'2022-09-27T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (638, 1, CAST(N'2022-09-28T08:00:00.000' AS DateTime), CAST(N'2022-09-28T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (639, 1, CAST(N'2022-09-29T08:00:00.000' AS DateTime), CAST(N'2022-09-29T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (640, 1, CAST(N'2022-09-30T08:00:00.000' AS DateTime), CAST(N'2022-09-30T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (645, 2, CAST(N'2022-09-05T08:00:00.000' AS DateTime), CAST(N'2022-09-05T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (646, 2, CAST(N'2022-09-06T08:00:00.000' AS DateTime), CAST(N'2022-09-06T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (647, 2, CAST(N'2022-09-07T08:00:00.000' AS DateTime), CAST(N'2022-09-07T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (648, 2, CAST(N'2022-09-08T08:00:00.000' AS DateTime), CAST(N'2022-09-08T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (649, 2, CAST(N'2022-09-09T08:00:00.000' AS DateTime), CAST(N'2022-09-09T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (652, 2, CAST(N'2022-09-12T08:00:00.000' AS DateTime), CAST(N'2022-09-12T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (654, 2, CAST(N'2022-09-14T08:00:00.000' AS DateTime), CAST(N'2022-09-14T16:20:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (655, 2, CAST(N'2022-09-15T08:00:00.000' AS DateTime), CAST(N'2022-09-15T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (656, 2, CAST(N'2022-09-16T08:00:00.000' AS DateTime), CAST(N'2022-09-16T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (659, 2, CAST(N'2022-09-19T08:00:00.000' AS DateTime), CAST(N'2022-09-19T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (660, 2, CAST(N'2022-09-20T08:00:00.000' AS DateTime), CAST(N'2022-09-20T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (661, 2, CAST(N'2022-09-21T08:00:00.000' AS DateTime), CAST(N'2022-09-21T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (671, 3, CAST(N'2022-09-01T08:00:00.000' AS DateTime), CAST(N'2022-09-01T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (672, 3, CAST(N'2022-09-02T08:00:00.000' AS DateTime), CAST(N'2022-09-02T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (675, 3, CAST(N'2022-09-05T08:00:00.000' AS DateTime), CAST(N'2022-09-05T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (676, 3, CAST(N'2022-09-06T08:00:00.000' AS DateTime), CAST(N'2022-09-06T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (682, 3, CAST(N'2022-09-12T08:00:00.000' AS DateTime), CAST(N'2022-09-12T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (683, 3, CAST(N'2022-09-13T08:00:00.000' AS DateTime), CAST(N'2022-09-13T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (684, 3, CAST(N'2022-09-14T08:00:00.000' AS DateTime), CAST(N'2022-09-14T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (685, 3, CAST(N'2022-09-15T08:00:00.000' AS DateTime), CAST(N'2022-09-15T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (686, 3, CAST(N'2022-09-16T08:00:00.000' AS DateTime), CAST(N'2022-09-16T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (687, 3, CAST(N'2022-09-17T08:00:00.000' AS DateTime), CAST(N'2022-09-17T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (689, 3, CAST(N'2022-09-19T08:00:00.000' AS DateTime), CAST(N'2022-09-19T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (690, 3, CAST(N'2022-09-20T10:34:00.000' AS DateTime), CAST(N'2022-09-20T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (691, 3, CAST(N'2022-09-21T08:00:00.000' AS DateTime), CAST(N'2022-09-21T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (692, 3, CAST(N'2022-09-22T08:00:00.000' AS DateTime), CAST(N'2022-09-22T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (693, 3, CAST(N'2022-09-23T08:00:00.000' AS DateTime), CAST(N'2022-09-23T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (694, 3, CAST(N'2022-09-24T08:00:00.000' AS DateTime), CAST(N'2022-09-24T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (696, 3, CAST(N'2022-09-26T08:00:00.000' AS DateTime), CAST(N'2022-09-26T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (697, 3, CAST(N'2022-09-27T08:00:00.000' AS DateTime), CAST(N'2022-09-27T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (698, 3, CAST(N'2022-09-28T08:00:00.000' AS DateTime), CAST(N'2022-09-28T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (699, 3, CAST(N'2022-09-29T08:00:00.000' AS DateTime), CAST(N'2022-09-29T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (700, 3, CAST(N'2022-09-30T08:00:00.000' AS DateTime), CAST(N'2022-09-30T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (705, 4, CAST(N'2022-09-05T09:01:00.000' AS DateTime), CAST(N'2022-09-05T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (706, 4, CAST(N'2022-09-06T08:00:00.000' AS DateTime), CAST(N'2022-09-06T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (707, 4, CAST(N'2022-09-07T08:00:00.000' AS DateTime), CAST(N'2022-09-07T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (708, 4, CAST(N'2022-09-08T08:00:00.000' AS DateTime), CAST(N'2022-09-08T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (709, 4, CAST(N'2022-09-09T08:00:00.000' AS DateTime), CAST(N'2022-09-09T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (712, 4, CAST(N'2022-09-12T08:00:00.000' AS DateTime), CAST(N'2022-09-12T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (713, 4, CAST(N'2022-09-13T08:00:00.000' AS DateTime), CAST(N'2022-09-13T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (714, 4, CAST(N'2022-09-14T08:00:00.000' AS DateTime), CAST(N'2022-09-14T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (715, 4, CAST(N'2022-09-15T08:00:00.000' AS DateTime), CAST(N'2022-09-15T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (716, 4, CAST(N'2022-09-16T08:00:00.000' AS DateTime), CAST(N'2022-09-16T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (720, 4, CAST(N'2022-09-20T08:00:00.000' AS DateTime), CAST(N'2022-09-20T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (721, 4, CAST(N'2022-09-21T08:00:00.000' AS DateTime), CAST(N'2022-09-21T17:00:00.000' AS DateTime))
GO
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (722, 4, CAST(N'2022-09-22T08:00:00.000' AS DateTime), CAST(N'2022-09-22T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (723, 4, CAST(N'2022-09-23T08:00:00.000' AS DateTime), CAST(N'2022-09-23T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (732, 5, CAST(N'2022-09-02T08:00:00.000' AS DateTime), CAST(N'2022-09-02T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (736, 5, CAST(N'2022-09-06T08:00:00.000' AS DateTime), CAST(N'2022-09-06T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (737, 5, CAST(N'2022-09-07T08:00:00.000' AS DateTime), CAST(N'2022-09-07T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (738, 5, CAST(N'2022-09-08T08:00:00.000' AS DateTime), CAST(N'2022-09-08T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (739, 5, CAST(N'2022-09-09T08:00:00.000' AS DateTime), CAST(N'2022-09-09T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (740, 5, CAST(N'2022-09-10T08:00:00.000' AS DateTime), CAST(N'2022-09-10T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (742, 5, CAST(N'2022-09-12T08:00:00.000' AS DateTime), CAST(N'2022-09-12T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (744, 5, CAST(N'2022-09-14T08:00:00.000' AS DateTime), CAST(N'2022-09-14T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (745, 5, CAST(N'2022-09-15T08:00:00.000' AS DateTime), CAST(N'2022-09-15T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (746, 5, CAST(N'2022-09-16T08:00:00.000' AS DateTime), CAST(N'2022-09-16T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (749, 5, CAST(N'2022-09-19T08:00:00.000' AS DateTime), CAST(N'2022-09-19T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (750, 5, CAST(N'2022-09-20T08:00:00.000' AS DateTime), CAST(N'2022-09-20T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (751, 5, CAST(N'2022-09-21T08:00:00.000' AS DateTime), CAST(N'2022-09-21T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (752, 5, CAST(N'2022-09-22T08:00:00.000' AS DateTime), CAST(N'2022-09-22T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (753, 5, CAST(N'2022-09-23T08:00:00.000' AS DateTime), CAST(N'2022-09-23T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (756, 5, CAST(N'2022-09-26T08:39:00.000' AS DateTime), CAST(N'2022-09-26T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (757, 5, CAST(N'2022-09-27T09:11:00.000' AS DateTime), CAST(N'2022-09-27T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (758, 5, CAST(N'2022-09-28T08:00:00.000' AS DateTime), CAST(N'2022-09-28T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (759, 5, CAST(N'2022-09-29T08:00:00.000' AS DateTime), CAST(N'2022-09-29T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (760, 5, CAST(N'2022-09-30T08:00:00.000' AS DateTime), CAST(N'2022-09-30T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (765, 7, CAST(N'2022-09-05T08:00:00.000' AS DateTime), CAST(N'2022-09-05T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (767, 7, CAST(N'2022-09-07T08:00:00.000' AS DateTime), CAST(N'2022-09-07T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (768, 7, CAST(N'2022-09-08T08:00:00.000' AS DateTime), CAST(N'2022-09-08T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (769, 7, CAST(N'2022-09-09T08:00:00.000' AS DateTime), CAST(N'2022-09-09T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (772, 7, CAST(N'2022-09-12T08:00:00.000' AS DateTime), CAST(N'2022-09-12T15:59:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (773, 7, CAST(N'2022-09-13T08:00:00.000' AS DateTime), CAST(N'2022-09-13T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (774, 7, CAST(N'2022-09-14T08:00:00.000' AS DateTime), CAST(N'2022-09-14T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (775, 7, CAST(N'2022-09-15T08:00:00.000' AS DateTime), CAST(N'2022-09-15T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (776, 7, CAST(N'2022-09-16T08:00:00.000' AS DateTime), CAST(N'2022-09-16T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (779, 7, CAST(N'2022-09-19T08:00:00.000' AS DateTime), CAST(N'2022-09-19T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (781, 7, CAST(N'2022-09-21T08:00:00.000' AS DateTime), CAST(N'2022-09-21T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (782, 7, CAST(N'2022-09-22T08:00:00.000' AS DateTime), CAST(N'2022-09-22T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (783, 7, CAST(N'2022-09-23T08:00:00.000' AS DateTime), CAST(N'2022-09-23T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (786, 7, CAST(N'2022-09-26T08:00:00.000' AS DateTime), CAST(N'2022-09-26T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (787, 7, CAST(N'2022-09-27T08:00:00.000' AS DateTime), CAST(N'2022-09-27T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (788, 7, CAST(N'2022-09-28T08:00:00.000' AS DateTime), CAST(N'2022-09-28T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (789, 7, CAST(N'2022-09-29T09:00:00.000' AS DateTime), CAST(N'2022-09-29T17:00:00.000' AS DateTime))
INSERT [dbo].[TimeSheet] ([tid], [eid], [checkin], [checkout]) VALUES (790, 7, CAST(N'2022-09-30T08:00:00.000' AS DateTime), CAST(N'2022-09-30T17:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[TimeSheet] OFF
GO
SET IDENTITY_INSERT [dbo].[Type] ON 

INSERT [dbo].[Type] ([tid], [tname]) VALUES (1, N'Cong Tac')
INSERT [dbo].[Type] ([tid], [tname]) VALUES (2, N'Om')
INSERT [dbo].[Type] ([tid], [tname]) VALUES (3, N'Thai san')
INSERT [dbo].[Type] ([tid], [tname]) VALUES (4, N'other')
SET IDENTITY_INSERT [dbo].[Type] OFF
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Position] FOREIGN KEY([pid])
REFERENCES [dbo].[Position] ([pid])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Position]
GO
ALTER TABLE [dbo].[Holiday]  WITH CHECK ADD  CONSTRAINT [FK_Holiday_HolidayType] FOREIGN KEY([tid])
REFERENCES [dbo].[HolidayType] ([tid])
GO
ALTER TABLE [dbo].[Holiday] CHECK CONSTRAINT [FK_Holiday_HolidayType]
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Request_Employee] FOREIGN KEY([eid])
REFERENCES [dbo].[Employee] ([eid])
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_Request_Employee]
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Request_Type] FOREIGN KEY([tid])
REFERENCES [dbo].[Type] ([tid])
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_Request_Type]
GO
ALTER TABLE [dbo].[TimeSheet]  WITH CHECK ADD  CONSTRAINT [FK_TimeSheet_Employee] FOREIGN KEY([eid])
REFERENCES [dbo].[Employee] ([eid])
GO
ALTER TABLE [dbo].[TimeSheet] CHECK CONSTRAINT [FK_TimeSheet_Employee]
GO
USE [master]
GO
ALTER DATABASE [TimeKeeping] SET  READ_WRITE 
GO
