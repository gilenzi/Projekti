USE TehnoMedia
GO

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