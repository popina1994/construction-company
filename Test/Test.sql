

-- FK relationship destroy
UPDATE Magacin
SET IDZaposleni = NULL
UPDATE Zaposleni
SET IDMagacin = NULL

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

SELECT * FROM ImaJedinica
SELECT * FROM Posao