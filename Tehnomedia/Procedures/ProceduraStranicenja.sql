USE TehnoMedia
GO

--PROCEDURA ZA STRANICENJE------

CREATE PROCEDURE Stranicenje
(
	@brojstrane int = 1,
	@brojlinija int = 10
)
AS
BEGIN 
	DECLARE @preskociti int = (@brojstrane - 1) * @brojlinija
	SELECT * 
	FROM dbo.Proizvod
	ORDER BY idProizvod
	OFFSET @preskociti ROW FETCH FIRST @brojlinija ROWS ONLY
END;
GO
		
--Provera procedure za STRANICENJE, prikaz podataka iz tabele(Proizvod).

EXEC stranicenje
    @brojstrane = 2,
    @brojlinija = 10;
