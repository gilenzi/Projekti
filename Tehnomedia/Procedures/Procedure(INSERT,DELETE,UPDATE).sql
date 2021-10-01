USE TehnoMedia
GO

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