USE TehnoMedia
GO

SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
--Prvi korak
BEGIN TRAN
	SELECT kolicina
	FROM dbo.Proizvod
	WHERE idProizvod = 43
GO

--Simuliramo radjenje nekog posla
waitfor delay '00:00:10'
--Treci korak
	SELECT kolicina
	FROM dbo.Proizvod
	WHERE idProizvod = 43
COMMIT TRAN