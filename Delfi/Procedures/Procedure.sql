use ProjekatSQL_Delfi;
go

--insert procedura

create or alter procedure dbo.DodajDetaljeNarudzbine
(@NarudzbinaID	int,
@DatumIsporuke	date,
@AdresaIsporuke nvarchar(30),
@GradIsporuke	nvarchar(30),
@PostanskiKod	nvarchar(5),
@DetaljiNarudzbineID int OUTPUT
)
as
begin try
insert into dbo.DetaljiNarudzbine
(NarudzbinaID,DatumIsporuke, AdresaIsporuke, GradIsporuke, PostanskiKod )
values
(@NarudzbinaID,@DatumIsporuke, @AdresaIsporuke, @GradIsporuke,@PostanskiKod)
SET @DetaljiNarudzbineID  = SCOPE_IDENTITY();
end try
begin catch
exec ErrorHandler
end catch
go


--Delete procedura
create or alter procedure dbo.ObrisiDetaljeNarudzbine
(
@DetaljiNarudzbineID int
)
as
begin try
Delete from dbo.DetaljiNarudzbine  where dbo.DetaljiNarudzbine.DetaljiNarudzbineID = @DetaljiNarudzbineID
end try
begin catch
exec ErrorHandler
end catch
go

--update
create or alter procedure dbo.UpdateDetaljiNarudzbine
(
@DatumIsporuke	date,
@AdresaIsporuke nvarchar(30),
@GradIsporuke	nvarchar(30),
@PostanskiKod	nvarchar(5),
@NarudzbinaID	int,
@DetaljiNarudzbineID int 
)
as
begin try
Update dbo.DetaljiNarudzbine
set DatumIsporuke = @DatumIsporuke,
	AdresaIsporuke = @AdresaIsporuke,
	GradIsporuke = @GradIsporuke,
	PostanskiKod = @PostanskiKod,
	NarudzbinaID = @NarudzbinaID
	where DetaljiNarudzbineID = @DetaljiNarudzbineID
end try
begin catch
exec ErrorHandler
end catch
go

select * from dbo.DetaljiNarudzbine
select * from ErrorLog;

