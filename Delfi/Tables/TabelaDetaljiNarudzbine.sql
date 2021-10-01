USE [ProjekatSQL_Delfi]
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

