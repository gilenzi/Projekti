USE [master]
GO

/****** Object:  Database [ProjekatSQL_Delfi]    Script Date: 2/21/2021 8:08:52 PM ******/
CREATE DATABASE [ProjekatSQL_Delfi]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProjekatSQL_Delfi', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ProjekatSQL_Delfi.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ProjekatSQL_Delfi_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ProjekatSQL_Delfi_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProjekatSQL_Delfi].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [ProjekatSQL_Delfi] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [ProjekatSQL_Delfi] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [ProjekatSQL_Delfi] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [ProjekatSQL_Delfi] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [ProjekatSQL_Delfi] SET ARITHABORT OFF 
GO

ALTER DATABASE [ProjekatSQL_Delfi] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [ProjekatSQL_Delfi] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [ProjekatSQL_Delfi] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [ProjekatSQL_Delfi] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [ProjekatSQL_Delfi] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [ProjekatSQL_Delfi] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [ProjekatSQL_Delfi] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [ProjekatSQL_Delfi] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [ProjekatSQL_Delfi] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [ProjekatSQL_Delfi] SET  DISABLE_BROKER 
GO

ALTER DATABASE [ProjekatSQL_Delfi] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [ProjekatSQL_Delfi] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [ProjekatSQL_Delfi] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [ProjekatSQL_Delfi] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [ProjekatSQL_Delfi] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [ProjekatSQL_Delfi] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [ProjekatSQL_Delfi] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [ProjekatSQL_Delfi] SET RECOVERY FULL 
GO

ALTER DATABASE [ProjekatSQL_Delfi] SET  MULTI_USER 
GO

ALTER DATABASE [ProjekatSQL_Delfi] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [ProjekatSQL_Delfi] SET DB_CHAINING OFF 
GO

ALTER DATABASE [ProjekatSQL_Delfi] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [ProjekatSQL_Delfi] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [ProjekatSQL_Delfi] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [ProjekatSQL_Delfi] SET QUERY_STORE = OFF
GO

ALTER DATABASE [ProjekatSQL_Delfi] SET  READ_WRITE 
GO

USE [ProjekatSQL_Delfi]
GO
--Tabele
/****** Object:  Table [dbo].[Kupac]    Script Date: 2/21/2021 4:17:51 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Kupac](
	[KupacID] [int] IDENTITY(1,1) NOT NULL,
	[Ime] [nvarchar](30) NOT NULL,
	[Prezime] [nvarchar](30) NOT NULL,
	[BrojMob] [nvarchar](15) NOT NULL,
	[Adresa] [nvarchar](30) NOT NULL,
	[Email] [nvarchar](40) NOT NULL,
 CONSTRAINT [PK_Kupac] PRIMARY KEY CLUSTERED 
(
	[KupacID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [ProjekatSQL_Delfi]
GO

/****** Object:  Table [dbo].[Zaposleni]    Script Date: 2/21/2021 4:18:40 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Zaposleni](
	[ZaposleniID] [int] IDENTITY(1,1) NOT NULL,
	[Ime] [nvarchar](30) NOT NULL,
	[Prezime] [nvarchar](30) NOT NULL,
	[BrojMob] [nvarchar](15) NOT NULL,
	[Adresa] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Zaposleni] PRIMARY KEY CLUSTERED 
(
	[ZaposleniID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO



/****** Object:  Table [dbo].[Autori]    Script Date: 2/21/2021 4:20:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Autori](
	[AutorID] [int] IDENTITY(1,1) NOT NULL,
	[Ime] [nvarchar](40) NOT NULL,
	[Prezime] [nvarchar](40) NOT NULL,
 CONSTRAINT [PK_Autori] PRIMARY KEY CLUSTERED 
(
	[AutorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


/****** Object:  Table [dbo].[Kategorija]    Script Date: 2/21/2021 4:24:05 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Kategorija](
	[KategorijaID] [int] IDENTITY(1,1) NOT NULL,
	[ImeKategorije] [nvarchar](40) NOT NULL,
	[OpisKategorije] [ntext] NOT NULL,
 CONSTRAINT [PK_Kategorija] PRIMARY KEY CLUSTERED 
(
	[KategorijaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO



/****** Object:  Table [dbo].[Izdavac]    Script Date: 2/21/2021 4:20:53 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Izdavac](
	[IzdavacID] [int] IDENTITY(1,1) NOT NULL,
	[ImeIzdavackeKuce] [nvarchar](30) NOT NULL,
	[BrojTelefona] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_Izdavac] PRIMARY KEY CLUSTERED 
(
	[IzdavacID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Zanr]    Script Date: 2/21/2021 4:21:08 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Zanr](
	[ZanrID] [int] IDENTITY(1,1) NOT NULL,
	[ImeZanra] [nvarchar](50) NOT NULL,
	[OpisZanra] [ntext] NOT NULL,
 CONSTRAINT [PK_Zanr] PRIMARY KEY CLUSTERED 
(
	[ZanrID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO






/****** Object:  Table [dbo].[Knjiga]    Script Date: 2/21/2021 4:19:37 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Knjiga](
	[KnjigaID] [int] IDENTITY(1,1) NOT NULL,
	[Naslov] [nvarchar](50) NOT NULL,
	[Stranice] [int] NOT NULL,
	[ISBN] [nvarchar](13) NOT NULL,
	[DatumIzlaskaIzdanjaKnjige] [date] NULL,
	[Jezik] [nvarchar](30) NOT NULL,
	[Cena] [float] NOT NULL,
	[Kolicina] [nchar](10) NOT NULL,
	[AutorID] [int] NOT NULL,
	[IzdavacID] [int] NOT NULL,
	[KategorijaID] [int] NOT NULL,
 CONSTRAINT [PK_Knjiga] PRIMARY KEY CLUSTERED 
(
	[KnjigaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Knjiga]  WITH CHECK ADD  CONSTRAINT [FK_Knjiga_Autori] FOREIGN KEY([AutorID])
REFERENCES [dbo].[Autori] ([AutorID])
GO

ALTER TABLE [dbo].[Knjiga] CHECK CONSTRAINT [FK_Knjiga_Autori]
GO

ALTER TABLE [dbo].[Knjiga]  WITH CHECK ADD  CONSTRAINT [FK_Knjiga_Izdavac] FOREIGN KEY([IzdavacID])
REFERENCES [dbo].[Izdavac] ([IzdavacID])
GO

ALTER TABLE [dbo].[Knjiga] CHECK CONSTRAINT [FK_Knjiga_Izdavac]
GO

ALTER TABLE [dbo].[Knjiga]  WITH CHECK ADD  CONSTRAINT [FK_Knjiga_Kategorija] FOREIGN KEY([KategorijaID])
REFERENCES [dbo].[Kategorija] ([KategorijaID])
GO

ALTER TABLE [dbo].[Knjiga] CHECK CONSTRAINT [FK_Knjiga_Kategorija]
GO

/****** Object:  Table [dbo].[KnjigaZanr]    Script Date: 2/21/2021 4:24:27 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[KnjigaZanr](
	[KnjigaZanrID] [int] IDENTITY(1,1) NOT NULL,
	[KnjigaID] [int] NOT NULL,
	[ZanrID] [int] NOT NULL,
 CONSTRAINT [PK_KnjigaZanr] PRIMARY KEY CLUSTERED 
(
	[KnjigaZanrID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[KnjigaZanr]  WITH CHECK ADD  CONSTRAINT [FK_KnjigaZanr_Knjiga] FOREIGN KEY([KnjigaID])
REFERENCES [dbo].[Knjiga] ([KnjigaID])
GO

ALTER TABLE [dbo].[KnjigaZanr] CHECK CONSTRAINT [FK_KnjigaZanr_Knjiga]
GO

ALTER TABLE [dbo].[KnjigaZanr]  WITH CHECK ADD  CONSTRAINT [FK_KnjigaZanr_Zanr] FOREIGN KEY([ZanrID])
REFERENCES [dbo].[Zanr] ([ZanrID])
GO

ALTER TABLE [dbo].[KnjigaZanr] CHECK CONSTRAINT [FK_KnjigaZanr_Zanr]
GO

/****** Object:  Table [dbo].[Kupon]    Script Date: 2/21/2021 4:23:03 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Kupon](
	[KuponID] [int] IDENTITY(1,1) NOT NULL,
	[VrednostKupona] [float] NOT NULL,
	[DatumIstekaKupona] [date] NOT NULL,
 CONSTRAINT [PK_Kupon] PRIMARY KEY CLUSTERED 
(
	[KuponID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO



/****** Object:  Table [dbo].[Narudzbina]    Script Date: 2/21/2021 4:23:29 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Narudzbina](
	[NarudzbinaID] [int] IDENTITY(1,1) NOT NULL,
	[KupacID] [int] NOT NULL,
	[KnjigaID] [int] NOT NULL,
	[ZaposleniID] [int] NOT NULL,
	[KuponID] [int] NOT NULL,
	[UkupnaCena] [float] NULL,
 CONSTRAINT [PK_Narudzbina] PRIMARY KEY CLUSTERED 
(
	[NarudzbinaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Narudzbina]  WITH CHECK ADD  CONSTRAINT [FK_Narudzbina_Knjiga] FOREIGN KEY([KnjigaID])
REFERENCES [dbo].[Knjiga] ([KnjigaID])
GO

ALTER TABLE [dbo].[Narudzbina] CHECK CONSTRAINT [FK_Narudzbina_Knjiga]
GO

ALTER TABLE [dbo].[Narudzbina]  WITH CHECK ADD  CONSTRAINT [FK_Narudzbina_Kupac] FOREIGN KEY([KupacID])
REFERENCES [dbo].[Kupac] ([KupacID])
GO

ALTER TABLE [dbo].[Narudzbina] CHECK CONSTRAINT [FK_Narudzbina_Kupac]
GO

ALTER TABLE [dbo].[Narudzbina]  WITH CHECK ADD  CONSTRAINT [FK_Narudzbina_Kupon] FOREIGN KEY([KuponID])
REFERENCES [dbo].[Kupon] ([KuponID])
GO

ALTER TABLE [dbo].[Narudzbina] CHECK CONSTRAINT [FK_Narudzbina_Kupon]
GO

ALTER TABLE [dbo].[Narudzbina]  WITH CHECK ADD  CONSTRAINT [FK_Narudzbina_Zaposleni] FOREIGN KEY([ZaposleniID])
REFERENCES [dbo].[Zaposleni] ([ZaposleniID])
GO

ALTER TABLE [dbo].[Narudzbina] CHECK CONSTRAINT [FK_Narudzbina_Zaposleni]
GO


/****** Object:  Table [dbo].[DetaljiNarudzbine]    Script Date: 2/21/2021 4:26:07 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DetaljiNarudzbine](
	[DetaljiNarudzbineID] [int] IDENTITY(1,1) NOT NULL,
	[DatumIsporuke] [date] NOT NULL,
	[AdresaIsporuke] [nvarchar](30) NOT NULL,
	[GradIsporuke] [nvarchar](30) NOT NULL,
	[PostanskiKod] [nvarchar](5) NOT NULL,
	[NarudzbinaID] [int] NOT NULL,
 CONSTRAINT [PK_DetaljiNarudzbine] PRIMARY KEY CLUSTERED 
(
	[DetaljiNarudzbineID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[DetaljiNarudzbine]  WITH CHECK ADD  CONSTRAINT [FK_DetaljiNarudzbine_Narudzbina] FOREIGN KEY([NarudzbinaID])
REFERENCES [dbo].[Narudzbina] ([NarudzbinaID])
GO

ALTER TABLE [dbo].[DetaljiNarudzbine] CHECK CONSTRAINT [FK_DetaljiNarudzbine_Narudzbina]
GO

/****** Object:  Table [dbo].[ErrorLog]    Script Date: 2/21/2021 4:27:20 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ErrorLog](
	[ErrorID] [int] IDENTITY(1,1) NOT NULL,
	[ErrorTime] [datetime] NOT NULL,
	[ErrorNumber] [int] NOT NULL,
	[ErrorSeverity] [int] NOT NULL,
	[ErrorState] [int] NULL,
	[ErrorProcedure] [nvarchar](126) NULL,
	[ErrorLine] [int] NULL,
	[ErrorMessage] [nvarchar](1000) NULL,
	[UserName] [nvarchar](50) NULL,
	[Resolved] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ErrorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ErrorLog] ADD  DEFAULT (getdate()) FOR [ErrorTime]
GO

ALTER TABLE [dbo].[ErrorLog] ADD  DEFAULT (suser_name()) FOR [UserName]
GO

--Inserti

INSERT  dbo.Kupac
VALUES
('Ivan','Todorovic','0615555555','Zemunska 188','Ivan@gmail.com'),
('Milos','Markovic','0622223333','Surcinska 154','Milos@gmail.com'),
('Petar','Cirovic','0633334444','Zemunska 128','Petar@gmail.com'),
('Djuro','Jelovac','0641112222','Ugrinovacka 15','Djuro@gmail.com'),
('Mladen','Prokic','0651233344','Ugrinovacka 24','Mladen@gmail.com'),
('Sara','Savic','0622235544','Partizanska 55','Sara@gmail.com'),
('Bojana ','Radenkovic','0635551144','Beogradska 4','Bojana@gmail.com'),
('Marko ','Kalcic','0623213355','Beogradska 8','Marko@gmail.com'),
('Dragan','Delic','0644442121','Beogradska 12','Dragan@gmail.com'),
('Aleska','Mihajlovic','0633131122','Zemunska 188','Aleksa@gmail.com'),

('Aleksandra','Blagojevic','0634214242','Zemunska 16','Aleksandra@gmail.com'),
('Djordje','Stojanovic','0645335234','Toplicka 14','Djordje@gmail.com'),
('Nikola','Nikolic','0612312222','Ugrinovacka 78','Nikola@gmail.com'),
('Milija','Arsic','0621132355','Lovacka 18','Milija@gmail.com'),
('Savo','Kleut','0634441234','Lovacka 28','Savo@gmail.com'),
('Teodora','Savic','0613665577','Balkasnka 176','Teodora@gmail.com'),
('Jovan','Ivanis','0628887777','Obilicka 16','Jovan@gmail.com'),
('Dalibor','Radenkovic','0636227788','Balkasnka 17','Dalibor@gmail.com'),
('Danica','Tarabanovic','0616337555','Zemunska 43','Danica@gmail.com'),
('Milica','Misic','0613631554','Zemunska 55','Milica@gmail.com'),

('Andrea','Mrijaj','0642771661','Beogradska 122','Andrea@gmail.com'),
('Andjela','Antonijevic','0623838666','Beogradska 157','Andjela@gmail.com'),
('Nikolina','Vukasinovic','0643237765','Zemunska 12','Nikolina@gmail.com'),
('Teodora','Petrovic','0615472655','Balkanskoj 112','TeodoraP@gmail.com'),
('Milos','Tomovic','0645899999','Balkasnka 11','MilosT@gmail.com'),
('Luka','Dalekovic','0615959955','Beogradska 162','LukaD@gmail.com'),
('Mitar','Stevanovic','0634741489','Lovacka 19',',MitarS@gmail.com'),
('Petar','Sulovic','0642821825','Lovacka 84','PetarS@gmail.com'),
('Mirijana','Rasula','0653346655','Obrenovacka 187','MirijanaR@gmail.com'),
('Anja','Tosic','0635645555','Obrenovacka 9','AnjaT@gmail.com'),

('Biljana','Jaksic','0641258825','Zemunska 4','BiljanaJ@gmail.com'),
('Kristina','Kuborovic','0624884565','Zemunska 5','KristinaK@gmail.com'),
('Jovana','Milosevic','0651175437','Toplicka 17','JovanaM@gmail.com'),
('Jovan','Drobnjak','0635653444','Toplicka 27','JovanD@gmail.com'),
('Nenad','Milosavjevic','0626627355','Obrenovacka 156','NenadM@gmail.com'),
('Tamara','Miric','0611759556','Zemunska 174','TamaraM@gmail.com'),
('Dragan','Paunovic','0617156145','Beogradska 47','DraganP@gmail.com'),
('Milan','Zirojevic','0648885885','Beogradska 6','MilanZ@gmail.com'),
('Stefan','Bukvic','0635445958','Obrenovacka 59','StefanB@gmail.com'),
('Bogdan','Belic','0653356725','Obrenovacka 169','BogdanB@gmail.com'),

('Nikolina','Kostic','0615315189','Zemunska 188','NikolinaK@gmail.com'),
('Steva','Zivotic','0625919335','Surcinska 101','StevaZ@gmail.com'),
('Ana','Milenkovic','0631675145','Surcinska 105','AnaM@gmail.com'),
('Natalija','Zujovic','0654912514','Surcinska 115','NatalijaZ@gmail.com'),
('Lazar','Dimitrijevic','0633416512','Beogradska 204','LazarD@gmail.com'),
('Jovan','Momcilovic','0647277111','Beogradska 50','JovanM@gmail.com'),
('Vojin','Arsic','0627446111','Toplicka 94','VojinA@gmail.com'),
('Nenad','Micovic','0659329876','Toplicka 88','NenadM@gmail.com'),
('Dusan','Ristic','0618426688','Dobanovacka 13','DusanR@gmail.com'),
('Miomir','Novovic','0627291478','Dobanovacka 14','MiomirN@gmail.com');



INSERT dbo.Zaposleni
VALUES
('Dragas','Jankelic','0622361881','Drage Spasic 135'),
('Dragan','Jankelin','0628458505','Dr Dragoljuba Sretenovica 159'),	
('Dositej','Janicic','0630668010','Dostojevskog 269'),	
('Dorotej','Janicijevic','0650372142','Djordja Tasica 127'),	
('Dojcin','Janicevic','0643525758','Djordja Ognjanovica 39'),	
('Dojcilo','Janic','0630614637','Branka sotre 1998'),	
('Dobroslav','Janikic','0638643212','Branka Cvetkovica 168'),	
('Dobrosav','Janekovic','0644766787','Brace Skerovica 614'),	
('Dobromir','Jandric','0657222460','Brace Lamijer 158'),	
('Dobromil','Janaskovic','0627586416','Beogradskog Bataljona 165'),	
('Dobroljub','Janackovic','0645133865','Belog Bagrema 92'),	
('Dobrivoje','Janackovic','0633637642','Bele Vode 49'),	
('Dobrivoj','Jamina','0651386766','Bate Vukanovic 662'),	
('Dobrica','Jamedžija','0631324220','Vladimira Rolovica 1694'),	
('Dobrinko','Jamandilovic','0642315785','Vladimira Radovanovica 31'),	
('Dobrimir','Jalic','0645416740','Vladimira Matijevica 14'),	
('Dobrilo','Jaksic','0617617003','Vladimira Dujica 131'),	
('Dobrica','Jakonic','0627068667','Vladimira copica 75'),	
('Dobrasin','Jakovcevic','0628072454','Slobodana Principa Selje 142'),	
('Dmitar','Jakovovic','0633226071','Slobodana Perovica 72'),	
('Dimitrije','Jakovljevic','0624664452','Slobodana Aligrudica 28'),
('Dimitar','Jakovljev','0654515078','Slavonskih Brigada 18'),	
('Dimco','Jakisic','0630688268','Sinise Stankovica 25'),	
('Despot','Jakic','0618044550','Stevana Luburica 15'),	
('Desimir','Jajcanin','0615634728','Stevana Filipovica 81'),	
('Denis','Jajic','0615818457','Stevana Djurdjevica 6'),	
('Deka','Jaic','0611102202','Stevana Brakusa 18'),	
('Dejan','Jazic','0645362872','Stanka Opsenice 12'),	
('Davorin','Jadranin','0657025620','Mirka Postica 7'),	
('Davor','Jagodic','0615125278','Mira Popare 34'),	
('David','Jaglicic','0637430315','Milovana Celebica 67'),	
('Daroslav','Jaglica','0614258024','Milosava Vlajica 85'),	
('Darko','Javoric','0617684711','Milorada Jovanovica 88'),	
('Darjan','Javorina','0637811467','Miloja Zakica 28'),	
('Dario','Javorac','0610643762','Milisava Dakica 181'),	
('Darijo','Jablanovic','0623554548','Mile Jevtovic 193'),	
('Darije','Jablanov','0626652531','Milana Stanivukovica 49'),	
('Danojlo','Velimanovic ','0642752054','Milana sarca 706'),	
('Danko','Veledinovic ','0658087280','Milana Minjasa 145'),	
('Danilo','Velasevic ','0644324062','Milana Milovanovica 62'),	
('Danijel','Vekovic ','0647722641','Milana Kuca 195'),	
('Dane','Vejnovic ','0613535465','Milana Jovanovica 53'),	
('Dancul','Vejinovic ','0637634752','Milana Delica 59'),	
('Damljan','Veinovic ','0612226063','Milana Dedinca 29'),	
('Damjan','Veizovic ','0611410438','Mike Mitrovica 169'),	
('Damir','Vezurovic ','0648574841','Mije Oreskog 115'),	
('Dalibor','Vatricevic ','0613703665','Mihajla Valtrovica 164'),	
('Dabo','Vatovic ','0650782682','Matije Bana 107'),	
('Dabiziv','Vatazevic ','0636275767','Mate Jerkovica 58'),	
('Dabisa','Vasojevic ','0624482844','Marka Koncara Bure 16');


INSERT dbo.Autori
VALUES
('Andzej','Sapkowski'),
('Ivo','Andric'),
('Brendon','Sanderson'),
('Agata','Kristi'),
('Antoan','Sent egziperi'),
('Stan','Lee'),
('Dzo','Akrekombi'),
('Joanne','Rowling'),
('J. R. R.','Tolkien'),
('George R.R.',' Martin'),

('Patric','Rothfuss'),
('Stephen','King'),
('Steven','Erikson'),
('Brent','Weeks'),
('Scott ','lynch'),
('Vilijam','Sekspir'),
('Milos','Crnjanski'),
('Branko','Radicevic'),
('Dositelj','Obradovic'),
('Branislav','Nusic'),

('Borislav','Stankovic'),
('Jovan Sterija','Popovic'),
('Persi','Dzekson'),
('Suzzane','Collins'),
('Stephenie ','Meyer'),
('James','Dashner'),
('C.S.','Lewis'),
(' Madeleine',' L Engle'),
('John','Green'),
('Ernest ','Cline'),

('Lewis','Carroll'),
('L. Frank','Baum'),
('George','Orwell'),
('Dante','Aligijeri'),
('Arthur Conan','Doyle'),
('Charles','Dickens'),
('Ernest','Hemingway'),
('Jules','Verne'),
('Daniel','Defoe'),
('Lav Nikolajevic','Tolstoj'),

('Rene','Gijo'),
('Fjodor','Dostojevski'),
('Mesa','Selimovic'),
('Anton Pavlovic ','Cehov'),
('Borislav','Stankovic'),
('Miguel ','de Cervantes'),
('Onore ','de Balzak'),
('Stevan','Sremac'),
('Nikolai','Gogolj'),
('Branko','Copic'),
('Marija','Robic'),
('Eva','Musinski'),
('Natasa','Popovic'),
('Robert','Jordan'),
('H.P.','Lovecraft');


INSERT  dbo.Kategorija 
VALUES
('Knjige','Sadrzi glavne zanrove knjiga'),
('Knjige za decu','Knjige za decu od 8 do 13 godina'),
('Strane knjige','Knjige na stranim jezicima'),
('Razno','Sadrzi mesane zanrove knjiga');


INSERT dbo.Izdavac
VALUES 
('Klett','011 555 1111'),
('Eduka','011 555 2222'),
('Kreativni centar','011 555 3333'),
('Logos','011 555 4444'),
('Vukan','011 555 5555'),
('Laguna','011 555 6666'),
('The English Book','011 555 7777'),
('Carobna knjiga','011 665 8877'),
('TOR fantasy','011 421 9988'),
('MARVEL comics','555 1234'),
('DC comics',' 555 5678'),
('EVRO BOOK',' 555 2662');

INSERT dbo.Zanr
VALUES

('Akcioni','Akcioni zanr ce vas uvek konstano drzati na ivici sedista,glavni likovi su uvek u situacijama visokih uloga i da bi stigli do svoga cilja moraju proci veliki rizik'),
('Avanturisticki','Avanturisticki zanr se fokusira na velika putovanja u portazi za ciljem i istrazivanjem novih lokacija, citaocima daje osecaj  uzbudjenja'),
('Biografije',' Biografije Knjizenvi zanr koji opisuje zivot neke istaknute licnosti'),
('Autobiografije','Autobiografije oblik biografije koja se pise u prvom licu'),
('Drama','Knjizevni zanr gde su glavni likovi u emotivnom konfliktu'),
('Edukativni','Sadrzi knjige u raznim edukativnim podrucijima'),
('Ekologija','Knjige koje poucavaju o cuvanju prirode i okruzenja'),
('Fantastika','Knjizevni zanr zasnovan na istrazivanju drugih svetova koje imaju svoju civilizaciju'),
('Naucna Fantastika','Knjizevni zanr koji israzuje svemir i koncepte nemoguce realnosti'),
('Horor','Knjizevni zanr koji tezi nacinima da zastrasi svoje citaoce na ne predvidjene nacine'),
('Komedija','Zanr koji tezi da nasmeje svoje citaoce'),
('Romansa','Knjizevni zanr na kome je glavni fokus veze izmedju likova'),
('Misterija','Knjizevni zanr misterija ima za cilje da izazove radoznalost u citaocu i da ga tera da razmislja o situaciji u kojoj se likovi price nalaze i pokusavaju razotkriti'),
('Psiholski','Knizevni zanr koji istrazuje psihu i motivaciju likova'),
('Stripovi','Stripovi sadrze nacrtan prikaz desavanja price uz malo reci'),
('Istorijski','Knjizenvni zanr zasnovani na istoriju'),
('Deciji','Knjizevni zanr namenjen deci'),
('Roman','Prosireni knjizevni zanr'),
('Ratna prica','Knjizenvni zanr zasnovan na vojnickoj fikciji i pricama o ratu'),
('Epska poezija','Pripoveda o podvizima i dogadjajima');


INSERT dbo.Knjiga(Naslov,Stranice,ISBN,DatumIzlaskaIzdanjaKnjige,Jezik,Cena,Kolicina,AutorID,IzdavacID,KategorijaID)
VALUES
('Poslednja zelja (Saga o vescu)',320,'9788677022341','2012-03-24','Srpski',1000,30,1,8,1),
('Mac sudbine (Saga o vescu)',368,'9788677022662','2012-04-12','Srpski',1100,20,1,8,1),
('Krv Vilenjaka (Saga o vescu)',336,'9788677022259','2012-05-13','Srpski',1200,15,1,8,1),
('Vreme prezira (Saga o vescu)',352,'9788677022297','2012-06-14','Srpski',1150,10,1,8,1),
('Vatreno krstenje (Saga o vescu)',368,'9788677022563','2012-07-15','Srpski',1050,25,1,8,1),
('Lastavicija kula (Saga o vescu)',443,'9788677023102','2012-08-16','Srpski',1200,20,1,8,1),
('Gospodarica jezera (Saga o vescu)',534,'9788677023171','2012-09-17','Srpski',1200,30,1,8,1),
('Sezona oluja (Saga o vescu sporedna prica)',367,'9788677023720','2013-02-07','Srpski',1100,15,1,8,4),
('Hari Poter i kamen mudrosti',265,'9788650509463','2010-04-19','Srpski',1200,50,8,12,1),
('Hari Poter i Dvorana tajni',292,'9788650509517','2010-05-14','Srpski',1250,40,8,12,1),

('Hari poter i zatvorenik iz askabana',334,'9788650509739','2010-06-24','Srpski',1100,30,8,12,1),
('Hari poter i vatreni pehar',651,'9788650510124','2010-07-12','Srpski',1300,20,8,12,1),
('Hari poter i red feniksa',879,'9788650510278','2010-08-16','Srpski',1400,15,8,12,1),
('Hari poter i Polukrvni princ',583,'9788650509951','2010-09-21','Srpski',1450,8,8,12,1),
('Hari poter i relikvije smrti',640,'9788650508992','2010-10-01','Srpski',1500,20,8,12,1),
('Zona Zamfirova',242,'9788652130504','2018-05-01','Srpski',500,30,48,5,1),
('Pop Cira i Pop Spira',408,'9788610009361','2014-03-01','Srpski',550,20,48,5,1),
('Sherlock Holmes: The Complete Stories',1400,'9781853268960','1996-07-07','Engleski',1500,10,35,7,3),
('Ubistvo na orijent expresu',254,'9788652128754','2017-09-22','Srpski',720,10,4,6,1),
('Mali Princ',128,'9788610001051','2013-06-21','Srpski',300,40,5,5,2),

('Carobnjak iz Oza',304,'9781840226942','2012-10-11','Srpski',400,20,32,5,2),
('Bela griva',80,'9788660892463','2012-11-07','Srpski',612,30,41,6,2),
('Iron man',100,'9788660892463','2013-06-24','Engleski',1000,10,6,10,4),
('Fantastic four',120,'9788677023300','2013-06-24','Engleski',900,13,6,10,4),
('Romeo i julija',216,'9788610017694','2016-02-13','Srpski',480,25,16,5,1),
('Hamlet',170,'8600262035417','1996-06-24','Srpski',670,20,16,5,1),
('Twenty Thousand Leagues Under the Sea',70,'9788652117536','2015-08-09','Engleski',800,30,38,7,3),
('The old man and the see',112,'9780099273967','1999-12-10','Engleski',700,10,37,7,3),
('Revizor',237,'9788617320322','2000-04-14','Srpski',600,18,49,5,1),
('Prokleta avlija',85,'9788674706398','2014-07-16','Srpski',500,30,2,5,1),

('Na Drini cuprija',352,'9788610034226','2020-09-03','Srpski',1000,50,2,5,1),
('Zlocin i kazna',508,'9788689203271','2017-06-13','Srpski',980,24,42,6,1),
('Ana Karenjina',792,'9788677109356','2012-03-15','Srpski',850,30,40,6,1),
('Rat i mir',896,'9788610024364','2018-08-17','Srpski',1200,45,40,6,1),
('Alisa u zemlji cuda',126,'8600262046628','2007-06-18','Srpski',400,65,31,5,4),
('Seobe',288,'9788652130825','2019-09-18','Srpski',450,15,17,5,1),
('To',1359,'9781444707861','2011-05-28','Srpski',1000,30,12,6,1),
('The Shining',512,'9781444720723','2011-08-20','Engleski',1100,30,12,7,3),
('Bozanstvena komedija',608,'9788664571067','2016-03-17','Srpski',800,20,34,5,1),
('Robinzon Kruso',124,'9788683583966','2004-03-25','Srpski',600,16,39,6,1),

('Gospodar prstenova Druzina prstena',432,'9788660355869','2018-06-07','Srpski',1800,30,9,6,1),
('Gospodar prstenova Dve kule',356,'9788660355876','2018-07-07','Srpski',1750,30,9,6,1),
('Gospodar prstenova Povratak Kralja',412,'9788660355883','2018-07-07','Srpski',1730,30,9,6,1),
('Hobit',400,'9780007487295','2012-04-13','Srpski',1100,10,9,6,1),
('The way of kings',1280,'9780575097360','2011-07-14','Engleski',1500,15,3,9,3),
('Words of Radiance',1328,'9780765365286','2015-08-14','Engleski',1300,10,3,9,3),
('Oathbringer',1248,'9780765365286','2017-06-15','Engleski',1400,5,3,9,3),
('Rhythm of War',1232,'9780765326386','2020-05-15','Engleski',1500,20,3,9,3),
('The Final Empire (Mistborn)',752,'9780575089914','2009-02-15','Engleski',1200,25,3,9,3),
('The Well of Ascension  (Mistborn)',804,'9780575089938','2010-11-06','Engleski',1215,15,3,9,3),

('The Hero of Ages  (Mistborn)',768,'9780575089945','2010-12-07','Engleski',1315,10,3,9,3),
('The Name of the Wind',672,'9780575081406','2008-03-07','Engleski',1215,15,11,9,3),
('The Wise Mans Fear',1008,'9780575081437','2009-03-07','Engleski',1315,17,11,9,3),
('Ostrica',568,'9788652106820','2011-05-05','Srpski',1100,12,7,6,4),
('Vesala',607,'9788652110612','2012-05-05','Srpski',1200,15,7,6,4),
('Poslednji argument kraljeva',716,'9788652114368','2014-02-09','Srpski',1300,14,7,6,4),
('Osveta',752,'9788652117796','2014-04-09','Srpski',1050,7,7,6,4),
('Junaci',680,'9788652126019','2014-06-09','Srpski',1100,12,7,6,4),
('Krvava zemlja',584,'9788652128952','2014-08-09','Srpski',1150,10,7,6,4),
('Malo mrznje',559,'9788652139897','2020-05-10','Srpski',1400,30,7,6,4),

('Matematika za Osnovnu skolu',120,'9788656754232','2014-08-22','Srpski',500,30,51,1,2),
('Engleski za Osnovnu skolu',130,'9788652139892','2014-03-16','Srpski',500,30,51,1,2),
('Srpski za Osnovnu skolu',140,'9788652139893','2014-05-12','Srpski',500,30,51,1,2),
('Zbirka zadataka iz Hemije',90,'9788652139894','2016-08-21','Srpski',400,20,51,4,2),
('Zbirka zadataka iz Fizike',100,'9788652139895','2016-03-16','Srpski',400,20,51,4,2),
('Zbirka zadataka iz Biologije',112,'9788652139896','2016-04-12','Srpski',400,20,51,4,2),
('Geografija za peti razred',80,'9788652139721','2010-05-12','Srpski',300,8,53,2,2),
('Kauboj Krsta na rodeu',60,'9788652139286','2012-03-14','Srpski',310,13,52,3,2),
('Kauboj Krsta i Toma tornado',50,'9788652139287','2013-06-10','Srpski',320,5,52,3,2),
('Kauboj Krsta i grozni Frenk',56,'9788652139285','2015-08-25','Srpski',330,10,52,3,2),

('The Eye of the World (the Wheel of Time)',670,'9780312850098','2000-03-17','Engleski',1800,10,54,7,3),
('The Shadow Rising (the Wheel of Time)',1024,'9780356503851','2003-05-23','Engleski',1400,3,54,7,3),
('The Fires Of Heaven (the Wheel of Time)',928,'9780356503868','2005-07-12','Engleski',1450,7,54,7,3),
('Lord Of Chaos (the Wheel of Time)',1040,'9780356503875','2006-08-15','Engleski',1300,11,54,7,3),
('The Dragon Reborn (the Wheel of Time)',672,'9780356503844','2007-05-11','Engleski',1350,14,54,7,3),
('A Game of Thrones (A song of ice and fire)',846,'9780006479888','2009-07-12','Engleski',1400,25,10,7,3),
('A Clash of Kings (A song of ice and fire)',927,'9780006479895','2010-08-09','Engleski',1400,15,10,7,3),
('A Feast for Crows (A song of ice and fire)',864,'9780006486121','2011-09-17','Engleski',1450,10,10,7,3),
('A Dance With Dragons (A song of ice and fire)',1256,'9780006486114','2012-10-11','Engleski',1500,10,10,7,3),
('Nekronomikon ',578,'9788660390372','2008-10-22','Srpski',3000,15,55,5,4);


INSERT dbo.KnjigaZanr
VALUES
--Poslednja zelja (Saga o vescu)
(1,1),
(1,2),
(1,8),
(1,9),
--Mac sudbine (Saga o vescu)
(2,1),
(2,2),
(2,8),
(2,9),
--Krv Vilenjaka (Saga o vescu)
(3,1),
(3,2),
(3,8),
(3,9),
--Vreme prezira (Saga o vescu)
(4,1),
(4,2),
(4,8),
(4,9),
--Vatreno krstenje (Saga o vescu)
(5,1),
(5,2),
(5,8),
(5,9),
--Lastavicija kula (Saga o vescu)
(6,1),
(6,2),
(6,8),
(6,9),
--Gospodarica jezera (Saga o vescu)
(7,1),
(7,2),
(7,8),
(7,9),
--Sezona oluja (Saga o vescu sporedna prica)
(8,1),
(8,2),
(8,8),
(8,9),
--Hari Poter i kamen mudrosti
(9,1),
(9,2),
(9,8),
(9,9),
(9,13),
--Hari Poter i Dvorana tajni
(10,1),
(10,2),
(10,8),
(10,9),
(10,13),
--Hari poter i zatvorenik iz askabana
(11,1),
(11,2),
(11,8),
(11,9),
(11,13),
--Hari poter i vatreni pehar
(12,1),
(12,2),
(12,8),
(12,9),
(12,13),
--'Hari poter i red feniksa
(13,1),
(13,2),
(13,8),
(13,9),
(13,13),
--Hari poter i Polukrvni princ
(14,1),
(14,2),
(14,8),
(14,9),
(14,13),
--Hari poter i relikvije smrti
(15,1),
(15,2),
(15,8),
(15,9),
(15,13),
--Zona Zamfirova
(16,5),
(16,11),
--Pop Cira i Pop Spira
(17,11),
--Sherlock Holmes
(18,1),
(18,13),
(18,14),
--Ubistvo na orijent expresu
(19,13),
(19,14),
--Mali Princ
(20,2),
(20,8),
(20,17),
--Carobnjak iz Oza
(21,2),
(21,8),
(21,17),
--Bela griva
(22,17),
(22,18),
--Iron man
(23,1),
(23,15),
--Fantastic four
(24,1),
(24,15),
--Romeo i julija
(25,5),
(25,12),
(25,18),
--Hamlet
(26,5),
(26,18),
--Twenty Thousand Leagues Under the Sea
(27,2),
(27,9),
(27,18),
--The old man and the see
(28,9),
(28,18),
--Revizor
(29,11),
--Prokleta Avlija
(30,18),
--Na Drini cuprija
(31,18),
--Zlocin i kazna
(32,13),
(32,14),
(32,18),
--Ana Karenjina
(33,18),
-- Rat i mir
(34,18),
(34,19),
--Alisa u zemlji cuda
(35,2),
(35,8),
(35,17),
(35,18),
--Seobe
(36,18),
--to
(37,5),
(37,9),
(37,10),
(37,13),
(37,14),
(37,18),
--The shining
(38,10),
(38,14),
(38,18),
--Bozanstvena komedija
(39,20),
--Robinzon Kruso
(40,1),
(40,18),
--'Gospodar prstenova Druzina prstena
(41,2),
(41,8),
--Gospodar prstenova Dve kule
(42,2),
(42,8),
--Gospodar prstenova Povratak Kralja
(43,2),
(43,8),
--Hobit
(44,2),
(44,8),
--The way of kings
(45,8),
(45,18),
--Words of Radiance
(46,8),
(46,18),
--Oathbringer
(47,8),
(47,18),
--Rhythm of War
(48,8),
(48,18),
--The Final Empire
(49,8),
(49,18),
--The Well of Ascension
(50,8),
(50,18),
--The Hero of Ages
(51,8),
(51,18),
--The Name of the Wind
(52,2),
(52,8),
(52,18),
--The Wise Mans Fear
(53,2),
(53,8),
(53,18),
--Ostrica
(54,2),
(54,8),
(54,18),
--Vesala
(55,2),
(55,8),
(55,18),
--Poslednji argument kraljeva
(56,2),
(56,8),
(56,18),
--Osveta
(57,2),
(57,8),
(57,18),
--Junaci
(58,2),
(58,8),
(58,18),
--Krvava zemlja
(59,2),
(59,8),
(59,18),
--Malo mrznje
(60,2),
(60,8),
(60,18),
--Matematika za Osnovnu skolu
(61,6),
--Engleski za Osnovnu skolu
(62,6),
--Srpski za Osnovnu skolu
(63,6),
--Zbirka zadataka iz Hemije
(64,6),
--Zbirka zadataka iz Fizike
(65,6),
--Zbirka zadataka iz Biologije
(66,6),
(66,7),
--Geografija za peti razred
(67,6),
(67,7),
--Kauboj Krsta na rodeu
(68,1),
(68,2),
(68,17),
--Kauboj Krsta i Toma tornado
(69,1),
(69,2),
(69,17),
--Kauboj Krsta i grozni Frenk
(70,1),
(70,2),
(70,17),
--The Eye of the World
(71,2),
(71,8),
(71,18),
--The Shadow Rising
(72,2),
(72,8),
(72,18),
--The Fires Of Heaven
(73,2),
(73,8),
(73,18),
--Lord Of Chaos
(74,2),
(74,8),
(74,18),
--The Dragon Reborn
(75,2),
(75,8),
(75,18),
--A Game of Thrones
(76,2),
(76,5),
(76,8),
(76,18),
--A Clash of Kings
(77,2),
(77,5),
(77,8),
(77,18),
--A Feast for Crows
(78,2),
(78,5),
(78,8),
(78,18),
--'A Dance With Dragons
(79,2),
(79,5),
(79,8),
(79,18),
--Nekronomikon
(80,10),
(80,14);



INSERT dbo.Kupon
VALUES
(0,'2021-03-25'),
(5,'2021-03-25'),
(10,'2021-03-25'),
(15,'2021-03-25');


INSERT dbo.Narudzbina (KupacID,KnjigaID,ZaposleniID,KuponID,UkupnaCena)
VALUES
(1,1,1,1,1000),
(1,2,1,1,1100),
(1,3,1,1,1200),
(5,3,2,2,1140),
(5,2,2,2,1045),
(7,10,3,1,1250),
(9,20,5,1,300),
(9,21,5,1,400),
(11,10,6,1,1250),
(11,11,6,1,1100),

(14,41,8,1,1800),
(14,42,8,1,1750),
(14,44,8,1,1730),
(17,41,7,3,1620),
(21,37,9,1,1000),
(21,38,9,1,1100),
(24,37,11,1,1000),
(24,38,11,1,1100),
(33,33,14,4,722.5),
(27,32,16,2,931),

(31,37,5,1,1000),
(31,76,5,1,1400),
(35,80,6,2,2850),
(29,80,16,3,2700),
(37,80,24,4,2550),
(40,41,28,1,1800),
(40,44,28,1,1750),
(44,52,1,1,1215),
(44,53,1,1,1315),
(27,46,8,1,1300),

(17,49,9,1,1200),
(18,26,9,1,670),
(34,1,2,1,1000),
(25,41,4,1,1800),
(25,42,4,1,1750),
(25,43,4,1,1730),
(46,64,18,1,400),
(46,65,18,1,400),
(46,66,18,1,400),
(22,40,12,2,570),

(13,30,18,1,500),
(13,31,18,1,1000),
(20,18,36,1,1500),
(20,19,36,1,720),
(37,18,43,4,1275),
(48,18,34,3,1350),
(50,9,9,1,1200),
(50,10,9,1,1250),
(50,11,9,1,1100),
(26,17,6,2,522.5);

INSERT dbo.DetaljiNarudzbine
VALUES
('2021-02-18','Surcinska 54','Beograd','11000',1),
('2021-02-18','Surcinska 54','Beograd','11000',2),	
('2021-02-18','Surcinska 54','Beograd','11000',3),	
('2021-08-11','Ugrinovacka 24','Zemun','23001',4),	
('2021-08-11','Ugrinovacka 24','Zemun','23001',5),	
('2021-11-27','Alekse Nenadovica 55','Vranje','27758',6),	
('2021-05-10','Alekse Dundica 136','Vlasotince','11945',7),	
('2021-05-10','Alekse Dundica 136','Vlasotince','11945',8),	
('2021-11-23','Alekse Bacvanskog 233','Veliko Gradiste','26375',9),	
('2021-11-23','Alekse Bacvanskog 233','Veliko Gradiste','26375',10),	
('2021-08-19','Lovacka 18','Novi sad','24138',11),	
('2021-08-19','Lovacka 18','Novi sad','24138',12),	
('2021-08-19','Lovacka 18','Novi sad','24138',13),	
('2021-02-11','Obilicka 16','Brus','12985',14),	
('2021-04-18','Borivoja Stevanovica 82','Brza Palanka','20598',15),	
('2021-04-18','Borivoja Stevanovica 82','Brza Palanka','20598',16),	
('2021-09-04','Bore Stankovica 276','Borca','21838',17),	
('2021-09-04','Bore Stankovica 276','Borca','21838',18),
('2021-09-08','Bore Markovica 294','Boljevac ','17384',19),	
('2021-05-26','Bogoboja Atanackovica 267','Bogatic ','11035',20),
('2021-12-20','Bogdana Zerajica 300','Blace','32868',21),	
('2021-12-20','Bogdana Zerajica 300','Blace','32868',22),		
('2021-07-21','Bogdana Popovica 180','Beocin','22755',23),	
('2021-08-07','Bogdana Bolte 200','Beograd','27756',24),	
('2021-05-18','Beogradska 47','Beograd','31057',25),	
('2021-12-12','Buljubasina Voda 61','Belo Polje','26776',26),	
('2021-12-12','Buljubasina Voda 61','Belo Polje','26776',27),
('2021-09-08','Bulevar Vojvode 180','Bela Crkva','12819',28),	
('2021-09-08','Bulevar Vojvode 180','Bela Crkva','12819',29),	
('2021-10-24','Bulevar Umetnosti 163','Beograd','20052',30),	
('2021-04-07','Bulevar Nikole 98','Begec','15222',31),	
('2021-11-24','Bulevar Mira 72','Backi Petrovac','24259',32),	
('2021-01-09','Brane cosica 42','Backi Jarak','34962',33),	
('2021-10-24','Brace Todorovic 46','Backa Topola','19843',34),	
('2021-10-24','Brace Todorovic 46','Backa Topola','19843',35),	
('2021-10-24','Brace Todorovic 46','Backa Topola','19843',36),		
('2021-04-05','Beogradska 50','Beograd','32523',37),	
('2021-04-05','Beogradska 50','Beograd','32523',38),
('2021-04-05','Beogradska 50','Beograd','32523',39),	
('2021-11-01','Brace Miladinov 243','Bajmok','18717',40),
('2021-11-03','Brace Marinkovic 34','Bajina Basta','16278',41),	
('2021-11-03','Brace Marinkovic 34','Bajina Basta','16278',42),	
('2021-10-07','Brace Krsmanovic 247','Babusnica','34160',43),	
('2021-10-07','Brace Krsmanovic 247','Babusnica','34160',44),	
('2021-02-26','Brace Jugovica 83','Arandjelovac','31355',45),	
('2021-01-12','Brace Jerkovic 165','Beograd','16149',46),	
('2021-12-26','Dobanovacka 14','Beograd','24018',47),	
('2021-12-26','Dobanovacka 14','Beograd','24018',48),
('2021-12-26','Dobanovacka 14','Beograd','24018',49),
('2021-09-30','Brace Amar 188','Aleksandrovac','33718',50);	

