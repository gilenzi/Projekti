USE TehnoMedia
GO

DECLARE @json nvarchar(max) = N'{"Radnje":[{"imeProdavnice":"Prodavnica R10 Aleksinac","adresaProdavnice":"Knjaza Miloša 20","brojTelefona":"0646478600"},
{"imeProdavnice":"Prodavnica R28 Bela Palanka","adresaProdavnice":"Srpskih vladara 68","brojTelefona":"0691647138"},
{"imeProdavnice":"Prodavnica R46 Beograd","adresaProdavnice":"Auto-put za Zagreb 18","brojTelefona":"0691647691"},
{"imeProdavnice":"Prodavnica R38 Beograd","adresaProdavnice":"Agostina Neta 14","brojTelefona":"0691647696"},
{"imeProdavnice":"Prodavnica R47 Beograd","adresaProdavnice":"Cara Nikolaja II 41","brojTelefona":"0691647063"},
{"imeProdavnice":"Prodavnica R30 Beograd","adresaProdavnice":"Žicka br 1","brojTelefona":"0691647681"},
{"imeProdavnice":"Prodavnica R36 Beograd","adresaProdavnice":"Vojvode Stepe 318","brojTelefona":"0691647686"},
{"imeProdavnice":"Prodavnica R42 Beograd","adresaProdavnice":"Požeška 72","brojTelefona":"0646478611"},
{"imeProdavnice":"Prodavnica R50 Beograd","adresaProdavnice":"Kolarceva 7","brojTelefona":"0691647175"},
{"imeProdavnice":"Prodavnica R5 Boljevac","adresaProdavnice":"Svetosavka 3L\/2","brojTelefona":"0646472429"},
{"imeProdavnice":"Prodavnica R9 Bor","adresaProdavnice":"Ðorda Vajferta 5\/1","brojTelefona":"0666478600"}]}'

SELECT * FROM OPENJSON (@json,'$.Radnje')
WITH(
imeProdavnice nvarchar(40) '$.imeProdavnice',
adresaProdavnice nvarchar(50) '$.adresaProdavnice',
brojTelefona nvarchar(50)'$.brojTelefona'
);