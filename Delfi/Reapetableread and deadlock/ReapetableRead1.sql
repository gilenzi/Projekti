use ProjekatSQL_Delfi
go

SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
--Prvi korak

BEGIN TRAN
    SELECT Kolicina
    FROM dbo.Knjiga
    WHERE KnjigaID = 10
GO


--Treci korak
    SELECT Kolicina
    FROM dbo.Knjiga
    WHERE KnjigaID = 10
COMMIT TRAN