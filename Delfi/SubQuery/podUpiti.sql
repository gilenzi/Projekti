use ProjekatSQL_Delfi
GO 
--skalarni
--Ovaj upit nam ispisuje najskuplji proizvod
select dbo.Knjiga.Naslov as [Naslov knjige], dbo.Knjiga.Cena as [Cena knjige], dbo.Knjiga.ISBN as [ISBN knjige] from dbo.Knjiga 
where dbo.Knjiga.Cena = (select max(Cena) from dbo.Knjiga) 
--vise vrednosni
--Ovaj upit nam vraca sve knjige koje su na engleskom jeziku
select dbo.Knjiga.Naslov as [Naslov knjige], dbo.Knjiga.Cena as [Cena knjige], dbo.Knjiga.ISBN as [ISBN knjige],dbo.Knjiga.Jezik as [Jezik knjige] from dbo.Knjiga
where dbo.Knjiga.KnjigaID in (select dbo.Knjiga.KnjigaID from dbo.Knjiga where Jezik = 'engleski')

--OFSET FETCH
select dbo.Knjiga.Naslov as [Naslov knjige], dbo.Knjiga.Cena as [Cena knjige], dbo.Knjiga.ISBN as [ISBN knjige],dbo.Knjiga.Jezik as [Jezik knjige] from dbo.Knjiga
order by dbo.Knjiga.Cena desc offset 60 rows fetch next 20 rows only 

--Exists 
--ovaj upit nam vraca sve knjige za odredjene izdavace

SELECT dbo.Knjiga.Naslov AS [ime]
FROM dbo.Knjiga WHERE
EXISTS (SELECT * from  dbo.Izdavac WHERE dbo.Knjiga.IzdavacID = dbo.Izdavac.IzdavacID and dbo.Izdavac.ImeIzdavackeKuce = 'Laguna')



--Korelativni--
--Ovaj upit mi vraca broj narudzbina po knjizi

SELECT k1.Naslov,k1.Cena,k1.IzdavacID from dbo.Knjiga as k1
where k1.Cena = (select min(Cena) from dbo.Knjiga as k2 where k2.IzdavacID = k1.IzdavacID)

-- group by
--ovaj upit mi pokazuje broj obradjenih porudzbina po zaposlenom
SELECT ZaposleniID, COUNT(NarudzbinaID) as [narudzbina]
FROM dbo.Narudzbina
GROUP BY ZaposleniID;


--having 
--ovaj upit mi pokazuje sve narudzbine vece od 1000 dinara
SELECT NarudzbinaID,UkupnaCena 
FROM dbo.Narudzbina
GROUP BY NarudzbinaID,UkupnaCena
HAVING UkupnaCena>1000;
