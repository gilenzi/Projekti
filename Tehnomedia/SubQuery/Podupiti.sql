USE TehnoMedia
GO

--UPDATE--

UPDATE dbo.DetaljiPorudzbine
SET dbo.DetaljiPorudzbine.napomena = 'Molim za korektnost kao prethodni put.'
WHERE dbo.DetaljiPorudzbine.idPorudzbina = 35;

UPDATE dbo.DetaljiPorudzbine
SET dbo.DetaljiPorudzbine.postanskiBroj = 11277
WHERE dbo.DetaljiPorudzbine.grad = 'Batajnica';

UPDATE dbo.DetaljiPorudzbine
SET dbo.DetaljiPorudzbine.grad = 'Koralovo'
WHERE dbo.DetaljiPorudzbine.imePorucioca = 'Avelj'
AND dbo.DetaljiPorudzbine.prezimePorucioca = 'Ateljevic';

--DELETE--
--Ovaj upit brise sve email-ove koje
DELETE FROM dbo.NewsLetter WHERE email LIKE '%@yahoo.com';

--Ovaj upit brise prvi proizvod
DELETE FROM dbo.Proizvod WHERE idProizvod= 1;

SELECT * FROM dbo.Porudzbina;

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

--VIEW prikaz
SELECT * FROM PrikazKategorijaProizvoda;


--PROCEDURE -> INSERT
CREATE PROCEDURE INSERT_Prodavnice
    (
        @imeProdavnice nvarchar(40),
        @adresaProdavnice nvarchar(50),
        @brojTelefona nvarchar(50)
    )
    AS
    BEGIN TRY
        INSERT INTO Prodavnice(imeProdavnice, adresaProdavnice, brojTelefona)
                    VALUES(@imeProdavnice, @adresaProdavnice, @brojTelefona)
    END TRY
    BEGIN CATCH 
		EXEC ErrorHandler
    END CATCH;
    GO
	
--Provera procedure za INSERT, unos nove prodavnice u tabelu(Prodavnice).

EXEC[INSERT_Prodavnice]
    @imeProdavnice = 'Prodavnica iz procedure(insert)',
    @adresaProdavnice = 'Adresa iz procedure(insert)',
    @brojTelefona = 555
GO

--DELETE PROCEDURA----------

CREATE PROCEDURE DELETE_Prodavnica
    (
        @idProdavnica bigint
    )
AS
BEGIN TRY
	DELETE FROM dbo.Prodavnice
	WHERE idProdavnica = @idProdavnica
END TRY
BEGIN CATCH
	EXEC ErrorHandler
END CATCH;
GO

--Provera procedure za DELETE, brisanje prodavnice iz tabele(Prodavnice).
EXEC [DELETE_Prodavnica]
    @idProdavnica = 12;
    GO

SELECT * FROM Prodavnice;


--UPDATE PROCEDURA----------

CREATE PROCEDURE UPDATE_Prodavnica
(
	@idProdavnica bigint,
	@imeProdavnice nvarchar(40),
	@adresaProdavnice nvarchar(50),
	@brojTelefona nvarchar(50)
)
AS
BEGIN TRY
	UPDATE dbo.Prodavnice
	SET imeProdavnice = @imeProdavnice,
		adresaProdavnice = @adresaProdavnice,
		brojTelefona = @brojTelefona
		WHERE idProdavnica = @idProdavnica
	END TRY
	BEGIN CATCH
		EXEC ErrorHandler
	END CATCH;
GO

--Provera procedure za UPDATE, brisanje prodavnice iz tabele(Prodavnice).
EXEC [UPDATE_Prodavnica]
	@idProdavnica = 11,
    @imeProdavnice = 'Ime prodavnice iz update procedure',
    @adresaProdavnice = 'Adresa prodavnice iz update procedure',
    @brojTelefona = 'Broj telefona prodavnice iz update procedure'
GO

SELECT * FROM Prodavnice;

--PROCEDURA ZA STRANICENJE------

CREATE PROCEDURE Stranicenje
(
	@brojstrane int = 1,
	@brojlinija int = 10
)
AS
BEGIN 
	DECLARE @preskociti int = (@brojstrane - 1) * @brojlinija
	SELECT * 
	FROM dbo.Proizvod
	ORDER BY idProizvod
	OFFSET @preskociti ROW FETCH FIRST @brojlinija ROWS ONLY
END;
GO
		
--Provera procedure za STRANICENJE, prikaz podataka iz tabele(Proizvod).

EXEC stranicenje
    @brojstrane = 2,
    @brojlinija = 10;

--SKALARNA FUNCKIJA

CREATE FUNCTION RacunanjePopusta(@cena float, @kupon float)
RETURNS float
AS 
	BEGIN
		RETURN	@cena - (@cena * (@kupon / 100));
	END;
GO

--Provera SKALARNE funckije, prikaz izracunatog popusta.
SELECT dbo.RacunanjePopusta(100.10,10.0);

--INLINE TABLE VALUE FUNKCIJA

CREATE FUNCTION StatusPorudzbine
(@status nvarchar(20))
RETURNS TABLE
AS
RETURN (
    SELECT dp.idPorudzbina, dp.imePorucioca, dp.prezimePorucioca, dp.status, dp.datumPorudzbine
    FROM dbo.DetaljiPorudzbine AS dp
    WHERE  dp.status = @status
);

--Provera INLINE TABLE VALUE funckije, prikaz korisnika, uspesnih porudzbina.
SELECT * FROM StatusPorudzbine('Uspešno');

--AFTER okidac 

CREATE TRIGGER tr_KupacInsert ON DetaljiPorudzbine
    AFTER INSERT 
AS 
BEGIN
    IF EXISTS( SELECT * FROM inserted AS i WHERE i.datumPorudzbine > SYSDATETIME() ) 
    BEGIN
        PRINT 'Datum porudzbine ne sme da prekoraci danasnji datum!';
         IF @@TRANCOUNT > 0 ROLLBACK TRAN;
    END;
END;
GO

--Provera AFTER okidac, unosenje vrednosti u tabelu(DetaljiPorudzbine).

INSERT INTO dbo.DetaljiPorudzbine
  (idPorudzbina, status, placeno, nacinPlacanja, 
  imePorucioca, prezimePorucioca, adresaPorucioca, 
  grad, postanskiBroj, napomena, datumPorudzbine)
  VALUES ( 52, 'Uspešno', 'Placeno', 'Kartica', 'Brana','Marković',
  'Vladimirci 711', 'Šabac','12388','Proizvod je genijalan!', '2021-02-20');
GO

--INSTEAD OF okidac

CREATE TRIGGER tr_KorisnikDelete ON Korisnik
    INSTEAD OF DELETE
AS
BEGIN
    DECLARE @counter int;
    SELECT @counter = COUNT(*) FROM deleted;
    IF @counter > 0
    BEGIN
        RAISERROR ('Nije dozvoljeno brisanje korisnika', 10, 1);
        IF @@TRANCOUNT > 0
            ROLLBACK TRAN;
    END;
END;
GO


--Provera INSTEAD OF okidaca, zabranjuje brisanje reda iz tabele(Korisnik).
DELETE FROM dbo.Korisnik WHERE idKorisnik = 3;

--DDL okidac

CREATE TRIGGER tr_SprecavanjeBrisanjaFunkcija
    ON DATABASE
    FOR DROP_FUNCTION
AS
    PRINT 'Funkcija ne sme biti obrisana!';
    ROLLBACK TRAN;
GO

--Provera DDL okidaca, zabranjuje brisanje tabele iz baze.
DROP FUNCTION IF EXISTS dbo.RacunanjePopusta;
GO


--PROCEDURA koja sadrzi obradu TRANSAKCIJE--

CREATE PROCEDURE PromenaCeneProizvoda
(
	@idProizvod bigint,
	@novaCena float
)
AS
BEGIN TRY
	BEGIN TRANSACTION
		UPDATE dbo.Proizvod
		SET cena = @novaCena
		WHERE idProizvod = @idProizvod
	COMMIT
END TRY
BEGIN CATCH
	IF @@TRANCOUNT > 0
	BEGIN
		ROLLBACK
		EXEC ErrorHandler
	END
END CATCH

--Provera procedure koja sadrzi obradu transakcije--
EXEC PromenaCeneProizvoda @idProizvod = 7882, @novaCena = 29890;

