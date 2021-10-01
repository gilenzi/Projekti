use ProjekatSQL_Delfi
go
--Transakcija
CREATE PROCEDURE PromenaBrojaTelefonaZaposlenog
@ZaposleniID int,
@NBrojMob nvarchar(15)
AS
BEGIN TRY
	BEGIN TRANSACTION
	UPDATE dbo.Zaposleni
	SET BrojMob = @NBrojMob
	WHERE ZaposleniID = @ZaposleniID
	IF @@TRANCOUNT > 0
	COMMIT
END TRY
BEGIN CATCH
	IF @@TRANCOUNT > 0 ROLLBACK
	EXEC ErrorHandler
END CATCH;
GO

EXEC PromenaBrojaTelefonaZaposlenog
	@ZaposleniID = 1,
	@NBrojMob = '061 111 1112';

SELECT * FROM Zaposleni;