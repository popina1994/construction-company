DELETE Ocena 
WHERE IDRad=32

SELECT * FROM Rad
SELECT * FROM Ocena

SELECT * FROM Zaposleni

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
SELECT * FROM Posao
SELECT * FROM Magacin

SELECT * FROM Roba

SELECT * FROM Roba

SELECT * FROM Sadrzi
SELECT * FROM SadrziJedinica
SELECT * FROM SadrziKolicina
SELECT * FROM ImaJedinica
SELECT * FROM ImaKolicine


SELECT * FROM Posao
SELECT * FROM Zaduzio

SELECT * FROM Zaposleni
SELECT * FROM Magacin
SELECT * FROM Roba
SELECT * FROM ImaJedinica
SELECT * FROM Ima
SELECT Jedinica
FROM Ima, ImaJedinica
WHERE Ima.IDIma = ImaJedinica.IDIma AND IDMagacin = 26 AND IDRoba = 385

INSERT INTO Ima(IDRoba, IDMagacin)
VALUES (430, 29)

SELECT * FROM Magacin

INSERT INTO Rad(IDZaposleni, IDPosao, DatumPocetka)
VALUES(195, 34, 11-11-11)

SELECT * FROM Rad

SELECT * FROM Posao

DELETE FROM RAD
WHERE IDRad = 27

UPDATE RAD 
SET DatumKraja = '2016/12/12'
WHERE IDRad = 18

INSERT INTO Rad(IDPosao, IDZaposleni, DatumPocetka, DatumKraja)
VALUES (34, 193, '2016/12/12', '2016/12/12')

INSERT INTO Ocena(IDRad, Ocena)
VALUES (32, 10)

