USE [BookCatalogue]
GO
ALTER TABLE [dbo].[Books] DROP CONSTRAINT [FK_Books_Genres]
GO
ALTER TABLE [dbo].[Books] DROP CONSTRAINT [FK_Books_Authors]
GO
ALTER TABLE [dbo].[Genres] DROP CONSTRAINT [DF_Genres_active]
GO
ALTER TABLE [dbo].[Books] DROP CONSTRAINT [DF_Books_active]
GO
ALTER TABLE [dbo].[Authors] DROP CONSTRAINT [DF_Authors_active]
GO
/****** Object:  Index [IX_Genres_2]    Script Date: 11.07.2025 18:29:15 ******/
DROP INDEX [IX_Genres_2] ON [dbo].[Genres]
GO
/****** Object:  Index [IX_Genres_1]    Script Date: 11.07.2025 18:29:15 ******/
DROP INDEX [IX_Genres_1] ON [dbo].[Genres]
GO
/****** Object:  Index [IX_UNIQUE_Genres]    Script Date: 11.07.2025 18:29:15 ******/
ALTER TABLE [dbo].[Genres] DROP CONSTRAINT [IX_UNIQUE_Genres]
GO
/****** Object:  Index [IX_Books_7]    Script Date: 11.07.2025 18:29:15 ******/
DROP INDEX [IX_Books_7] ON [dbo].[Books]
GO
/****** Object:  Index [IX_Books_6]    Script Date: 11.07.2025 18:29:15 ******/
DROP INDEX [IX_Books_6] ON [dbo].[Books]
GO
/****** Object:  Index [IX_Books_5]    Script Date: 11.07.2025 18:29:15 ******/
DROP INDEX [IX_Books_5] ON [dbo].[Books]
GO
/****** Object:  Index [IX_Books_4]    Script Date: 11.07.2025 18:29:15 ******/
DROP INDEX [IX_Books_4] ON [dbo].[Books]
GO
/****** Object:  Index [IX_Books_3]    Script Date: 11.07.2025 18:29:15 ******/
DROP INDEX [IX_Books_3] ON [dbo].[Books]
GO
/****** Object:  Index [IX_Books_2]    Script Date: 11.07.2025 18:29:15 ******/
DROP INDEX [IX_Books_2] ON [dbo].[Books]
GO
/****** Object:  Index [IX_Books_1]    Script Date: 11.07.2025 18:29:15 ******/
DROP INDEX [IX_Books_1] ON [dbo].[Books]
GO
/****** Object:  Index [IX_Authors_3]    Script Date: 11.07.2025 18:29:15 ******/
DROP INDEX [IX_Authors_3] ON [dbo].[Authors]
GO
/****** Object:  Index [IX_Authors_2]    Script Date: 11.07.2025 18:29:15 ******/
DROP INDEX [IX_Authors_2] ON [dbo].[Authors]
GO
/****** Object:  Index [IX_Authors_1]    Script Date: 11.07.2025 18:29:15 ******/
DROP INDEX [IX_Authors_1] ON [dbo].[Authors]
GO
/****** Object:  Table [dbo].[Genres]    Script Date: 11.07.2025 18:29:15 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Genres]') AND type in (N'U'))
DROP TABLE [dbo].[Genres]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 11.07.2025 18:29:15 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Books]') AND type in (N'U'))
DROP TABLE [dbo].[Books]
GO
/****** Object:  Table [dbo].[Authors]    Script Date: 11.07.2025 18:29:15 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Authors]') AND type in (N'U'))
DROP TABLE [dbo].[Authors]
GO
/****** Object:  User [kasoo]    Script Date: 11.07.2025 18:29:15 ******/
DROP USER [kasoo]
GO
/****** Object:  User [NT AUTHORITY\IUSR]    Script Date: 11.07.2025 18:29:15 ******/
DROP USER [NT AUTHORITY\IUSR]
GO
USE [master]
GO
/****** Object:  Database [BookCatalogue]    Script Date: 11.07.2025 18:29:15 ******/
DROP DATABASE [BookCatalogue]
GO
/****** Object:  Database [BookCatalogue]    Script Date: 11.07.2025 18:29:15 ******/
CREATE DATABASE [BookCatalogue]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BookCatalogue', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\BookCatalogue.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BookCatalogue_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\BookCatalogue_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [BookCatalogue] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BookCatalogue].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BookCatalogue] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BookCatalogue] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BookCatalogue] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BookCatalogue] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BookCatalogue] SET ARITHABORT OFF 
GO
ALTER DATABASE [BookCatalogue] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BookCatalogue] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BookCatalogue] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BookCatalogue] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BookCatalogue] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BookCatalogue] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BookCatalogue] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BookCatalogue] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BookCatalogue] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BookCatalogue] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BookCatalogue] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BookCatalogue] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BookCatalogue] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BookCatalogue] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BookCatalogue] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BookCatalogue] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BookCatalogue] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BookCatalogue] SET RECOVERY FULL 
GO
ALTER DATABASE [BookCatalogue] SET  MULTI_USER 
GO
ALTER DATABASE [BookCatalogue] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BookCatalogue] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BookCatalogue] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BookCatalogue] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BookCatalogue] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BookCatalogue] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BookCatalogue', N'ON'
GO
ALTER DATABASE [BookCatalogue] SET QUERY_STORE = ON
GO
ALTER DATABASE [BookCatalogue] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [BookCatalogue]
GO
/****** Object:  User [NT AUTHORITY\IUSR]    Script Date: 11.07.2025 18:29:15 ******/
CREATE USER [NT AUTHORITY\IUSR] FOR LOGIN [NT AUTHORITY\IUSR]
GO
/****** Object:  User [kasoo]    Script Date: 11.07.2025 18:29:15 ******/
CREATE USER [kasoo] FOR LOGIN [kasoo] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [NT AUTHORITY\IUSR]
GO
ALTER ROLE [db_datareader] ADD MEMBER [NT AUTHORITY\IUSR]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [NT AUTHORITY\IUSR]
GO
/****** Object:  Table [dbo].[Authors]    Script Date: 11.07.2025 18:29:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authors](
	[author_num_id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [nvarchar](50) NOT NULL,
	[last_name] [nvarchar](100) NOT NULL,
	[patronymic] [nvarchar](100) NULL,
	[birthday] [date] NOT NULL,
	[deathdate] [date] NULL,
	[biography] [text] NULL,
	[active] [tinyint] NOT NULL,
 CONSTRAINT [PK_Authors] PRIMARY KEY CLUSTERED 
(
	[author_num_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 11.07.2025 18:29:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[book_num_id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](100) NOT NULL,
	[author_num_id] [int] NOT NULL,
	[genre_num_id] [int] NOT NULL,
	[publication_year] [int] NULL,
	[isbn] [nvarchar](20) NULL,
	[description] [text] NULL,
	[active] [tinyint] NOT NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED 
(
	[book_num_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genres]    Script Date: 11.07.2025 18:29:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genres](
	[genre_num_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[description] [text] NULL,
	[active] [tinyint] NOT NULL,
 CONSTRAINT [PK_Genres] PRIMARY KEY CLUSTERED 
(
	[genre_num_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Authors] ON 

INSERT [dbo].[Authors] ([author_num_id], [first_name], [last_name], [patronymic], [birthday], [deathdate], [biography], [active]) VALUES (1, N'Лев', N'Толстой', N'Николаевич', CAST(N'1828-09-09' AS Date), CAST(N'1910-11-20' AS Date), N'Русский писатель, мыслитель, философ и публицист.', 1)
INSERT [dbo].[Authors] ([author_num_id], [first_name], [last_name], [patronymic], [birthday], [deathdate], [biography], [active]) VALUES (2, N'Фёдор', N'Достоевский', N'Михайлович', CAST(N'1821-11-11' AS Date), CAST(N'1881-02-09' AS Date), N'Русский писатель, мыслитель, философ и публицист.', 1)
SET IDENTITY_INSERT [dbo].[Authors] OFF
GO
SET IDENTITY_INSERT [dbo].[Genres] ON 

INSERT [dbo].[Genres] ([genre_num_id], [name], [description], [active]) VALUES (1, N'Роман', N'Большое повествовательное произведение.', 1)
INSERT [dbo].[Genres] ([genre_num_id], [name], [description], [active]) VALUES (2, N'Фантастика', N'Жанр, использующий фантастическое допущение.', 1)
SET IDENTITY_INSERT [dbo].[Genres] OFF
GO
SET IDENTITY_INSERT [dbo].[Books] ON 

INSERT [dbo].[Books] ([book_num_id], [title], [author_num_id], [genre_num_id], [publication_year], [isbn], [description], [active]) VALUES (1, N'Война и мир', 1, 1, 1869, N'978-5-389-06256-6', N'Роман-эпопея Льва Толстого.', 1)
INSERT [dbo].[Books] ([book_num_id], [title], [author_num_id], [genre_num_id], [publication_year], [isbn], [description], [active]) VALUES (2, N'Преступление и наказание', 2, 1, 1866, N'978-5-699-40431-6', N'Роман Фёдора Достоевского.', 1)
INSERT [dbo].[Books] ([book_num_id], [title], [author_num_id], [genre_num_id], [publication_year], [isbn], [description], [active]) VALUES (3, N'Анна Каренина', 1, 1, 1878, N'978-5-389-06618-2', N'роман Льва Толстого, написанный в 1873–1877 годах.', 0)
INSERT [dbo].[Books] ([book_num_id], [title], [author_num_id], [genre_num_id], [publication_year], [isbn], [description], [active]) VALUES (4, N'test', 2, 2, 2002, N'', N'', 0)
INSERT [dbo].[Books] ([book_num_id], [title], [author_num_id], [genre_num_id], [publication_year], [isbn], [description], [active]) VALUES (5, N'2222', 1, 1, 45, N'978-5-389-06618-2', N'asdasdasasddasasdasas', 0)
INSERT [dbo].[Books] ([book_num_id], [title], [author_num_id], [genre_num_id], [publication_year], [isbn], [description], [active]) VALUES (6, N'adasdas', 1, 1, 45, N'978-5-389-06618-2', N'sdas', 0)
INSERT [dbo].[Books] ([book_num_id], [title], [author_num_id], [genre_num_id], [publication_year], [isbn], [description], [active]) VALUES (7, N'aasdasd', 1, 2, 2002, N'', N'', 0)
INSERT [dbo].[Books] ([book_num_id], [title], [author_num_id], [genre_num_id], [publication_year], [isbn], [description], [active]) VALUES (8, N'wqeqweqw', 2, 1, 2002, N'978-5-389-06618-2', N'asdasdas', 0)
SET IDENTITY_INSERT [dbo].[Books] OFF
GO
/****** Object:  Index [IX_Authors_1]    Script Date: 11.07.2025 18:29:16 ******/
CREATE NONCLUSTERED INDEX [IX_Authors_1] ON [dbo].[Authors]
(
	[active] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Authors_2]    Script Date: 11.07.2025 18:29:16 ******/
CREATE NONCLUSTERED INDEX [IX_Authors_2] ON [dbo].[Authors]
(
	[first_name] ASC,
	[last_name] ASC,
	[active] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Authors_3]    Script Date: 11.07.2025 18:29:16 ******/
CREATE NONCLUSTERED INDEX [IX_Authors_3] ON [dbo].[Authors]
(
	[first_name] ASC,
	[last_name] ASC,
	[patronymic] ASC,
	[active] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Books_1]    Script Date: 11.07.2025 18:29:16 ******/
CREATE NONCLUSTERED INDEX [IX_Books_1] ON [dbo].[Books]
(
	[active] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Books_2]    Script Date: 11.07.2025 18:29:16 ******/
CREATE NONCLUSTERED INDEX [IX_Books_2] ON [dbo].[Books]
(
	[author_num_id] ASC,
	[active] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Books_3]    Script Date: 11.07.2025 18:29:16 ******/
CREATE NONCLUSTERED INDEX [IX_Books_3] ON [dbo].[Books]
(
	[genre_num_id] ASC,
	[active] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Books_4]    Script Date: 11.07.2025 18:29:16 ******/
CREATE NONCLUSTERED INDEX [IX_Books_4] ON [dbo].[Books]
(
	[author_num_id] ASC,
	[genre_num_id] ASC,
	[active] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Books_5]    Script Date: 11.07.2025 18:29:16 ******/
CREATE NONCLUSTERED INDEX [IX_Books_5] ON [dbo].[Books]
(
	[publication_year] ASC,
	[active] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Books_6]    Script Date: 11.07.2025 18:29:16 ******/
CREATE NONCLUSTERED INDEX [IX_Books_6] ON [dbo].[Books]
(
	[isbn] ASC,
	[active] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Books_7]    Script Date: 11.07.2025 18:29:16 ******/
CREATE NONCLUSTERED INDEX [IX_Books_7] ON [dbo].[Books]
(
	[title] ASC,
	[active] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UNIQUE_Genres]    Script Date: 11.07.2025 18:29:16 ******/
ALTER TABLE [dbo].[Genres] ADD  CONSTRAINT [IX_UNIQUE_Genres] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Genres_1]    Script Date: 11.07.2025 18:29:16 ******/
CREATE NONCLUSTERED INDEX [IX_Genres_1] ON [dbo].[Genres]
(
	[active] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Genres_2]    Script Date: 11.07.2025 18:29:16 ******/
CREATE NONCLUSTERED INDEX [IX_Genres_2] ON [dbo].[Genres]
(
	[name] ASC,
	[active] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Authors] ADD  CONSTRAINT [DF_Authors_active]  DEFAULT ((1)) FOR [active]
GO
ALTER TABLE [dbo].[Books] ADD  CONSTRAINT [DF_Books_active]  DEFAULT ((1)) FOR [active]
GO
ALTER TABLE [dbo].[Genres] ADD  CONSTRAINT [DF_Genres_active]  DEFAULT ((1)) FOR [active]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Authors] FOREIGN KEY([author_num_id])
REFERENCES [dbo].[Authors] ([author_num_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Authors]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Genres] FOREIGN KEY([genre_num_id])
REFERENCES [dbo].[Genres] ([genre_num_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Genres]
GO
USE [master]
GO
ALTER DATABASE [BookCatalogue] SET  READ_WRITE 
GO
