use ProjekatSQL_Delfi
GO

--Prvi korak
BEGIN TRAN
UPDATE dbo.Knjiga
    SET kolicina += 1
    WHERE KnjigaID = 10
GO
--Cetvrti korak
UPDATE dbo.Kupac
    SET Email = 'ivan@hotmail.com'
    WHERE KupacID = 1
GO