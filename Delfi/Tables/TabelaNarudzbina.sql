USE [ProjekatSQL_Delfi]
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

