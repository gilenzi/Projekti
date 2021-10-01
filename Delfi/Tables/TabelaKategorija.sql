USE [ProjekatSQL_Delfi]
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

