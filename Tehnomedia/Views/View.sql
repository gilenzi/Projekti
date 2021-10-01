USE TehnoMedia
GO

--Prikazivanje proizvoda po kategorijama

CREATE VIEW PrikazKategorijaProizvoda
AS
    SELECT  p.brendProizvoda, p.imeProizvoda, p.cena, kat.imeKategorije
    FROM    KategorijeProizvoda AS katP
            JOIN Proizvod AS p ON katP.idProizvod = p.idProizvod
            JOIN Kategorije AS kat ON kat.idKategorija = katP.idKategorija
            GROUP BY p.brendProizvoda, p.imeProizvoda, p.cena, kat.imeKategorije;
GO

SELECT * FROM PrikazKategorijaProizvoda;
