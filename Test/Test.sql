
-- FK relationship destroy
UPDATE Magacin
SET IDZaposleni = NULL
UPDATE Zaposleni
SET IDMagacin = NULL

DELETE FROM Ima
DELETE FROM Magacin
DELETE FROM Zaposleni
DELETE FROM Sprat
DELETE FROM Objekat
DELETE FROM Gradiliste
DELETE FROM Roba
DELETE FROM TipRobe
DELETE FROM Norma


SELECT * FROM Roba