-- xml upit
use ProjekatSQL_Delfi
go
select Naslov,Cena,ISBN,Jezik,Stranice from dbo.Knjiga
for xml path('Knjiga'),
root('Knjige');