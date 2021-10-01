use ProjekatSQL_Delfi
GO 
CREATE FUNCTION dbo.KnjigePoIzdavacu
(@IzdavacID int)
RETURNS TABLE
AS
RETURN
(Select dbo.Knjiga.Naslov as [Naslov], dbo.Knjiga.Cena as [Cena], dbo.Knjiga.ISBN as [ISBN]
from dbo.Knjiga
where dbo.Knjiga.IzdavacID = @IzdavacID);
GO

select * from dbo.KnjigePoIzdavacu(6);

