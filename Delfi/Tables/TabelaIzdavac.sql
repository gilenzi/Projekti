USE [ProjekatSQL_Delfi]
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

