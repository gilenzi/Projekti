DECLARE @idoc INT, @dokument VARCHAR(1000);
SET @dokument ='<Knjige>
  <Knjiga>
    <Naslov>Poslednja zelja (Saga o vescu)</Naslov>
    <Cena>1.000000000000000e+003</Cena>
    <ISBN>9788677022341</ISBN>
    <Jezik>Srpski</Jezik>
    <Stranice>320</Stranice>
  </Knjiga>
  <Knjiga>
    <Naslov>Mac sudbine (Saga o vescu)</Naslov>
    <Cena>1.100000000000000e+003</Cena>
    <ISBN>9788677022662</ISBN>
    <Jezik>Srpski</Jezik>
    <Stranice>368</Stranice>
  </Knjiga>
  <Knjiga>
    <Naslov>Krv Vilenjaka (Saga o vescu)</Naslov>
    <Cena>1.200000000000000e+003</Cena>
    <ISBN>9788677022259</ISBN>
    <Jezik>Srpski</Jezik>
    <Stranice>336</Stranice>
  </Knjiga>
  <Knjiga>
    <Naslov>Vreme prezira (Saga o vescu)</Naslov>
    <Cena>1.150000000000000e+003</Cena>
    <ISBN>9788677022297</ISBN>
    <Jezik>Srpski</Jezik>
    <Stranice>352</Stranice>
  </Knjiga>
  </Knjige>';

exec sp_xml_preparedocument @idoc output, @dokument;

select * from openxml(@idoc, '/Knjige/Knjiga' , 1)
 with(
Naslov varchar(30) 'Naslov',
Cena float 'Cena',
ISBN varchar(15) 'ISBN',
Jezik  varchar(30) 'Jezik',
Stranice int 'Stranice'
);