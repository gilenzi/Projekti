USE TehnoMedia
GO

SELECT p.brendProizvoda, p.imeProizvoda, p.cena, p.sifraProizvoda 
FROM dbo.Proizvod AS p
FOR XML PATH('Proizvod'),
ROOT('Proizvodi');
