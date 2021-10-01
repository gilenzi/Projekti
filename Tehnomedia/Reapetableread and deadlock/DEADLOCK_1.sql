USE TehnoMedia
GO

--Prvi korak
BEGIN TRAN
UPDATE dbo.Proizvod
	SET kolicina += 1
	WHERE idProizvod = 5
GO	
--Cetvrti korak
UPDATE dbo.Porudzbina
	SET ukupnaKolicina += 1
	WHERE idProizvod = 5
GO