use ProjekatSQL_Delfi
GO 

INSERT dbo.Knjiga(Naslov,Stranice,ISBN,DatumIzlaskaIzdanjaKnjige,Jezik,Cena,Kolicina,AutorID,IzdavacID,KategorijaID)
VALUES
('Poslednja zelja (Saga o vescu)',320,'9788677022341','2012-03-24','Srpski',1000,30,1,8,1),
('Mac sudbine (Saga o vescu)',368,'9788677022662','2012-04-12','Srpski',1100,20,1,8,1),
('Krv Vilenjaka (Saga o vescu)',336,'9788677022259','2012-05-13','Srpski',1200,15,1,8,1),
('Vreme prezira (Saga o vescu)',352,'9788677022297','2012-06-14','Srpski',1150,10,1,8,1),
('Vatreno krstenje (Saga o vescu)',368,'9788677022563','2012-07-15','Srpski',1050,25,1,8,1),
('Lastavicija kula (Saga o vescu)',443,'9788677023102','2012-08-16','Srpski',1200,20,1,8,1),
('Gospodarica jezera (Saga o vescu)',534,'9788677023171','2012-09-17','Srpski',1200,30,1,8,1),
('Sezona oluja (Saga o vescu sporedna prica)',367,'9788677023720','2013-02-07','Srpski',1100,15,1,8,4),
('Hari Poter i kamen mudrosti',265,'9788650509463','2010-04-19','Srpski',1200,50,8,12,1),
('Hari Poter i Dvorana tajni',292,'9788650509517','2010-05-14','Srpski',1250,40,8,12,1),

('Hari poter i zatvorenik iz askabana',334,'9788650509739','2010-06-24','Srpski',1100,30,8,12,1),
('Hari poter i vatreni pehar',651,'9788650510124','2010-07-12','Srpski',1300,20,8,12,1),
('Hari poter i red feniksa',879,'9788650510278','2010-08-16','Srpski',1400,15,8,12,1),
('Hari poter i Polukrvni princ',583,'9788650509951','2010-09-21','Srpski',1450,8,8,12,1),
('Hari poter i relikvije smrti',640,'9788650508992','2010-10-01','Srpski',1500,20,8,12,1),
('Zona Zamfirova',242,'9788652130504','2018-05-01','Srpski',500,30,48,5,1),
('Pop Cira i Pop Spira',408,'9788610009361','2014-03-01','Srpski',550,20,48,5,1),
('Sherlock Holmes: The Complete Stories',1400,'9781853268960','1996-07-07','Engleski',1500,10,35,7,3),
('Ubistvo na orijent expresu',254,'9788652128754','2017-09-22','Srpski',720,10,4,6,1),
('Mali Princ',128,'9788610001051','2013-06-21','Srpski',300,40,5,5,2),

('Carobnjak iz Oza',304,'9781840226942','2012-10-11','Srpski',400,20,32,5,2),
('Bela griva',80,'9788660892463','2012-11-07','Srpski',612,30,41,6,2),
('Iron man',100,'9788660892463','2013-06-24','Engleski',1000,10,6,10,4),
('Fantastic four',120,'9788677023300','2013-06-24','Engleski',900,13,6,10,4),
('Romeo i julija',216,'9788610017694','2016-02-13','Srpski',480,25,16,5,1),
('Hamlet',170,'8600262035417','1996-06-24','Srpski',670,20,16,5,1),
('Twenty Thousand Leagues Under the Sea',70,'9788652117536','2015-08-09','Engleski',800,30,38,7,3),
('The old man and the see',112,'9780099273967','1999-12-10','Engleski',700,10,37,7,3),
('Revizor',237,'9788617320322','2000-04-14','Srpski',600,18,49,5,1),
('Prokleta avlija',85,'9788674706398','2014-07-16','Srpski',500,30,2,5,1),

('Na Drini cuprija',352,'9788610034226','2020-09-03','Srpski',1000,50,2,5,1),
('Zlocin i kazna',508,'9788689203271','2017-06-13','Srpski',980,24,42,6,1),
('Ana Karenjina',792,'9788677109356','2012-03-15','Srpski',850,30,40,6,1),
('Rat i mir',896,'9788610024364','2018-08-17','Srpski',1200,45,40,6,1),
('Alisa u zemlji cuda',126,'8600262046628','2007-06-18','Srpski',400,65,31,5,4),
('Seobe',288,'9788652130825','2019-09-18','Srpski',450,15,17,5,1),
('To',1359,'9781444707861','2011-05-28','Srpski',1000,30,12,6,1),
('The Shining',512,'9781444720723','2011-08-20','Engleski',1100,30,12,7,3),
('Bozanstvena komedija',608,'9788664571067','2016-03-17','Srpski',800,20,34,5,1),
('Robinzon Kruso',124,'9788683583966','2004-03-25','Srpski',600,16,39,6,1),

('Gospodar prstenova Druzina prstena',432,'9788660355869','2018-06-07','Srpski',1800,30,9,6,1),
('Gospodar prstenova Dve kule',356,'9788660355876','2018-07-07','Srpski',1750,30,9,6,1),
('Gospodar prstenova Povratak Kralja',412,'9788660355883','2018-07-07','Srpski',1730,30,9,6,1),
('Hobit',400,'9780007487295','2012-04-13','Srpski',1100,10,9,6,1),
('The way of kings',1280,'9780575097360','2011-07-14','Engleski',1500,15,3,9,3),
('Words of Radiance',1328,'9780765365286','2015-08-14','Engleski',1300,10,3,9,3),
('Oathbringer',1248,'9780765365286','2017-06-15','Engleski',1400,5,3,9,3),
('Rhythm of War',1232,'9780765326386','2020-05-15','Engleski',1500,20,3,9,3),
('The Final Empire (Mistborn)',752,'9780575089914','2009-02-15','Engleski',1200,25,3,9,3),
('The Well of Ascension  (Mistborn)',804,'9780575089938','2010-11-06','Engleski',1215,15,3,9,3),

('The Hero of Ages  (Mistborn)',768,'9780575089945','2010-12-07','Engleski',1315,10,3,9,3),
('The Name of the Wind',672,'9780575081406','2008-03-07','Engleski',1215,15,11,9,3),
('The Wise Mans Fear',1008,'9780575081437','2009-03-07','Engleski',1315,17,11,9,3),
('Ostrica',568,'9788652106820','2011-05-05','Srpski',1100,12,7,6,4),
('Vesala',607,'9788652110612','2012-05-05','Srpski',1200,15,7,6,4),
('Poslednji argument kraljeva',716,'9788652114368','2014-02-09','Srpski',1300,14,7,6,4),
('Osveta',752,'9788652117796','2014-04-09','Srpski',1050,7,7,6,4),
('Junaci',680,'9788652126019','2014-06-09','Srpski',1100,12,7,6,4),
('Krvava zemlja',584,'9788652128952','2014-08-09','Srpski',1150,10,7,6,4),
('Malo mrznje',559,'9788652139897','2020-05-10','Srpski',1400,30,7,6,4),

('Matematika za Osnovnu skolu',120,'9788656754232','2014-08-22','Srpski',500,30,51,1,2),
('Engleski za Osnovnu skolu',130,'9788652139892','2014-03-16','Srpski',500,30,51,1,2),
('Srpski za Osnovnu skolu',140,'9788652139893','2014-05-12','Srpski',500,30,51,1,2),
('Zbirka zadataka iz Hemije',90,'9788652139894','2016-08-21','Srpski',400,20,51,4,2),
('Zbirka zadataka iz Fizike',100,'9788652139895','2016-03-16','Srpski',400,20,51,4,2),
('Zbirka zadataka iz Biologije',112,'9788652139896','2016-04-12','Srpski',400,20,51,4,2),
('Geografija za peti razred',80,'9788652139721','2010-05-12','Srpski',300,8,53,2,2),
('Kauboj Krsta na rodeu',60,'9788652139286','2012-03-14','Srpski',310,13,52,3,2),
('Kauboj Krsta i Toma tornado',50,'9788652139287','2013-06-10','Srpski',320,5,52,3,2),
('Kauboj Krsta i grozni Frenk',56,'9788652139285','2015-08-25','Srpski',330,10,52,3,2),

('The Eye of the World (the Wheel of Time)',670,'9780312850098','2000-03-17','Engleski',1800,10,54,7,3),
('The Shadow Rising (the Wheel of Time)',1024,'9780356503851','2003-05-23','Engleski',1400,3,54,7,3),
('The Fires Of Heaven (the Wheel of Time)',928,'9780356503868','2005-07-12','Engleski',1450,7,54,7,3),
('Lord Of Chaos (the Wheel of Time)',1040,'9780356503875','2006-08-15','Engleski',1300,11,54,7,3),
('The Dragon Reborn (the Wheel of Time)',672,'9780356503844','2007-05-11','Engleski',1350,14,54,7,3),
('A Game of Thrones (A song of ice and fire)',846,'9780006479888','2009-07-12','Engleski',1400,25,10,7,3),
('A Clash of Kings (A song of ice and fire)',927,'9780006479895','2010-08-09','Engleski',1400,15,10,7,3),
('A Feast for Crows (A song of ice and fire)',864,'9780006486121','2011-09-17','Engleski',1450,10,10,7,3),
('A Dance With Dragons (A song of ice and fire)',1256,'9780006486114','2012-10-11','Engleski',1500,10,10,7,3),
('Nekronomikon ',578,'9788660390372','2008-10-22','Srpski',3000,15,55,5,4);




SELECT * FROM dbo.Knjiga;

