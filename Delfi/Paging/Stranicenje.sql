use ProjekatSQL_Delfi
GO 
CREATE PROCEDURE KnjigaStranicenje
(
 @bs int = 1,
 @bl int = 10
)
AS
BEGIN DECLARE @p int = (@bs - 1) * @bl
SELECT * FROM Knjiga
ORDER BY KnjigaID
OFFSET @p ROW FETCH FIRST @bl ROWS ONLY
END;
GO
EXEC KnjigaStranicenje 1, 5
