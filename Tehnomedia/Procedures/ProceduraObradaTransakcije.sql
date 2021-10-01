USE TehnoMedia
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

