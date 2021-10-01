USE [ProjekatSQL_Delfi]
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

