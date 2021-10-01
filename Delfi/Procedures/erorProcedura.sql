use ProjekatSQL_Delfi;
go

create procedure dbo.ErrorHandler
as
begin
begin try
insert into dbo.ErrorLog
(ErrorNumber, ErrorSeverity, ErrorState, ErrorProcedure, ErrorLine, ErrorMessage)
values
(
	ERROR_NUMBER(),
	ERROR_SEVERITY(),
	ERROR_STATE(),
	ERROR_PROCEDURE(),
	ERROR_LINE(),
	ERROR_MESSAGE()

)
end try
begin catch
print 'Greska';
end catch
END;