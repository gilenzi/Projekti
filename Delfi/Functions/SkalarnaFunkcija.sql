--Skalarna
use ProjekatSQL_Delfi
GO 
CREATE FUNCTION dbo.konvertvanjeDatuma(@datum date)
returns varchar (20)
AS
BEGIN
RETURN CONVERT (varchar(20), @datum, 111)
END
GO

select dbo.DetaljiNarudzbine.DetaljiNarudzbineID,dbo.DetaljiNarudzbine.AdresaIsporuke, dbo.konvertvanjeDatuma(DatumIsporuke) as [Datum] from dbo.DetaljiNarudzbine