USE TehnoMedia
GO

--JOIN-ovi--
--Ovaj upit nam omogucuje da vidimo sve komentare za odredjen post. koji korisnici su komentarisali , kada su ga komentarisali,
-- i u kojoj meri. Dobijamo informaciju o zainteresovanosti korisnika.

SELECT * FROM dbo.Postovi
INNER JOIN dbo.Komentari
ON dbo.Postovi.idPost = dbo.Komentari.idPost
WHERE dbo.Postovi.idPost = 3;

--Ovaj upit nam omogucuje da vidimo koje prodavnice ne rade nedeljom.
SELECT idProdavnica, dan, vremePocetka, vremeZavrsetka 
FROM dbo.ProdavnicaRadnoVreme
JOIN dbo.RadnoVreme
ON dbo.ProdavnicaRadnoVreme.idRadnoVreme = dbo.RadnoVreme.idRadnoVreme
WHERE dbo.RadnoVreme.idRadnoVreme = 12;

--Radni dani i vreme svih prodavnica
SELECT idProdavnica, dan, vremePocetka, vremeZavrsetka 
FROM dbo.ProdavnicaRadnoVreme
JOIN dbo.RadnoVreme
ON dbo.ProdavnicaRadnoVreme.idRadnoVreme = dbo.RadnoVreme.idRadnoVreme
WHERE dbo.RadnoVreme.idRadnoVreme != 12;

--Prikazujemo sve porudzbine koje su iskoristile kupon i njihove pojedinosti.
SELECT p.idPorudzbina, idProizvod, p.idKorisnik,
p.idKupon, p.ukupnaCena
FROM dbo.Porudzbina AS p
JOIN dbo.Kupon AS k
ON p.idKupon = k.idKupon;

--Ovaj upit koristimo da vidimo koji proizvodi su slabije zastupljeni(nemaju porudzbine). 
SELECT * FROM dbo.Proizvod AS p
LEFT JOIN dbo.Porudzbina AS por
ON p.idProizvod = por.idPorudzbina
ORDER BY por.idPorudzbina;

--Ovaj upit koristimo da bi videli koji korisnici i koliko korisnika, ne porucuje
--za sebe(narucuje kao poklon). 
SELECT dp.imePorucioca, dp.prezimePorucioca, k.ime, k.prezime
FROM dbo.Porudzbina AS p
JOIN DetaljiPorudzbine AS dp ON dp.idPorudzbina = p.idPorudzbina
JOIN Korisnik AS k ON k.idKorisnik = p.idKorisnik
GROUP BY dp.imePorucioca, dp.prezimePorucioca, k.ime, k.prezime
HAVING dp.imePorucioca != k.ime AND dp.prezimePorucioca != k.prezime;

--Kolicina proizvoda za odredjenu kategoriju.
SELECT k.imeKategorije, SUM(p.kolicina) AS [Kolicina]
FROM dbo.KategorijeProizvoda AS kp
JOIN Proizvod AS p ON p.idProizvod = kp.idProizvod
JOIN Kategorije AS k ON k.idKategorija = kp.idKategorija
GROUP BY k.imeKategorije
ORDER BY Kolicina DESC;

--Koji proizvodi se nalaze u kojim kategorijama.
SELECT kat.imeKategorije, p.imeProizvoda
FROM KategorijeProizvoda AS katP
JOIN Proizvod AS p ON katP.idProizvod = p.idProizvod
JOIN Kategorije AS kat ON kat.idKategorija = katP.idKategorija
GROUP BY kat.imeKategorije, p.imeProizvoda;

--Ovim upitom imamo uvid u trenutni broj komentara po postu.
SELECT  p.Naslov, COUNT(*) AS [Broj komentara]
FROM dbo.Postovi AS p
JOIN dbo.Komentari AS k
ON p.idPost = k.idPost
GROUP BY p.Naslov
ORDER BY [Broj komentara] DESC

--Ovaj upit nam pokazuje koji korisnici, porucuju vise od jednog proizvoda.
SELECT k.ime, k.prezime , pr.imeProizvoda, p.ukupnaKolicina
FROM Porudzbina AS p
JOIN Korisnik AS k ON k.idKorisnik = p.idKorisnik
JOIN Proizvod AS pr ON pr.idProizvod = p.idProizvod
GROUP BY  k.ime, k.prezime , pr.imeProizvoda, p.ukupnaKolicina
HAVING p.ukupnaKolicina >= 2
ORDER BY p.ukupnaKolicina DESC