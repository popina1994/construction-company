
-- FK relationship destroy
UPDATE Magacin
SET IDZaposleni = NULL
UPDATE Zaposleni
SET IDMagacin = NULL

DELETE FROM Zaduzio
DELETE FROM Ocena
DELETE FROM Rad
DELETE FROM Posao
DELETE FROM Sadrzi
DELETE FROM Ima
DELETE FROM Magacin
DELETE FROM Zaposleni
DELETE FROM Sprat
DELETE FROM Objekat
DELETE FROM Gradiliste
DELETE FROM Roba
DELETE FROM TipRobe
DELETE FROM Norma

SELECT * FROM Zaposleni


SELECT Rad.IDZaposleni AS IDZap, Rad.DatumPocetka AS RadPoc, Rad.DatumKraja AS RadKraj, Posao.DatumPocetka AS PosPoc, Posao.DatumKraja AS PosKraj, Plata, ProsecnaOcena, IsplaceniIznos, Zaposleni.IDMagacin FROM 
Rad, Posao, Zaposleni, Norma
WHERE Rad.IDPosao = Posao.IDPosao AND Rad.IDZaposleni=Zaposleni.IDZaposleni AND Posao.IDNorma = Norma.IDNorma


SELECT * FROM 
Ima, ImaKolicine, Roba
WHERE Ima.IDIma = ImaKolicine.IDIma AND ROba.IDRoba = Ima.IDRoba

SELECT * FROM 
Ima, ImaJedinica, Roba
WHERE Ima.IDIma = ImaJedinica.IDIma AND ROba.IDRoba = Ima.IDRoba

SELECT * FROM Zaposleni

SELECT COUNT(IDMagacin)
FROM Zaposleni
WHERE IDZaposleni = 609

SELECT * FROM Magacin

SELECT * FROM Gradiliste



DELETE FROM OCena

WHERE IDRad = 262

SELECT * FROM Sprat
SELECT * FROM Posao

SELECT * FROM Zaposleni

UPDATE Posao 
SET Status = 'U', DatumKraja = NULL
WHERE IDPosao = 196


Update Zaposleni
SET IDMagacin = 106
WHERE IDZaposleni = 609

INSERT INTO Rad(DatumPocetka, DatumKraja,IDPosao, IDZaposleni)
VALUES ('2016-11-11', NULL, 198, 609)

SELECT * FROM Zaposleni
SELECT * FROM Rad
INNER JOIN Posao ON Rad.IDPosao = Posao.IDPosao

DECLARE @DatumPocetka DateType
DECLARE @DatumKraja DateType
DECLARE @IDZaposleni IDType

SET @IDZaposleni = 607
SET @DatumPocetka = '2016-02-12'
SET @DatumKraja = '2016-11-13'

DELETE FROM Rad 
WHERE IDRad = 274