USE TehnoMedia
GO

--Drugi korak
BEGIN TRAN
UPDATE dbo.Porudzbina
	SET ukupnaKolicina += 1
	WHERE idProizvod = 5
GO
--Treci korak
UPDATE dbo.Proizvod
	SET kolicina += 1
	WHERE idProizvod = 5
GO

ROLLBACK

