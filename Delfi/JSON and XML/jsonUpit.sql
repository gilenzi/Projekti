select Naslov,Cena,ISBN,Jezik,Stranice from dbo.Knjiga
for json path,
root('Knjige');