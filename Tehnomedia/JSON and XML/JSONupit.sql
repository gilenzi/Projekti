USE TehnoMedia
GO

SELECT p.imeProdavnice, p.adresaProdavnice, p.brojTelefona
FROM dbo.Prodavnice AS p
FOR JSON PATH,
ROOT('Radnje');