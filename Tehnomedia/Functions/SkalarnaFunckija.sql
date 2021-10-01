USE TehnoMedia

--SKALARNA FUNCKIJA

CREATE FUNCTION RacunanjePopusta(@cena float, @kupon float)
RETURNS float
AS 
	BEGIN
		RETURN	@cena - (@cena * (@kupon / 100));
	END;
GO

--Provera SKALARNE funckije, prikaz izracunatog popusta.
SELECT dbo.RacunanjePopusta(100.10,10.0);
