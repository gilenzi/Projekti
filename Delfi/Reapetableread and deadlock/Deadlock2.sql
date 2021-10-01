use ProjekatSQL_Delfi
GO

--Drugi korak
BEGIN TRAN
UPDATE dbo.Kupac
    SET Email = 'ivan@yahoo.com'
    WHERE KupacID = 1
GO
--Treci korak
UPDATE dbo.Knjiga
    SET kolicina += 1
    WHERE KnjigaID = 10
GO

ROLLBACK


select * from Kupac