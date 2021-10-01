USE TehnoMedia
GO

INSERT INTO dbo.KategorijeProizvoda
VALUES
--Frizideri(glavna kategorija)
(1,1),(3,1),(4,1),(5,1),(6,1),(7,1),
--Ugradni Frizideri sa jednim vratima
(2,3),(3,3),(4,3),(5,3),(6,3),
--Frizideri sa jednim vratima
(7,2),

--Ves masine(glavna kategorija)
(8,4),(9,4),(10,4),(11,4),(12,4),(13,4),
--Masina za pranje vesa frontalno punjenje
(8,5),(9,5),(10,5),
--Masina za pranje vesa punjenje odozgo
(11,6),(12,6),(13,6),

--Sporeti(glavna kategorija)
(14,7),(15,7),(16,7),(17,7),(18,7),(19,7),(20,7),
(21,7),(22,7),(23,7),(24,7),(25,7),(26,7),(27,7),
--ELektricni sporeti
(14,8),(15,8),(16,8),(17,8),
--Sporeti sa staklokeramickom plocom
(18,9),(19,9),(20,9),
--Kombinovani sporeti
(21,10),(22,10),(23,10),
--Sporeti na gas
(24,11),(25,11),(26,11),(27,11),


--Aspiratori(glavna kategorija (12))
(28,12),(29,12),(30,12),(31,12),(32,12),
(33,12),(34,12),(35,12),(36,12),
--Standardni(13)
(28,13),(29,13),(30,13),
--Kaminski(14)
(31,14),(32,14),(33,14),
--Teleskopski(15)
(34,15),(35,15),(36,15),

--Mikrotalasne rerne(glavna kategorija (16))
(37,16),(38,16),(39,16),(40,16),
(41,16),(42,16),(43,16),
--Mikrotalasne sa grilom(17)
(37,17),(38,17),
--Ugradne mikrotalasne(18)
(39,18),(40,18),(41,18),(42,18),(43,18),


--Klima uredjaji(glavna kategorija(19))
(43,19),(44,19),(45,19),(46,19),
(47,19),(48,19),(49,19),
--Standardne klime(20)
(43,20),(44,20),(45,20),(46,20),
--Inverter Klime(21)
(47,21),(48,21),(49,21),

--Ugradna tehnika(glavna kategorija(22))
(50,22),(51,22),(52,22),(53,22),
--Ugradne ploce(23)
(50,23),(51,23),(52,23),(53,23),

--Masine za pranje sudova(glavna kategorija(24))
(54,24),(55,24),(56,24),(57,24),
(58,24),(59,24),(60,24),
--Samostojece(25)
(54,25),(55,25),(56,25),(57,25),
--Ugradne(26)
(58,26),(59,26),(60,26),


--Bojler(glavna kategorija(27))
(61,27),(62,27),(63,27),(64,27),
(65,27),(66,27),(67,27),(68,27),
--Standardni bojleri(28)
(63,28),(61,28),(66,28),(67,28),
--Bojleri sa malom litrazom(29)
(62,29),(64,29),(65,29),(68,29),

--Zamrzivaci(glavna kategorija(30))
(67,30),(68,30),(69,30),(70,30),(71,30),
(72,30),(73,30),(74,30),(75,30),(76,30),
(77,30),
--Samostojeci(31)
(67,31),(68,31),(69,31),(70,31),
(71,31),(74,31),(75,31),(76,31),
(77,31),
--Vertikalni(32)
(67,32),(70,32),(71,32),(72,32),
(73,32),
--Horizontalni(33)
(74,33),(75,33),(76,33),
(77,33),(68,33),(69,33);
