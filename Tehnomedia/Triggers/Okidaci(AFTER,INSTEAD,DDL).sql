USE TehnoMedia
GO

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