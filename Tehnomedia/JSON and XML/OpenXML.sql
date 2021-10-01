USE TehnoMedia
GO

DECLARE @hdoc INT, @document VARCHAR(1000);
SET @document ='<Proizvodi>
 <Proizvod>
    <brendProizvoda>BOSCH</brendProizvoda>
    <imeProizvoda>Aspirator</imeProizvoda>
    <cena>1.599000000000000e+004</cena>
    <sifraProizvoda>DUL62FA51</sifraProizvoda>
  </Proizvod>
  <Proizvod>
    <brendProizvoda>BOSCH</brendProizvoda>
    <imeProizvoda>Aspirator</imeProizvoda>
    <cena>3.000090000000000e+004</cena>
    <sifraProizvoda>DWP96BC50</sifraProizvoda>
  </Proizvod>
  <Proizvod>
    <brendProizvoda>ELECTROLUX</brendProizvoda>
    <imeProizvoda>Aspirator</imeProizvoda>
    <cena>3.299000000000000e+004</cena>
    <sifraProizvoda>LFV316K</sifraProizvoda>
  </Proizvod>
  <Proizvod>
    <brendProizvoda>LG</brendProizvoda>
    <imeProizvoda>Mikrotalasna rerna</imeProizvoda>
    <cena>2.832900000000000e+004</cena>
    <sifraProizvoda>MH6565CPS</sifraProizvoda>
  </Proizvod>
  </Proizvodi>';

   exec sp_xml_preparedocument @hdoc OUTPUT, @document;

 SELECT * FROM OPENXML(@hdoc, '/Proizvodi/Proizvod' , 1)
 WITH(
brendProizvoda nvarchar(50) 'brendProizvoda',
imeProizvoda nvarchar(70) 'imeProizvoda',
cena float 'cena',
sifraProizvoda  nvarchar(20) 'sifraProizvoda'
);