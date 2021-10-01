use ProjekatSQL_Delfi
go

--after triger

CREATE TRIGGER tr_ZaposleniUpdate
    ON Zaposleni
    AFTER UPDATE 
AS 
BEGIN
    IF EXISTS( SELECT * FROM inserted AS b WHERE b.BrojMob  like '011%' ) 
    BEGIN
        PRINT 'Ne mozete uneti fiksni broj telefona';
         IF @@TRANCOUNT > 0 ROLLBACK TRAN;
    END;
END;
GO

select * from Zaposleni

--provera

UPDATE dbo.Zaposleni
SET	BrojMob = '01101' 
WHERE ZaposleniID = 50;


--INSTEAD

CREATE TRIGGER tr_KnjigeDelete ON Knjiga
    INSTEAD OF DELETE
AS
BEGIN
    DECLARE @brojac int;
    SELECT @brojac = COUNT(*) FROM deleted;
    IF @brojac > 0
    BEGIN
        RAISERROR ('Nije dozvoljeno brisanje Knjiga', 10, 1);
        IF @@TRANCOUNT > 0
            ROLLBACK TRAN;
    END;
END;
GO

--provera

delete  from Knjiga where KnjigaID = 50

--ddl

CREATE TRIGGER tr_SprecavanjeModifikovanja
    ON DATABASE
    FOR ALTER_TABLE
AS
    PRINT 'Tabela ne sme biti modifikovana !';
    ROLLBACK TRAN;
GO
-- provera
ALTER TABLE Zaposleni
ADD Email varchar(10);


