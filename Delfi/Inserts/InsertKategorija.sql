use ProjekatSQL_Delfi
GO 
INSERT  dbo.Kategorija 
VALUES
('Knjige','Sadrzi glavne zanrove knjiga'),
('Knjige za decu','Knjige za decu od 8 do 13 godina'),
('Strane knjige','Knjige na stranim jezicima'),
('Razno','Sadrzi mesane zanrove knjiga');

select * from dbo.Kategorija;


