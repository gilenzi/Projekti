
-- Ovaj upit nam pokazuje autore i sva njihova dela koja su trenutno na stanju
SELECT a.Ime,a.Prezime,k.Naslov
FROM dbo.Autori as a
inner join dbo.Knjiga as k on k.AutorID = a.AutorID

--Ovaj upit prikazuje sve kategorije knjiga
SELECT k2.Naslov,a.Ime,a.Prezime, k.ImeKategorije
FROM dbo.Kategorija as k
inner join dbo.Knjiga as k2 on k.KategorijaID = k2.KategorijaID
inner join dbo.Autori as a on a.AutorID = k2.AutorID

--Ovaj upit prikazuje koliko knjiga ima po kategorijama
SELECT  k.ImeKategorije,COUNT(*) AS [Broj knjiga]
FROM dbo.Kategorija as k
inner join dbo.Knjiga as k2 on k.KategorijaID = k2.KategorijaID
GROUP BY ImeKategorije


--Ovaj upit nam pokazuje izdavace za sve knjige na stanju
SELECT k.Naslov,i.ImeIzdavackeKuce
FROM dbo.Izdavac as i
left join dbo.Knjiga as k on i.IzdavacID = k.IzdavacID

--Ovaj upit nam pokazuje broj knjiga po izdavackim kucama 
SELECT i.ImeIzdavackeKuce,COUNT(*) as [Broj knjiga]
FROM dbo.Izdavac as i
left join dbo.Knjiga as k on i.IzdavacID = k.IzdavacID
GROUP BY ImeIzdavackeKuce

--Ovaj upit nam daje broj knjiga po zanru
SELECT z.ImeZanra,COUNT(*) AS [broj knjiga]
FROM dbo.KnjigaZanr as kz
inner join dbo.Knjiga as k on k.KnjigaID = kz.KnjigaID
inner join dbo.Zanr as z on z.ZanrID = kz.ZanrID
GROUP BY ImeZanra

--Ovaj upit nam prikazuje kupce i njihove narudzbine
SELECT	k.Ime,k.Prezime,n.NarudzbinaID,dn.AdresaIsporuke,dn.GradIsporuke,dn.PostanskiKod,dn.DatumIsporuke
FROM dbo.Narudzbina as n
inner join dbo.Kupac AS k on k.KupacID = n.KupacID
inner join dbo.DetaljiNarudzbine AS dn on dn.NarudzbinaID = n.NarudzbinaID
GROUP BY 	k.Ime,k.Prezime,n.NarudzbinaID,dn.AdresaIsporuke,dn.GradIsporuke,dn.PostanskiKod,dn.DatumIsporuke

-- ovaj upit nam pokazuje sve narudzbine po gradovima
SELECT k.Ime,k.Prezime,n.NarudzbinaID,dn.GradIsporuke
FROM dbo.Narudzbina as N
inner join dbo.Kupac AS k on k.KupacID = n.KupacID
inner join dbo.DetaljiNarudzbine as dn on dn.NarudzbinaID = n.NarudzbinaID

--ovaj upit nam prikazuje porudzbine  za odredjeni mesec

SELECT k.Ime,k.Prezime,n.NarudzbinaID,dn.GradIsporuke,dn.DatumIsporuke
FROM dbo.Narudzbina as N
inner join dbo.Kupac AS k on k.KupacID = n.KupacID
inner join dbo.DetaljiNarudzbine as dn on dn.NarudzbinaID = n.NarudzbinaID
GROUP BY  k.Ime,k.Prezime,n.NarudzbinaID,dn.GradIsporuke,dn.DatumIsporuke
HAVING YEAR(dn.DatumIsporuke) >= 2021 and MONTH(dn.DatumIsporuke) = 2

--Ovaj upit nam pokazuje porudzbine na kojima su iskorisceni kuponi
SELECT k.Ime,k.Prezime,N.NarudzbinaID,dbo.Kupon.VrednostKupona
FROM dbo.Narudzbina as n
inner join dbo.Kupon on dbo.Kupon.KuponID = n.KuponID
inner join dbo.Kupac AS k on k.KupacID = n.KupacID
GROUP BY k.Ime,k.Prezime,N.NarudzbinaID,dbo.Kupon.VrednostKupona
HAVING dbo.Kupon.VrednostKupona != 0