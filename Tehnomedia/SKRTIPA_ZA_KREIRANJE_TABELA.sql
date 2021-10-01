USE [master]
GO

/****** Object:  Database [TehnoMedia]    Script Date: 2/21/2021 9:58:51 PM ******/
CREATE DATABASE [TehnoMedia]
-- CONTAINMENT = NONE
-- ON  PRIMARY 
--( NAME = N'test', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\test.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
-- LOG ON 
--( NAME = N'test_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\test_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
-- WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO

USE [TehnoMedia]
GO


IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TehnoMedia].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [TehnoMedia] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [TehnoMedia] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [TehnoMedia] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [TehnoMedia] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [TehnoMedia] SET ARITHABORT OFF 
GO

ALTER DATABASE [TehnoMedia] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [TehnoMedia] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [TehnoMedia] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [TehnoMedia] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [TehnoMedia] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [TehnoMedia] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [TehnoMedia] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [TehnoMedia] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [TehnoMedia] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [TehnoMedia] SET  DISABLE_BROKER 
GO

ALTER DATABASE [TehnoMedia] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [TehnoMedia] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [TehnoMedia] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [TehnoMedia] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [TehnoMedia] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [TehnoMedia] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [TehnoMedia] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [TehnoMedia] SET RECOVERY FULL 
GO

ALTER DATABASE [TehnoMedia] SET  MULTI_USER 
GO

ALTER DATABASE [TehnoMedia] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [TehnoMedia] SET DB_CHAINING OFF 
GO

ALTER DATABASE [TehnoMedia] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [TehnoMedia] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [TehnoMedia] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [TehnoMedia] SET QUERY_STORE = OFF
GO

ALTER DATABASE [TehnoMedia] SET  READ_WRITE 
GO

---TABELE---

USE [TehnoMedia]
GO

/****** Object:  Table [dbo].[ErrorLog]    Script Date: 2/21/2021 10:00:40 PM ******/
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

USE [TehnoMedia]
GO

/****** Object:  Table [dbo].[NewsLetter]    Script Date: 2/21/2021 10:01:33 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[NewsLetter](
	[idNewsLetter] [bigint] IDENTITY(1,1) NOT NULL,
	[email] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_NewsLetter] PRIMARY KEY CLUSTERED 
(
	[idNewsLetter] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [TehnoMedia]
GO

/****** Object:  Table [dbo].[Prodavnice]    Script Date: 2/21/2021 10:02:17 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Prodavnice](
	[idProdavnica] [bigint] IDENTITY(1,1) NOT NULL,
	[imeProdavnice] [nvarchar](40) NOT NULL,
	[adresaProdavnice] [nvarchar](50) NOT NULL,
	[brojTelefona] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Prodavnice] PRIMARY KEY CLUSTERED 
(
	[idProdavnica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [TehnoMedia]
GO

/****** Object:  Table [dbo].[RadnoVreme]    Script Date: 2/21/2021 10:02:32 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[RadnoVreme](
	[idRadnoVreme] [bigint] IDENTITY(1,1) NOT NULL,
	[dan] [nvarchar](15) NULL,
	[vremePocetka] [time](4) NULL,
	[vremeZavrsetka] [time](4) NULL,
 CONSTRAINT [PK_RadnoVreme] PRIMARY KEY CLUSTERED 
(
	[idRadnoVreme] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [TehnoMedia]
GO

/****** Object:  Table [dbo].[ProdavnicaRadnoVreme]    Script Date: 2/21/2021 10:02:08 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ProdavnicaRadnoVreme](
	[idProdavnicaRadnoVreme] [bigint] IDENTITY(1,1) NOT NULL,
	[idProdavnica] [bigint] NOT NULL,
	[idRadnoVreme] [bigint] NOT NULL,
 CONSTRAINT [PK_ProdavnicaRadnoVreme] PRIMARY KEY CLUSTERED 
(
	[idProdavnicaRadnoVreme] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ProdavnicaRadnoVreme]  WITH CHECK ADD  CONSTRAINT [FK_ProdavnicaRadnoVreme_Prodavnice] FOREIGN KEY([idProdavnica])
REFERENCES [dbo].[Prodavnice] ([idProdavnica])
GO

ALTER TABLE [dbo].[ProdavnicaRadnoVreme] CHECK CONSTRAINT [FK_ProdavnicaRadnoVreme_Prodavnice]
GO

ALTER TABLE [dbo].[ProdavnicaRadnoVreme]  WITH CHECK ADD  CONSTRAINT [FK_ProdavnicaRadnoVreme_RadnoVreme] FOREIGN KEY([idRadnoVreme])
REFERENCES [dbo].[RadnoVreme] ([idRadnoVreme])
GO

ALTER TABLE [dbo].[ProdavnicaRadnoVreme] CHECK CONSTRAINT [FK_ProdavnicaRadnoVreme_RadnoVreme]
GO

USE [TehnoMedia]
GO

/****** Object:  Table [dbo].[Postovi]    Script Date: 2/21/2021 10:01:54 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Postovi](
	[idPost] [bigint] IDENTITY(1,1) NOT NULL,
	[autor] [nvarchar](25) NOT NULL,
	[datumKreiranja] [datetime] NOT NULL,
	[naslov] [nvarchar](30) NOT NULL,
	[sadrzaj] [ntext] NOT NULL,
 CONSTRAINT [PK_Postovi] PRIMARY KEY CLUSTERED 
(
	[idPost] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

USE [TehnoMedia]
GO

/****** Object:  Table [dbo].[Komentari]    Script Date: 2/21/2021 10:01:08 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Komentari](
	[idKomentar] [bigint] IDENTITY(1,1) NOT NULL,
	[idPost] [bigint] NOT NULL,
	[ime] [nchar](20) NOT NULL,
	[sadrzaj] [ntext] NOT NULL,
	[datumKreiranja] [datetime] NOT NULL,
	[email] [nchar](20) NOT NULL,
 CONSTRAINT [PK_Komentari] PRIMARY KEY CLUSTERED 
(
	[idKomentar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[Komentari]  WITH CHECK ADD  CONSTRAINT [FK_Komentari_Postovi] FOREIGN KEY([idPost])
REFERENCES [dbo].[Postovi] ([idPost])
GO

ALTER TABLE [dbo].[Komentari] CHECK CONSTRAINT [FK_Komentari_Postovi]
GO

USE [TehnoMedia]
GO

/****** Object:  Table [dbo].[Proizvod]    Script Date: 2/21/2021 10:02:23 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Proizvod](
	[idProizvod] [bigint] IDENTITY(1,1) NOT NULL,
	[brendProizvoda] [nvarchar](50) NOT NULL,
	[sifraProizvoda] [nvarchar](20) NOT NULL,
	[imeProizvoda] [nvarchar](70) NOT NULL,
	[detaljiProizvoda] [ntext] NULL,
	[kolicina] [bigint] NOT NULL,
	[cena] [float] NOT NULL,
	[istaknuto] [tinyint] NULL,
	[akcijskaCena] [float] NULL,
 CONSTRAINT [PK_Proizvod] PRIMARY KEY CLUSTERED 
(
	[idProizvod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

USE [TehnoMedia]
GO

/****** Object:  Table [dbo].[Kategorije]    Script Date: 2/21/2021 10:00:49 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Kategorije](
	[idKategorija] [bigint] IDENTITY(1,1) NOT NULL,
	[imeKategorije] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Kategorije] PRIMARY KEY CLUSTERED 
(
	[idKategorija] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [TehnoMedia]
GO

/****** Object:  Table [dbo].[KategorijeProizvoda]    Script Date: 2/21/2021 10:01:01 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[KategorijeProizvoda](
	[idKategorijaProizvoda] [bigint] IDENTITY(1,1) NOT NULL,
	[idProizvod] [bigint] NOT NULL,
	[idKategorija] [bigint] NOT NULL,
 CONSTRAINT [PK_KategorijeProizvoda] PRIMARY KEY CLUSTERED 
(
	[idKategorijaProizvoda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO



ALTER TABLE [dbo].[KategorijeProizvoda]  WITH CHECK ADD  CONSTRAINT [FK_KategorijeProizvoda_Kategorije] FOREIGN KEY([idKategorija])
REFERENCES [dbo].[Kategorije] ([idKategorija])
GO

ALTER TABLE [dbo].[KategorijeProizvoda] CHECK CONSTRAINT [FK_KategorijeProizvoda_Kategorije]
GO

ALTER TABLE [dbo].[KategorijeProizvoda]  WITH CHECK ADD  CONSTRAINT [FK_KategorijeProizvoda_Proizvod] FOREIGN KEY([idProizvod])
REFERENCES [dbo].[Proizvod] ([idProizvod])
GO

ALTER TABLE [dbo].[KategorijeProizvoda] CHECK CONSTRAINT [FK_KategorijeProizvoda_Proizvod]
GO

USE [TehnoMedia]
GO

/****** Object:  Table [dbo].[Korisnik]    Script Date: 2/21/2021 10:01:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Korisnik](
	[idKorisnik] [bigint] IDENTITY(1,1) NOT NULL,
	[ime] [nvarchar](20) NOT NULL,
	[prezime] [nvarchar](25) NOT NULL,
	[adresa] [nvarchar](35) NOT NULL,
	[brojTelefona] [nvarchar](15) NULL,
	[email] [nvarchar](25) NOT NULL,
	[password] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Korisnik] PRIMARY KEY CLUSTERED 
(
	[idKorisnik] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [TehnoMedia]
GO

/****** Object:  Table [dbo].[Kupon]    Script Date: 2/21/2021 10:01:24 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Kupon](
	[idKupon] [bigint] IDENTITY(1,1) NOT NULL,
	[nazivKupona] [nchar](10) NOT NULL,
	[vrednostKupona] [float] NOT NULL,
	[datumIsteka] [datetime] NOT NULL,
	[ponovnaUpotreba] [tinyint] NOT NULL,
 CONSTRAINT [PK_Kupon] PRIMARY KEY CLUSTERED 
(
	[idKupon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [TehnoMedia]
GO

/****** Object:  Table [dbo].[Porudzbina]    Script Date: 2/21/2021 10:01:43 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Porudzbina](
	[idPorudzbina] [bigint] IDENTITY(1,1) NOT NULL,
	[idProizvod] [bigint] NOT NULL,
	[idKorisnik] [bigint] NOT NULL,
	[idKupon] [bigint] NULL,
	[ukupnaKolicina] [int] NOT NULL,
	[ukupnaCena] [float] NOT NULL,
 CONSTRAINT [PK_Porudzbina] PRIMARY KEY CLUSTERED 
(
	[idPorudzbina] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Porudzbina]  WITH CHECK ADD  CONSTRAINT [FK_Porudzbina_Korisnik] FOREIGN KEY([idKorisnik])
REFERENCES [dbo].[Korisnik] ([idKorisnik])
GO

ALTER TABLE [dbo].[Porudzbina] CHECK CONSTRAINT [FK_Porudzbina_Korisnik]
GO

ALTER TABLE [dbo].[Porudzbina]  WITH CHECK ADD  CONSTRAINT [FK_Porudzbina_Kupon] FOREIGN KEY([idKupon])
REFERENCES [dbo].[Kupon] ([idKupon])
GO

ALTER TABLE [dbo].[Porudzbina] CHECK CONSTRAINT [FK_Porudzbina_Kupon]
GO

ALTER TABLE [dbo].[Porudzbina]  WITH CHECK ADD  CONSTRAINT [FK_Porudzbina_Proizvod] FOREIGN KEY([idProizvod])
REFERENCES [dbo].[Proizvod] ([idProizvod])
GO

ALTER TABLE [dbo].[Porudzbina] CHECK CONSTRAINT [FK_Porudzbina_Proizvod]
GO

USE [TehnoMedia]
GO


/****** Object:  Table [dbo].[DetaljiPorudzbine]    Script Date: 2/21/2021 10:00:31 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DetaljiPorudzbine](
	[idDetaljiPorudzbine] [bigint] IDENTITY(1,1) NOT NULL,
	[idPorudzbina] [bigint] NOT NULL,
	[status] [nvarchar](20) NOT NULL,
	[placeno] [nvarchar](10) NOT NULL,
	[nacinPlacanja] [nvarchar](20) NOT NULL,
	[imePorucioca] [nvarchar](20) NOT NULL,
	[prezimePorucioca] [nvarchar](30) NOT NULL,
	[adresaPorucioca] [nvarchar](30) NOT NULL,
	[grad] [nvarchar](25) NOT NULL,
	[postanskiBroj] [nvarchar](50) NOT NULL,
	[napomena] [text] NULL,
	[datumPorudzbine] [date] NOT NULL,
 CONSTRAINT [PK_DetaljiPorudzbine] PRIMARY KEY CLUSTERED 
(
	[idDetaljiPorudzbine] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[DetaljiPorudzbine]  WITH CHECK ADD  CONSTRAINT [FK_DetaljiPorudzbine_Porudzbina] FOREIGN KEY([idPorudzbina])
REFERENCES [dbo].[Porudzbina] ([idPorudzbina])
GO

ALTER TABLE [dbo].[DetaljiPorudzbine] CHECK CONSTRAINT [FK_DetaljiPorudzbine_Porudzbina]
GO


--INSERTI--

INSERT INTO dbo.NewsLetter
VALUES
('tanja@yahoo.com'),	
('tamara@yahoo.com'),	
('tajana@yahoo.com'),	
('senka@hotmail.com'),	
('sena@yahoo.com'),	
('selena@yahoo.com'),	
('sara@hotmail.com'),	
('sanja@gmail.com'),	
('sandra@hotmail.com'),	
('sanda@yahoo.com'),	
('danka@hotmail.com'),	
('danijela@hotmail.com'),	
('danica@raf.rs'),	
('dana@hotmail.com'),	
('damljanka@gmail.com'),	
('damjanka@gmail.com'),	
('damjana@gmail.com'),	
('daliborka@gmail.com'),	
('dafina@raf.rs'),	
('daca@hotmail.com'),	
('vera@yahoo.com'),	
('velimirka@yahoo.com'),	
('veliborka@raf.rs'),	
('vasilisa@raf.rs'),	
('vasilija@raf.rs'),	
('varvara@yahoo.com'),	
('valarija@raf.rs'),	
('valentina@raf.rs');


INSERT INTO dbo.Prodavnice
VALUES
('Prodavnica R10 Aleksinac','Knjaza Miloša 20','0646478600'),
('Prodavnica R28 Bela Palanka','Srpskih vladara 68','0691647138'),
('Prodavnica R46 Beograd','Auto-put za Zagreb 18','0691647691'),
('Prodavnica R38 Beograd','Agostina Neta 14','0691647696'),
('Prodavnica R47 Beograd','Cara Nikolaja II 41','0691647063'),
('Prodavnica R30 Beograd','Žička br 1','069 164 7681'),
('Prodavnica R36 Beograd','Vojvode Stepe 318','0691647686'),
('Prodavnica R42 Beograd','Požeška 72','0646478611'),
('Prodavnica R50 Beograd','Kolarčeva 7','0691647175'),
('Prodavnica R5 Boljevac','Svetosavka 3L/2','0646472429'),
('Prodavnica R9 Bor','Đorđa Vajferta 5/1','0666478600');


INSERT INTO dbo.RadnoVreme
VALUES
('Ponedeljak','08:00:00','20:00:00'),
('Utorak','08:00:00','20:00:00'),
('Sreda','08:00:00','20:00:00'),
('Četvrtak','08:00:00','20:00:00'),
('Petak','08:00:00','20:00:00'),
('Subota','08:00:00','15:00:00'),
('Subota','08:00:00','20:00:00'),
('Subota','09:00:00','19:00:00'),
('Subota','09:00:00','20:00:00'),
('Nedelja','09:00:00','15:00:00'),
('Nedelja','09:00:00','20:00:00'),
('Nedelja',null,null);


INSERT INTO dbo.ProdavnicaRadnoVreme
VALUES
--Radni dani su svuda isti
(1,1),(1,2),(1,3),(1,4),(1,5),
(2,1),(2,2),(2,3),(2,4),(2,5),
(3,1),(3,2),(3,3),(3,4),(3,5),
(4,1),(4,2),(4,3),(4,4),(4,5),
(5,1),(5,2),(5,3),(5,4),(5,5),
(6,1),(6,2),(6,3),(6,4),(6,5),
(7,1),(7,2),(7,3),(7,4),(7,5),
(8,1),(8,2),(8,3),(8,4),(8,5),
(9,1),(9,2),(9,3),(9,4),(9,5),
(10,1),(10,2),(10,3),(10,4),(10,5),
(11,1),(11,2),(11,3),(11,4),(11,5),
--Varijacije radnog vremena vikendom
(1,6),(1,10),
(2,7),(2,11),
(3,8),(3,12),
(4,9),(4,12),
(5,6),(5,11),
(6,8),(6,10),
(7,7),(7,12),
(8,6),(8,12),
(9,8),(9,11),
(10,7),(10,10),
(11,9),(11,12);

INSERT INTO dbo.Postovi
VALUES
('Branislav Lalić','2020-01-17 12:32:12','Radno vreme na dan državnosti','Za vreme predstojećeg državnog praznika Sretenja – Dana državnosti, u ponedeljak i utorak, 15. i 16. februara Tehnomedia će raditi po izmenjenom režimu rada.
Prodavnice će raditi od 9 do 15 sati, osim maloprodajnih objekata u Nišu u Bulevaru Medijana 15 i u Beogradu u Agostina Neta 14, koje će biti otvorene od 9 do 17 sati.
Prodavnice koje su u okviru tržnih centara radiće po radnom vremenu tržnog centra.'),

('Ana Marković','2020-05-05 09:00:12','Za nju i njega','Ne morate više da posećujete frizerske salone i da dajete veliki novac za šišanje, friziranje, feniranje, negu, već sada možete sve sami obaviti kod kuće.
Potreban vam je samo dobar aparat. Bez razmišljanja odlučite se za Remington. Izaberite: prese za kosu, figaro, fenove, aparate za brijanje, trimere.
U Tehnomedia maloprodajnim objektima u ovom periodu možete kupiti neki od ovih aparata i uštedeti.
Iskoristite ovu pogodnost i nabavite aparat za sebe i svoju drugu polovinu po neverovatno povoljnoj ceni.'),

('Ivan Todorović','2020-07-11 15:00:00','Fitens sat ili narukvica','Odlična zamena za personalnog trenera i modernog fitnes asistenta je fitnes sat ili narukvica.
Ono će pratiti vašu fizičku aktivnost, a ukoliko se bavite sportom rekreativno ili profesionalno ovaj gedžet vam je neophodan.
Veoma su funkcionalni a poseduju brojne mogućnosti. Ako se u vašem organizmu dese neke promene i o tome će vas obavestiti.'),

('Ognjen Popović','2020-07-27 17:32:15','Torta ljubavi','Smesu pokušajte da podelite na dva identična dela pre pečenja.
Torta bi trebala da ima 4 sprata. Najbolje je ispeći dva patišpanja i svaki od njih jednom iseči.
Radite to pažljivo, jer ovaj patišpanj nakon pečenja bude lepljiv pa ga je teže rezati, zato nemojte da pečete sve odjednom.
Pecite na 180 stepeni oko 25 do 30 minuta, odnosno dok čačkalica ne izađe čista kada je ubodete u sredinu patišpanja.
Nakon što se patišpanj malo ohladi, stavite ga u zamrzivač na oko sat vremena. Kada se malo ohladi i delimično zamrzne, biće ih lakše iseći.
Isecite patišpanj tako da dobijete četiri približno jednaka dela.'),

('Filip Prottić','2020-09-23 18:45:23','Huawei za dan zaljubljenih','Huawei smart watch je gedžet elegantnog dizajna koji prati najrazličitije sportske discipline.
Ponuda u Tehnomedia prodavnicama je izuzetna. On je vaš verni pratilac zdravlja i sporta. Baterija će vas dugo služiti. Brojčanik sata je na habanje otporan.
Veoma je udoban za nošenje. Tehnologija je izuzetna.
Svaki od modela ima svoj dizajn kaiša. Displej AMOLED kao i odlična rezolucija sa savršenom gustinom piksela i kontrasti čini satove ovog brenda izuzetnim.'),

('Miloš Biković','2021-01-07 09:55:11','Mini a moćan','Ovaj iPad je pravo čudo u džepnom formatu. Zbog laganog i tankog dizajna postaće vaš najbolji prijatelj.
Neverovatno brz, udoban dok ga držite u ruci i veoma lagan zadovoljiće sve vaše potrebe.
Zahvaljujući težini od 300 grama kao i tome što je tanak 6,1 mm jednostavno ćete ga izvaditi iz torbe, džepa ili nositi u ruci. Kao i kod prethodnih modela veličina displeja kao i kućište su isti.
Čip A12 Bionic sa Neural Engineom, 7,9-inčni Retina ekran sa True Tone i olovkom Apple Pencil zabeležiće sve što vam padne na pamet.'),

('Branko Ćopić','2021-02-15 19:15:43','Samsung poklon','Elegantan dizaj i vrhunski zvuk idu zajedno i zato iskoristite ovu pogodnost i Samsung promociju.
Ako se odlučite za kupovinu The Frame modela veličine ekrana 50″ ili više u tom periodu na poklon dobijate jedinstveni HW-S40T model zvučnika.
Samsung TV The Serif su takođe sjajni televizori sa brojnim mogućnostima i ako izaberete neki od ovih modela, na dar dobijate HW-S41T model zvučnika.'),

('Marko Lazarević','2021-02-27 11:37:30','Samsung za dvoje','Bez mobilnog telefona ne možemo da zamislimo svakodnevni život.
U mnogim situacijama nam omogućavaju funkcionisanje, rešavaju važne stvari i dobro nas zabave.
Jedan od najtraženijih, najprodavanijih, najpopularnijih i najkvalitetnijih je Samsung.
Posetite Tehnomedia maloprodajne objekte jer je u toku specijalna promocija i obradujte sebe i svoju drugu polovinu Samsung telefonom.'),

('Katarina Matić','2021-04-03 11:00:30','Xiaomi mi TV stick','Xiaomi Smart TV Box MI TV STICK EU izgleda kao USB.
Funkcionalno se ne razlikuje od Android TV Bok-a. Ovo je minijaturni računar koji sadrži četvorojezgarni procesor (4 k 1,4 GHz Cortek A53),
1 GB RAM-a, 8 GB interne memorije i pravi Android TV sistem.
Na vrhu uređaja nalazi se HDMI izlaz koji direktno povežete sa televizorom, a pored njega postoji samo microUSB ulaz koji se koristi za napajanje.'),

('Petar Petrović','2021-07-01 08:30:32','Testirajte najbolje','Niko se ne raduje kada je potrebno da opere veliku količinu tanjira, šerpi…Pravi je momenat da posetite
Tehnomedia maloprodajne objekte i nabavite Bosch sudomašinu. Ona je vaša idealna pomoćnica i sve će uraditi umesto vas.
Vaše je samo da lepo složite prljavo suđe i podesite određene funkcije. Kuhinja nije samo mesto za kuvanje i obedovanje, već i za razgovor, čitanje, radimo.
Bosch je i na to mislio jer su mašine izuzetno tihe. Bosch garantuje za kvalitet svojih proizvoda i sada vam se pruža prilika da testirate najbolje.
Bosch modeli su visoke energetske efikasnosti, sa odličnim bezbednosnim mehanizmima i sjajnim izborom programa, dodatnim korpama za escajg.');

INSERT INTO dbo.Komentari
VALUES
(1,'Mladen','Odlične informacije u pravo vreme! Hvala na ažuriranju!','2021-01-17 13:00:12','mladen@gmail.com'),
(2,'Ivana','Prava stvar ako želite da obradujete svoje bližnje!','2020-05-07 10:12:10','ivana@gmail.com'),
(2,'Marko','Kupio sam devojci, odusevila se!','2020-05-07 11:15:10','marko@gmail.com'),
(3,'Ilija','Ko se bavi sportom, preporučio bih, stvarno pomaže.','2020-07-15 13:17:05','ilija@gmail.com'),
(3,'Јаnko','Kvalitet je stvarno dobar, pri vežbanju sat čvrsto stoji na ruci!','2020-07-16 12:10:05','janko@yahoo.com'),
(3,'Vojislav','Bacanje para, ljudi ne zamajavajte se ovim stvarima!','2020-07-16 12:15:07','vojislav@yahoo.com'),
(5,'Mara','Super telefon po super ceni, zadovoljna sam!','2020-09-23 19:13:03','mara@gmail.com'),
(5,'Miloš','Kinezi su se opet potrudili, odlična mašinica.','2020-09-26 14:57:08','miloš@gmail.com'),
(6,'Sara','Ko se bavi IT-om, super tablet, jako dobre performanse, uživanje je raditi.','2021-01-08 17:11:11','sara@gmail.com'),
(7,'Branko','Previše para za to što se dobija, u tom cenovnom rangu se mogu naći mnogo bolji uređaji.','2021-02-15 16:54:03','branko@gmail.com'),
(7,'Verica','Solidan telefon za te pare....','2021-02-16 19:12:56','verica@hotmail.com'),
(9,'Radovan','Tv stick koji pruža maksimalno uživanje, ljudi svaka preporuka!!','2021-04-05 21:22:23','radovan@gmail.com'),
(9,'Jasna','Ja sam oduševljena brojem funckija, i sposobnostima ovog uređaja, sve pohvale!','2021-04-07 07:13:45','jasna@gmail.com'),
(9,'Mirko','Kupio sam klincima. Klinci su oduševljeni, a i ja zajedno s njima!','2021-04-08 11:27:12','mirko@gmail.com'),
(10,'Labud','Može da opere i najtvrdokornije mrlje, preporučujem ljudima sa malom decom, na deci je da se isprljaju, vaše je da ih operete(samo odeću).','2021-07-04 12:00:35','labud@gmail.com');

INSERT INTO dbo.Proizvod
VALUES
('ELECTROLUX ','ERN1200FOW','Ugradni frižider sa jednim vratima',
'Tip: Ugradni
Sistem hlađenja: Samootapajući
Energetski razred: A+
Kapacitet: 106 l',21,26550.6,0,null),

('LIEBHERR','LI0306018','Ugradni frižider sa jednim vratima IK 3524 Comfort',
'Tip: Ugradni
Sistem hlađenja: Smart frost
Energetski razred	A++
Kapacitet	306 l',45,94251.50,0,null),

('LIEBHERR','LI0306025','Ugradni frižider sa jednim vratima IKS 1620 Comfort',
'Tip: Ugradni
Sistem hlađenja: Samootapajući
Energetski razred: A++
Kapacitet: 151 l',12,112456.0,1,null),

('LIEBHERR','LI0306022','Ugradni frižider sa jednim vratima IKS 2334 Comfort',
'Tip: Ugradni
Sistem hlađenja: Smart frost
Energetski razred: A++
Kapacitet: 201 l',33,110500.0,0,10000.0),

('BOSCH','KIL42AFF0','Ugradni frižider',
'Tip: Ugradni
Sistem hlađenja: Statički
Energetski razred: A++
Kapacitet: 195 l',76,69999.21,1,null),

('BEKO','WTV8735XC0ST','Mašina za pranje veša',
'Kapacitet pranja veša: 8
Klasa energetske efikasnosti: 10% efikasniji od A+++
Maksimalna brzina centrifuge: 1400
Nivo buke tokom pranja: 56 dBA',145,42300.5,0,39500),

('BEKO','WTV9633XS0','Mašina za pranje veša',
'Kapacitet pranja veša: 9
Klasa energetske efikasnosti: A+++
Maksimalna brzina centrifuge: 1200
Nivo buke tokom pranja: 52 dBA',52,40300.0,0,null),

('WHIRLPOOL','FWF71253WEU','Mašina za pranje veša',
'Tip: Samostojeća
Energetski razred: A+++
Broj obrtaja centrifuge: 1200 obr/min
Kapacitet: 7 kg
Boja: Bela',15,32500.0,0,null),

('ELECTROLUX','EW2T5261E','Mašina za pranje veša',
'Tip: Samostojeća
Energetski razred: A++
Broj obrtaja centrifuge: 1200 obr/min
Učinak ceđenja: B
Kapacitet: 6 kg
Boja: Bela',56,49999.0,1,null),

('ELECTROLUX ','EW6T4261','Mašina za pranje veša PerfectCare 600',
'Tip: Samostojeća
Energetski razred: A+++
Broj obrtaja centrifuge: 1200 obr/min
Učinak ceđenja: B
Kapacitet: 6 kg
Boja: Bela',15,47900.55,0,null),

('WHIRLPOOL','AWE55208','Mašina za pranje veša Top Load',
'Tip: Samostojeća
Energetski razred: A+
Broj obrtaja centrifuge: 800 obr/min
Kapacitet: 5.5 kg
Boja: Bela',5,19950.6,0,null),

('ALFA PLAM','S1405513G6','Električni šporet',
'Boja: Bela
Vrsta ploče za kuvanje: Ringle
Vrsta rerne: Konvencionalna
Zapremina rerne: 70 l',45,23599.0,1,null),

('VOX','CHT5001','Električni šporet',
'Boja: Bela
Energetski razred: B
Vrsta ploče za kuvanje: Staklokeramička
Zapremina rerne: 50 l',51,25999.0,0,null),

('MILAN BLAGOJEVIC','NL60','Električni šporet',
'Boja:Bela
Vrsta ploče za kuvanje:Ringle
Zapremina rerne:60 l',45,21700.55,0,19500.0),

('GORENJE ','EC52CLI','Električni šporet',
'Boja: Slonova kost
Energetski razred: A
Vrsta ploče za kuvanje: Staklokeramička
Zapremina rerne: 70 l',20,49999.0,0,null),

('ELECTROLUX ','EKC61960OX','Električni šporet',
'Boja: Nerđajući čelik
Energetski razred: A
Vrsta ploče za kuvanje: Staklokeramička
Zapremina rerne: 54 l',5,53999.0,1,null),

('BOSCH ','HKN390150','Električni šporet',
'Boja: Siva
Energetski razred: A
Vrsta ploče za kuvanje: Staklokeramička
Zapremina rerne: 66 l',11,69999.0,0,null),

('ELECTROLUX ','EKC6430AOX','Električni šporet',
'Boja: Nerđajući čelik
Energetski razred: A
Vrsta ploče za kuvanje: Staklokeramička
Zapremina rerne: 73 l',32,65900.55,0,61000),

('HANSA ','FCMX58099','Kombinovani šporet',
'Vrsta ploče za kuvanje: Ringla/Gorionik
Vrste rerne: Ventilatorska
Zapremina rerne: 62 l
Energetski razred: A',1,32000.0,0,null),

('GORENJE ','K5111WG','Kombinovani šporet',
'Vrsta ploče za kuvanje: Ringla/Gorionik
Vrste rerne :Konvencionalna
Zapremina rerne :68 l
Energetski razred: A',78,54499.0,0,null),

('GORENJE ','K6351WF','Kombinovani šporet',
'Vrsta ploče za kuvanje: Ringla/Gorionik
Vrste rerne: Multifunkcionalna
Zapremina rerne: 71 l
Energetski razred: A',7,27990.0,1,null),

('GORENJE ','G5112WJ','Šporet na gas',
'Boja: Bela
Energetski razred: A+
Vrste rerne: Plinska
Zapremina rerne: 70 l
Dimenzije: 50 x 85 x 59.4 cm',13,29999.0,1,null),

('HANSA ','FCGI63022','Šporet na gas',
'Boja: Inox
Energetski razred: A
Vrste rerne: Plinska
Zapremina rerne: 56 l
Dimenzije: 60 x 85 x 60 cm',100,37999.6,0,35200.0),

('VOX','GHT640SB','Šporet na gas',
'Boja: Inox
Energetski razred: A
Vrste rerne :Ventilatorska
Zapremina rerne: 60 l',45,26550.5,0,null),

('VOX ','GHT640W','Šporet na gas',
'Boja: Bela
Energetski razred: A
Vrste rerne: Ventilatorska
Zapremina rerne: 60 l
Dimenzije:60 x 85 x 60 cm',54,23999.7,1,null),

('GORENJE','DU611B','Aspirator',
'Tip:Standardni
Način ugradnje: Podugradni
Upravljanje: Mehaničko (Prekidač)
Širina: 59.9 cm',30,7500.0,0,null),

('BOSCH','DUL62FA51','Aspirator',
'Tip: Standardni
Način ugradnje: Podugradni
Upravljanje: Mehaničko (Prekidač)
Širina: 60 cm',24,15990.0,1,null),

('GORENJE','WHU629AX/M','Aspirator',
'Tip: Standardni
Način ugradnje: Podugradni
Upravljanje: Mehaničko (Dugmad)
Širina: 59.6 cm',11,17450.6,0,null),

('BOSCH','DWP96BC50','Aspirator',
'Tip: Kaminski
Način ugradnje: Zidni
Upravljanje: Mehaničko (Dugmad)
Širina: 90 cm',3,30000.9,0,24600.0),

('ELECTROLUX','LFV316K','Aspirator',
'Tip: Kaminski
Način ugradnje: Zidni
Upravljanje: Mehaničko (Dugmad)
Širina: 59.8 cm',9,32990.0,0,null),

('ELICA ','MISSYIX/A/90','Aspirator',
'Tip: Kaminski
Način ugradnje: Zidni
Upravljanje: Mehaničko (Prekidač)
Širina: 90 cm',87,14990.0,1,null),

('VOX','PIO650GL','Aspirator',
'Tip: Teleskopski (na izvlačenje)
Način ugradnje: Ugradni
Upravljanje: Mehaničko (Prekidač)
Širina: 60 cm',0,7999.0,0,5500.0),

('ELICA','14LUXGRIX/A/60','Aspirator elite',
'Tip: Teleskopski (na izvlačenje)
Način ugradnje: Ugradni
Upravljanje :Mehaničko (Dugmad)
Širina: 60 cm',3,9999.0,0,null),

('BOSCH','DFL064W50','Aspirator',
'Tip: Teleskopski (na izvlačenje)
Način ugradnje: Ugradni
Upravljanje: Mehaničko (Prekidač)
Širina: 59.8 cm',44,19990.0,1,null),

('PANASONIC','NN-K10JWMEPG','Mikrotalasna rerna',
'Boja: Bela
Zapremina: 20 l
Upravljanje: Mehaničko',6,12790.0,0,null),

('BEKO','ERN1WW0FOW','Ugradni frižider sa jednim vratima',
'Boja: Crna
Zapremina: 24 l
Upravljanje: Senzorsko - na dodir',0,22659.0,0,20500.0),

('LG','MH6565CPS','Mikrotalasna rerna',
'Boja: Inox
Zapremina: 25 l
Upravljanje: Senzorsko - na dodir',12,28329.0,0,null),

('BOSCH','BFL554MS0','Ugradna mikrotalasna rerna',
'Boja: Crna/Siva
Zapremina: 25 l
Upravljanje: Elektronsko',35,35899.8,1,null),

('GORENJE','BM235SYB','Ugradna Mikortalasna rerna',
'Boja: Crna
Zapremina: 23 l
Upravljanje: Senzorsko - na dodir',22,39567.0,0,null),

('FRANKE','FMW250SMGXS','Ugradna mikrotalasna rerna',
'Boja: Inox
Zapremina: 25 l
Upravljanje: Mehaničko',3,38719.0,0,25678.0),

('CANDY','ERN1200FOW','Ugradna mikrotalasna rerna',
'Boja: Crna
Zapremina: 20 l
Upravljanje: Elektronsko',36,27550.8,0,null),

('VOX','VSA2-12BE','Klima uređaj',
'Kapacitet klima uređaja: 12000 BTU
Freon: R410
Energetska klasa: A',32,27000.0,1,null),

('MIDEA','MSMA-09HRN1','Klima uređaj',
'Kapacitet klima uređaja: 9000 BTU
Freon: R410A
Energetska klasa :A/A (hlađenje/grejanje)',18,31999.0,0,null),

('CHIGO','CS-32H3A-VB125AY2G','Klima uređaj',
'Kapacitet klima uređaja: 12000 BTU
Freon: R410A
Energetska klasa: B/B (hlađenje/grejanje)',19,28990.0,0,null),

('VIVAX','ACP-24CH70AERI','Klima uređaj inverter',
'Kapacitet klima uređaja: 24000 BTU
Freon: R410A
Energetska klasa: A++/A+ (hlađenje/grejanje)
Jonizator: Da',14,85999.6,1,null),

('DAIKIN','FTXB35C/RXB35C','Klima uređaj inverter',
'Kapacitet klima uređaja: 12000 BTU
Freon: R410A
Energetska klasa: A+/A+ (hlađenje/grejanje)',67,65789.6,0,null),

('GORENJE','KAS35INVDC','Klima uređaj inverter',
'Kapacitet klima uređaja: 12000 BTU
Freon: R410A
Energetska klasa: A+/A (hlađenje/grejanje)',12,44999.0,1,null),

('BEKO','HIC64403X','Ugradna ploča',
'Boja: Crna
Vrsta ploče za kuvanje: Staklokeramička
Način upravljanja: Senzorsko upravljanje (Na dodir)',89,27999.6,0,21000.0),

('GORENJE','ECT643BX','Ugradna ploča',
'Boja: Crna
Vrsta ploče za kuvanje: Staklokeramička
Način upravljanja: Senzorsko upravljanje (Na dodir)'
,67,28888.0,0,null),

('BOSCH','PRA3A6D70','Ugradna ploča',
'Boja: Crna
Vrsta ploče za kuvanje: Plinska
Način upravljanja: Mehaničko (Prekidač)',77,64999.0,0,null),

('HANSA','BHCS38120030','Ugradna ploča',
'Boja: Crna
Vrsta ploče za kuvanje: Staklokeramička
Način upravljanja: Mehaničko (Prekidač)',96,14999.0,1,null),

('MIELE','G5210SC','Mašina za pranje sudova Active Plus 11495430',
'Kapacitet punjenja: 14 kompleta
Energetski razred: A+++
Odloženi start: Da
Inverter motor: Ne',12,94999.0,0,89900.0),

('BOSCH','SMS46GW01E','Mašina za pranje sudova Silence Plus ',
'Kapacitet punjenja: 12 kompleta
Energetski razred: A++',96,87990.0,1,null),

('CANDY','CDP1LS39W','Mašina za pranje sudova',
'Kapacitet punjenja: 13 kompleta
Energetski razred: A+',45,33989.0,0,null),

('VOX','LC6745','Mašina za pranje sudova',
'Kapacitet punjenja: 12 kompleta
Energetski razred: A++',16,258990.0,0,null),

('SAMSUNG','DW60M6040BB/EO','Ugradna mašina za pranje sudova',
'Kapacitet punjenja: 13 kompleta
Energetski razred: A++',29,58849.0,0,null),

('MIELE','G4203SCiBRWS','Ugradna mašina za pranje sudova',
'Kapacitet punjenja: 14 kompleta
Energetski razred: A+',0,90990.0,0,null),

('MIELE','G6730SCiEDST/CS','Ugradna mašina za pranje sudova',
'Kapacitet punjenja: 14 kompleta
Energetski razred: A+++',4,160990.0,1,null),

('ARISTON','VLSEVO80EU','Bojler',
'Tip: Standardni
Zapremina: 80 l
Vrsta kazana: Emajlirani čelik
Način montaže: Horizontalna i vertikalna montaža',30,31099.0,0,24990.0),

('BOSCH','2000TTR2000T10B','Bojler malolitražni Tronic',
'Tip: Standardni
Zapremina:10 l
Vrsta kazana: Emajlirani čelik
Način montaže: Visoko-montažni',18,9599.0,0,null),

('BOSCH','1000TTR1000T150B','Bojler tronic',
'Tip: Standardni
Zapremina:150 l
Vrsta kazana: Emajlirani čelik
Način montaže: Vertikalno',10,20199.0,0,null),

('BOSCH','2000TTR2000T10B','Bojler malolitražni Tronic',
'Tip: Standardni
Zapremina:10 l
Vrsta kazana: Emajlirani čelik
Način montaže: Visoko-montažni',0,9599.0,0,null),

('TESY ','1015L52RC','Bojler malolitražni GCA',
'Tip: Standardni
Zapremina: 10 l
Vrsta kazana :Staklo/Keramika
Način montaže: Visoko-montažni',56,12990.0,1,null),

('TESY','GCU1015L52RC','Bojler Compact ',
'Tip: Standardni
Zapremina: 10 l
Vrsta kazana: Staklo/Keramika
Način montaže: Nisko-montažni',17,7999.0,0,15999.0),

('TERMORAD','BTN-10','Bojler',
'Zapremina:10 l
Vrsta kazana: Polipropilenski
Način montaže: Nisko-montažni',0,4699.0,0,null),

('GORENJE','GT5O','Bojler malolitražni',
'Tip: Standardni
Zapremina: 5 l
Vrsta kazana: Emajlirani čelik
Način montaže: Visoko-montažni',2,7999.0,0,null),

('VOX','VF1200','Zamrzivač',
'Tip: Samostojeći
Sistem hlađenja: Ručno-otapajući
Položaj zamrzivača: Vertikalni
Kapacitet zamrzivača: 63 l
Energetski razred: A+',17,16199.0,1,null),

('BEKO','210520-ELE00404','Zamrzivač HS',
'Tip: Samostojeći
Sistem hlađenja: Statični
Položaj zamrzivača: Horizontalni
Kapacitet zamrzivača: 104 l
Energetski razred: A+',9,20799.0,0,null),

('BEKO','47520-ELE00408','Zamrzivač HSA',
'Tip: Samostojeći
Sistem hlađenja: Statični
Položaj zamrzivača: Horizontalni
Kapacitet zamrzivača: 451 l
Energetski razred: A+',11,39189.0,1,35900.0),

('BOSCH','GSN58AWDP','Zamrzivač ',
'Tip:Samostojeći
Sistem hlađenja:No frost
Položaj zamrzivača:Vertikalni
Kapacitet zamrzivača:365 l
Energetski razred:A+++',4,103500.0,0,null),

('VOX','VF1200','Zamrzivač ',
'Tip: Samostojeći
Sistem hlađenja: Ručno-otapajući
Položaj zamrzivača: Vertikalni
Kapacitet zamrzivača: 63 l
Energetski razred: A+',78,16199.0,1,null),

('LIEBHERR','LI0310005','Ugradni zamrzivač SIGN 3576 Premium',
'Tip: Ugradni
Sistem hlađenja: No frost
Položaj zamrzivača: Vertikalni
Kapacitet zamrzivača: 209 l
Energetski razred: A++',10,226229.0,1,null),

('LIEBHERR','LI0308003','Ugradni zamrzivač UIG 1323 Comfort ',
'Tip :Ugradni
Sistem hlađenja: Smart frost
Položaj zamrzivača: Vertikalni
Kapacitet zamrzivača: 96 l
Energetski razred: A++',5,105409.0,0,null),

('BEKO','47520-ELE00408','Zamrzivač HSA',
'Tip: Samostojeći
Sistem hlađenja:S tatični
Položaj zamrzivača: Horizontalni
Kapacitet zamrzivača: 451 l
Energetski razred: A+',27,39189.0,0,null),

('BEKO','210520-ELE00404','Zamrzivač HSA',
'Tip: Samostojeći
Sistem hlađenja: Statični
Položaj zamrzivača: Horizontalni
Kapacitet zamrzivača: 104 l
Energetski razred: A+',39,20799.0,0,15990.0),

('MIELE','28463Ebb','Zamrzivač FNS',
'Tip: Samostojeći
Sistem hlađenja: Super Frost
Položaj zamrzivača: Horizontalni
Kapacitet zamrzivača: 262 l
Energetski razred: A+++',28,214999.0,1,null),

('MIELE','HS-543CN','Zamrzivač',
'Tip: Samostojeći
Položaj zamrzivača: Horizontalni
Kapacitet zamrzivača: 418 l
Energetski razred: A+',0,40609.5,0,null);

INSERT INTO dbo.Kategorije
VALUES
('Frižideri'),
('Frižideri sa jednim vratima'),
('Ugradni frižideri sa jednim vratima'),
('Veš mašine'),
('Mašine za pranje veša - frontalno punjenje'),
('Mašine za pranje veša - punjenje odozgo'),
('Šporeti'),
('Električni šporeti'),
('Šporeti sa staklokeramičkom pločom'),
('Kombinovani šporeti'),
('Šporeti na gas'),
('Aspiratori'),
('Standardni'),
('Kaminski'),
('Teleskopski'),
('Mikrotalasne rerne'),
('Mikrotalasne rerne sa grilom'),
('Ugradne mikrotalasne'),
('Klima uređaji'),
('Standardne klime'),
('Inverter klime'),
('Ugradna tehnika'),
('Ugradne ploče'),
('Mašine za pranje sudova'),
('Samostojeće'),
('Ugradne'),
('Bojleri'),
('Standardni bojleri'),
('Bojleri male litraže'),
('Zamrzivači'),
('Samostojeći'),
('Vertikalni'),
('Horizontalni');

--SELECT * FROM KategorijeProizvoda
INSERT INTO dbo.KategorijeProizvoda
VALUES
--Frizideri(glavna kategorija)
(1,1),(3,1),(4,1),(5,1),(6,1),(7,1),
--Ugradni Frizideri sa jednim vratima
(2,3),(3,3),(4,3),(5,3),(6,3),
--Frizideri sa jednim vratima
(7,2),

--Ves masine(glavna kategorija)
(8,4),(9,4),(10,4),(11,4),(12,4),(13,4),
--Masina za pranje vesa frontalno punjenje
(8,5),(9,5),(10,5),
--Masina za pranje vesa punjenje odozgo
(11,6),(12,6),(13,6),

--Sporeti(glavna kategorija)
(14,7),(15,7),(16,7),(17,7),(18,7),(19,7),(20,7),
(21,7),(22,7),(23,7),(24,7),(25,7),(26,7),(27,7),
--ELektricni sporeti
(14,8),(15,8),(16,8),(17,8),
--Sporeti sa staklokeramickom plocom
(18,9),(19,9),(20,9),
--Kombinovani sporeti
(21,10),(22,10),(23,10),
--Sporeti na gas
(24,11),(25,11),(26,11),(27,11),


--Aspiratori(glavna kategorija (12))
(28,12),(29,12),(30,12),(31,12),(32,12),
(33,12),(34,12),(35,12),(36,12),
--Standardni(13)
(28,13),(29,13),(30,13),
--Kaminski(14)
(31,14),(32,14),(33,14),
--Teleskopski(15)
(34,15),(35,15),(36,15),

--Mikrotalasne rerne(glavna kategorija (16))
(37,16),(38,16),(39,16),(40,16),
(41,16),(42,16),(43,16),
--Mikrotalasne sa grilom(17)
(37,17),(38,17),
--Ugradne mikrotalasne(18)
(39,18),(40,18),(41,18),(42,18),(43,18),


--Klima uredjaji(glavna kategorija(19))
(43,19),(44,19),(45,19),(46,19),
(47,19),(48,19),(49,19),
--Standardne klime(20)
(43,20),(44,20),(45,20),(46,20),
--Inverter Klime(21)
(47,21),(48,21),(49,21),

--Ugradna tehnika(glavna kategorija(22))
(50,22),(51,22),(52,22),(53,22),
--Ugradne ploce(23)
(50,23),(51,23),(52,23),(53,23),



--Masine za pranje sudova(glavna kategorija(24))
(54,24),(55,24),(56,24),(57,24),
(58,24),(59,24),(60,24),
--Samostojece(25)
(54,25),(55,25),(56,25),(57,25),
--Ugradne(26)
(58,26),(59,26),(60,26),


--Bojler(glavna kategorija(27))
(61,27),(62,27),(63,27),(64,27),
(65,27),(66,27),(67,27),(68,27),
--Standardni bojleri(28)
(63,28),(61,28),(66,28),(67,28),
--Bojleri sa malom litrazom(29)
(62,29),(64,29),(65,29),(68,29),

--Zamrzivaci(glavna kategorija(30))
(67,30),(68,30),(69,30),(70,30),(71,30),
(72,30),(73,30),(74,30),(75,30),(76,30),
(77,30),
--Samostojeci(31)
(67,31),(68,31),(69,31),(70,31),
(71,31),(74,31),(75,31),(76,31),
(77,31),
--Vertikalni(32)
(67,32),(70,32),(71,32),(72,32),
(73,32),
--Horizontalni(33)
(74,33),(75,33),(76,33),
(77,33),(68,33),(69,33);

INSERT dbo.Korisnik 
VALUES
('Bogdan','Baraganović ','Alekse Dundića 332','0632868582','bogdan@raf.rs','Bogdan332'),	
('Bogašin','Banješević ','Alekse Dejovića 119','0612465454','bogašin@gmail.com','Bogašin119'),	
('Bobo','Banjević','Alekse Bačvanskog 976','0640675213','bobo@raf.rs','Bobo976'),	
('Boban','Balović','Aleksandra Stambolijskog 842','0625463627','boban@yahoo.com','Boban842'),	
('Blažo','Balmazović','Aleksandra Glišića 930','0648402642','blažo@gmail.com','Blažo930'),	
('Blažen','Balešević','Aleksandra Fleminga 354','0620336751','blažen@hotmail.com','Blažen354'),	
('Blaža','Balević','Aleksandra Deroka 577','0643512870','blaža@gmail.com','Blaža577'),	
('Blaško','Balašević','Albanske Spomenice 449','0634265562','blaško@raf.rs','Blaško449'),	
('Blagovan','Balatunović ','Branka Šotre 987','0627273561','blagovan@yahoo.com','Blagovan987'),	
('Blagota','Balančević','Branka Plećaša 809','0630104088','blagota@gmail.com','Blagota809'),	
('Blagomir','Balanesković ','Branka Momirova 18','0622882634','blagomir@hotmail.com','Blagomir18'),	
('Blagoje','Balabanović','Branka Miljkovića 192','0622328238','blagoje@yahoo.com','Blagoje192'),	
('Biserko','Bakšunović','Branka Krsmanovića 830','0646815031','biserko@yahoo.com','Biserko830'),	
('Biljan','Bakračević','Branka Gavela 861','0656783113','biljan@gmail.com','Biljan861'),	
('Berko','Bakočević','Branka Đonovića 580','0612563814','berko@hotmail.com','Berko580'),	
('Berislav','Bakojević ','Branka Cvetkovića 53','0643014242','berislav@raf.rs','Berislav53'),	
('Berisav','Baković','Branka Bulata 243','0652214160','berisav@raf.rs','Berisav243'),	
('Beriša','Bakalović ','Braničevska 337','0621830827','beriša@hotmail.com','Beriša337'),	
('Beran','Bajunović','Brane Ćosića 752','0617740050','beran@gmail.com','Beran752'),	
('Beloslav','Bajuković ','Braće Todorović 68','0621771586','beloslav@raf.rs','Beloslav68'),	
('Beladin','Bajović','Braće Škerovića 299','0644336805','beladin@gmail.com','Beladin299'),	
('Bana','Bajković','Braće Srnić 195','0656405035','bana@gmail.com','Bana195'),	
('Balša','Bajkanović','Braće Ribnikar 9','0627585684','balša@yahoo.com','Balša9'),	
('Baja','Bajinović','Braće Radovanovića 43','0635574874','baja@yahoo.com','Baja43'),	
('Arsen','Ašćerić','Braće Nedić 897','0617637384','arsen@raf.rs','Arsen897'),	
('Arsa','Ašonja','Braće Miladinov 29','0621361734','arsa@yahoo.com','Arsa29'),	
('Aranđel','Aškrabić','Braće Marinković 569','0658427286','aranđel@hotmail.com','Aranđel569'),	
('Apostol','Aškraba','Braće Lamijer 565','0636361077','apostol@gmail.com','Apostol565'),	
('Antonije','Ašanin','Braće Krsmanović 597','0644365228','antonije@yahoo.com','Antonije597'),	
('Anđelko','Ašađanin','Braće Kovač 470','0652142588','anđelko@hotmail.com','Anđelko470'),	
('Andrija','Adžović','Braće Jugovića 885','0640381353','andrija@raf.rs','Andrija885'),	
('Andrej','Adžić','Braće Jerković 651','0622530384','andrej@gmail.com','Andrej651'),	
('Anatolije','Adživuković','Braće Grim 458','0648667721','anatolije@gmail.com','Anatolije458'),	
('Anastasije','Ačić','Braće Fogl 873','0621153108','anastasije@yahoo.com','Anastasije873'),	
('Anastas','Ačanski','Braće Baruh 797','0610658524','anastas@hotmail.com','Anastas797'),	
('Aleksej','Acović','Braće Amar 522','0633414183','aleksej@hotmail.com','Aleksej522'),	
('Aleksije','Acković','Braće Abafi 200','0637448430','aleksije@raf.rs','Aleksije200'),	
('Aleksandar','Acić','Bračka 10','0656516251','aleksandar@raf.rs','Aleksandar10'),	
('Aleksa','Acamović','Bracana Bracanovića 697','0615667735','aleksa@hotmail.com','Aleksa697'),	
('Aksentije','Aćić','Božidara Stojanovića 413','0646033624','aksentije@raf.rs','Aksentije413'),	
('Akim','Aćin','Božidara Adžije 486','0628617224','akim@hotmail.com','Akim486'),	
('Azarija','Aćimović','Božidara Adžije 758','0614430736','azarija@hotmail.com','Azarija758'),	
('Adrijan','Aćimovac','Božićna 794','0615618783','adrijan@raf.rs','Adrijan794'),	
('Adam','Aćimov','Božice Divnić 351','0618336076','adam@gmail.com','Adam351'),	
('Agaton','Aćimić','Bože Jankovića 405','0650765347','agaton@raf.rs','Agaton405'),	
('Agapije','Aćimac','Botićeva 192','0618540160','agapije@yahoo.com','Agapije192'),	
('Avakum','Aćim','Boška Vrebalova 814','0648633023','avakum@raf.rs','Avakum814'),	
('Avram','Atlija','Boška Petrovića 83','0635610242','avram@yahoo.com','Avram83'),	
('Avra','Atlagić','Boška Palkovljevića 509','0631736416','avra@yahoo.com','Avra509'),	
('Avelj','Ateljević','Bošak Buhe 715','0646858728','avelj@yahoo.com','Avelj715');	

INSERT INTO dbo.Kupon
VALUES
('B6543C2',10.0,'2021-03-15 12:00:00',0),
('C21BH19',5.0,'2021-03-15 12:00:00',1),
('JK32CHK',7.5,'2021-03-15 12:00:00',0),
('KI6L12C',15.0,'2021-03-15 12:00:00',1),
('BN90KLI',20.0,'2021-03-15 12:00:00',0),
('YU7712C',12.5,'2021-03-15 12:00:00',1),
('RI1C5BK',25.0,'2021-03-15 12:00:00',0),
('OPXL12R',30.0,'2021-03-15 12:00:00',1),
('JKVC5RK',17.5,'2021-03-15 12:00:00',1),
('ASD123C',3.5,'2021-03-15 12:00:00',0);


INSERT INTO dbo.Porudzbina
VALUES
(5,1,null,1,10000),(2,3,null,2,53101.2),(7,4,null,3,209997.63),

(8,4,null,1,39500),(11,11,1,2,44999),(13,20,null,2,47198),

(15,3,null,1,25999),(21,21,null,2,64000),(19,31,null,1,69999),

(17,9,null,1,53999),(75,40,null,2,81219),(74,49,5,1,84327.2),

(58,29,null,3,176547),(59,29,null,1,90990),(61,29,null,1,24990),

(50,15,null,2,55999.2),(32,31,null,1,32990),(39,29,null,1,28329),

(25,32,null,1,37999.6),(32,24,null,1,32990),(39,26,null,1,28329),

(50,28,null,2,55999.2),(32,16,null,1,32990),(39,15,null,1,28329),

(63,41,null,1,20199),(72,40,null,2,207000),(42,47,null,1,38719),

(55,44,8,3,184779),(19,4,null,1,69999),(35,5,null,1,9999), 

(58,22,null,2,117698),(40,20,null,1,35899.8),(2,11,null,1,26550.6), 

(45,13,null,1,31999),(47,38,null,2,171999.2),(49,30,null,1,44999),

(31,12,null,4,120003.6),(57,44,null,1,258990),(61,40,4,1,26434.15), 

(73,1,null,1,16199),(76,5,null,1,39189),(74,15,null,1,226229),

(40,16,null,2,71799.2),(43,21,null,1,27550.8),(48,25,null,1,65789.6), 

(54,24,8,2,132998.2),(60,20,null,1,160990),(59,29,null,1,90990),

(5,7,null,1,112456),(7,18,null,2,139998.2),(13,34,null,1,19950.6),

(64,33,1,2,17278.2),(74,39,null,1,226229),(16,50,2,3,61846.56);


INSERT INTO dbo.DetaljiPorudzbine
VALUES
(1,'Obrada','Plaćeno','Kartica','Bogdan','Baraganovic','Alekse Dundica 332','Beograd','11277',null,'2019-12-14'),	
(2,'Uspešno','Plaćeno','Kartica','Bobo','Banjevic','Alekse Bacvanskog 976','Kragujevac','11278','Pazite sa mojom posiljkom!','2019-01-16'),	
(3,'Nerešeno','Plaćeno','Kartica','Boban','Balovic','Aleksandra Stambolijskog 842','Subotica','9780',null,'2019-06-05'),	
(4,'Uspešno','Plaćeno','Paypal','Boban','Balovic','Aleksandra Stambolijskog 842','Subotica','9780',null,'2018-07-01'),	
(5,'Na čekanju','Plaćeno','Pouzećem','Blagomir','Balaneskovic','Branka Momirova 18','Brus','9770',null,'2019-09-23'),	
(6,'Na čekanju','Plaćeno','Kartica','Beloslav','Bajukovic','Brace Todorovic 68','Ruma','12567','budite sto brzi','2018-07-18'),	
(7,'Nerešeno','Neplaćeno','Pouzećem','Bobo','Banjevic','Alekse Bacvanskog 976','Kragujevac','11278',null,'2019-02-01'),	
(8,'Na čekanju','Neplaćeno','Pouzećem','Beladin','Bajovic','Brace Škerovica 299','Niš','12343',null,'2019-08-28'),	
(9,'Obrada','Neplaćeno','Pouzećem','Andrija','Adžovic','Brace Jugovica 885','Zlatibor 12','13678',null,'2020-08-21'),	
(10,'Na čekanju','Neplaćeno','Pouzećem','Blagovan','Balatunovic','Branka Šotre 987','Kruševac','12355','oprezno','2018-04-18'),	
(11,'Obrada','Plaćeno','Kartica','Aksentije','Acic','Božidara Stojanovica 413','Batajnica','11277',null,'2019-09-04'),	
(12,'Nerešeno','Plaćeno','Pouzećem','Avra','Atlagic','Boška Palkovljevica 509','Zemun','11277',null,'2018-03-03'),	
(13,'Na čekanju','Plaćeno','Kartica','Antonije','Ašanin','Brace Krsmanovic 597','Novi Sad','16892',null,'2018-09-24'),	
(14,'Na čekanju','Neplaćeno','Pouzećem','Antonije','Ašanin','Brace Krsmanovic 597','Obrenovac','16452',null,'2021-06-03'),	
(15,'Obrada','Plaćeno','Paypal','Antonije','Ašanin','Brace Krsmanovic 597','Ostružnica','14562',null,'2019-10-26'),	
(16,'Nerešeno','Plaćeno','Paypal','Berko','Bakocevic','Branka Ðonovica 580','Kikinda','17845',null,'2021-02-23'),	
(17,'Uspešno','Plaćeno','Paypal','Andrija','Adžovic','Brace Jugovica 885','Sibač','23564',null,'2020-12-30'),	
(18,'Obrada','Plaćeno','Paypal','Antonije','Ašanin','Brace Krsmanovic 597','Ljukovo','18175',null,'2019-03-25'),	
(19,'Obrada','Plaćeno','Kartica','Andrej','Adžic','Brace Jerkovic 651','Preševo','14563',null,'2019-01-22'),	
(20,'Obrada','Neplaćeno','Pouzećem','Baja','Bajinovic','Brace Radovanovica 43','Grabovac','13245',null,'2020-08-15'),	
(21,'Poslato','Neplaćeno','Pouzećem','Arsa','Ašonja','Brace Miladinov 29','Stubline','19874',null,'2018-05-04'),	
(22,'Uspešno','Plaćeno','Paypal','Apostol','Aškraba','Brace Lamijer 565','Bački Jarak','13038',null,'2018-03-06'),	
(23,'Poslato','Neplaćeno','Pouzećem','Berislav','Bakojevic','Branka Cvetkovica 53','Bački Petrovac','29438',null,'2019-07-07'),	
(24,'Uspešno','Plaćeno','Paypal','Berko','Bakocevic','Branka Ðonovica 580','Begeč','39934',null,'2019-08-20'),	
(25,'Obrada','Plaćeno','Paypal','Akim','Acin','Božidara Adžije 486','Belanovica','27250',null,'2020-06-12'),	
(26,'Na čekanju','Neplaćeno','Pouzećem','Aksentije','Acic','Božidara Stojanovica 413','Bela Palanka','9208',null,'2021-09-26'),	
(27,'Na čekanju','Neplaćeno','Pouzećem','Avakum','Acim','Boška Vrebalova 814','Bela Crkva','18431',null,'2021-07-01'),	
(28,'Nerešeno','Neplaćeno','Kartica','Adam','Acimov','Božice Divnic 351','Beli Potok','17968',null,'2020-12-16'),	
(29,'Poslato','Plaćeno','Kartica','Boban','Balovic','Aleksandra Stambolijskog 842','Belo Polje','21255',null,'2019-04-12'),	
(30,'Na čekanju','Plaćeno','Kartica','Blažo','Balmazovic','Aleksandra Glišica 930','Batajnica','18969',null,'2018-08-24'),	
(31,'Na čekanju','Plaćeno','Kartica','Bana','Bajkovic','Brace Srnic 195','Beograd','20455',null,'2020-01-20'),	
(32,'Uspešno','Plaćeno','Pouzećem','Beloslav','Bajukovic ','Brace Todorovic 68','Beočin','41310',null,'2021-12-04'),	
(33,'Uspešno','Plaćeno','Kartica','Blagomir','Balaneskovic ','Branka Momirova 18','Bečej','36155',null,'2018-03-07'),	
(34,'Nerešeno','Plaćeno','Kartica','Biserko','Bakšunovic','Branka Krsmanovica 830','Blace','41064',null,'2020-11-01'),	
(35,'Na čekanju','Neplaćeno','Pouzećem','Aleksandar','Acic','Bracka 10','Bogatić ','16859',null,'2018-04-17'),	
(36,'Neuspelo','Plaćeno','Pouzećem','Andelko','Ašadanin','Brace Kovac 470','Boljevac ','27497',null,'2019-10-15'),	
(37,'Obrada','Plaćeno','Kartica','Blagoje','Balabanovic','Branka Miljkovica 192','Bor','23016',null,'2018-07-12'),	
(38,'Neuspelo','Plaćeno','Paypal','Adam','Acimov','Božice Divnic 351','Borča','20200',null,'2018-01-10'),	
(39,'Poslato','Plaćeno','Kartica','Aksentije','Acic','Božidara Stojanovica 413','Bosilegrad','39023',null,'2021-09-24'),	
(40,'Obrada','Neplaćeno','Pouzećem','Bogdan','Baraganovic','Alekse Dundica 332','Brza Palanka','31873',null,'2020-12-16'),	
(41,'Neuspelo','Plaćeno','Kartica','Blažo','Balmazovic','Aleksandra Glišica 930','Brus','29830',null,'2021-08-10'),	
(42,'Obrada','Plaćeno','Paypal','Berko','Bakocevic','Branka Ðonovica 580','Bujanovac','20974',null,'2019-11-13'),	
(43,'Poslato','Plaćeno','Paypal','Adrijan','Acimovac','Božicna 794','Valjevo','43281',null,'2021-11-23'),	
(44,'Poslato','Neplaćeno','Pouzećem','Beladin','Bajovic','Brace Škerovica 299','Velika Plana','37253',null,'2020-06-16'),	
(45,'Nerešeno','Plaćeno','Pouzećem','Arsen','Ašceric','Brace Nedic 897','Veliki Crljeni','32238',null,'2020-08-24'),	
(46,'Na čekanju','Plaćeno','Kartica','Baja','Bajinovic','Brace Radovanovica 43','Veliko Gradište','34080',null,'2018-03-30'),	
(47,'Obrada','Plaćeno','Paypal','Beloslav','Bajukovic','Brace Todorovic 68','Vladičin Han','9604',null,'2020-06-30'),	
(48,'Uspešno','Plaćeno','Kartica','Antonije','Ašanin','Brace Krsmanovic 597','Vlasotince','20655',null,'2020-08-19'),	
(49,'Obrada','Plaćeno','Paypal','Blaža','Balevic','Aleksandra Deroka 577','Vranje','37814',null,'2018-01-16'),	
(50,'Obrada','Neplaćeno','Pouzećem','Beriša','Bakalovic','Branicevska 337','Vranjska','32005',null,'2020-10-29'),	
(51,'Na čekanju','Neplaćeno','Pouzećem','Anastasije','Acic','Brace Fogl 873','Vrbas','30858',null,'2021-05-05'),	
(52,'Obrada','Plaćeno','Paypal','Anatolije','Adživukovic','Brace Grim 458','Vrnjačka Banja ','30639',null,'2019-06-29'),	
(53,'Neuspelo','Neplaćeno','Paypal','Aleksa','Acamovic','Bracana Bracanovica 697','Vršac','33888',null,'2021-11-24'),	
(54,'Obrada','Plaćeno','Kartica','Avelj','Ateljevic','Bošak Buhe 715','undefined','21897',null,'2021-03-15');
