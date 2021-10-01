USE TehnoMedia
GO

--SKALARNI UPIT--
--Ovaj upit nam pruza uvid u proizvode koje ne treba porucivati.

SELECT dbo.Proizvod.brendProizvoda AS [Brend], dbo.Proizvod.imeProizvoda AS [Naziv proizvoda],
dbo.Proizvod.kolicina AS [Kolicina]
FROM dbo.Proizvod 
WHERE dbo.Proizvod.kolicina = (SELECT MAX(dbo.Proizvod.kolicina) FROM dbo.Proizvod);


--VISE-VREDNOSNI UPIT--
--Ovaj upit nam daje uvid u sve porudzbine koje su trenutno u obradi. Kako bi znali sa kojim kapacitetima raspolazemo,
--i da li je potrebno unaprediti radne mere(u slucaju prekoracenja dozvoljenog broja porudzbina u obradi).

SELECT dbo.DetaljiPorudzbine.idDetaljiPorudzbine AS [Broj porudzbine], dbo.DetaljiPorudzbine.nacinPlacanja AS [Nacin placanja],
dbo.DetaljiPorudzbine.status AS [Status porudzbine]
FROM dbo.DetaljiPorudzbine WHERE idDetaljiPorudzbine IN
(SELECT idDetaljiPorudzbine FROM dbo.DetaljiPorudzbine WHERE DetaljiPorudzbine.status = 'Obrada');

--KORELATIVNI UPIT--
--Ovaj upit nam sluzi kako bi dobili informaciju o trenutnom najvecem kuponu, i njegovim detaljima

SELECT * FROM dbo.Kupon AS k1
WHERE 1 = (SELECT COUNT(k2.vrednostKupona) FROM dbo.Kupon AS k2 WHERE k2.vrednostKupona >= k1.vrednostKupona);

--EXISTS UPIT--
--Ovaj upit koristimo da vidimo koji nam korisnici(potrosaci), ostavljaju najvise sredstava,
--kako bi mogli da nagradjujemo te korisnike raznim benificijama(popustima, poklonima).

SELECT dbo.Korisnik.ime AS [Ime], dbo.Korisnik.prezime AS [Prezime]
FROM dbo.Korisnik WHERE
EXISTS 
(SELECT ukupnaCena 
FROM dbo.Porudzbina
WHERE dbo.Porudzbina.idKorisnik = dbo.Korisnik.idKorisnik and dbo.Porudzbina.ukupnaCena > 100000)

--GROUP BY , HAVING UPIT--
--Ovaj upit nam omogucava da vidimo iz kojih gradova primamo najvise porudzbina
--(gde su potrosaci najaktivniji, gde bi trebalo da povecamo uticaj).

SELECT grad, COUNT(idPorudzbina) AS [Broj porudzbina]
FROM dbo.DetaljiPorudzbine
GROUP BY grad;

SELECT grad,datumPorudzbine, COUNT(idPorudzbina) AS [Broj porudzbina]
FROM dbo.DetaljiPorudzbine
GROUP BY grad,datumPorudzbine
HAVING YEAR(datumPorudzbine) > 2019;

--OFFSET UPIT--
--Ovaj upit koristimo kako bi imali uvid u brojno stanje proizvoda(proizvoda kojih nema na zalihama), ili proizvoda sa minimalnom kolicinom.
--Kako bi mogli blagovremeno da azuriramo stanje proizvoda.

SELECT dbo.Proizvod.brendProizvoda AS [Brend], dbo.Proizvod.imeProizvoda AS [Naziv proizvoda], dbo.Proizvod.cena AS [Cena],
dbo.Proizvod.kolicina as [Kolicina]
FROM dbo.Proizvod
ORDER BY dbo.Proizvod.kolicina DESC offset 58 ROWS FETCH NEXT 20 ROWS only;
