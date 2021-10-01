use ProjekatSQL_Delfi
GO

update dbo.Knjiga set Cena = 1200 where KnjigaID = 12

update dbo.Kupac set Email = 'TodorovicIvan99@yahoo.com' where KupacID = 1

delete from dbo.Kupac where KupacID = 49

delete from dbo.Zaposleni where ZaposleniID = 49