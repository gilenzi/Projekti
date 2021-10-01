USE TehnoMedia
GO

--UPDATE--

UPDATE dbo.DetaljiPorudzbine
SET dbo.DetaljiPorudzbine.napomena = 'Molim za korektnost kao prethodni put.'
WHERE dbo.DetaljiPorudzbine.idPorudzbina = 35;

UPDATE dbo.DetaljiPorudzbine
SET dbo.DetaljiPorudzbine.postanskiBroj = 11277
WHERE dbo.DetaljiPorudzbine.grad = 'Batajnica';

UPDATE dbo.DetaljiPorudzbine
SET dbo.DetaljiPorudzbine.grad = 'Koralovo'
WHERE dbo.DetaljiPorudzbine.imePorucioca = 'Avelj'
AND dbo.DetaljiPorudzbine.prezimePorucioca = 'Ateljevic';

--DELETE--
--Ovaj upit brise sve email-ove koje
DELETE FROM dbo.NewsLetter WHERE email LIKE '%@yahoo.com';

--Ovaj upit brise prvi proizvod
DELETE FROM dbo.Proizvod WHERE idProizvod= 1;

SELECT * FROM dbo.Porudzbina;
