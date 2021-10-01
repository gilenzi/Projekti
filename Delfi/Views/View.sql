--View
--ovaj view mi pokazuje koje knjige pripadaju kom zanru
CREATE VIEW PrikazZanrovaKnjiga
AS
    SELECT k.Naslov,k.Jezik,z.ImeZanra
    FROM    KnjigaZanr AS kz
            JOIN Knjiga AS k ON k.KnjigaID = kz.KnjigaID
            JOIN Zanr AS z ON z.ZanrID = kz.ZanrID
            GROUP BY  k.Naslov,k.Jezik,z.ImeZanra;
GO
SELECT * FROM PrikazZanrovaKnjiga;