USE [master]
GO
/****** Object:  Database [Apilicious]    Script Date: 18/08/2022 14:29:44 ******/
CREATE DATABASE [Apilicious]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Apilicious', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Apilicious.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Apilicious_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Apilicious_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Apilicious] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Apilicious].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Apilicious] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Apilicious] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Apilicious] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Apilicious] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Apilicious] SET ARITHABORT OFF 
GO
ALTER DATABASE [Apilicious] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Apilicious] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Apilicious] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Apilicious] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Apilicious] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Apilicious] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Apilicious] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Apilicious] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Apilicious] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Apilicious] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Apilicious] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Apilicious] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Apilicious] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Apilicious] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Apilicious] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Apilicious] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Apilicious] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Apilicious] SET RECOVERY FULL 
GO
ALTER DATABASE [Apilicious] SET  MULTI_USER 
GO
ALTER DATABASE [Apilicious] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Apilicious] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Apilicious] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Apilicious] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Apilicious] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Apilicious] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Apilicious', N'ON'
GO
ALTER DATABASE [Apilicious] SET QUERY_STORE = OFF
GO
USE [Apilicious]
GO
/****** Object:  Table [dbo].[Ameliorer]    Script Date: 18/08/2022 14:29:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ameliorer](
	[ame_art_id] [int] NOT NULL,
	[ame_med_id] [int] NOT NULL,
 CONSTRAINT [PK_AMELIORER_ARTICLE_MEDIA] PRIMARY KEY CLUSTERED 
(
	[ame_art_id] ASC,
	[ame_med_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Article]    Script Date: 18/08/2022 14:29:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Article](
	[art_id] [int] IDENTITY(1,1) NOT NULL,
	[art_pics] [varchar](1000) NOT NULL,
	[art_titre] [varchar](50) NOT NULL,
	[art_texte] [text] NOT NULL,
	[art_uti_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[art_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Associer]    Script Date: 18/08/2022 14:29:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Associer](
	[ass_rec_id] [int] NOT NULL,
	[ass_tag_id] [int] NOT NULL,
 CONSTRAINT [PK_ASSOCIER_RECETTE_TAGS] PRIMARY KEY CLUSTERED 
(
	[ass_rec_id] ASC,
	[ass_tag_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contenir]    Script Date: 18/08/2022 14:29:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contenir](
	[con_rec_id] [int] NOT NULL,
	[con_pro_id] [int] NOT NULL,
 CONSTRAINT [PK_CONTENIR_RECETTE_PRODUIT] PRIMARY KEY CLUSTERED 
(
	[con_rec_id] ASC,
	[con_pro_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Decrire]    Script Date: 18/08/2022 14:29:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Decrire](
	[dec_art_id] [int] NOT NULL,
	[dec_tag_id] [int] NOT NULL,
 CONSTRAINT [PK_DECRIRE_ARTICLE_TAGS] PRIMARY KEY CLUSTERED 
(
	[dec_art_id] ASC,
	[dec_tag_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Embellir]    Script Date: 18/08/2022 14:29:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Embellir](
	[emb_rec_id] [int] NOT NULL,
	[emb_med_id] [int] NOT NULL,
 CONSTRAINT [PK_EMBELLIR_RECETTE_MEDIA] PRIMARY KEY CLUSTERED 
(
	[emb_rec_id] ASC,
	[emb_med_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FicheProduit]    Script Date: 18/08/2022 14:29:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FicheProduit](
	[fic_id] [int] IDENTITY(1,1) NOT NULL,
	[fic_libelle] [varchar](50) NOT NULL,
	[fic_pics] [varchar](200) NOT NULL,
	[fic_description] [varchar](1000) NOT NULL,
	[fic_pro_id] [int] NOT NULL,
	[fic_uti_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[fic_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Illustrer]    Script Date: 18/08/2022 14:29:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Illustrer](
	[ill_fic_id] [int] NOT NULL,
	[ill_med_id] [int] NOT NULL,
 CONSTRAINT [PK_ILLUSTRER_FICHEPRODUIT_MEDIA] PRIMARY KEY CLUSTERED 
(
	[ill_fic_id] ASC,
	[ill_med_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Media]    Script Date: 18/08/2022 14:29:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Media](
	[med_id] [int] IDENTITY(1,1) NOT NULL,
	[med_chemin] [varchar](1000) NOT NULL,
	[med_type] [varchar](15) NULL,
	[med_extension] [varchar](5) NULL,
PRIMARY KEY CLUSTERED 
(
	[med_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MessageForum]    Script Date: 18/08/2022 14:29:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MessageForum](
	[mes_id] [int] IDENTITY(1,1) NOT NULL,
	[mes_horodate] [datetime] NOT NULL,
	[mes_texte] [text] NOT NULL,
	[mes_reponse_id_1] [int] NULL,
	[mes_uti_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[mes_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Montrer]    Script Date: 18/08/2022 14:29:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Montrer](
	[mon_fic_id] [int] NOT NULL,
	[mon_tag_id] [int] NOT NULL,
 CONSTRAINT [PK_MONTRER_FICHEPRODUIT_TAGS] PRIMARY KEY CLUSTERED 
(
	[mon_fic_id] ASC,
	[mon_tag_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Produit]    Script Date: 18/08/2022 14:29:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Produit](
	[pro_id] [int] IDENTITY(1,1) NOT NULL,
	[pro_libelle] [varchar](50) NOT NULL,
	[pro_unite] [int] NULL,
	[pro_pics] [varchar](1000) NULL,
	[pro_uti_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[pro_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recette]    Script Date: 18/08/2022 14:29:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recette](
	[rec_id] [int] IDENTITY(1,1) NOT NULL,
	[rec_titre] [varchar](20) NOT NULL,
	[rec_texte] [text] NOT NULL,
	[rec_pics] [varchar](1000) NOT NULL,
	[rec_liste] [varchar](50) NOT NULL,
	[rec_compo_uti_id] [int] NOT NULL,
	[rec_valider_uti_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[rec_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 18/08/2022 14:29:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[rol_id] [int] IDENTITY(1,1) NOT NULL,
	[rol_nom] [varchar](50) NOT NULL,
	[rol_droit] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[rol_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tags]    Script Date: 18/08/2022 14:29:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tags](
	[tag_id] [int] IDENTITY(1,1) NOT NULL,
	[tag_nom] [varchar](25) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[tag_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Utilisateur]    Script Date: 18/08/2022 14:29:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Utilisateur](
	[uti_id] [int] IDENTITY(1,1) NOT NULL,
	[uti_pseudo] [varchar](12) NOT NULL,
	[uti_nom] [varchar](15) NOT NULL,
	[uti_prenom] [varchar](15) NOT NULL,
	[uti_DDN] [date] NOT NULL,
	[uti_ville] [varchar](25) NOT NULL,
	[uti_mail] [varchar](100) NOT NULL,
	[uti_mdp] [varchar](25) NOT NULL,
	[uti_avatar] [varchar](1000) NULL,
	[uti_rol_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[uti_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Ameliorer] ([ame_art_id], [ame_med_id]) VALUES (4, 7)
INSERT [dbo].[Ameliorer] ([ame_art_id], [ame_med_id]) VALUES (5, 7)
INSERT [dbo].[Ameliorer] ([ame_art_id], [ame_med_id]) VALUES (6, 2)
INSERT [dbo].[Ameliorer] ([ame_art_id], [ame_med_id]) VALUES (6, 3)
INSERT [dbo].[Ameliorer] ([ame_art_id], [ame_med_id]) VALUES (7, 2)
INSERT [dbo].[Ameliorer] ([ame_art_id], [ame_med_id]) VALUES (7, 8)
INSERT [dbo].[Ameliorer] ([ame_art_id], [ame_med_id]) VALUES (9, 3)
INSERT [dbo].[Ameliorer] ([ame_art_id], [ame_med_id]) VALUES (9, 5)
INSERT [dbo].[Ameliorer] ([ame_art_id], [ame_med_id]) VALUES (9, 6)
INSERT [dbo].[Ameliorer] ([ame_art_id], [ame_med_id]) VALUES (10, 4)
INSERT [dbo].[Ameliorer] ([ame_art_id], [ame_med_id]) VALUES (10, 7)
INSERT [dbo].[Ameliorer] ([ame_art_id], [ame_med_id]) VALUES (11, 9)
INSERT [dbo].[Ameliorer] ([ame_art_id], [ame_med_id]) VALUES (12, 2)
INSERT [dbo].[Ameliorer] ([ame_art_id], [ame_med_id]) VALUES (13, 8)
INSERT [dbo].[Ameliorer] ([ame_art_id], [ame_med_id]) VALUES (14, 8)
INSERT [dbo].[Ameliorer] ([ame_art_id], [ame_med_id]) VALUES (15, 6)
INSERT [dbo].[Ameliorer] ([ame_art_id], [ame_med_id]) VALUES (16, 3)
INSERT [dbo].[Ameliorer] ([ame_art_id], [ame_med_id]) VALUES (16, 5)
INSERT [dbo].[Ameliorer] ([ame_art_id], [ame_med_id]) VALUES (16, 9)
INSERT [dbo].[Ameliorer] ([ame_art_id], [ame_med_id]) VALUES (18, 2)
INSERT [dbo].[Ameliorer] ([ame_art_id], [ame_med_id]) VALUES (18, 3)
INSERT [dbo].[Ameliorer] ([ame_art_id], [ame_med_id]) VALUES (19, 2)
INSERT [dbo].[Ameliorer] ([ame_art_id], [ame_med_id]) VALUES (19, 4)
INSERT [dbo].[Ameliorer] ([ame_art_id], [ame_med_id]) VALUES (20, 2)
INSERT [dbo].[Ameliorer] ([ame_art_id], [ame_med_id]) VALUES (20, 4)
GO
SET IDENTITY_INSERT [dbo].[Article] ON 

INSERT [dbo].[Article] ([art_id], [art_pics], [art_titre], [art_texte], [art_uti_id]) VALUES (1, N'https://yahoo.com/one', N'', N'bibendum sed, est. Nunc laoreet lectus quis massa. Mauris vestibulum, neque sed dictum eleifend, nunc risus varius orci, in consequat enim diam vel arcu. Curabitur ut odio vel est tempor bibendum. Donec felis orci, adipiscing non, luctus sit amet, faucibus ut, nulla. Cras eu tellus eu augue porttitor interdum. Sed auctor odio a purus. Duis elementum, dui quis accumsan convallis, ante lectus convallis est, vitae sodales nisi magna sed dui. Fusce aliquam, enim nec tempus scelerisque, lorem ipsum sodales purus, in molestie tortor nibh sit amet', 10)
INSERT [dbo].[Article] ([art_id], [art_pics], [art_titre], [art_texte], [art_uti_id]) VALUES (2, N'http://netflix.com/user/110', N'', N'vitae velit egestas lacinia. Sed congue, elit sed consequat auctor, nunc nulla vulputate dui, nec tempus mauris erat eget ipsum. Suspendisse sagittis. Nullam vitae diam. Proin dolor. Nulla semper tellus id nunc interdum feugiat. Sed nec metus facilisis lorem tristique aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet odio. Etiam ligula tortor, dictum eu, placerat eget, venenatis a, magna. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Etiam laoreet, libero et tristique pellentesque, tellus sem mollis', 1)
INSERT [dbo].[Article] ([art_id], [art_pics], [art_titre], [art_texte], [art_uti_id]) VALUES (3, N'http://facebook.com/en-us', N'', N'odio. Nam interdum enim non nisi. Aenean eget metus. In nec orci. Donec nibh. Quisque nonummy ipsum non arcu. Vivamus sit amet risus. Donec egestas. Aliquam nec enim. Nunc ut erat. Sed nunc est, mollis non, cursus non, egestas a, dui. Cras pellentesque. Sed dictum. Proin eget odio. Aliquam vulputate ullamcorper magna. Sed eu eros. Nam consequat dolor vitae dolor. Donec fringilla. Donec feugiat metus sit amet ante. Vivamus non lorem vitae odio sagittis semper. Nam tempor diam dictum sapien. Aenean massa. Integer vitae nibh. Donec est mauris, rhoncus id, mollis nec, cursus', 5)
INSERT [dbo].[Article] ([art_id], [art_pics], [art_titre], [art_texte], [art_uti_id]) VALUES (4, N'https://netflix.com/sub/cars', N'', N'Suspendisse aliquet, sem ut cursus luctus, ipsum leo elementum sem, vitae aliquam eros turpis non enim. Mauris quis turpis vitae purus gravida sagittis. Duis gravida. Praesent eu nulla at sem molestie sodales. Mauris blandit enim consequat purus. Maecenas libero est, congue a, aliquet vel, vulputate eu, odio. Phasellus at augue id ante dictum cursus. Nunc mauris elit, dictum eu, eleifend nec, malesuada ut, sem. Nulla interdum. Curabitur dictum. Phasellus in felis. Nulla tempor augue ac ipsum. Phasellus vitae mauris sit amet lorem semper auctor. Mauris vel turpis. Aliquam adipiscing lobortis risus. In mi pede,', 4)
INSERT [dbo].[Article] ([art_id], [art_pics], [art_titre], [art_texte], [art_uti_id]) VALUES (5, N'http://zoom.us/fr', N'', N'eu dolor egestas rhoncus. Proin nisl sem, consequat nec, mollis vitae, posuere at, velit. Cras lorem lorem, luctus ut, pellentesque eget, dictum placerat, augue. Sed molestie. Sed id risus quis diam luctus lobortis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Mauris ut quam vel sapien imperdiet ornare. In faucibus. Morbi vehicula. Pellentesque tincidunt tempus risus. Donec egestas. Duis ac arcu. Nunc mauris. Morbi non sapien molestie orci tincidunt adipiscing. Mauris molestie pharetra nibh. Aliquam ornare, libero at', 8)
INSERT [dbo].[Article] ([art_id], [art_pics], [art_titre], [art_texte], [art_uti_id]) VALUES (6, N'http://pinterest.com/user/110', N'', N'arcu. Nunc mauris. Morbi non sapien molestie orci tincidunt adipiscing. Mauris molestie pharetra nibh. Aliquam ornare, libero at auctor ullamcorper, nisl arcu iaculis enim, sit amet ornare lectus justo eu arcu. Morbi sit amet massa. Quisque porttitor eros nec tellus. Nunc lectus pede, ultrices a, auctor non, feugiat nec, diam. Duis mi enim, condimentum eget, volutpat ornare, facilisis eget, ipsum. Donec sollicitudin adipiscing ligula. Aenean gravida nunc sed pede. Cum sociis natoque penatibus', 7)
INSERT [dbo].[Article] ([art_id], [art_pics], [art_titre], [art_texte], [art_uti_id]) VALUES (7, N'http://whatsapp.com/en-ca', N'', N'massa. Integer vitae nibh. Donec est mauris, rhoncus id, mollis nec, cursus a, enim. Suspendisse aliquet, sem ut cursus luctus, ipsum leo elementum sem, vitae aliquam eros turpis non enim. Mauris quis turpis vitae purus gravida sagittis. Duis gravida. Praesent eu nulla at sem molestie sodales. Mauris blandit enim consequat purus. Maecenas libero est, congue a, aliquet vel, vulputate eu, odio. Phasellus at augue id ante dictum cursus. Nunc mauris elit, dictum eu, eleifend nec, malesuada ut, sem. Nulla', 6)
INSERT [dbo].[Article] ([art_id], [art_pics], [art_titre], [art_texte], [art_uti_id]) VALUES (8, N'http://twitter.com/fr', N'', N'Fusce aliquam, enim nec tempus scelerisque, lorem ipsum sodales purus, in molestie tortor nibh sit amet orci. Ut sagittis lobortis mauris. Suspendisse aliquet molestie tellus. Aenean egestas hendrerit neque. In ornare sagittis felis. Donec tempor, est ac mattis semper, dui lectus rutrum urna, nec luctus felis purus ac tellus. Suspendisse sed dolor. Fusce mi lorem, vehicula et, rutrum eu, ultrices sit amet, risus. Donec nibh enim, gravida sit amet, dapibus id, blandit at, nisi. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel nisl. Quisque fringilla euismod enim. Etiam gravida molestie arcu.', 7)
INSERT [dbo].[Article] ([art_id], [art_pics], [art_titre], [art_texte], [art_uti_id]) VALUES (9, N'http://wikipedia.org/user/110', N'', N'adipiscing. Mauris molestie pharetra nibh. Aliquam ornare, libero at auctor ullamcorper, nisl arcu iaculis enim, sit amet ornare lectus justo eu arcu. Morbi sit amet massa. Quisque porttitor eros nec tellus. Nunc lectus pede, ultrices a, auctor non, feugiat nec, diam. Duis mi enim, condimentum eget, volutpat ornare, facilisis eget, ipsum. Donec sollicitudin adipiscing ligula. Aenean gravida nunc sed pede. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel arcu eu odio tristique pharetra. Quisque ac libero nec ligula consectetuer rhoncus. Nullam velit dui, semper et,', 1)
INSERT [dbo].[Article] ([art_id], [art_pics], [art_titre], [art_texte], [art_uti_id]) VALUES (10, N'http://cnn.com/fr', N'', N'in, hendrerit consectetuer, cursus et, magna. Praesent interdum ligula eu enim. Etiam imperdiet dictum magna. Ut tincidunt orci quis lectus. Nullam suscipit, est ac facilisis facilisis, magna tellus faucibus leo, in lobortis tellus justo sit amet nulla. Donec non justo. Proin non massa non ante bibendum ullamcorper. Duis cursus, diam at pretium aliquet, metus urna convallis erat, eget tincidunt dui augue eu tellus. Phasellus elit pede, malesuada vel, venenatis vel, faucibus id, libero.', 9)
INSERT [dbo].[Article] ([art_id], [art_pics], [art_titre], [art_texte], [art_uti_id]) VALUES (11, N'https://zoom.us/settings', N'', N'lorem fringilla ornare placerat, orci lacus vestibulum lorem, sit amet ultricies sem magna nec quam. Curabitur vel lectus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec dignissim magna a tortor. Nunc commodo auctor velit. Aliquam nisl. Nulla eu neque pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper, velit in aliquet lobortis, nisi nibh lacinia orci, consectetuer euismod est arcu ac orci. Ut semper pretium neque. Morbi quis urna. Nunc quis arcu vel quam dignissim pharetra. Nam ac nulla. In tincidunt congue turpis. In', 6)
INSERT [dbo].[Article] ([art_id], [art_pics], [art_titre], [art_texte], [art_uti_id]) VALUES (12, N'https://youtube.com/one', N'', N'metus. In lorem. Donec elementum, lorem ut aliquam iaculis, lacus pede sagittis augue, eu tempor erat neque non quam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aliquam fringilla cursus purus. Nullam scelerisque neque sed sem egestas blandit. Nam nulla magna, malesuada vel, convallis in, cursus et, eros. Proin ultrices. Duis volutpat nunc sit amet metus.', 4)
INSERT [dbo].[Article] ([art_id], [art_pics], [art_titre], [art_texte], [art_uti_id]) VALUES (13, N'https://nytimes.com/settings', N'', N'amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at lacus. Quisque purus sapien, gravida non, sollicitudin a, malesuada id, erat. Etiam vestibulum massa rutrum magna. Cras convallis convallis dolor. Quisque tincidunt pede ac urna. Ut tincidunt vehicula risus. Nulla eget metus eu erat semper rutrum. Fusce dolor quam, elementum at, egestas a, scelerisque sed, sapien. Nunc pulvinar arcu et pede. Nunc sed orci lobortis augue scelerisque mollis. Phasellus libero mauris, aliquam eu, accumsan sed, facilisis vitae, orci. Phasellus dapibus quam quis diam. Pellentesque habitant morbi tristique senectus et', 3)
INSERT [dbo].[Article] ([art_id], [art_pics], [art_titre], [art_texte], [art_uti_id]) VALUES (14, N'https://reddit.com/group/9', N'', N'semper et, lacinia vitae, sodales at, velit. Pellentesque ultricies dignissim lacus. Aliquam rutrum lorem ac risus. Morbi metus. Vivamus euismod urna. Nullam lobortis quam a felis ullamcorper viverra. Maecenas iaculis aliquet diam. Sed diam lorem, auctor quis, tristique ac, eleifend vitae, erat. Vivamus nisi. Mauris nulla. Integer urna. Vivamus molestie dapibus ligula. Aliquam erat volutpat. Nulla dignissim. Maecenas ornare egestas ligula. Nullam feugiat placerat velit. Quisque varius. Nam porttitor scelerisque', 9)
INSERT [dbo].[Article] ([art_id], [art_pics], [art_titre], [art_texte], [art_uti_id]) VALUES (15, N'http://google.com/user/110', N'', N'gravida sagittis. Duis gravida. Praesent eu nulla at sem molestie sodales. Mauris blandit enim consequat purus. Maecenas libero est, congue a, aliquet vel, vulputate eu, odio. Phasellus at augue id ante dictum cursus. Nunc mauris elit, dictum eu, eleifend nec, malesuada ut, sem. Nulla interdum. Curabitur dictum. Phasellus in felis. Nulla tempor augue ac ipsum. Phasellus', 4)
INSERT [dbo].[Article] ([art_id], [art_pics], [art_titre], [art_texte], [art_uti_id]) VALUES (16, N'https://whatsapp.com/en-us', N'', N'mattis. Cras eget nisi dictum augue malesuada malesuada. Integer id magna et ipsum cursus vestibulum. Mauris magna. Duis dignissim tempor arcu. Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus non magna. Nam ligula elit, pretium et, rutrum non, hendrerit id, ante. Nunc mauris sapien, cursus in, hendrerit consectetuer, cursus et, magna. Praesent interdum ligula eu enim. Etiam imperdiet dictum magna. Ut tincidunt orci', 1)
INSERT [dbo].[Article] ([art_id], [art_pics], [art_titre], [art_texte], [art_uti_id]) VALUES (17, N'http://instagram.com/user/110', N'', N'senectus et netus et malesuada fames ac turpis egestas. Fusce aliquet magna a neque. Nullam ut nisi a odio semper cursus. Integer mollis. Integer tincidunt aliquam arcu. Aliquam ultrices iaculis odio. Nam interdum enim non nisi. Aenean eget metus. In nec orci. Donec nibh. Quisque nonummy ipsum non arcu. Vivamus sit amet risus. Donec egestas. Aliquam nec enim. Nunc ut erat.', 10)
INSERT [dbo].[Article] ([art_id], [art_pics], [art_titre], [art_texte], [art_uti_id]) VALUES (18, N'https://wikipedia.org/one', N'', N'velit egestas lacinia. Sed congue, elit sed consequat auctor, nunc nulla vulputate dui, nec tempus mauris erat eget ipsum. Suspendisse sagittis. Nullam vitae diam. Proin dolor. Nulla semper tellus id nunc interdum feugiat. Sed nec metus facilisis lorem tristique aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet odio. Etiam ligula', 2)
INSERT [dbo].[Article] ([art_id], [art_pics], [art_titre], [art_texte], [art_uti_id]) VALUES (19, N'http://youtube.com/site', N'', N'adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at lacus. Quisque purus sapien, gravida non, sollicitudin a, malesuada id, erat. Etiam vestibulum massa rutrum magna. Cras convallis convallis dolor. Quisque tincidunt pede ac urna. Ut tincidunt vehicula risus. Nulla eget metus eu erat semper rutrum. Fusce dolor quam, elementum at, egestas a, scelerisque sed, sapien. Nunc pulvinar', 9)
INSERT [dbo].[Article] ([art_id], [art_pics], [art_titre], [art_texte], [art_uti_id]) VALUES (20, N'https://pinterest.com/user/110', N'', N'magna. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Etiam laoreet, libero et tristique pellentesque, tellus sem mollis dui, in sodales elit erat vitae risus. Duis a mi fringilla mi lacinia mattis. Integer eu lacus. Quisque imperdiet, erat nonummy ultricies ornare, elit elit fermentum risus, at fringilla purus mauris a nunc. In at pede. Cras vulputate velit eu sem. Pellentesque ut ipsum ac mi eleifend egestas. Sed pharetra,', 3)
INSERT [dbo].[Article] ([art_id], [art_pics], [art_titre], [art_texte], [art_uti_id]) VALUES (21, N'https://cnn.com/fr', N'', N'ut ipsum ac mi eleifend egestas. Sed pharetra, felis eget varius ultrices, mauris ipsum porta elit, a feugiat tellus lorem eu metus. In lorem. Donec elementum, lorem ut aliquam iaculis, lacus pede sagittis augue, eu tempor erat neque non quam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aliquam fringilla cursus purus. Nullam scelerisque neque sed sem egestas blandit. Nam nulla magna,', 1)
INSERT [dbo].[Article] ([art_id], [art_pics], [art_titre], [art_texte], [art_uti_id]) VALUES (22, N'http://bbc.co.uk/user/110', N'', N'Donec sollicitudin adipiscing ligula. Aenean gravida nunc sed pede. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel arcu eu odio tristique pharetra. Quisque ac libero nec ligula consectetuer rhoncus. Nullam velit dui, semper et, lacinia vitae, sodales at, velit. Pellentesque ultricies dignissim lacus. Aliquam rutrum lorem ac risus. Morbi metus. Vivamus euismod urna. Nullam lobortis quam a felis ullamcorper viverra. Maecenas iaculis aliquet diam. Sed diam lorem, auctor quis, tristique ac, eleifend vitae, erat. Vivamus nisi. Mauris nulla. Integer urna. Vivamus molestie dapibus ligula. Aliquam erat volutpat. Nulla dignissim. Maecenas', 9)
INSERT [dbo].[Article] ([art_id], [art_pics], [art_titre], [art_texte], [art_uti_id]) VALUES (23, N'http://naver.com/user/110', N'', N'dictum eu, placerat eget, venenatis a, magna. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Etiam laoreet, libero et tristique pellentesque, tellus sem mollis dui, in sodales elit erat vitae risus. Duis a mi fringilla mi lacinia mattis. Integer eu lacus. Quisque imperdiet, erat nonummy ultricies ornare, elit elit fermentum risus,', 9)
INSERT [dbo].[Article] ([art_id], [art_pics], [art_titre], [art_texte], [art_uti_id]) VALUES (24, N'http://google.com/user/110', N'', N'Aenean eget magna. Suspendisse tristique neque venenatis lacus. Etiam bibendum fermentum metus. Aenean sed pede nec ante blandit viverra. Donec tempus, lorem fringilla ornare placerat, orci lacus vestibulum lorem, sit amet ultricies sem magna nec quam. Curabitur vel lectus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec dignissim magna a tortor. Nunc commodo auctor velit. Aliquam nisl. Nulla eu neque pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper, velit in aliquet lobortis, nisi nibh lacinia orci, consectetuer euismod est arcu ac orci. Ut semper pretium neque. Morbi quis urna. Nunc quis arcu', 2)
INSERT [dbo].[Article] ([art_id], [art_pics], [art_titre], [art_texte], [art_uti_id]) VALUES (25, N'http://baidu.com/en-ca', N'', N'non, sollicitudin a, malesuada id, erat. Etiam vestibulum massa rutrum magna. Cras convallis convallis dolor. Quisque tincidunt pede ac urna. Ut tincidunt vehicula risus. Nulla eget metus eu erat semper rutrum. Fusce dolor quam, elementum at, egestas a, scelerisque sed, sapien. Nunc pulvinar arcu et pede. Nunc sed orci lobortis augue scelerisque mollis. Phasellus libero mauris, aliquam eu, accumsan sed, facilisis vitae, orci. Phasellus dapibus quam quis diam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce aliquet magna a neque. Nullam ut', 4)
INSERT [dbo].[Article] ([art_id], [art_pics], [art_titre], [art_texte], [art_uti_id]) VALUES (26, N'https://whatsapp.com/group/9', N'', N'Suspendisse sed dolor. Fusce mi lorem, vehicula et, rutrum eu, ultrices sit amet, risus. Donec nibh enim, gravida sit amet, dapibus id, blandit at, nisi. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel nisl. Quisque fringilla euismod enim. Etiam gravida molestie arcu. Sed eu nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula. Nullam enim. Sed nulla ante, iaculis nec, eleifend non, dapibus rutrum, justo. Praesent luctus. Curabitur egestas nunc sed', 3)
INSERT [dbo].[Article] ([art_id], [art_pics], [art_titre], [art_texte], [art_uti_id]) VALUES (27, N'http://guardian.co.uk/site', N'', N'non arcu. Vivamus sit amet risus. Donec egestas. Aliquam nec enim. Nunc ut erat. Sed nunc est, mollis non, cursus non, egestas a, dui. Cras pellentesque. Sed dictum. Proin eget odio. Aliquam vulputate ullamcorper magna. Sed eu eros. Nam consequat dolor vitae dolor. Donec fringilla. Donec feugiat metus sit amet ante. Vivamus non lorem vitae odio sagittis semper. Nam tempor diam dictum sapien. Aenean massa. Integer vitae nibh. Donec est mauris, rhoncus id, mollis nec, cursus a, enim. Suspendisse aliquet,', 4)
INSERT [dbo].[Article] ([art_id], [art_pics], [art_titre], [art_texte], [art_uti_id]) VALUES (28, N'https://reddit.com/sub', N'', N'eleifend, nunc risus varius orci, in consequat enim diam vel arcu. Curabitur ut odio vel est tempor bibendum. Donec felis orci, adipiscing non, luctus sit amet, faucibus ut, nulla. Cras eu tellus eu augue porttitor interdum. Sed auctor odio a purus. Duis elementum, dui quis accumsan convallis, ante lectus convallis est, vitae sodales nisi magna sed dui. Fusce aliquam, enim nec tempus scelerisque, lorem ipsum sodales purus, in molestie tortor nibh sit amet orci. Ut sagittis lobortis mauris. Suspendisse aliquet molestie tellus. Aenean egestas hendrerit neque. In ornare', 10)
INSERT [dbo].[Article] ([art_id], [art_pics], [art_titre], [art_texte], [art_uti_id]) VALUES (29, N'http://guardian.co.uk/sub', N'', N'vulputate ullamcorper magna. Sed eu eros. Nam consequat dolor vitae dolor. Donec fringilla. Donec feugiat metus sit amet ante. Vivamus non lorem vitae odio sagittis semper. Nam tempor diam dictum sapien. Aenean massa. Integer vitae nibh. Donec est mauris, rhoncus id, mollis nec, cursus a, enim. Suspendisse aliquet, sem ut cursus', 10)
INSERT [dbo].[Article] ([art_id], [art_pics], [art_titre], [art_texte], [art_uti_id]) VALUES (30, N'http://pinterest.com/en-ca', N'', N'egestas. Aliquam nec enim. Nunc ut erat. Sed nunc est, mollis non, cursus non, egestas a, dui. Cras pellentesque. Sed dictum. Proin eget odio. Aliquam vulputate ullamcorper magna. Sed eu eros. Nam consequat dolor vitae dolor. Donec fringilla. Donec feugiat metus sit amet ante. Vivamus non lorem vitae odio sagittis semper. Nam tempor diam dictum sapien. Aenean massa. Integer vitae nibh. Donec est mauris,', 10)
INSERT [dbo].[Article] ([art_id], [art_pics], [art_titre], [art_texte], [art_uti_id]) VALUES (31, N'http://youtube.com/en-ca', N'', N'amet, faucibus ut, nulla. Cras eu tellus eu augue porttitor interdum. Sed auctor odio a purus. Duis elementum, dui quis accumsan convallis, ante lectus convallis est, vitae sodales nisi magna sed dui. Fusce aliquam, enim nec tempus scelerisque, lorem ipsum sodales purus, in molestie tortor nibh sit amet orci. Ut sagittis lobortis mauris. Suspendisse aliquet molestie tellus. Aenean egestas hendrerit neque. In ornare sagittis felis. Donec tempor, est ac mattis semper, dui lectus rutrum urna, nec luctus felis purus ac tellus. Suspendisse sed dolor.', 9)
INSERT [dbo].[Article] ([art_id], [art_pics], [art_titre], [art_texte], [art_uti_id]) VALUES (32, N'https://pinterest.com/en-us', N'', N'Donec tincidunt. Donec vitae erat vel pede blandit congue. In scelerisque scelerisque dui. Suspendisse ac metus vitae velit egestas lacinia. Sed congue, elit sed consequat auctor, nunc nulla vulputate dui, nec tempus mauris erat eget ipsum. Suspendisse sagittis. Nullam vitae diam. Proin dolor. Nulla semper tellus id nunc interdum feugiat. Sed nec', 6)
INSERT [dbo].[Article] ([art_id], [art_pics], [art_titre], [art_texte], [art_uti_id]) VALUES (33, N'https://naver.com/site', N'', N'sollicitudin orci sem eget massa. Suspendisse eleifend. Cras sed leo. Cras vehicula aliquet libero. Integer in magna. Phasellus dolor elit, pellentesque a, facilisis non, bibendum sed, est. Nunc laoreet lectus quis massa. Mauris vestibulum, neque sed dictum eleifend, nunc risus varius orci, in consequat enim diam vel arcu. Curabitur ut odio vel est tempor bibendum. Donec felis orci,', 5)
INSERT [dbo].[Article] ([art_id], [art_pics], [art_titre], [art_texte], [art_uti_id]) VALUES (34, N'https://walmart.com/settings', N'', N'nec, eleifend non, dapibus rutrum, justo. Praesent luctus. Curabitur egestas nunc sed libero. Proin sed turpis nec mauris blandit mattis. Cras eget nisi dictum augue malesuada malesuada. Integer id magna et ipsum cursus vestibulum. Mauris magna. Duis dignissim tempor arcu. Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus non magna. Nam ligula elit, pretium et, rutrum non, hendrerit id, ante. Nunc mauris sapien, cursus in, hendrerit consectetuer, cursus et, magna.', 2)
INSERT [dbo].[Article] ([art_id], [art_pics], [art_titre], [art_texte], [art_uti_id]) VALUES (35, N'http://facebook.com/sub/cars', N'', N'semper pretium neque. Morbi quis urna. Nunc quis arcu vel quam dignissim pharetra. Nam ac nulla. In tincidunt congue turpis. In condimentum. Donec at arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae Donec tincidunt. Donec vitae erat vel pede blandit congue. In scelerisque scelerisque dui. Suspendisse ac metus vitae velit egestas lacinia. Sed congue, elit sed consequat auctor, nunc nulla vulputate dui, nec tempus mauris erat', 3)
INSERT [dbo].[Article] ([art_id], [art_pics], [art_titre], [art_texte], [art_uti_id]) VALUES (36, N'https://guardian.co.uk/sub', N'', N'a nunc. In at pede. Cras vulputate velit eu sem. Pellentesque ut ipsum ac mi eleifend egestas. Sed pharetra, felis eget varius ultrices, mauris ipsum porta elit, a feugiat tellus lorem eu metus. In lorem. Donec elementum, lorem ut aliquam iaculis, lacus pede sagittis augue, eu tempor erat neque non quam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis', 8)
INSERT [dbo].[Article] ([art_id], [art_pics], [art_titre], [art_texte], [art_uti_id]) VALUES (37, N'http://twitter.com/site', N'', N'id sapien. Cras dolor dolor, tempus non, lacinia at, iaculis quis, pede. Praesent eu dui. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean eget magna. Suspendisse tristique neque venenatis lacus. Etiam bibendum fermentum metus. Aenean sed pede nec ante blandit viverra. Donec tempus, lorem fringilla ornare placerat, orci lacus vestibulum lorem, sit amet ultricies sem magna nec quam. Curabitur vel lectus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec dignissim magna a tortor. Nunc commodo auctor velit. Aliquam nisl. Nulla eu neque pellentesque', 10)
INSERT [dbo].[Article] ([art_id], [art_pics], [art_titre], [art_texte], [art_uti_id]) VALUES (38, N'http://wikipedia.org/user/110', N'', N'Curabitur dictum. Phasellus in felis. Nulla tempor augue ac ipsum. Phasellus vitae mauris sit amet lorem semper auctor. Mauris vel turpis. Aliquam adipiscing lobortis risus. In mi pede, nonummy ut, molestie in, tempus eu, ligula. Aenean euismod mauris eu elit. Nulla facilisi. Sed neque. Sed eget lacus. Mauris non dui nec urna suscipit nonummy. Fusce fermentum fermentum arcu. Vestibulum ante ipsum primis in faucibus orci luctus', 5)
INSERT [dbo].[Article] ([art_id], [art_pics], [art_titre], [art_texte], [art_uti_id]) VALUES (39, N'http://reddit.com/fr', N'', N'iaculis enim, sit amet ornare lectus justo eu arcu. Morbi sit amet massa. Quisque porttitor eros nec tellus. Nunc lectus pede, ultrices a, auctor non, feugiat nec, diam. Duis mi enim, condimentum eget, volutpat ornare, facilisis eget, ipsum. Donec sollicitudin adipiscing ligula. Aenean gravida nunc sed pede. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel arcu eu odio tristique pharetra. Quisque ac libero nec ligula consectetuer rhoncus. Nullam velit dui, semper et, lacinia vitae, sodales at, velit. Pellentesque ultricies dignissim lacus. Aliquam rutrum lorem ac risus. Morbi metus. Vivamus euismod urna. Nullam', 8)
INSERT [dbo].[Article] ([art_id], [art_pics], [art_titre], [art_texte], [art_uti_id]) VALUES (40, N'https://youtube.com/sub/cars', N'', N'egestas hendrerit neque. In ornare sagittis felis. Donec tempor, est ac mattis semper, dui lectus rutrum urna, nec luctus felis purus ac tellus. Suspendisse sed dolor. Fusce mi lorem, vehicula et, rutrum eu, ultrices sit amet, risus. Donec nibh enim, gravida sit amet, dapibus id, blandit at, nisi. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel nisl. Quisque fringilla euismod enim. Etiam gravida molestie arcu. Sed eu nibh', 1)
INSERT [dbo].[Article] ([art_id], [art_pics], [art_titre], [art_texte], [art_uti_id]) VALUES (41, N'http://twitter.com/fr', N'', N'viverra. Donec tempus, lorem fringilla ornare placerat, orci lacus vestibulum lorem, sit amet ultricies sem magna nec quam. Curabitur vel lectus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec dignissim magna a tortor. Nunc commodo auctor velit. Aliquam nisl. Nulla eu neque pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec', 5)
INSERT [dbo].[Article] ([art_id], [art_pics], [art_titre], [art_texte], [art_uti_id]) VALUES (42, N'http://whatsapp.com/one', N'', N'elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at lacus. Quisque purus sapien, gravida non, sollicitudin a, malesuada id, erat. Etiam vestibulum massa rutrum magna. Cras convallis convallis dolor. Quisque tincidunt pede ac urna. Ut tincidunt vehicula risus. Nulla eget metus eu erat semper rutrum. Fusce dolor quam, elementum at, egestas a, scelerisque sed, sapien. Nunc pulvinar arcu et pede. Nunc sed orci lobortis augue scelerisque mollis.', 3)
INSERT [dbo].[Article] ([art_id], [art_pics], [art_titre], [art_texte], [art_uti_id]) VALUES (43, N'https://yahoo.com/group/9', N'', N'eu, accumsan sed, facilisis vitae, orci. Phasellus dapibus quam quis diam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce aliquet magna a neque. Nullam ut nisi a odio semper cursus. Integer mollis. Integer tincidunt aliquam arcu. Aliquam ultrices iaculis odio. Nam interdum enim non nisi. Aenean eget metus. In nec orci. Donec nibh. Quisque nonummy ipsum non arcu. Vivamus sit amet risus. Donec egestas. Aliquam nec enim. Nunc ut erat. Sed nunc est, mollis non, cursus non, egestas a, dui. Cras pellentesque. Sed dictum. Proin eget odio. Aliquam vulputate ullamcorper magna. Sed', 2)
INSERT [dbo].[Article] ([art_id], [art_pics], [art_titre], [art_texte], [art_uti_id]) VALUES (44, N'https://google.com/site', N'', N'nonummy ipsum non arcu. Vivamus sit amet risus. Donec egestas. Aliquam nec enim. Nunc ut erat. Sed nunc est, mollis non, cursus non, egestas a, dui. Cras pellentesque. Sed dictum. Proin eget odio. Aliquam vulputate ullamcorper magna. Sed eu eros. Nam consequat dolor vitae dolor. Donec fringilla. Donec feugiat metus sit amet ante. Vivamus non lorem vitae odio sagittis semper. Nam tempor diam dictum sapien. Aenean massa. Integer vitae nibh. Donec est mauris, rhoncus', 3)
INSERT [dbo].[Article] ([art_id], [art_pics], [art_titre], [art_texte], [art_uti_id]) VALUES (45, N'http://cnn.com/en-us', N'', N'amet ultricies sem magna nec quam. Curabitur vel lectus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec dignissim magna a tortor. Nunc commodo auctor velit. Aliquam nisl. Nulla eu neque pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper, velit in aliquet lobortis, nisi nibh lacinia orci, consectetuer euismod est arcu ac orci. Ut semper pretium neque. Morbi quis urna. Nunc quis arcu vel quam dignissim pharetra. Nam ac nulla. In tincidunt congue turpis. In condimentum. Donec at', 3)
INSERT [dbo].[Article] ([art_id], [art_pics], [art_titre], [art_texte], [art_uti_id]) VALUES (46, N'https://zoom.us/en-us', N'', N'fermentum fermentum arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae Phasellus ornare. Fusce mollis. Duis sit amet diam eu dolor egestas rhoncus. Proin nisl sem, consequat nec, mollis vitae, posuere at, velit. Cras lorem lorem, luctus ut, pellentesque eget, dictum placerat, augue. Sed molestie. Sed id risus quis diam luctus lobortis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Mauris ut quam vel sapien imperdiet ornare. In faucibus. Morbi vehicula. Pellentesque tincidunt', 2)
INSERT [dbo].[Article] ([art_id], [art_pics], [art_titre], [art_texte], [art_uti_id]) VALUES (47, N'http://guardian.co.uk/fr', N'', N'eu, euismod ac, fermentum vel, mauris. Integer sem elit, pharetra ut, pharetra sed, hendrerit a, arcu. Sed et libero. Proin mi. Aliquam gravida mauris ut mi. Duis risus odio, auctor vitae, aliquet nec, imperdiet nec, leo. Morbi neque tellus, imperdiet non, vestibulum nec, euismod in, dolor. Fusce feugiat. Lorem ipsum dolor sit amet, consectetuer', 7)
INSERT [dbo].[Article] ([art_id], [art_pics], [art_titre], [art_texte], [art_uti_id]) VALUES (48, N'https://pinterest.com/user/110', N'', N'ultricies adipiscing, enim mi tempor lorem, eget mollis lectus pede et risus. Quisque libero lacus, varius et, euismod et, commodo at, libero. Morbi accumsan laoreet ipsum. Curabitur consequat, lectus sit amet luctus vulputate, nisi sem semper erat, in consectetuer ipsum nunc id enim. Curabitur massa. Vestibulum accumsan neque et nunc. Quisque ornare tortor at risus. Nunc ac sem ut dolor dapibus gravida. Aliquam tincidunt, nunc ac mattis', 10)
INSERT [dbo].[Article] ([art_id], [art_pics], [art_titre], [art_texte], [art_uti_id]) VALUES (49, N'https://cnn.com/user/110', N'', N'amet, faucibus ut, nulla. Cras eu tellus eu augue porttitor interdum. Sed auctor odio a purus. Duis elementum, dui quis accumsan convallis, ante lectus convallis est, vitae sodales nisi magna sed dui. Fusce aliquam, enim nec tempus scelerisque, lorem ipsum sodales purus, in molestie tortor nibh sit amet orci. Ut sagittis lobortis mauris. Suspendisse aliquet molestie tellus. Aenean egestas hendrerit neque. In ornare sagittis felis. Donec tempor, est ac mattis semper, dui lectus rutrum urna, nec luctus felis purus ac tellus. Suspendisse sed dolor. Fusce mi lorem, vehicula et, rutrum eu, ultrices sit amet, risus.', 5)
INSERT [dbo].[Article] ([art_id], [art_pics], [art_titre], [art_texte], [art_uti_id]) VALUES (50, N'https://cnn.com/user/110', N'', N'mollis. Integer tincidunt aliquam arcu. Aliquam ultrices iaculis odio. Nam interdum enim non nisi. Aenean eget metus. In nec orci. Donec nibh. Quisque nonummy ipsum non arcu. Vivamus sit amet risus. Donec egestas. Aliquam nec enim. Nunc ut erat. Sed nunc est, mollis non, cursus non, egestas a, dui. Cras pellentesque. Sed dictum. Proin eget odio. Aliquam vulputate ullamcorper magna. Sed eu eros. Nam consequat dolor vitae dolor. Donec fringilla. Donec feugiat metus sit amet ante. Vivamus non lorem vitae odio sagittis semper. Nam tempor diam dictum sapien. Aenean massa. Integer vitae nibh. Donec', 5)
SET IDENTITY_INSERT [dbo].[Article] OFF
GO
INSERT [dbo].[Associer] ([ass_rec_id], [ass_tag_id]) VALUES (1, 1)
INSERT [dbo].[Associer] ([ass_rec_id], [ass_tag_id]) VALUES (1, 2)
INSERT [dbo].[Associer] ([ass_rec_id], [ass_tag_id]) VALUES (1, 3)
INSERT [dbo].[Associer] ([ass_rec_id], [ass_tag_id]) VALUES (1, 15)
INSERT [dbo].[Associer] ([ass_rec_id], [ass_tag_id]) VALUES (1, 22)
INSERT [dbo].[Associer] ([ass_rec_id], [ass_tag_id]) VALUES (1, 23)
INSERT [dbo].[Associer] ([ass_rec_id], [ass_tag_id]) VALUES (2, 6)
INSERT [dbo].[Associer] ([ass_rec_id], [ass_tag_id]) VALUES (2, 8)
INSERT [dbo].[Associer] ([ass_rec_id], [ass_tag_id]) VALUES (2, 9)
INSERT [dbo].[Associer] ([ass_rec_id], [ass_tag_id]) VALUES (2, 10)
INSERT [dbo].[Associer] ([ass_rec_id], [ass_tag_id]) VALUES (2, 11)
INSERT [dbo].[Associer] ([ass_rec_id], [ass_tag_id]) VALUES (2, 13)
INSERT [dbo].[Associer] ([ass_rec_id], [ass_tag_id]) VALUES (2, 14)
INSERT [dbo].[Associer] ([ass_rec_id], [ass_tag_id]) VALUES (2, 15)
INSERT [dbo].[Associer] ([ass_rec_id], [ass_tag_id]) VALUES (2, 17)
INSERT [dbo].[Associer] ([ass_rec_id], [ass_tag_id]) VALUES (2, 18)
INSERT [dbo].[Associer] ([ass_rec_id], [ass_tag_id]) VALUES (2, 19)
INSERT [dbo].[Associer] ([ass_rec_id], [ass_tag_id]) VALUES (2, 20)
INSERT [dbo].[Associer] ([ass_rec_id], [ass_tag_id]) VALUES (2, 21)
INSERT [dbo].[Associer] ([ass_rec_id], [ass_tag_id]) VALUES (2, 22)
INSERT [dbo].[Associer] ([ass_rec_id], [ass_tag_id]) VALUES (2, 23)
INSERT [dbo].[Associer] ([ass_rec_id], [ass_tag_id]) VALUES (3, 1)
INSERT [dbo].[Associer] ([ass_rec_id], [ass_tag_id]) VALUES (3, 2)
INSERT [dbo].[Associer] ([ass_rec_id], [ass_tag_id]) VALUES (3, 3)
INSERT [dbo].[Associer] ([ass_rec_id], [ass_tag_id]) VALUES (3, 5)
INSERT [dbo].[Associer] ([ass_rec_id], [ass_tag_id]) VALUES (3, 7)
INSERT [dbo].[Associer] ([ass_rec_id], [ass_tag_id]) VALUES (3, 9)
INSERT [dbo].[Associer] ([ass_rec_id], [ass_tag_id]) VALUES (3, 10)
INSERT [dbo].[Associer] ([ass_rec_id], [ass_tag_id]) VALUES (3, 11)
INSERT [dbo].[Associer] ([ass_rec_id], [ass_tag_id]) VALUES (3, 12)
INSERT [dbo].[Associer] ([ass_rec_id], [ass_tag_id]) VALUES (3, 14)
INSERT [dbo].[Associer] ([ass_rec_id], [ass_tag_id]) VALUES (3, 15)
INSERT [dbo].[Associer] ([ass_rec_id], [ass_tag_id]) VALUES (3, 16)
INSERT [dbo].[Associer] ([ass_rec_id], [ass_tag_id]) VALUES (3, 17)
INSERT [dbo].[Associer] ([ass_rec_id], [ass_tag_id]) VALUES (3, 19)
INSERT [dbo].[Associer] ([ass_rec_id], [ass_tag_id]) VALUES (4, 2)
INSERT [dbo].[Associer] ([ass_rec_id], [ass_tag_id]) VALUES (4, 3)
INSERT [dbo].[Associer] ([ass_rec_id], [ass_tag_id]) VALUES (4, 7)
INSERT [dbo].[Associer] ([ass_rec_id], [ass_tag_id]) VALUES (4, 12)
INSERT [dbo].[Associer] ([ass_rec_id], [ass_tag_id]) VALUES (4, 13)
INSERT [dbo].[Associer] ([ass_rec_id], [ass_tag_id]) VALUES (4, 14)
INSERT [dbo].[Associer] ([ass_rec_id], [ass_tag_id]) VALUES (4, 15)
INSERT [dbo].[Associer] ([ass_rec_id], [ass_tag_id]) VALUES (4, 16)
INSERT [dbo].[Associer] ([ass_rec_id], [ass_tag_id]) VALUES (4, 21)
INSERT [dbo].[Associer] ([ass_rec_id], [ass_tag_id]) VALUES (4, 25)
INSERT [dbo].[Associer] ([ass_rec_id], [ass_tag_id]) VALUES (5, 7)
INSERT [dbo].[Associer] ([ass_rec_id], [ass_tag_id]) VALUES (5, 8)
INSERT [dbo].[Associer] ([ass_rec_id], [ass_tag_id]) VALUES (5, 10)
INSERT [dbo].[Associer] ([ass_rec_id], [ass_tag_id]) VALUES (5, 14)
INSERT [dbo].[Associer] ([ass_rec_id], [ass_tag_id]) VALUES (5, 15)
GO
INSERT [dbo].[Contenir] ([con_rec_id], [con_pro_id]) VALUES (1, 1)
INSERT [dbo].[Contenir] ([con_rec_id], [con_pro_id]) VALUES (1, 2)
INSERT [dbo].[Contenir] ([con_rec_id], [con_pro_id]) VALUES (1, 5)
INSERT [dbo].[Contenir] ([con_rec_id], [con_pro_id]) VALUES (1, 7)
INSERT [dbo].[Contenir] ([con_rec_id], [con_pro_id]) VALUES (1, 10)
INSERT [dbo].[Contenir] ([con_rec_id], [con_pro_id]) VALUES (1, 11)
INSERT [dbo].[Contenir] ([con_rec_id], [con_pro_id]) VALUES (1, 12)
INSERT [dbo].[Contenir] ([con_rec_id], [con_pro_id]) VALUES (1, 17)
INSERT [dbo].[Contenir] ([con_rec_id], [con_pro_id]) VALUES (1, 19)
INSERT [dbo].[Contenir] ([con_rec_id], [con_pro_id]) VALUES (2, 1)
INSERT [dbo].[Contenir] ([con_rec_id], [con_pro_id]) VALUES (2, 2)
INSERT [dbo].[Contenir] ([con_rec_id], [con_pro_id]) VALUES (2, 3)
INSERT [dbo].[Contenir] ([con_rec_id], [con_pro_id]) VALUES (2, 4)
INSERT [dbo].[Contenir] ([con_rec_id], [con_pro_id]) VALUES (2, 7)
INSERT [dbo].[Contenir] ([con_rec_id], [con_pro_id]) VALUES (2, 9)
INSERT [dbo].[Contenir] ([con_rec_id], [con_pro_id]) VALUES (2, 13)
INSERT [dbo].[Contenir] ([con_rec_id], [con_pro_id]) VALUES (2, 16)
INSERT [dbo].[Contenir] ([con_rec_id], [con_pro_id]) VALUES (2, 17)
INSERT [dbo].[Contenir] ([con_rec_id], [con_pro_id]) VALUES (3, 1)
INSERT [dbo].[Contenir] ([con_rec_id], [con_pro_id]) VALUES (3, 2)
INSERT [dbo].[Contenir] ([con_rec_id], [con_pro_id]) VALUES (3, 4)
INSERT [dbo].[Contenir] ([con_rec_id], [con_pro_id]) VALUES (3, 8)
INSERT [dbo].[Contenir] ([con_rec_id], [con_pro_id]) VALUES (3, 10)
INSERT [dbo].[Contenir] ([con_rec_id], [con_pro_id]) VALUES (3, 11)
INSERT [dbo].[Contenir] ([con_rec_id], [con_pro_id]) VALUES (3, 12)
INSERT [dbo].[Contenir] ([con_rec_id], [con_pro_id]) VALUES (3, 13)
INSERT [dbo].[Contenir] ([con_rec_id], [con_pro_id]) VALUES (3, 15)
INSERT [dbo].[Contenir] ([con_rec_id], [con_pro_id]) VALUES (3, 16)
INSERT [dbo].[Contenir] ([con_rec_id], [con_pro_id]) VALUES (3, 17)
INSERT [dbo].[Contenir] ([con_rec_id], [con_pro_id]) VALUES (3, 18)
INSERT [dbo].[Contenir] ([con_rec_id], [con_pro_id]) VALUES (3, 19)
INSERT [dbo].[Contenir] ([con_rec_id], [con_pro_id]) VALUES (3, 20)
INSERT [dbo].[Contenir] ([con_rec_id], [con_pro_id]) VALUES (4, 2)
INSERT [dbo].[Contenir] ([con_rec_id], [con_pro_id]) VALUES (4, 4)
INSERT [dbo].[Contenir] ([con_rec_id], [con_pro_id]) VALUES (4, 5)
INSERT [dbo].[Contenir] ([con_rec_id], [con_pro_id]) VALUES (4, 6)
INSERT [dbo].[Contenir] ([con_rec_id], [con_pro_id]) VALUES (4, 9)
INSERT [dbo].[Contenir] ([con_rec_id], [con_pro_id]) VALUES (4, 12)
INSERT [dbo].[Contenir] ([con_rec_id], [con_pro_id]) VALUES (4, 13)
INSERT [dbo].[Contenir] ([con_rec_id], [con_pro_id]) VALUES (4, 14)
INSERT [dbo].[Contenir] ([con_rec_id], [con_pro_id]) VALUES (4, 15)
INSERT [dbo].[Contenir] ([con_rec_id], [con_pro_id]) VALUES (4, 16)
INSERT [dbo].[Contenir] ([con_rec_id], [con_pro_id]) VALUES (5, 1)
INSERT [dbo].[Contenir] ([con_rec_id], [con_pro_id]) VALUES (5, 4)
INSERT [dbo].[Contenir] ([con_rec_id], [con_pro_id]) VALUES (5, 5)
INSERT [dbo].[Contenir] ([con_rec_id], [con_pro_id]) VALUES (5, 6)
INSERT [dbo].[Contenir] ([con_rec_id], [con_pro_id]) VALUES (5, 8)
INSERT [dbo].[Contenir] ([con_rec_id], [con_pro_id]) VALUES (5, 10)
INSERT [dbo].[Contenir] ([con_rec_id], [con_pro_id]) VALUES (5, 14)
INSERT [dbo].[Contenir] ([con_rec_id], [con_pro_id]) VALUES (5, 15)
GO
INSERT [dbo].[Decrire] ([dec_art_id], [dec_tag_id]) VALUES (1, 22)
INSERT [dbo].[Decrire] ([dec_art_id], [dec_tag_id]) VALUES (1, 23)
INSERT [dbo].[Decrire] ([dec_art_id], [dec_tag_id]) VALUES (2, 22)
INSERT [dbo].[Decrire] ([dec_art_id], [dec_tag_id]) VALUES (2, 23)
INSERT [dbo].[Decrire] ([dec_art_id], [dec_tag_id]) VALUES (3, 6)
INSERT [dbo].[Decrire] ([dec_art_id], [dec_tag_id]) VALUES (3, 9)
INSERT [dbo].[Decrire] ([dec_art_id], [dec_tag_id]) VALUES (3, 15)
INSERT [dbo].[Decrire] ([dec_art_id], [dec_tag_id]) VALUES (4, 7)
INSERT [dbo].[Decrire] ([dec_art_id], [dec_tag_id]) VALUES (4, 11)
INSERT [dbo].[Decrire] ([dec_art_id], [dec_tag_id]) VALUES (5, 16)
INSERT [dbo].[Decrire] ([dec_art_id], [dec_tag_id]) VALUES (6, 5)
INSERT [dbo].[Decrire] ([dec_art_id], [dec_tag_id]) VALUES (6, 7)
INSERT [dbo].[Decrire] ([dec_art_id], [dec_tag_id]) VALUES (6, 13)
INSERT [dbo].[Decrire] ([dec_art_id], [dec_tag_id]) VALUES (7, 4)
INSERT [dbo].[Decrire] ([dec_art_id], [dec_tag_id]) VALUES (7, 6)
INSERT [dbo].[Decrire] ([dec_art_id], [dec_tag_id]) VALUES (7, 7)
INSERT [dbo].[Decrire] ([dec_art_id], [dec_tag_id]) VALUES (7, 12)
INSERT [dbo].[Decrire] ([dec_art_id], [dec_tag_id]) VALUES (8, 4)
INSERT [dbo].[Decrire] ([dec_art_id], [dec_tag_id]) VALUES (8, 7)
INSERT [dbo].[Decrire] ([dec_art_id], [dec_tag_id]) VALUES (8, 9)
INSERT [dbo].[Decrire] ([dec_art_id], [dec_tag_id]) VALUES (8, 21)
INSERT [dbo].[Decrire] ([dec_art_id], [dec_tag_id]) VALUES (8, 23)
INSERT [dbo].[Decrire] ([dec_art_id], [dec_tag_id]) VALUES (9, 9)
INSERT [dbo].[Decrire] ([dec_art_id], [dec_tag_id]) VALUES (10, 15)
INSERT [dbo].[Decrire] ([dec_art_id], [dec_tag_id]) VALUES (10, 17)
INSERT [dbo].[Decrire] ([dec_art_id], [dec_tag_id]) VALUES (10, 24)
INSERT [dbo].[Decrire] ([dec_art_id], [dec_tag_id]) VALUES (11, 5)
INSERT [dbo].[Decrire] ([dec_art_id], [dec_tag_id]) VALUES (11, 10)
INSERT [dbo].[Decrire] ([dec_art_id], [dec_tag_id]) VALUES (12, 14)
INSERT [dbo].[Decrire] ([dec_art_id], [dec_tag_id]) VALUES (13, 23)
INSERT [dbo].[Decrire] ([dec_art_id], [dec_tag_id]) VALUES (13, 24)
INSERT [dbo].[Decrire] ([dec_art_id], [dec_tag_id]) VALUES (14, 9)
INSERT [dbo].[Decrire] ([dec_art_id], [dec_tag_id]) VALUES (15, 14)
INSERT [dbo].[Decrire] ([dec_art_id], [dec_tag_id]) VALUES (15, 16)
INSERT [dbo].[Decrire] ([dec_art_id], [dec_tag_id]) VALUES (15, 24)
INSERT [dbo].[Decrire] ([dec_art_id], [dec_tag_id]) VALUES (16, 5)
INSERT [dbo].[Decrire] ([dec_art_id], [dec_tag_id]) VALUES (16, 18)
INSERT [dbo].[Decrire] ([dec_art_id], [dec_tag_id]) VALUES (17, 7)
INSERT [dbo].[Decrire] ([dec_art_id], [dec_tag_id]) VALUES (17, 13)
INSERT [dbo].[Decrire] ([dec_art_id], [dec_tag_id]) VALUES (17, 14)
INSERT [dbo].[Decrire] ([dec_art_id], [dec_tag_id]) VALUES (17, 21)
INSERT [dbo].[Decrire] ([dec_art_id], [dec_tag_id]) VALUES (17, 25)
INSERT [dbo].[Decrire] ([dec_art_id], [dec_tag_id]) VALUES (18, 7)
INSERT [dbo].[Decrire] ([dec_art_id], [dec_tag_id]) VALUES (18, 15)
INSERT [dbo].[Decrire] ([dec_art_id], [dec_tag_id]) VALUES (18, 21)
INSERT [dbo].[Decrire] ([dec_art_id], [dec_tag_id]) VALUES (18, 23)
INSERT [dbo].[Decrire] ([dec_art_id], [dec_tag_id]) VALUES (19, 7)
INSERT [dbo].[Decrire] ([dec_art_id], [dec_tag_id]) VALUES (19, 8)
INSERT [dbo].[Decrire] ([dec_art_id], [dec_tag_id]) VALUES (19, 11)
INSERT [dbo].[Decrire] ([dec_art_id], [dec_tag_id]) VALUES (20, 3)
GO
INSERT [dbo].[Embellir] ([emb_rec_id], [emb_med_id]) VALUES (1, 3)
INSERT [dbo].[Embellir] ([emb_rec_id], [emb_med_id]) VALUES (1, 8)
INSERT [dbo].[Embellir] ([emb_rec_id], [emb_med_id]) VALUES (2, 1)
INSERT [dbo].[Embellir] ([emb_rec_id], [emb_med_id]) VALUES (2, 7)
INSERT [dbo].[Embellir] ([emb_rec_id], [emb_med_id]) VALUES (2, 8)
INSERT [dbo].[Embellir] ([emb_rec_id], [emb_med_id]) VALUES (3, 1)
INSERT [dbo].[Embellir] ([emb_rec_id], [emb_med_id]) VALUES (3, 2)
INSERT [dbo].[Embellir] ([emb_rec_id], [emb_med_id]) VALUES (3, 3)
INSERT [dbo].[Embellir] ([emb_rec_id], [emb_med_id]) VALUES (3, 7)
INSERT [dbo].[Embellir] ([emb_rec_id], [emb_med_id]) VALUES (4, 1)
INSERT [dbo].[Embellir] ([emb_rec_id], [emb_med_id]) VALUES (4, 2)
INSERT [dbo].[Embellir] ([emb_rec_id], [emb_med_id]) VALUES (4, 3)
INSERT [dbo].[Embellir] ([emb_rec_id], [emb_med_id]) VALUES (4, 4)
INSERT [dbo].[Embellir] ([emb_rec_id], [emb_med_id]) VALUES (4, 5)
INSERT [dbo].[Embellir] ([emb_rec_id], [emb_med_id]) VALUES (4, 6)
INSERT [dbo].[Embellir] ([emb_rec_id], [emb_med_id]) VALUES (4, 8)
INSERT [dbo].[Embellir] ([emb_rec_id], [emb_med_id]) VALUES (4, 9)
INSERT [dbo].[Embellir] ([emb_rec_id], [emb_med_id]) VALUES (5, 3)
INSERT [dbo].[Embellir] ([emb_rec_id], [emb_med_id]) VALUES (5, 6)
INSERT [dbo].[Embellir] ([emb_rec_id], [emb_med_id]) VALUES (5, 9)
GO
SET IDENTITY_INSERT [dbo].[FicheProduit] ON 

INSERT [dbo].[FicheProduit] ([fic_id], [fic_libelle], [fic_pics], [fic_description], [fic_pro_id], [fic_uti_id]) VALUES (1, N'VeJLGaEL BXVAHa', N'/Y7C/7V3/DRFJ', N'lacus. Nulla', 13, 7)
INSERT [dbo].[FicheProduit] ([fic_id], [fic_libelle], [fic_pics], [fic_description], [fic_pro_id], [fic_uti_id]) VALUES (2, N'JeNGHaPJ NUSSRa', N'/I8L/7G3/VIID', N'velit eget laoreet', 13, 9)
INSERT [dbo].[FicheProduit] ([fic_id], [fic_libelle], [fic_pics], [fic_description], [fic_pro_id], [fic_uti_id]) VALUES (3, N'JeZOPaPT RCWFGa', N'/P6P/8K6/PGHY', N'lacus. Quisque purus sapien,', 8, 7)
INSERT [dbo].[FicheProduit] ([fic_id], [fic_libelle], [fic_pics], [fic_description], [fic_pro_id], [fic_uti_id]) VALUES (4, N'CeGFFaTV NUSXJa', N'/O7W/2C3/EWOU', N'a, magna. Lorem ipsum dolor', 8, 1)
INSERT [dbo].[FicheProduit] ([fic_id], [fic_libelle], [fic_pics], [fic_description], [fic_pro_id], [fic_uti_id]) VALUES (5, N'AeVGTaMC NTJTOa', N'/Q5M/5N3/VWYX', N'et, rutrum non, hendrerit id,', 7, 8)
INSERT [dbo].[FicheProduit] ([fic_id], [fic_libelle], [fic_pics], [fic_description], [fic_pro_id], [fic_uti_id]) VALUES (6, N'MeYNDaOH UEJEOa', N'/G3E/0Q5/PPIH', N'non, hendrerit id,', 4, 2)
INSERT [dbo].[FicheProduit] ([fic_id], [fic_libelle], [fic_pics], [fic_description], [fic_pro_id], [fic_uti_id]) VALUES (7, N'XeOPTaLY CDOPTa', N'/E5O/7W5/GXUU', N'egestas ligula.', 6, 6)
INSERT [dbo].[FicheProduit] ([fic_id], [fic_libelle], [fic_pics], [fic_description], [fic_pro_id], [fic_uti_id]) VALUES (8, N'NeSUEaYI ERPNSa', N'/T7L/0S7/JPTZ', N'ut dolor dapibus gravida. Aliquam', 16, 7)
INSERT [dbo].[FicheProduit] ([fic_id], [fic_libelle], [fic_pics], [fic_description], [fic_pro_id], [fic_uti_id]) VALUES (9, N'LeYDNaTN OETHSa', N'/E9Q/9Q6/MIGX', N'nec, leo. Morbi', 3, 8)
INSERT [dbo].[FicheProduit] ([fic_id], [fic_libelle], [fic_pics], [fic_description], [fic_pro_id], [fic_uti_id]) VALUES (10, N'QeSSTaPJ XOIXYa', N'/S0Q/4R4/GSCF', N'sapien imperdiet ornare. In faucibus.', 11, 6)
INSERT [dbo].[FicheProduit] ([fic_id], [fic_libelle], [fic_pics], [fic_description], [fic_pro_id], [fic_uti_id]) VALUES (11, N'CeCATaJR VGBBFa', N'/C4K/7M0/GEME', N'in, cursus et, eros. Proin', 13, 7)
INSERT [dbo].[FicheProduit] ([fic_id], [fic_libelle], [fic_pics], [fic_description], [fic_pro_id], [fic_uti_id]) VALUES (12, N'GeEXLaHV HIHVKa', N'/G5N/5Y6/HOWZ', N'adipiscing lobortis risus.', 3, 3)
INSERT [dbo].[FicheProduit] ([fic_id], [fic_libelle], [fic_pics], [fic_description], [fic_pro_id], [fic_uti_id]) VALUES (13, N'HeBXIaMP TUBFYa', N'/V3V/8F6/SHNR', N'dolor, nonummy ac, feugiat', 5, 3)
INSERT [dbo].[FicheProduit] ([fic_id], [fic_libelle], [fic_pics], [fic_description], [fic_pro_id], [fic_uti_id]) VALUES (14, N'MeDICaHW OJFESa', N'/B2E/8J4/RCCD', N'dui quis accumsan', 3, 6)
INSERT [dbo].[FicheProduit] ([fic_id], [fic_libelle], [fic_pics], [fic_description], [fic_pro_id], [fic_uti_id]) VALUES (15, N'YeDUOaYO KNLLDa', N'/I0E/0Y2/HNVP', N'egestas. Aliquam nec', 15, 6)
INSERT [dbo].[FicheProduit] ([fic_id], [fic_libelle], [fic_pics], [fic_description], [fic_pro_id], [fic_uti_id]) VALUES (16, N'MePMWaTF YEEFCa', N'/X4D/6M1/SCRE', N'mi, ac mattis', 4, 3)
INSERT [dbo].[FicheProduit] ([fic_id], [fic_libelle], [fic_pics], [fic_description], [fic_pro_id], [fic_uti_id]) VALUES (17, N'CeCKIaMA XSKAXa', N'/H7W/9D0/TCOX', N'lorem, luctus ut,', 6, 7)
INSERT [dbo].[FicheProduit] ([fic_id], [fic_libelle], [fic_pics], [fic_description], [fic_pro_id], [fic_uti_id]) VALUES (18, N'QeDRDaDQ FUKZJa', N'/X4O/3R1/XHUG', N'Nullam nisl.', 14, 2)
INSERT [dbo].[FicheProduit] ([fic_id], [fic_libelle], [fic_pics], [fic_description], [fic_pro_id], [fic_uti_id]) VALUES (19, N'LeWCWaRU OPFLEa', N'/P2I/5U1/MEAA', N'porttitor eros', 10, 3)
INSERT [dbo].[FicheProduit] ([fic_id], [fic_libelle], [fic_pics], [fic_description], [fic_pro_id], [fic_uti_id]) VALUES (20, N'WeISUaET YHRVYa', N'/X6P/6N9/ROWL', N'molestie tellus. Aenean egestas', 4, 7)
SET IDENTITY_INSERT [dbo].[FicheProduit] OFF
GO
INSERT [dbo].[Illustrer] ([ill_fic_id], [ill_med_id]) VALUES (4, 5)
INSERT [dbo].[Illustrer] ([ill_fic_id], [ill_med_id]) VALUES (4, 8)
INSERT [dbo].[Illustrer] ([ill_fic_id], [ill_med_id]) VALUES (5, 9)
INSERT [dbo].[Illustrer] ([ill_fic_id], [ill_med_id]) VALUES (6, 2)
INSERT [dbo].[Illustrer] ([ill_fic_id], [ill_med_id]) VALUES (6, 6)
INSERT [dbo].[Illustrer] ([ill_fic_id], [ill_med_id]) VALUES (7, 4)
INSERT [dbo].[Illustrer] ([ill_fic_id], [ill_med_id]) VALUES (8, 5)
INSERT [dbo].[Illustrer] ([ill_fic_id], [ill_med_id]) VALUES (9, 4)
INSERT [dbo].[Illustrer] ([ill_fic_id], [ill_med_id]) VALUES (9, 5)
INSERT [dbo].[Illustrer] ([ill_fic_id], [ill_med_id]) VALUES (10, 6)
INSERT [dbo].[Illustrer] ([ill_fic_id], [ill_med_id]) VALUES (11, 2)
INSERT [dbo].[Illustrer] ([ill_fic_id], [ill_med_id]) VALUES (11, 9)
INSERT [dbo].[Illustrer] ([ill_fic_id], [ill_med_id]) VALUES (12, 3)
INSERT [dbo].[Illustrer] ([ill_fic_id], [ill_med_id]) VALUES (12, 8)
INSERT [dbo].[Illustrer] ([ill_fic_id], [ill_med_id]) VALUES (13, 2)
INSERT [dbo].[Illustrer] ([ill_fic_id], [ill_med_id]) VALUES (13, 9)
INSERT [dbo].[Illustrer] ([ill_fic_id], [ill_med_id]) VALUES (14, 3)
INSERT [dbo].[Illustrer] ([ill_fic_id], [ill_med_id]) VALUES (15, 5)
INSERT [dbo].[Illustrer] ([ill_fic_id], [ill_med_id]) VALUES (16, 7)
INSERT [dbo].[Illustrer] ([ill_fic_id], [ill_med_id]) VALUES (16, 8)
INSERT [dbo].[Illustrer] ([ill_fic_id], [ill_med_id]) VALUES (17, 2)
INSERT [dbo].[Illustrer] ([ill_fic_id], [ill_med_id]) VALUES (17, 5)
INSERT [dbo].[Illustrer] ([ill_fic_id], [ill_med_id]) VALUES (18, 2)
INSERT [dbo].[Illustrer] ([ill_fic_id], [ill_med_id]) VALUES (19, 8)
INSERT [dbo].[Illustrer] ([ill_fic_id], [ill_med_id]) VALUES (20, 4)
GO
SET IDENTITY_INSERT [dbo].[Media] ON 

INSERT [dbo].[Media] ([med_id], [med_chemin], [med_type], [med_extension]) VALUES (1, N'./media/article1.png', N'Image', N'png')
INSERT [dbo].[Media] ([med_id], [med_chemin], [med_type], [med_extension]) VALUES (2, N'./media/article2.jpeg', N'Image', N'jpeg')
INSERT [dbo].[Media] ([med_id], [med_chemin], [med_type], [med_extension]) VALUES (3, N'./media/article3.gif', N'Image animée', N'gif')
INSERT [dbo].[Media] ([med_id], [med_chemin], [med_type], [med_extension]) VALUES (4, N'./media/article4.fw', N'Image', N'fw')
INSERT [dbo].[Media] ([med_id], [med_chemin], [med_type], [med_extension]) VALUES (5, N'./media/article5.png', N'Image', N'png')
INSERT [dbo].[Media] ([med_id], [med_chemin], [med_type], [med_extension]) VALUES (6, N'./media/article6.png', N'Image', N'png')
INSERT [dbo].[Media] ([med_id], [med_chemin], [med_type], [med_extension]) VALUES (7, N'./media/article7.png', N'Image', N'png')
INSERT [dbo].[Media] ([med_id], [med_chemin], [med_type], [med_extension]) VALUES (8, N'./media/article8.png', N'Image', N'png')
INSERT [dbo].[Media] ([med_id], [med_chemin], [med_type], [med_extension]) VALUES (9, N'./media/article9.png', N'Image', N'png')
SET IDENTITY_INSERT [dbo].[Media] OFF
GO
SET IDENTITY_INSERT [dbo].[MessageForum] ON 

INSERT [dbo].[MessageForum] ([mes_id], [mes_horodate], [mes_texte], [mes_reponse_id_1], [mes_uti_id]) VALUES (1, CAST(N'1997-12-31T02:24:18.000' AS DateTime), N'Phasellus vitae mauris sit amet lorem semper auctor. Mauris vel turpis. Aliquam adipiscing lobortis risus. In mi pede, nonummy ut, molestie in,', NULL, 2)
INSERT [dbo].[MessageForum] ([mes_id], [mes_horodate], [mes_texte], [mes_reponse_id_1], [mes_uti_id]) VALUES (2, CAST(N'2010-02-05T14:01:08.000' AS DateTime), N'turpis vitae purus gravida sagittis. Duis gravida. Praesent eu nulla at sem molestie sodales. Mauris blandit enim consequat purus. Maecenas libero est, congue a, aliquet vel, vulputate eu,', NULL, 6)
INSERT [dbo].[MessageForum] ([mes_id], [mes_horodate], [mes_texte], [mes_reponse_id_1], [mes_uti_id]) VALUES (3, CAST(N'2015-07-12T05:11:16.000' AS DateTime), N'justo sit amet nulla. Donec non justo. Proin non massa non ante bibendum ullamcorper. Duis cursus, diam at pretium aliquet, metus urna convallis erat, eget tincidunt dui augue eu tellus. Phasellus elit pede, malesuada vel, venenatis vel, faucibus id, libero. Donec', NULL, 5)
INSERT [dbo].[MessageForum] ([mes_id], [mes_horodate], [mes_texte], [mes_reponse_id_1], [mes_uti_id]) VALUES (4, CAST(N'2008-08-25T04:47:54.000' AS DateTime), N'convallis in, cursus et, eros. Proin ultrices. Duis volutpat nunc sit amet metus. Aliquam erat volutpat. Nulla facilisis. Suspendisse commodo tincidunt nibh. Phasellus nulla. Integer vulputate,', NULL, 4)
INSERT [dbo].[MessageForum] ([mes_id], [mes_horodate], [mes_texte], [mes_reponse_id_1], [mes_uti_id]) VALUES (5, CAST(N'2021-05-02T20:09:45.000' AS DateTime), N'Cras dolor dolor, tempus non, lacinia at, iaculis quis, pede. Praesent eu dui. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean eget magna. Suspendisse tristique neque venenatis lacus. Etiam bibendum fermentum metus. Aenean sed pede nec ante blandit viverra. Donec tempus, lorem fringilla', NULL, 2)
INSERT [dbo].[MessageForum] ([mes_id], [mes_horodate], [mes_texte], [mes_reponse_id_1], [mes_uti_id]) VALUES (6, CAST(N'1997-12-31T02:24:18.000' AS DateTime), N'Phasellus vitae mauris sit amet lorem semper auctor. Mauris vel turpis. Aliquam adipiscing lobortis risus. In mi pede, nonummy ut, molestie in,', 8, 2)
INSERT [dbo].[MessageForum] ([mes_id], [mes_horodate], [mes_texte], [mes_reponse_id_1], [mes_uti_id]) VALUES (7, CAST(N'2010-02-05T14:01:08.000' AS DateTime), N'turpis vitae purus gravida sagittis. Duis gravida. Praesent eu nulla at sem molestie sodales. Mauris blandit enim consequat purus. Maecenas libero est, congue a, aliquet vel, vulputate eu,', 10, 6)
INSERT [dbo].[MessageForum] ([mes_id], [mes_horodate], [mes_texte], [mes_reponse_id_1], [mes_uti_id]) VALUES (8, CAST(N'2015-07-12T05:11:16.000' AS DateTime), N'justo sit amet nulla. Donec non justo. Proin non massa non ante bibendum ullamcorper. Duis cursus, diam at pretium aliquet, metus urna convallis erat, eget tincidunt dui augue eu tellus. Phasellus elit pede, malesuada vel, venenatis vel, faucibus id, libero. Donec', 12, 5)
INSERT [dbo].[MessageForum] ([mes_id], [mes_horodate], [mes_texte], [mes_reponse_id_1], [mes_uti_id]) VALUES (9, CAST(N'2008-08-25T04:47:54.000' AS DateTime), N'convallis in, cursus et, eros. Proin ultrices. Duis volutpat nunc sit amet metus. Aliquam erat volutpat. Nulla facilisis. Suspendisse commodo tincidunt nibh. Phasellus nulla. Integer vulputate,', 9, 4)
INSERT [dbo].[MessageForum] ([mes_id], [mes_horodate], [mes_texte], [mes_reponse_id_1], [mes_uti_id]) VALUES (10, CAST(N'2021-05-02T20:09:45.000' AS DateTime), N'Cras dolor dolor, tempus non, lacinia at, iaculis quis, pede. Praesent eu dui. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean eget magna. Suspendisse tristique neque venenatis lacus. Etiam bibendum fermentum metus. Aenean sed pede nec ante blandit viverra. Donec tempus, lorem fringilla', 9, 2)
INSERT [dbo].[MessageForum] ([mes_id], [mes_horodate], [mes_texte], [mes_reponse_id_1], [mes_uti_id]) VALUES (11, CAST(N'1997-12-31T02:24:18.000' AS DateTime), N'Phasellus vitae mauris sit amet lorem semper auctor. Mauris vel turpis. Aliquam adipiscing lobortis risus. In mi pede, nonummy ut, molestie in,', 9, 2)
INSERT [dbo].[MessageForum] ([mes_id], [mes_horodate], [mes_texte], [mes_reponse_id_1], [mes_uti_id]) VALUES (12, CAST(N'2010-02-05T14:01:08.000' AS DateTime), N'turpis vitae purus gravida sagittis. Duis gravida. Praesent eu nulla at sem molestie sodales. Mauris blandit enim consequat purus. Maecenas libero est, congue a, aliquet vel, vulputate eu,', 12, 6)
INSERT [dbo].[MessageForum] ([mes_id], [mes_horodate], [mes_texte], [mes_reponse_id_1], [mes_uti_id]) VALUES (13, CAST(N'2015-07-12T05:11:16.000' AS DateTime), N'justo sit amet nulla. Donec non justo. Proin non massa non ante bibendum ullamcorper. Duis cursus, diam at pretium aliquet, metus urna convallis erat, eget tincidunt dui augue eu tellus. Phasellus elit pede, malesuada vel, venenatis vel, faucibus id, libero. Donec', 8, 5)
INSERT [dbo].[MessageForum] ([mes_id], [mes_horodate], [mes_texte], [mes_reponse_id_1], [mes_uti_id]) VALUES (14, CAST(N'2008-08-25T04:47:54.000' AS DateTime), N'convallis in, cursus et, eros. Proin ultrices. Duis volutpat nunc sit amet metus. Aliquam erat volutpat. Nulla facilisis. Suspendisse commodo tincidunt nibh. Phasellus nulla. Integer vulputate,', 10, 4)
INSERT [dbo].[MessageForum] ([mes_id], [mes_horodate], [mes_texte], [mes_reponse_id_1], [mes_uti_id]) VALUES (15, CAST(N'2021-05-02T20:09:45.000' AS DateTime), N'Cras dolor dolor, tempus non, lacinia at, iaculis quis, pede. Praesent eu dui. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean eget magna. Suspendisse tristique neque venenatis lacus. Etiam bibendum fermentum metus. Aenean sed pede nec ante blandit viverra. Donec tempus, lorem fringilla', 10, 2)
INSERT [dbo].[MessageForum] ([mes_id], [mes_horodate], [mes_texte], [mes_reponse_id_1], [mes_uti_id]) VALUES (16, CAST(N'1997-12-31T02:24:18.000' AS DateTime), N'Phasellus vitae mauris sit amet lorem semper auctor. Mauris vel turpis. Aliquam adipiscing lobortis risus. In mi pede, nonummy ut, molestie in,', 12, 2)
INSERT [dbo].[MessageForum] ([mes_id], [mes_horodate], [mes_texte], [mes_reponse_id_1], [mes_uti_id]) VALUES (17, CAST(N'2010-02-05T14:01:08.000' AS DateTime), N'turpis vitae purus gravida sagittis. Duis gravida. Praesent eu nulla at sem molestie sodales. Mauris blandit enim consequat purus. Maecenas libero est, congue a, aliquet vel, vulputate eu,', 8, 6)
INSERT [dbo].[MessageForum] ([mes_id], [mes_horodate], [mes_texte], [mes_reponse_id_1], [mes_uti_id]) VALUES (18, CAST(N'2015-07-12T05:11:16.000' AS DateTime), N'justo sit amet nulla. Donec non justo. Proin non massa non ante bibendum ullamcorper. Duis cursus, diam at pretium aliquet, metus urna convallis erat, eget tincidunt dui augue eu tellus. Phasellus elit pede, malesuada vel, venenatis vel, faucibus id, libero. Donec', 10, 5)
INSERT [dbo].[MessageForum] ([mes_id], [mes_horodate], [mes_texte], [mes_reponse_id_1], [mes_uti_id]) VALUES (19, CAST(N'2008-08-25T04:47:54.000' AS DateTime), N'convallis in, cursus et, eros. Proin ultrices. Duis volutpat nunc sit amet metus. Aliquam erat volutpat. Nulla facilisis. Suspendisse commodo tincidunt nibh. Phasellus nulla. Integer vulputate,', 9, 4)
INSERT [dbo].[MessageForum] ([mes_id], [mes_horodate], [mes_texte], [mes_reponse_id_1], [mes_uti_id]) VALUES (20, CAST(N'2021-05-02T20:09:45.000' AS DateTime), N'Cras dolor dolor, tempus non, lacinia at, iaculis quis, pede. Praesent eu dui. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean eget magna. Suspendisse tristique neque venenatis lacus. Etiam bibendum fermentum metus. Aenean sed pede nec ante blandit viverra. Donec tempus, lorem fringilla', 10, 2)
SET IDENTITY_INSERT [dbo].[MessageForum] OFF
GO
INSERT [dbo].[Montrer] ([mon_fic_id], [mon_tag_id]) VALUES (2, 3)
INSERT [dbo].[Montrer] ([mon_fic_id], [mon_tag_id]) VALUES (2, 18)
INSERT [dbo].[Montrer] ([mon_fic_id], [mon_tag_id]) VALUES (4, 5)
INSERT [dbo].[Montrer] ([mon_fic_id], [mon_tag_id]) VALUES (4, 25)
INSERT [dbo].[Montrer] ([mon_fic_id], [mon_tag_id]) VALUES (5, 4)
INSERT [dbo].[Montrer] ([mon_fic_id], [mon_tag_id]) VALUES (5, 9)
INSERT [dbo].[Montrer] ([mon_fic_id], [mon_tag_id]) VALUES (5, 13)
INSERT [dbo].[Montrer] ([mon_fic_id], [mon_tag_id]) VALUES (5, 16)
INSERT [dbo].[Montrer] ([mon_fic_id], [mon_tag_id]) VALUES (5, 25)
INSERT [dbo].[Montrer] ([mon_fic_id], [mon_tag_id]) VALUES (6, 2)
INSERT [dbo].[Montrer] ([mon_fic_id], [mon_tag_id]) VALUES (7, 5)
INSERT [dbo].[Montrer] ([mon_fic_id], [mon_tag_id]) VALUES (7, 7)
INSERT [dbo].[Montrer] ([mon_fic_id], [mon_tag_id]) VALUES (7, 8)
INSERT [dbo].[Montrer] ([mon_fic_id], [mon_tag_id]) VALUES (7, 25)
INSERT [dbo].[Montrer] ([mon_fic_id], [mon_tag_id]) VALUES (8, 10)
INSERT [dbo].[Montrer] ([mon_fic_id], [mon_tag_id]) VALUES (8, 19)
INSERT [dbo].[Montrer] ([mon_fic_id], [mon_tag_id]) VALUES (9, 13)
INSERT [dbo].[Montrer] ([mon_fic_id], [mon_tag_id]) VALUES (9, 19)
INSERT [dbo].[Montrer] ([mon_fic_id], [mon_tag_id]) VALUES (10, 4)
INSERT [dbo].[Montrer] ([mon_fic_id], [mon_tag_id]) VALUES (10, 11)
INSERT [dbo].[Montrer] ([mon_fic_id], [mon_tag_id]) VALUES (10, 18)
INSERT [dbo].[Montrer] ([mon_fic_id], [mon_tag_id]) VALUES (11, 10)
INSERT [dbo].[Montrer] ([mon_fic_id], [mon_tag_id]) VALUES (11, 14)
INSERT [dbo].[Montrer] ([mon_fic_id], [mon_tag_id]) VALUES (11, 19)
INSERT [dbo].[Montrer] ([mon_fic_id], [mon_tag_id]) VALUES (12, 9)
INSERT [dbo].[Montrer] ([mon_fic_id], [mon_tag_id]) VALUES (13, 1)
INSERT [dbo].[Montrer] ([mon_fic_id], [mon_tag_id]) VALUES (13, 2)
INSERT [dbo].[Montrer] ([mon_fic_id], [mon_tag_id]) VALUES (13, 8)
INSERT [dbo].[Montrer] ([mon_fic_id], [mon_tag_id]) VALUES (13, 18)
INSERT [dbo].[Montrer] ([mon_fic_id], [mon_tag_id]) VALUES (14, 5)
INSERT [dbo].[Montrer] ([mon_fic_id], [mon_tag_id]) VALUES (14, 15)
INSERT [dbo].[Montrer] ([mon_fic_id], [mon_tag_id]) VALUES (14, 16)
INSERT [dbo].[Montrer] ([mon_fic_id], [mon_tag_id]) VALUES (14, 20)
INSERT [dbo].[Montrer] ([mon_fic_id], [mon_tag_id]) VALUES (15, 6)
INSERT [dbo].[Montrer] ([mon_fic_id], [mon_tag_id]) VALUES (15, 11)
INSERT [dbo].[Montrer] ([mon_fic_id], [mon_tag_id]) VALUES (15, 13)
INSERT [dbo].[Montrer] ([mon_fic_id], [mon_tag_id]) VALUES (16, 11)
INSERT [dbo].[Montrer] ([mon_fic_id], [mon_tag_id]) VALUES (16, 14)
INSERT [dbo].[Montrer] ([mon_fic_id], [mon_tag_id]) VALUES (16, 20)
INSERT [dbo].[Montrer] ([mon_fic_id], [mon_tag_id]) VALUES (17, 1)
INSERT [dbo].[Montrer] ([mon_fic_id], [mon_tag_id]) VALUES (17, 4)
INSERT [dbo].[Montrer] ([mon_fic_id], [mon_tag_id]) VALUES (17, 5)
INSERT [dbo].[Montrer] ([mon_fic_id], [mon_tag_id]) VALUES (17, 12)
INSERT [dbo].[Montrer] ([mon_fic_id], [mon_tag_id]) VALUES (18, 10)
INSERT [dbo].[Montrer] ([mon_fic_id], [mon_tag_id]) VALUES (18, 11)
INSERT [dbo].[Montrer] ([mon_fic_id], [mon_tag_id]) VALUES (18, 24)
INSERT [dbo].[Montrer] ([mon_fic_id], [mon_tag_id]) VALUES (19, 4)
INSERT [dbo].[Montrer] ([mon_fic_id], [mon_tag_id]) VALUES (19, 15)
INSERT [dbo].[Montrer] ([mon_fic_id], [mon_tag_id]) VALUES (19, 19)
INSERT [dbo].[Montrer] ([mon_fic_id], [mon_tag_id]) VALUES (19, 25)
GO
SET IDENTITY_INSERT [dbo].[Produit] ON 

INSERT [dbo].[Produit] ([pro_id], [pro_libelle], [pro_unite], [pro_pics], [pro_uti_id]) VALUES (1, N'Ut tincidunt', 50, N'/C6G/8Q4/PPQU', 3)
INSERT [dbo].[Produit] ([pro_id], [pro_libelle], [pro_unite], [pro_pics], [pro_uti_id]) VALUES (2, N'Pellentesque ut', 50, N'/Q0E/9M7/HVRT', 2)
INSERT [dbo].[Produit] ([pro_id], [pro_libelle], [pro_unite], [pro_pics], [pro_uti_id]) VALUES (3, N'pede, nonummy', 25, N'/G6M/6Q2/ITAV', 9)
INSERT [dbo].[Produit] ([pro_id], [pro_libelle], [pro_unite], [pro_pics], [pro_uti_id]) VALUES (4, N'in sodales', 25, N'/Y5Z/6X7/FPAP', 4)
INSERT [dbo].[Produit] ([pro_id], [pro_libelle], [pro_unite], [pro_pics], [pro_uti_id]) VALUES (5, N'eleifend vitae,', 20, N'/B1Z/2J7/FXSR', 1)
INSERT [dbo].[Produit] ([pro_id], [pro_libelle], [pro_unite], [pro_pics], [pro_uti_id]) VALUES (6, N'mauris. Integer', 15, N'/U2F/7V5/RIBP', 8)
INSERT [dbo].[Produit] ([pro_id], [pro_libelle], [pro_unite], [pro_pics], [pro_uti_id]) VALUES (7, N'ornare placerat,', 10, N'/O5X/8M1/KCLR', 4)
INSERT [dbo].[Produit] ([pro_id], [pro_libelle], [pro_unite], [pro_pics], [pro_uti_id]) VALUES (8, N'luctus et', 100, N'/T7F/8S1/KWWM', 2)
INSERT [dbo].[Produit] ([pro_id], [pro_libelle], [pro_unite], [pro_pics], [pro_uti_id]) VALUES (9, N'congue a,', 150, N'/H5O/0W8/EEBN', 4)
INSERT [dbo].[Produit] ([pro_id], [pro_libelle], [pro_unite], [pro_pics], [pro_uti_id]) VALUES (10, N'purus, in', 70, N'/S3Q/4X7/BEVW', 8)
INSERT [dbo].[Produit] ([pro_id], [pro_libelle], [pro_unite], [pro_pics], [pro_uti_id]) VALUES (11, N'Nunc ullamcorper,', 55, N'/I3A/4O6/OAOP', 6)
INSERT [dbo].[Produit] ([pro_id], [pro_libelle], [pro_unite], [pro_pics], [pro_uti_id]) VALUES (12, N'nibh enim,', 40, N'/V8U/2L0/GSRA', 8)
INSERT [dbo].[Produit] ([pro_id], [pro_libelle], [pro_unite], [pro_pics], [pro_uti_id]) VALUES (13, N'neque. Morbi', 45, N'/I7O/7H8/SFZT', 4)
INSERT [dbo].[Produit] ([pro_id], [pro_libelle], [pro_unite], [pro_pics], [pro_uti_id]) VALUES (14, N'penatibus et', 65, N'/G3K/7T1/INPW', 8)
INSERT [dbo].[Produit] ([pro_id], [pro_libelle], [pro_unite], [pro_pics], [pro_uti_id]) VALUES (15, N'Cras dictum', 90, N'/X1N/6E1/AFPY', 3)
INSERT [dbo].[Produit] ([pro_id], [pro_libelle], [pro_unite], [pro_pics], [pro_uti_id]) VALUES (16, N'vestibulum nec,', 105, N'/O1U/8E2/EMRQ', 3)
INSERT [dbo].[Produit] ([pro_id], [pro_libelle], [pro_unite], [pro_pics], [pro_uti_id]) VALUES (17, N'luctus aliquet', 110, N'/E4X/8C4/HEQP', 1)
INSERT [dbo].[Produit] ([pro_id], [pro_libelle], [pro_unite], [pro_pics], [pro_uti_id]) VALUES (18, N'ornare, elit', 165, N'/J3C/8L0/XUKT', 1)
INSERT [dbo].[Produit] ([pro_id], [pro_libelle], [pro_unite], [pro_pics], [pro_uti_id]) VALUES (19, N'fermentum vel,', 267, N'/W3Q/8T4/RRHU', 3)
INSERT [dbo].[Produit] ([pro_id], [pro_libelle], [pro_unite], [pro_pics], [pro_uti_id]) VALUES (20, N'venenatis lacus.', 111, N'/D2M/9S7/VXSW', 2)
SET IDENTITY_INSERT [dbo].[Produit] OFF
GO
SET IDENTITY_INSERT [dbo].[Recette] ON 

INSERT [dbo].[Recette] ([rec_id], [rec_titre], [rec_texte], [rec_pics], [rec_liste], [rec_compo_uti_id], [rec_valider_uti_id]) VALUES (1, N'Integer aliquam', N'et malesuada fames ac turpis egestas. Aliquam fringilla cursus purus. Nullam scelerisque neque sed sem egestas blandit. Nam nulla magna,', N'apilicious/img/?gi=100', N'diam lorem, auctor quis, tristique', 1, 1)
INSERT [dbo].[Recette] ([rec_id], [rec_titre], [rec_texte], [rec_pics], [rec_liste], [rec_compo_uti_id], [rec_valider_uti_id]) VALUES (2, N'elit. Curabitur', N'nunc sed libero. Proin sed turpis nec mauris blandit mattis. Cras eget nisi dictum augue malesuada malesuada. Integer id magna', N'apilicious/img/?search=1', N'sed turpis nec', 2, 1)
INSERT [dbo].[Recette] ([rec_id], [rec_titre], [rec_texte], [rec_pics], [rec_liste], [rec_compo_uti_id], [rec_valider_uti_id]) VALUES (3, N'Suspendisse aliquet,', N'nisi. Mauris nulla. Integer urna. Vivamus molestie dapibus ligula. Aliquam erat volutpat. Nulla dignissim. Maecenas ornare egestas ligula. Nullam feugiat', N'apilicious/img/?q=4', N'placerat eget, venenatis a, magna.', 3, 1)
INSERT [dbo].[Recette] ([rec_id], [rec_titre], [rec_texte], [rec_pics], [rec_liste], [rec_compo_uti_id], [rec_valider_uti_id]) VALUES (4, N'cubilia Curae', N'purus gravida sagittis. Duis gravida. Praesent eu nulla at sem molestie sodales. Mauris blandit enim consequat purus. Maecenas libero est,', N'apilicious/img/?ab=441&aad=2', N'gravida non,', 4, 1)
INSERT [dbo].[Recette] ([rec_id], [rec_titre], [rec_texte], [rec_pics], [rec_liste], [rec_compo_uti_id], [rec_valider_uti_id]) VALUES (5, N'sit amet', N'tristique aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet odio. Etiam ligula tortor, dictum eu, placerat eget, venenatis a, magna.', N'apilicious/img/?q=test', N'varius.', 5, 1)
SET IDENTITY_INSERT [dbo].[Recette] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([rol_id], [rol_nom], [rol_droit]) VALUES (1, N'Administrateur', N'Admin')
INSERT [dbo].[Roles] ([rol_id], [rol_nom], [rol_droit]) VALUES (2, N'Modérateur', N'Mods')
INSERT [dbo].[Roles] ([rol_id], [rol_nom], [rol_droit]) VALUES (3, N'Validateur', N'Validate')
INSERT [dbo].[Roles] ([rol_id], [rol_nom], [rol_droit]) VALUES (4, N'Utilisateur', N'User')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Tags] ON 

INSERT [dbo].[Tags] ([tag_id], [tag_nom]) VALUES (1, N'recette')
INSERT [dbo].[Tags] ([tag_id], [tag_nom]) VALUES (2, N'produit')
INSERT [dbo].[Tags] ([tag_id], [tag_nom]) VALUES (3, N'utilisateur')
INSERT [dbo].[Tags] ([tag_id], [tag_nom]) VALUES (4, N'media')
INSERT [dbo].[Tags] ([tag_id], [tag_nom]) VALUES (5, N'image')
INSERT [dbo].[Tags] ([tag_id], [tag_nom]) VALUES (6, N'pays')
INSERT [dbo].[Tags] ([tag_id], [tag_nom]) VALUES (7, N'fiche')
INSERT [dbo].[Tags] ([tag_id], [tag_nom]) VALUES (8, N'accueil')
INSERT [dbo].[Tags] ([tag_id], [tag_nom]) VALUES (9, N'profil')
INSERT [dbo].[Tags] ([tag_id], [tag_nom]) VALUES (10, N'note')
INSERT [dbo].[Tags] ([tag_id], [tag_nom]) VALUES (11, N'carotte')
INSERT [dbo].[Tags] ([tag_id], [tag_nom]) VALUES (12, N'riz')
INSERT [dbo].[Tags] ([tag_id], [tag_nom]) VALUES (13, N'pâtes')
INSERT [dbo].[Tags] ([tag_id], [tag_nom]) VALUES (14, N'poulet')
INSERT [dbo].[Tags] ([tag_id], [tag_nom]) VALUES (15, N'haricots rouge')
INSERT [dbo].[Tags] ([tag_id], [tag_nom]) VALUES (16, N'haricots vert')
INSERT [dbo].[Tags] ([tag_id], [tag_nom]) VALUES (17, N'sel')
INSERT [dbo].[Tags] ([tag_id], [tag_nom]) VALUES (18, N'poivre')
INSERT [dbo].[Tags] ([tag_id], [tag_nom]) VALUES (19, N'exotique')
INSERT [dbo].[Tags] ([tag_id], [tag_nom]) VALUES (20, N'epicés')
INSERT [dbo].[Tags] ([tag_id], [tag_nom]) VALUES (21, N'original')
INSERT [dbo].[Tags] ([tag_id], [tag_nom]) VALUES (22, N'avocat')
INSERT [dbo].[Tags] ([tag_id], [tag_nom]) VALUES (23, N'saumon')
INSERT [dbo].[Tags] ([tag_id], [tag_nom]) VALUES (24, N'thon')
INSERT [dbo].[Tags] ([tag_id], [tag_nom]) VALUES (25, N'sardine')
SET IDENTITY_INSERT [dbo].[Tags] OFF
GO
SET IDENTITY_INSERT [dbo].[Utilisateur] ON 

INSERT [dbo].[Utilisateur] ([uti_id], [uti_pseudo], [uti_nom], [uti_prenom], [uti_DDN], [uti_ville], [uti_mail], [uti_mdp], [uti_avatar], [uti_rol_id]) VALUES (1, N'Abbot', N'Woodard', N'Kirsten', CAST(N'2028-05-23' AS Date), N'Makurdi', N'a.purus@google.org', N'FCA94RDH6YT', N'MVP/JOKTBLVT/JDAO', 1)
INSERT [dbo].[Utilisateur] ([uti_id], [uti_pseudo], [uti_nom], [uti_prenom], [uti_DDN], [uti_ville], [uti_mail], [uti_mdp], [uti_avatar], [uti_rol_id]) VALUES (2, N'Abbot', N'Mathis', N'Cassady', CAST(N'2015-01-21' AS Date), N'Colombo', N'nibh@icloud.org', N'WPP85NRV7DA', N'YDT/XCPWFTEE/JWPE', 3)
INSERT [dbo].[Utilisateur] ([uti_id], [uti_pseudo], [uti_nom], [uti_prenom], [uti_DDN], [uti_ville], [uti_mail], [uti_mdp], [uti_avatar], [uti_rol_id]) VALUES (3, N'Carlos', N'Snider', N'Burke', CAST(N'2030-03-23' AS Date), N'Racine', N'ornare@aol.couk', N'BTQ82HBM2LF', N'HQQ/ISOFDRSK/URVS', 4)
INSERT [dbo].[Utilisateur] ([uti_id], [uti_pseudo], [uti_nom], [uti_prenom], [uti_DDN], [uti_ville], [uti_mail], [uti_mdp], [uti_avatar], [uti_rol_id]) VALUES (4, N'Xanthus', N'Barnes', N'Megan', CAST(N'2013-07-20' AS Date), N'Patan', N'sed.hendrerit.a@icloud.ca', N'WTO84MXY0DJ', N'CQW/XNXSXJVB/YERH', 1)
INSERT [dbo].[Utilisateur] ([uti_id], [uti_pseudo], [uti_nom], [uti_prenom], [uti_DDN], [uti_ville], [uti_mail], [uti_mdp], [uti_avatar], [uti_rol_id]) VALUES (5, N'Nigel', N'Humphrey', N'Penelope', CAST(N'2013-07-22' AS Date), N'Neumünster', N'nulla.eget.metus@aol.edu', N'AKS51XTB0EC', N'QOH/FTQVTVMK/HFFD', 2)
INSERT [dbo].[Utilisateur] ([uti_id], [uti_pseudo], [uti_nom], [uti_prenom], [uti_DDN], [uti_ville], [uti_mail], [uti_mdp], [uti_avatar], [uti_rol_id]) VALUES (6, N'Basia', N'Bradshaw', N'Dahlia', CAST(N'2025-12-20' AS Date), N'Troyes', N'congue@hotmail.com', N'TDU94BAR3LP', N'VPY/ZKIVNGJG/SWCD', 4)
INSERT [dbo].[Utilisateur] ([uti_id], [uti_pseudo], [uti_nom], [uti_prenom], [uti_DDN], [uti_ville], [uti_mail], [uti_mdp], [uti_avatar], [uti_rol_id]) VALUES (7, N'Cheryl', N'Cox', N'Macey', CAST(N'2008-11-21' AS Date), N'Holywell', N'sit.amet@icloud.ca', N'OXB64QFN2TW', N'IZR/RMXBYHBK/WKCF', 4)
INSERT [dbo].[Utilisateur] ([uti_id], [uti_pseudo], [uti_nom], [uti_prenom], [uti_DDN], [uti_ville], [uti_mail], [uti_mdp], [uti_avatar], [uti_rol_id]) VALUES (8, N'Keegan', N'Cruz', N'Fredericka', CAST(N'2024-01-21' AS Date), N'Inegöl', N'a.purus@icloud.ca', N'MFQ11KLP1VT', N'QJU/OUYPDUGF/NEKS', 2)
INSERT [dbo].[Utilisateur] ([uti_id], [uti_pseudo], [uti_nom], [uti_prenom], [uti_DDN], [uti_ville], [uti_mail], [uti_mdp], [uti_avatar], [uti_rol_id]) VALUES (9, N'Nina', N'Mcleod', N'Hannah', CAST(N'2007-03-22' AS Date), N'Bathurst', N'eu.nibh.vulputate@aol.ca', N'CJV64YTG1KY', N'MFN/NNKTUHRX/FLDZ', 3)
INSERT [dbo].[Utilisateur] ([uti_id], [uti_pseudo], [uti_nom], [uti_prenom], [uti_DDN], [uti_ville], [uti_mail], [uti_mdp], [uti_avatar], [uti_rol_id]) VALUES (10, N'Deacon', N'Shepherd', N'Indira', CAST(N'2028-09-20' AS Date), N'Port Blair', N'dolor@icloud.ca', N'XOJ17CEJ8ZI', N'IBV/PUTDMMOY/RSWN', 1)
INSERT [dbo].[Utilisateur] ([uti_id], [uti_pseudo], [uti_nom], [uti_prenom], [uti_DDN], [uti_ville], [uti_mail], [uti_mdp], [uti_avatar], [uti_rol_id]) VALUES (11, N'Liberty', N'Camacho', N'Zahir', CAST(N'2013-01-22' AS Date), N'Cabo de Santo Agostinho', N'tincidunt.dui@hotmail.net', N'TRF36WXJ4DX', N'BCH/CTFMSIIB/MFRB', 3)
INSERT [dbo].[Utilisateur] ([uti_id], [uti_pseudo], [uti_nom], [uti_prenom], [uti_DDN], [uti_ville], [uti_mail], [uti_mdp], [uti_avatar], [uti_rol_id]) VALUES (12, N'Barrett', N'Burns', N'Odette', CAST(N'2021-09-21' AS Date), N'Shandong', N'diam.duis.mi@aol.net', N'BPY11YSK7UX', N'QFC/MPFLXOJG/HVEI', 3)
INSERT [dbo].[Utilisateur] ([uti_id], [uti_pseudo], [uti_nom], [uti_prenom], [uti_DDN], [uti_ville], [uti_mail], [uti_mdp], [uti_avatar], [uti_rol_id]) VALUES (13, N'Brynn', N'Potts', N'Keely', CAST(N'2029-03-23' AS Date), N'Waalwijk', N'arcu.sed@hotmail.com', N'LAH23LBF7CO', N'NEI/XGHLCJFH/ZKEC', 3)
INSERT [dbo].[Utilisateur] ([uti_id], [uti_pseudo], [uti_nom], [uti_prenom], [uti_DDN], [uti_ville], [uti_mail], [uti_mdp], [uti_avatar], [uti_rol_id]) VALUES (14, N'Sylvia', N'Riddle', N'Micah', CAST(N'2021-02-22' AS Date), N'Lào Cai', N'mollis.non@protonmail.edu', N'LOV02IRT4UN', N'RNS/NQJINIXS/DAWX', 4)
INSERT [dbo].[Utilisateur] ([uti_id], [uti_pseudo], [uti_nom], [uti_prenom], [uti_DDN], [uti_ville], [uti_mail], [uti_mdp], [uti_avatar], [uti_rol_id]) VALUES (15, N'Blake', N'Rosales', N'Ferris', CAST(N'2028-04-21' AS Date), N'Jambi', N'accumsan.sed@hotmail.org', N'GQQ57THS8GD', N'PTJ/THCGHTXY/LPNT', 4)
INSERT [dbo].[Utilisateur] ([uti_id], [uti_pseudo], [uti_nom], [uti_prenom], [uti_DDN], [uti_ville], [uti_mail], [uti_mdp], [uti_avatar], [uti_rol_id]) VALUES (16, N'Tasha', N'Bradshaw', N'Mason', CAST(N'2009-04-21' AS Date), N'Leersum', N'cras.sed@hotmail.com', N'BCJ64IIM2DD', N'HHK/EXMWGIWG/FLWQ', 1)
INSERT [dbo].[Utilisateur] ([uti_id], [uti_pseudo], [uti_nom], [uti_prenom], [uti_DDN], [uti_ville], [uti_mail], [uti_mdp], [uti_avatar], [uti_rol_id]) VALUES (17, N'Tanisha', N'Short', N'Quinn', CAST(N'2021-04-23' AS Date), N'Watson Lake', N'elit.a@hotmail.ca', N'WNH89AIC2QP', N'ZSI/OTVREROH/XNTG', 1)
INSERT [dbo].[Utilisateur] ([uti_id], [uti_pseudo], [uti_nom], [uti_prenom], [uti_DDN], [uti_ville], [uti_mail], [uti_mdp], [uti_avatar], [uti_rol_id]) VALUES (18, N'Leslie', N'Atkins', N'Shannon', CAST(N'2003-11-22' AS Date), N'Magangué', N'mauris.elit@aol.net', N'NTW81FTM1QO', N'UQR/HQYNNJVY/PMVA', 2)
INSERT [dbo].[Utilisateur] ([uti_id], [uti_pseudo], [uti_nom], [uti_prenom], [uti_DDN], [uti_ville], [uti_mail], [uti_mdp], [uti_avatar], [uti_rol_id]) VALUES (19, N'Ishmael', N'Campos', N'Inez', CAST(N'2022-03-23' AS Date), N'Th? D?u M?t', N'libero.lacus@hotmail.couk', N'ZSR60CHD1PK', N'DIS/WVMOQLKQ/AXMJ', 3)
INSERT [dbo].[Utilisateur] ([uti_id], [uti_pseudo], [uti_nom], [uti_prenom], [uti_DDN], [uti_ville], [uti_mail], [uti_mdp], [uti_avatar], [uti_rol_id]) VALUES (20, N'Melinda', N'Madden', N'Beatrice', CAST(N'2014-07-23' AS Date), N'Puno', N'nibh.sit.amet@icloud.edu', N'MFO74ITD1WL', N'UEX/FEEIUVSI/MEWH', 3)
INSERT [dbo].[Utilisateur] ([uti_id], [uti_pseudo], [uti_nom], [uti_prenom], [uti_DDN], [uti_ville], [uti_mail], [uti_mdp], [uti_avatar], [uti_rol_id]) VALUES (21, N'Miriam', N'Boyer', N'Bruno', CAST(N'2020-01-21' AS Date), N'Pioneer', N'integer.tincidunt.aliquam@outlook.net', N'LSR29RUM4AT', N'QSJ/YCIADJGN/YXWR', 2)
INSERT [dbo].[Utilisateur] ([uti_id], [uti_pseudo], [uti_nom], [uti_prenom], [uti_DDN], [uti_ville], [uti_mail], [uti_mdp], [uti_avatar], [uti_rol_id]) VALUES (22, N'Ivan', N'Paul', N'Mannix', CAST(N'2024-03-23' AS Date), N'Torun', N'luctus.sit@google.com', N'KKU65ZSO0YY', N'FDO/UIZNCBPV/URPB', 4)
INSERT [dbo].[Utilisateur] ([uti_id], [uti_pseudo], [uti_nom], [uti_prenom], [uti_DDN], [uti_ville], [uti_mail], [uti_mdp], [uti_avatar], [uti_rol_id]) VALUES (23, N'Stella', N'Roach', N'Elvis', CAST(N'2013-06-22' AS Date), N'Itajaí', N'vivamus.nisi@google.ca', N'DDK13QMT5JS', N'JXO/OHNQYBUY/HERY', 3)
INSERT [dbo].[Utilisateur] ([uti_id], [uti_pseudo], [uti_nom], [uti_prenom], [uti_DDN], [uti_ville], [uti_mail], [uti_mdp], [uti_avatar], [uti_rol_id]) VALUES (24, N'Damon', N'Ashley', N'Kevin', CAST(N'2006-03-21' AS Date), N'Musakhel', N'nunc.ullamcorper@google.org', N'HLF54SGN3JT', N'LYQ/YKSQXWJW/PCAD', 3)
INSERT [dbo].[Utilisateur] ([uti_id], [uti_pseudo], [uti_nom], [uti_prenom], [uti_DDN], [uti_ville], [uti_mail], [uti_mdp], [uti_avatar], [uti_rol_id]) VALUES (25, N'Giacomo', N'Morales', N'Whitney', CAST(N'2027-10-22' AS Date), N'Berlin', N'sed.dictum@icloud.edu', N'SCB04SGL6HD', N'QNH/KGSWBMRE/UGKX', 2)
INSERT [dbo].[Utilisateur] ([uti_id], [uti_pseudo], [uti_nom], [uti_prenom], [uti_DDN], [uti_ville], [uti_mail], [uti_mdp], [uti_avatar], [uti_rol_id]) VALUES (26, N'Cassandra', N'Bridges', N'Alyssa', CAST(N'2024-08-22' AS Date), N'Rivne', N'amet.risus@hotmail.net', N'DYP02BTJ8BU', N'DSW/YYTTJBVH/VRGF', 1)
INSERT [dbo].[Utilisateur] ([uti_id], [uti_pseudo], [uti_nom], [uti_prenom], [uti_DDN], [uti_ville], [uti_mail], [uti_mdp], [uti_avatar], [uti_rol_id]) VALUES (27, N'Yuri', N'Cannon', N'Jael', CAST(N'2023-08-21' AS Date), N'Hamburg', N'curae@google.couk', N'UIB56CPU6JS', N'XRO/POMSRXUY/DRDU', 3)
INSERT [dbo].[Utilisateur] ([uti_id], [uti_pseudo], [uti_nom], [uti_prenom], [uti_DDN], [uti_ville], [uti_mail], [uti_mdp], [uti_avatar], [uti_rol_id]) VALUES (28, N'Alan', N'Casey', N'Julian', CAST(N'2029-11-21' AS Date), N'Sogamoso', N'eu.tempor.erat@outlook.net', N'ZTY83MEF4RT', N'PFF/TXWDKSUH/XGOQ', 3)
INSERT [dbo].[Utilisateur] ([uti_id], [uti_pseudo], [uti_nom], [uti_prenom], [uti_DDN], [uti_ville], [uti_mail], [uti_mdp], [uti_avatar], [uti_rol_id]) VALUES (29, N'Jonah', N'Sykes', N'Ivana', CAST(N'2022-03-23' AS Date), N'Zwolle', N'egestas.lacinia@outlook.edu', N'FWQ71QGV5RZ', N'NZO/NSMSQKKG/SWDZ', 1)
INSERT [dbo].[Utilisateur] ([uti_id], [uti_pseudo], [uti_nom], [uti_prenom], [uti_DDN], [uti_ville], [uti_mail], [uti_mdp], [uti_avatar], [uti_rol_id]) VALUES (30, N'Jordan', N'Hartman', N'Emery', CAST(N'2008-07-21' AS Date), N'Palmerston', N'mi.aliquam@hotmail.net', N'QPC98DMH6KW', N'ZID/SMYORBMF/JTHZ', 1)
INSERT [dbo].[Utilisateur] ([uti_id], [uti_pseudo], [uti_nom], [uti_prenom], [uti_DDN], [uti_ville], [uti_mail], [uti_mdp], [uti_avatar], [uti_rol_id]) VALUES (31, N'Gary', N'Chase', N'Cynthia', CAST(N'2030-01-22' AS Date), N'Brive-la-Gaillarde', N'turpis.vitae.purus@yahoo.net', N'SZI92JFX7BR', N'WIV/INMIVBEP/FEOI', 3)
INSERT [dbo].[Utilisateur] ([uti_id], [uti_pseudo], [uti_nom], [uti_prenom], [uti_DDN], [uti_ville], [uti_mail], [uti_mdp], [uti_avatar], [uti_rol_id]) VALUES (32, N'Armando', N'Moon', N'Hyacinth', CAST(N'2020-06-23' AS Date), N'Piura', N'semper@aol.ca', N'WNA53DRY0IW', N'CFF/NPQERNMQ/DNWL', 1)
INSERT [dbo].[Utilisateur] ([uti_id], [uti_pseudo], [uti_nom], [uti_prenom], [uti_DDN], [uti_ville], [uti_mail], [uti_mdp], [uti_avatar], [uti_rol_id]) VALUES (33, N'Tucker', N'Poole', N'Jerry', CAST(N'2018-12-22' AS Date), N'New Galloway', N'mollis.lectus@protonmail.org', N'JUJ91WGZ2BR', N'ULB/FXUDPJDQ/UFCH', 2)
INSERT [dbo].[Utilisateur] ([uti_id], [uti_pseudo], [uti_nom], [uti_prenom], [uti_DDN], [uti_ville], [uti_mail], [uti_mdp], [uti_avatar], [uti_rol_id]) VALUES (34, N'Callie', N'Langley', N'Howard', CAST(N'2029-06-21' AS Date), N'Hisar', N'pellentesque@yahoo.couk', N'SNL58JCI1RE', N'UTK/MYNTQLMP/DSUE', 3)
INSERT [dbo].[Utilisateur] ([uti_id], [uti_pseudo], [uti_nom], [uti_prenom], [uti_DDN], [uti_ville], [uti_mail], [uti_mdp], [uti_avatar], [uti_rol_id]) VALUES (35, N'Sheila', N'Morrow', N'Ray', CAST(N'2014-04-21' AS Date), N'Saint-Denis', N'arcu.et@icloud.com', N'HSL83ECG8RV', N'YQF/IPJSMGXZ/OVWN', 1)
INSERT [dbo].[Utilisateur] ([uti_id], [uti_pseudo], [uti_nom], [uti_prenom], [uti_DDN], [uti_ville], [uti_mail], [uti_mdp], [uti_avatar], [uti_rol_id]) VALUES (36, N'Gabriel', N'Spencer', N'Garth', CAST(N'2015-10-22' AS Date), N'Mexico City', N'urna.justo@icloud.net', N'JFC90ISU6WM', N'BTO/WDRYWMOS/UFAK', 3)
INSERT [dbo].[Utilisateur] ([uti_id], [uti_pseudo], [uti_nom], [uti_prenom], [uti_DDN], [uti_ville], [uti_mail], [uti_mdp], [uti_avatar], [uti_rol_id]) VALUES (37, N'Jordan', N'Stanley', N'Kenyon', CAST(N'2005-01-21' AS Date), N'Lai Cách', N'torquent.per.conubia@google.org', N'HPX10XBQ0ZP', N'TLS/DFWLKGHK/ARQI', 2)
INSERT [dbo].[Utilisateur] ([uti_id], [uti_pseudo], [uti_nom], [uti_prenom], [uti_DDN], [uti_ville], [uti_mail], [uti_mdp], [uti_avatar], [uti_rol_id]) VALUES (38, N'Leonard', N'Hampton', N'Brock', CAST(N'2027-06-22' AS Date), N'Thionville', N'dolor.donec.fringilla@protonmail.com', N'TUF16HDI8RT', N'OEI/FTVTWCZH/CDHM', 2)
INSERT [dbo].[Utilisateur] ([uti_id], [uti_pseudo], [uti_nom], [uti_prenom], [uti_DDN], [uti_ville], [uti_mail], [uti_mdp], [uti_avatar], [uti_rol_id]) VALUES (39, N'Jennifer', N'Floyd', N'Melissa', CAST(N'2019-06-23' AS Date), N'Argyle', N'ridiculus.mus.aenean@hotmail.ca', N'UJG75YHM5CE', N'OOQ/XMSMXBEG/VPDW', 3)
INSERT [dbo].[Utilisateur] ([uti_id], [uti_pseudo], [uti_nom], [uti_prenom], [uti_DDN], [uti_ville], [uti_mail], [uti_mdp], [uti_avatar], [uti_rol_id]) VALUES (40, N'Tana', N'O''donnell', N'Kermit', CAST(N'2006-07-22' AS Date), N'Bastia', N'sed@aol.ca', N'JCR45XFW9PN', N'BIS/TIHCLFKM/DNIH', 2)
INSERT [dbo].[Utilisateur] ([uti_id], [uti_pseudo], [uti_nom], [uti_prenom], [uti_DDN], [uti_ville], [uti_mail], [uti_mdp], [uti_avatar], [uti_rol_id]) VALUES (41, N'Lionel', N'Garrett', N'Stephen', CAST(N'2001-07-22' AS Date), N'Viransehir', N'eleifend.nec@hotmail.edu', N'DHM86UUP1FD', N'OEN/IWMLPILI/GEMF', 2)
INSERT [dbo].[Utilisateur] ([uti_id], [uti_pseudo], [uti_nom], [uti_prenom], [uti_DDN], [uti_ville], [uti_mail], [uti_mdp], [uti_avatar], [uti_rol_id]) VALUES (42, N'Kasimir', N'Herrera', N'Cooper', CAST(N'2004-04-23' AS Date), N'Kozan', N'erat.neque@icloud.com', N'FGL76PBJ5LS', N'CGM/SCEAVCLQ/DNWA', 1)
INSERT [dbo].[Utilisateur] ([uti_id], [uti_pseudo], [uti_nom], [uti_prenom], [uti_DDN], [uti_ville], [uti_mail], [uti_mdp], [uti_avatar], [uti_rol_id]) VALUES (43, N'Jared', N'Rutledge', N'Eaton', CAST(N'2006-01-21' AS Date), N'Itajaí', N'iaculis.nec@outlook.org', N'NXH65YQS1JI', N'ICR/QFQVJFNX/RFEI', 2)
INSERT [dbo].[Utilisateur] ([uti_id], [uti_pseudo], [uti_nom], [uti_prenom], [uti_DDN], [uti_ville], [uti_mail], [uti_mdp], [uti_avatar], [uti_rol_id]) VALUES (44, N'Isabelle', N'Stout', N'Brennan', CAST(N'2004-03-21' AS Date), N'Lagos', N'curabitur.sed@aol.com', N'UWV20NOJ8OY', N'LAQ/OUSVWUDR/GNML', 1)
INSERT [dbo].[Utilisateur] ([uti_id], [uti_pseudo], [uti_nom], [uti_prenom], [uti_DDN], [uti_ville], [uti_mail], [uti_mdp], [uti_avatar], [uti_rol_id]) VALUES (45, N'Rowan', N'Hurley', N'Vernon', CAST(N'2030-06-20' AS Date), N'Belfast', N'sed.nunc@protonmail.ca', N'BMB41CNF2EO', N'EYK/INHOJUBU/GZHP', 2)
INSERT [dbo].[Utilisateur] ([uti_id], [uti_pseudo], [uti_nom], [uti_prenom], [uti_DDN], [uti_ville], [uti_mail], [uti_mdp], [uti_avatar], [uti_rol_id]) VALUES (46, N'Brynn', N'Franklin', N'Halee', CAST(N'2001-10-21' AS Date), N'Teno', N'donec@outlook.com', N'EMP32RRO7CZ', N'YKQ/JWWUYNQT/IZBC', 1)
INSERT [dbo].[Utilisateur] ([uti_id], [uti_pseudo], [uti_nom], [uti_prenom], [uti_DDN], [uti_ville], [uti_mail], [uti_mdp], [uti_avatar], [uti_rol_id]) VALUES (47, N'Aspen', N'Barnett', N'Wynter', CAST(N'2007-11-21' AS Date), N'Rockhampton', N'leo.elementum@outlook.org', N'HYD23GGF7ND', N'ENU/FHJQNOAQ/BRMV', 2)
INSERT [dbo].[Utilisateur] ([uti_id], [uti_pseudo], [uti_nom], [uti_prenom], [uti_DDN], [uti_ville], [uti_mail], [uti_mdp], [uti_avatar], [uti_rol_id]) VALUES (48, N'Lydia', N'Blackwell', N'Jana', CAST(N'2023-07-21' AS Date), N'Randfontein', N'tortor.nunc@yahoo.com', N'QOI48DEB0HE', N'XFI/BUWKECWR/UCEQ', 3)
INSERT [dbo].[Utilisateur] ([uti_id], [uti_pseudo], [uti_nom], [uti_prenom], [uti_DDN], [uti_ville], [uti_mail], [uti_mdp], [uti_avatar], [uti_rol_id]) VALUES (49, N'Giacomo', N'Campos', N'Rinah', CAST(N'2029-04-22' AS Date), N'Anápolis', N'ac.feugiat@google.org', N'PBS22HFP1LM', N'MYO/LLPEFXWP/RDKQ', 2)
INSERT [dbo].[Utilisateur] ([uti_id], [uti_pseudo], [uti_nom], [uti_prenom], [uti_DDN], [uti_ville], [uti_mail], [uti_mdp], [uti_avatar], [uti_rol_id]) VALUES (50, N'Tamara', N'Brock', N'Brittany', CAST(N'2012-04-23' AS Date), N'Dublin', N'lectus.justo@icloud.couk', N'PFL46YSW3OC', N'CDG/VSRLXOEG/EDBM', 2)
SET IDENTITY_INSERT [dbo].[Utilisateur] OFF
GO
ALTER TABLE [dbo].[Ameliorer]  WITH CHECK ADD FOREIGN KEY([ame_art_id])
REFERENCES [dbo].[Article] ([art_id])
GO
ALTER TABLE [dbo].[Ameliorer]  WITH CHECK ADD FOREIGN KEY([ame_med_id])
REFERENCES [dbo].[Media] ([med_id])
GO
ALTER TABLE [dbo].[Article]  WITH CHECK ADD  CONSTRAINT [FK_UTILISATEUR_ARTICLE] FOREIGN KEY([art_uti_id])
REFERENCES [dbo].[Utilisateur] ([uti_id])
GO
ALTER TABLE [dbo].[Article] CHECK CONSTRAINT [FK_UTILISATEUR_ARTICLE]
GO
ALTER TABLE [dbo].[Associer]  WITH CHECK ADD FOREIGN KEY([ass_rec_id])
REFERENCES [dbo].[Recette] ([rec_id])
GO
ALTER TABLE [dbo].[Associer]  WITH CHECK ADD FOREIGN KEY([ass_tag_id])
REFERENCES [dbo].[Tags] ([tag_id])
GO
ALTER TABLE [dbo].[Contenir]  WITH CHECK ADD FOREIGN KEY([con_pro_id])
REFERENCES [dbo].[Produit] ([pro_id])
GO
ALTER TABLE [dbo].[Contenir]  WITH CHECK ADD FOREIGN KEY([con_rec_id])
REFERENCES [dbo].[Recette] ([rec_id])
GO
ALTER TABLE [dbo].[Decrire]  WITH CHECK ADD FOREIGN KEY([dec_art_id])
REFERENCES [dbo].[Article] ([art_id])
GO
ALTER TABLE [dbo].[Decrire]  WITH CHECK ADD FOREIGN KEY([dec_tag_id])
REFERENCES [dbo].[Tags] ([tag_id])
GO
ALTER TABLE [dbo].[Embellir]  WITH CHECK ADD FOREIGN KEY([emb_med_id])
REFERENCES [dbo].[Media] ([med_id])
GO
ALTER TABLE [dbo].[Embellir]  WITH CHECK ADD FOREIGN KEY([emb_rec_id])
REFERENCES [dbo].[Recette] ([rec_id])
GO
ALTER TABLE [dbo].[FicheProduit]  WITH CHECK ADD  CONSTRAINT [FK_PRODUIT_FICHEPRODUIT] FOREIGN KEY([fic_pro_id])
REFERENCES [dbo].[Produit] ([pro_id])
GO
ALTER TABLE [dbo].[FicheProduit] CHECK CONSTRAINT [FK_PRODUIT_FICHEPRODUIT]
GO
ALTER TABLE [dbo].[FicheProduit]  WITH CHECK ADD  CONSTRAINT [FK_UTILISATEUR_FICHEPRODUIT] FOREIGN KEY([fic_uti_id])
REFERENCES [dbo].[Utilisateur] ([uti_id])
GO
ALTER TABLE [dbo].[FicheProduit] CHECK CONSTRAINT [FK_UTILISATEUR_FICHEPRODUIT]
GO
ALTER TABLE [dbo].[Illustrer]  WITH CHECK ADD FOREIGN KEY([ill_fic_id])
REFERENCES [dbo].[FicheProduit] ([fic_id])
GO
ALTER TABLE [dbo].[Illustrer]  WITH CHECK ADD FOREIGN KEY([ill_med_id])
REFERENCES [dbo].[Media] ([med_id])
GO
ALTER TABLE [dbo].[MessageForum]  WITH CHECK ADD FOREIGN KEY([mes_reponse_id_1])
REFERENCES [dbo].[MessageForum] ([mes_id])
GO
ALTER TABLE [dbo].[MessageForum]  WITH CHECK ADD  CONSTRAINT [FK_UTILISATEUR_MESSAGEFORUM] FOREIGN KEY([mes_uti_id])
REFERENCES [dbo].[Utilisateur] ([uti_id])
GO
ALTER TABLE [dbo].[MessageForum] CHECK CONSTRAINT [FK_UTILISATEUR_MESSAGEFORUM]
GO
ALTER TABLE [dbo].[Montrer]  WITH CHECK ADD FOREIGN KEY([mon_fic_id])
REFERENCES [dbo].[FicheProduit] ([fic_id])
GO
ALTER TABLE [dbo].[Montrer]  WITH CHECK ADD FOREIGN KEY([mon_tag_id])
REFERENCES [dbo].[Tags] ([tag_id])
GO
ALTER TABLE [dbo].[Produit]  WITH CHECK ADD  CONSTRAINT [FK_UTILISATEUR_PRODUIT] FOREIGN KEY([pro_uti_id])
REFERENCES [dbo].[Utilisateur] ([uti_id])
GO
ALTER TABLE [dbo].[Produit] CHECK CONSTRAINT [FK_UTILISATEUR_PRODUIT]
GO
ALTER TABLE [dbo].[Recette]  WITH CHECK ADD  CONSTRAINT [FK_UTILISATEUR_RECETTE] FOREIGN KEY([rec_compo_uti_id])
REFERENCES [dbo].[Utilisateur] ([uti_id])
GO
ALTER TABLE [dbo].[Recette] CHECK CONSTRAINT [FK_UTILISATEUR_RECETTE]
GO
ALTER TABLE [dbo].[Recette]  WITH CHECK ADD  CONSTRAINT [FK_VALIDER_UTI_RECETTE] FOREIGN KEY([rec_valider_uti_id])
REFERENCES [dbo].[Utilisateur] ([uti_id])
GO
ALTER TABLE [dbo].[Recette] CHECK CONSTRAINT [FK_VALIDER_UTI_RECETTE]
GO
ALTER TABLE [dbo].[Utilisateur]  WITH CHECK ADD  CONSTRAINT [FK_UTILISATEUR_ROLES] FOREIGN KEY([uti_rol_id])
REFERENCES [dbo].[Roles] ([rol_id])
GO
ALTER TABLE [dbo].[Utilisateur] CHECK CONSTRAINT [FK_UTILISATEUR_ROLES]
GO
USE [master]
GO
ALTER DATABASE [Apilicious] SET  READ_WRITE 
GO
