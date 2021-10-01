USE [ProjekatSQL_Delfi]
GO

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

