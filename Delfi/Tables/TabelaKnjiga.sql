USE [ProjekatSQL_Delfi]
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

